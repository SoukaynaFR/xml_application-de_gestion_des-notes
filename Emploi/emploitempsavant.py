import os
import xml.etree.ElementTree as ET
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib.utils import ImageReader

# Paths (Update according to the new folder structure)
# FOLDER_PATH = r"/mnt/data"
XML_FILE = "EmploiTempsAvant.xml"  
PDF_FILE =  "EmploiTempsGenerated.pdf"

# Logo paths
LOGO_UAE = "logoUae.png"
LOGO_ENSA = "ensa.png"
LOGO_ENSAT = "ensat.png"

def parse_xml(xml_path):
    """Extract timetable data from XML."""
    tree = ET.parse(xml_path)
    root = tree.getroot()
    
    # Extracting timetable title, week, year
    title = root.find(".//{http://GINF2Emploi.org}Title").text
    week = root.find(".//{http://GINF2Emploi.org}semaine").text
    year = root.find(".//{http://GINF2Emploi.org}annee").text
    
    # Extracting courses
    courses = []
    for matiere in root.findall(".//{http://GINF2Emploi.org}matieres/*"):
        course = {
            "name": matiere.find("{http://GINF2Emploi.org}nom").text,
            "type": matiere.find("{http://GINF2Emploi.org}type").text.strip(),
            "time": matiere.find("{http://GINF2Emploi.org}Durre1").text,
            "day": matiere.find("{http://GINF2Emploi.org}jour").text,
            "professor": matiere.find("{http://GINF2Emploi.org}nomProf").text,
            "room": matiere.find("{http://GINF2Emploi.org}salle").text
        }
        courses.append(course)
    
    return title, week, year, courses

def generate_pdf(title, week, year, courses, pdf_path):
    """Generate timetable PDF with a professional design."""
    c = canvas.Canvas(pdf_path, pagesize=A4)
    width, height = A4
    y_position = height - 50

    # Add logos
    c.drawImage(ImageReader(LOGO_UAE), 50, y_position - 80, width=100, height=100, mask='auto')
    c.drawImage(ImageReader(LOGO_ENSA), width/2 - 50, y_position - 80, width=120, height=80, mask='auto')
    c.drawImage(ImageReader(LOGO_ENSAT), width - 150, y_position - 80, width=100, height=100, mask='auto')

    # Title
    y_position -= 100
    c.setFont("Helvetica-Bold", 16)
    c.drawCentredString(width / 2, y_position, title)

    # Week and Year
    c.setFont("Helvetica", 12)
    y_position -= 20
    c.drawString(50, y_position, f"{week}  |  {year}")

    # Table header
    y_position -= 40
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y_position, "Jour")
    c.drawString(150, y_position, "Matière")
    c.drawString(300, y_position, "Type")
    c.drawString(370, y_position, "Horaire")
    c.drawString(460, y_position, "Professeur")
    c.drawString(550, y_position, "Salle")
    
    # Table content
    c.setFont("Helvetica", 10)
    y_position -= 20
    for course in courses:
        c.drawString(50, y_position, course["day"])
        c.drawString(150, y_position, course["name"])
        c.drawString(300, y_position, course["type"])
        c.drawString(370, y_position, course["time"])
        c.drawString(460, y_position, course["professor"])
        c.drawString(550, y_position, course["room"])
        y_position -= 20

    # Save PDF
    c.save()
    print(f"[✔] PDF generated: {pdf_path}")

# Execute script
if __name__ == "__main__":
    title, week, year, courses = parse_xml(XML_FILE)
    generate_pdf(title, week, year, courses, PDF_FILE)
