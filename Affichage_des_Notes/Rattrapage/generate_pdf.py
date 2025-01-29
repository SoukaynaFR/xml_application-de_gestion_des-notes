import xml.etree.ElementTree as ET
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas

# Fonction pour lire le fichier XML et extraire les données des étudiants convoqués au rattrapage
def parse_xml(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    students_data = []

    # Accéder à tous les étudiants dans le XML
    for student in root.findall(".//Student"):
        first_name = student.find('firstName').text
        last_name = student.find('lastName').text
        cne = student.get('CNE')
        moyenne = float(student.find('moyenne').text)

        # Ajouter à la liste si la moyenne est inférieure à 12
        if moyenne < 12:
            students_data.append({"firstName": first_name, "lastName": last_name, "CNE": cne, "moyenne": moyenne})
    
    return students_data

# Fonction pour générer le PDF
def generate_pdf(students, filename="Rattrapage_GINF2.pdf"):
    c = canvas.Canvas(filename, pagesize=letter)
    width, height = letter
    
    # Titre du PDF
    c.setFont("Helvetica-Bold", 16)
    c.drawString(100, height - 50, "Etudiants Convoqués au Rattrapage (Moyenne < 12) - GINF2")
    
    # En-têtes de colonnes
    c.setFont("Helvetica-Bold", 12)
    c.drawString(100, height - 100, "Prénom")
    c.drawString(200, height - 100, "Nom")
    c.drawString(300, height - 100, "CNE")
    c.drawString(400, height - 100, "Moyenne")
    
    # Remplir avec les données des étudiants
    y_position = height - 120
    c.setFont("Helvetica", 12)
    for student in students:
        c.drawString(100, y_position, student['firstName'])
        c.drawString(200, y_position, student['lastName'])
        c.drawString(300, y_position, student['CNE'])
        c.drawString(400, y_position, str(student['moyenne']))
        y_position -= 20  # Ajuster la position pour chaque étudiant
    
    c.save()

# Exemple d'utilisation
xml_file = "Notes_GINF2.xml"  # Le chemin vers votre fichier XML
students_data = parse_xml(xml_file)
generate_pdf(students_data)
