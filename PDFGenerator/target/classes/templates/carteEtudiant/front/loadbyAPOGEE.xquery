xquery version "3.1";

declare variable $APOGEE as xs:string external;


let $inputXml := doc("../../../database/students.xml")

let $student := $inputXml/Students/Student[@APOGEE  = $APOGEE]


return
    <card>
        <logoUae uri="logoUae.png"/>
        <nameUae>Université Abdelmalek Essaâdi</nameUae>
        <nameSchool>Ecole Nationale des Sciences Appliquées</nameSchool>
        <villeSchool>Tanger</villeSchool>
        <logoEnsa uri="ensa.png"/>
        <title>CARTE D'ETUDIANT</title>


        <lastName>{ $student/lastName/text() }</lastName>
        <firstName>{ $student/firstName/text() }</firstName>
        <codeApoge>{ $student/@APOGEE/data() }</codeApoge>
        
        <photo uri="photo-default.jpg"/>
        <scanBar uri="scanbar.png"/>
        <footer>Première Inscription : 2020 / 2021</footer>
    </card>