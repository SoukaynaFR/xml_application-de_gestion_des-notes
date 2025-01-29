import xml.etree.ElementTree as ET
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib.utils import simpleSplit

# Fonction pour extraire les données depuis le fichier XML
import xml.etree.ElementTree as ET

# Fonction pour extraire les données depuis le fichier XML avec gestion de l'espace de noms
def parse_attestation(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    
    # Récupération de l'espace de noms
    ns = {"ns": "http://GINF2AttestaionReussite.org"}  # Adapter l'espace de noms ici

    # Extraction des informations avec le préfixe 'ns'
    data = {
        "royaumefr": root.find(".//ns:royaumefr", ns).text,
        "nameUaefr": root.find(".//ns:nameUaefr", ns).text,
        "nameSchoolfr": root.find(".//ns:nameSchoolfr", ns).text,
        "villeSchoolfr": root.find(".//ns:villeSchoolfr", ns).text,
        "title": root.find(".//ns:title", ns).text,
        "header": root.find(".//ns:header", ns).text,
        "nom": root.find(".//ns:nom", ns).text,
        "naissance": root.find(".//ns:naissance", ns).text,
        "message": root.find(".//ns:message", ns).text,
        "nivAdmis": root.find(".//ns:nivAdmis", ns).text,
        "annee": root.find(".//ns:annee", ns).text,
        "date": root.find(".//ns:date", ns).text,
        "signature": root.find(".//ns:Signature", ns).text,
        "codeApogeName": root.find(".//ns:CodeApogeName", ns).text,
        "codeApoge": root.find(".//ns:CodeApoge", ns).text,
        "avis": root.find(".//ns:avis", ns).text
    }

    return data


# Fonction pour générer le PDF de l'attestation
def generate_attestation_pdf(data, filename="Attestation_Reussite.pdf"):
    c = canvas.Canvas(filename, pagesize=A4)
    width, height = A4
    
    # Configuration des styles
    c.setFont("Helvetica-Bold", 14)
    y_position = height - 50
    
    # Affichage des informations générales
    c.drawString(200, y_position, data["royaumefr"])
    c.drawString(150, y_position - 20, data["nameUaefr"])
    c.drawString(130, y_position - 40, data["nameSchoolfr"])
    c.drawString(250, y_position - 60, data["villeSchoolfr"])
    
    # Titre de l'attestation
    c.setFont("Helvetica-Bold", 16)
    c.drawString(180, y_position - 100, data["title"])
    
    # Corps du texte
    c.setFont("Helvetica", 12)
    y_position -= 140
    lines = simpleSplit(data["header"], "Helvetica", 12, width - 100)
    for line in lines:
        c.drawString(50, y_position, line)
        y_position -= 20
    
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y_position - 20, data["nom"])
    
    c.setFont("Helvetica", 12)
    c.drawString(50, y_position - 40, data["naissance"])
    c.drawString(50, y_position - 60, data["message"])
    
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y_position - 80, data["nivAdmis"])
    
    c.setFont("Helvetica", 12)
    c.drawString(50, y_position - 100, data["annee"])
    
    # Date et signature
    c.drawString(50, y_position - 140, data["date"])
    c.drawString(50, y_position - 160, data["signature"])
    
    # Numéro étudiant
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y_position - 180, f"{data['codeApogeName']} {data['codeApoge']}")
    
    # Avis important
    c.setFont("Helvetica", 10)
    lines = simpleSplit(data["avis"], "Helvetica", 10, width - 100)
    y_position -= 220
    for line in lines:
        c.drawString(50, y_position, line)
        y_position -= 15
    
    # Sauvegarde du PDF
    c.save()

# Exemple d'utilisation
xml_file = "Attestation_Reussite.xml"  
attestation_data = parse_attestation(xml_file)
generate_attestation_pdf(attestation_data)
