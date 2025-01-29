xquery version "3.1";

declare variable $APOGEE as xs:string external;

let $inputXml := doc("../../database/students.xml")

let $student := $inputXml/Students/Student[@APOGEE  = $APOGEE]


return
    <attes>
            <royaumefr>Royaume du Maroc</royaumefr>
            <nameUaefr>Université Abdelmalek Essaâdi</nameUaefr>
            <nameSchoolfr>Ecole Nationale des Sciences Appliquées </nameSchoolfr>
            <villeSchoolfr>Tanger</villeSchoolfr>
            
            <logoEnsa uri="ensa.png"/>
            
            <royaumeAr lang="ar" direction="rtl">المملكة المغربية</royaumeAr>
            <nameUaeAr lang="ar" direction="rtl">جامعة عبد المالك السعدي</nameUaeAr>
            <nameSchoolAr lang="ar" direction="rtl">المدرسة الوطنية للعلوم التطبيقية </nameSchoolAr>
            <villeSchoolAr lang="ar" direction="rtl">طنجة</villeSchoolAr>
            
            
            <title>ATTESTATION  DE  REUSSITE</title>
            
            <body>
                <header>Le Directeur de l'Ecole Natioale des Sciences Appliquées de Tanger atteste que</header>
                <infoEtudiant>
                    <nom>Monsieur { $student/lastName/text() } {" "} { $student/firstName/text() }</nom>
                    <naissance>née le 27 avril 2002 à Tanger</naissance>
                    <message>a été déclarée admis au niveau</message>
                    <nivAdmis>3° Année Génie Informatique (Systèmes d'information)</nivAdmis>
                    <annee>au titre de l'année universitaire 2023/2024</annee>
                </infoEtudiant>
            </body>
            
            
            <footer>
                <date>Fait à TANGER, le 02 Decembre 2023</date>
                <Signature>Le Directeur: </Signature>
                <CodeApogeName>N° étudiant: </CodeApogeName>
                <CodeApoge>{ $student/@APOGEE/data() }</CodeApoge>
                
                <avis>Avis important: il ne peut être délivré qu'un seul exemplaire de cette attestation. Aucun duplicate ne sera fourni. </avis>
            </footer>
            
            
    </attes>
