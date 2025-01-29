import pandas as pd
import xml.etree.ElementTree as ET

# Charger le fichier Excel
excel_file = "GINF2_students.xlsx"  
sheet_name = "Liste des étudiants"  # Modifier si le nom de la feuille change

# Lire le fichier Excel
df = pd.read_excel(excel_file, sheet_name=sheet_name)

# Création de l'élément racine XML
root = ET.Element("Students")

# Boucle sur chaque étudiant
for _, row in df.iterrows():
    student = ET.SubElement(root, "Student")

    # Ajouter les informations générales
    ET.SubElement(student, "CNE").text = str(row["CNE"])
    ET.SubElement(student, "CIN").text = str(row["CIN"])
    ET.SubElement(student, "CodeApogee").text = str(row["code_apogée"])
    ET.SubElement(student, "FirstName").text = str(row["Prénom"])
    ET.SubElement(student, "LastName").text = str(row["Nom"])
    ET.SubElement(student, "LieuNaissance").text = str(row["Lieu_Naissance"])
    ET.SubElement(student, "DateNaissance").text = str(row["Date_Naissance"])

    # Ajouter les notes
    notes_element = ET.SubElement(student, "Notes")
    for col in df.columns:
        if col not in ["code_apogée", "CIN", "CNE", "Nom", "Prénom", "Lieu_Naissance", "Date_Naissance"]:
            module_element = ET.SubElement(notes_element, "Module", name=col)
            module_element.text = str(row[col]) if not pd.isna(row[col]) else "N/A"

# Sauvegarde du fichier XML
tree = ET.ElementTree(root)
output_file = "Students_GInf2.xml"
tree.write(output_file, encoding="utf-8", xml_declaration=True)

print(f"Fichier XML '{output_file}' généré avec succès !")
