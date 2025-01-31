import os
import xml.etree.ElementTree as ET
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas

# Paths
FOLDER_PATH = os.path.dirname(__file__)  # Répertoire du script
XML_FILE = os.path.join(FOLDER_PATH, "Relever_etudiant.xml")
PDF_FILE = os.path.join(FOLDER_PATH, "Releve_de_Notes.pdf")

def parse_xml(xml_path):
    """Extract student data from XML."""
    if not os.path.exists(xml_path):
        raise FileNotFoundError(f"[❌] Fichier introuvable: {xml_path}")

    tree = ET.parse(xml_path)
    root = tree.getroot()

    student = {
        "CIN": root.attrib.get("CIN", "N/A"),
        "CNE": root.attrib.get("CNE", "N/A"),
        "code_apogée": root.attrib.get("code_apogée", "N/A"),
        "Nom": root.findtext("Nom", "N/A"),
        "Prénom": root.findtext("Prénom", "N/A"),
        "Lieu_Naissance": root.findtext("Lieu_Naissance", "N/A"),
        "Date_Naissance": " / ".join([
            root.findtext("Date_Naissance/day", "??"),
            root.findtext("Date_Naissance/month", "??"),
            root.findtext("Date_Naissance/year", "????")
        ]),
        "NOTES": []
    }

    # Vérifier si l'élément "NOTES" existe
    notes_section = root.find("NOTES")
    if notes_section is not None:
        for note in notes_section.findall("note"):
            module = {
                "module_code": note.attrib.get("module_code", "N/A"),
                "module_name": note.attrib.get("module_name", "Sans nom"),
                "elements": []
            }
            for note_elm in note.findall("note_elm"):
                try:
                    element = {
                        "elm_name": note_elm.attrib.get("elm_name", "Sans nom"),
                        "poid": float(note_elm.attrib.get("poid", 1)),  # Défaut à 1 pour éviter division par zéro
                        "note_value": float(note_elm.text) if note_elm.text else 0.0
                    }
                    module["elements"].append(element)
                except ValueError:
                    print(f"[⚠] Erreur dans une note du module {module['module_name']}")

            student["NOTES"].append(module)
    else:
        print("[⚠] Aucun élément 'NOTES' trouvé dans le fichier XML.")

    return student

def calculate_averages(student):
    """Calculate module and general averages."""
    module_averages = []
    total_sum = 0
    module_count = 0

    for module in student["NOTES"]:
        if not module["elements"]:
            continue  # Ignorer les modules sans notes

        weighted_sum = sum(elm["note_value"] * elm["poid"] for elm in module["elements"])
        total_weight = sum(elm["poid"] for elm in module["elements"])

        avg = weighted_sum / total_weight if total_weight > 0 else 0
        module_averages.append((module["module_code"], module["module_name"], avg))

        total_sum += avg
        module_count += 1

    general_average = total_sum / module_count if module_count > 0 else 0
    return module_averages, general_average

def generate_pdf(student, module_averages, general_average, pdf_path):
    """Generate the student transcript PDF."""
    c = canvas.Canvas(pdf_path, pagesize=A4)
    width, height = A4
    y_position = height - 50

    # Header
    c.setFont("Helvetica-Bold", 16)
    c.drawString(150, y_position, "UNIVERSITE ABDELMALEK ESSAÂDI")
    c.setFont("Helvetica-Bold", 14)
    c.drawString(120, y_position - 20, "Ecole Nationale des Sciences Appliquées de Tanger")
    c.drawString(220, y_position - 40, "Relevé de Notes")
    
    # Student Information
    c.setFont("Helvetica", 12)
    y_position -= 80
    c.drawString(50, y_position, f"Nom: {student['Nom']} {student['Prénom']}")
    c.drawString(50, y_position - 20, f"CNE: {student['CNE']}")
    c.drawString(50, y_position - 40, f"Né le: {student['Date_Naissance']} à {student['Lieu_Naissance']}")

    # Table Header
    y_position -= 80
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y_position, "MODULE")
    c.drawString(300, y_position, "MOYENNE")
    c.drawString(400, y_position, "RESULTAT")

    # Table Content
    c.setFont("Helvetica", 12)
    y_position -= 20
    for module_code, module_name, avg in module_averages:
        result = "V" if avg >= 12 else "NV"
        c.drawString(50, y_position, f"{module_code}: {module_name}")
        c.drawString(300, y_position, f"{avg:.2f}")
        c.drawString(400, y_position, result)
        y_position -= 20

    # General Average & Decision
    y_position -= 40
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y_position, f"Moyenne Générale: {general_average:.2f}")
    
    y_position -= 20
    decision = "Admis(e) à GINF3" if general_average >= 12 else "Réaffecté(e) à GINF2"
    c.drawString(50, y_position, f"Décision: {decision}")

    # Footer
    y_position -= 50
    c.setFont("Helvetica", 10)
    c.drawString(50, y_position, "Avis important: Il ne sera délivré qu'un seul exemplaire du présent relevé de notes.")

    # Save PDF
    c.save()
    print(f"[✔] PDF généré: {pdf_path}")

if __name__ == "__main__":
    try:
        student_data = parse_xml(XML_FILE)
        module_averages, general_avg = calculate_averages(student_data)
        generate_pdf(student_data, module_averages, general_avg, PDF_FILE)
    except FileNotFoundError as e:
        print(e)
    except ET.ParseError:
        print("[❌] Erreur de parsing XML: Vérifiez la structure du fichier.")
    except Exception as e:
        print(f"[❌] Erreur inattendue: {e}")
