import xml.etree.ElementTree as ET
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib import colors

# Fonction pour lire les données depuis le fichier XML
def parse_student_card(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    
    ns = {"ns": "http://studentcard.org"}  # Espace de noms
    data = {
        "nameUae": root.find(".//ns:nameUae", ns).text if root.find(".//ns:nameUae", ns) is not None else "Unknown University",
        "nameSchool": root.find(".//ns:nameSchool", ns).text if root.find(".//ns:nameSchool", ns) is not None else "Unknown School",
        "villeSchool": root.find(".//ns:villeSchool", ns).text if root.find(".//ns:villeSchool", ns) is not None else "Unknown City",
        "title": root.find(".//ns:title", ns).text if root.find(".//ns:title", ns) is not None else "Student Card",
        "lastName": root.find(".//ns:lastName", ns).text if root.find(".//ns:lastName", ns) is not None else "Doe",
        "firstName": root.find(".//ns:firstName", ns).text if root.find(".//ns:firstName", ns) is not None else "John",
        "codeApoge": root.find(".//ns:codeApoge", ns).text if root.find(".//ns:codeApoge", ns) is not None else "00000000",
        "photo": root.find(".//ns:photo/ns:images/photoCarte.JPG", ns).text if root.find(".//ns:photo/ns:images/photoCarte.JPG", ns) is not None else "",
        "scanBar": root.find(".//ns:scanBar/ns:images/scanbar.png", ns).text if root.find(".//ns:scanBar/ns:images/scanbar.png", ns) is not None else "",
        "footer": root.find(".//ns:footer", ns).text if root.find(".//ns:footer", ns) is not None else "No footer"
    }
    
    return data

# Fonction pour générer le PDF
def generate_pdf(data, filename="Carte_Etudiant.pdf"):
    c = canvas.Canvas(filename, pagesize=A4)  # Format A4
    width, height = A4

    # Ajouter un fond ou bordure pour la carte
    c.setStrokeColor(colors.black)
    c.setLineWidth(2)
    c.rect(30, 30, width - 60, height - 60)

    # Ajouter les logos (à remplacer par les chemins réels des images)
    if data["photo"]:
        c.drawImage(data["photo"], 50, height - 150, width=1.2*inch, height=1.5*inch)
    if data["scanBar"]:
        c.drawImage(data["scanBar"], width - 130, height - 180, width=1*inch, height=0.8*inch)

    # Ajouter les informations de l'université et de l'école
    c.setFont("Helvetica-Bold", 14)
    c.drawString(50, height - 50, data["nameUae"])
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, height - 70, data["nameSchool"])
    c.drawString(50, height - 90, data["villeSchool"])

    # Titre de la carte étudiant
    c.setFont("Helvetica-Bold", 16)
    c.drawString(50, height - 130, "CARTE D'ETUDIANT")

    # Informations de l'étudiant
    c.setFont("Helvetica", 12)
    c.drawString(50, height - 160, f"Nom : {data['lastName']}")
    c.drawString(50, height - 180, f"Prénom : {data['firstName']}")
    c.drawString(50, height - 200, f"Code Apogée : {data['codeApoge']}")

    # Footer et informations supplémentaires
    c.setFont("Helvetica-Oblique", 10)
    c.drawString(50, height - 250, f"Première Inscription : {data['footer']}")

    c.save()

# Exécution du script
xml_file = "Carte_Etudiant.xml"  # Chemin vers votre fichier XML
data = parse_student_card(xml_file)
generate_pdf(data)
