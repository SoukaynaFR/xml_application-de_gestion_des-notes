import os
import xml.etree.ElementTree as ET
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas

# 📂 Définition des chemins
FOLDER_PATH = os.path.dirname(__file__)  # Dossier du script
PROF_XML = os.path.join(FOLDER_PATH, "Prof.xml")
PDF_FILE = os.path.join(FOLDER_PATH, "Liste_Professeurs.pdf")

def parse_professors(xml_path):
    """Extrait les informations des professeurs depuis le fichier XML."""
    if not os.path.exists(xml_path):
        raise FileNotFoundError(f"[❌] Fichier introuvable: {xml_path}")

    tree = ET.parse(xml_path)
    root = tree.getroot()

    professors = []
    for prof in root.findall("Prof"):
        professor = {
            "FirstName": prof.findtext("FirstName", "N/A"),
            "LastName": prof.findtext("LastName", "N/A"),
            "Dept_Attachement": prof.findtext("Dept_Attachement", "N/A"),
            "Phone": prof.findtext("Phone", "N/A"),
            "Email": prof.findtext("Email", "N/A"),
            "Modules": [module.text for module in prof.find("Modules").findall("Module")]
        }
        professors.append(professor)

    return professors

def generate_prof_pdf(professors, pdf_path):
    """Génère un PDF avec la liste des professeurs et leurs matières enseignées."""
    c = canvas.Canvas(pdf_path, pagesize=A4)
    width, height = A4
    y_position = height - 50

    # 📌 En-tête du document
    c.setFont("Helvetica-Bold", 16)
    c.drawString(150, y_position, "UNIVERSITE ABDELMALEK ESSAADI")
    c.setFont("Helvetica-Bold", 14)
    c.drawString(120, y_position - 20, "Ecole Nationale des Sciences Appliquées de Tanger")
    c.drawString(200, y_position - 40, "Liste des Professeurs")

    # 📚 Liste des professeurs
    c.setFont("Helvetica", 12)
    y_position -= 80
    for prof in professors:
        modules = ", ".join(prof["Modules"])
        
        # 📌 Informations du professeur
        c.setFont("Helvetica-Bold", 12)
        c.drawString(50, y_position, f"{prof['FirstName']} {prof['LastName']} ({prof['Dept_Attachement']})")
        c.setFont("Helvetica", 12)
        c.drawString(50, y_position - 15, f"📚 Modules: {modules}")
        c.drawString(50, y_position - 30, f"📧 Email: {prof['Email']}")
        c.drawString(50, y_position - 45, f"📞 Téléphone: {prof['Phone']}")
        
        y_position -= 70  # Espacement entre les professeurs

        # Saut de page si nécessaire
        if y_position < 50:
            c.showPage()
            y_position = height - 50

    # 📌 Sauvegarde du PDF
    c.save()
    print(f"[✔] PDF généré: {pdf_path}")

if __name__ == "__main__":
    try:
        prof_data = parse_professors(PROF_XML)
        generate_prof_pdf(prof_data, PDF_FILE)
    except FileNotFoundError as e:
        print(e)
    except ET.ParseError:
        print("[❌] Erreur de parsing XML: Vérifiez la structure du fichier.")
    except Exception as e:
        print(f"[❌] Erreur inattendue: {e}")
