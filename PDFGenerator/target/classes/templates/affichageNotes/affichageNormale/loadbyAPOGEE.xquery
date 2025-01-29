xquery version "3.1";

declare variable $APOGEE as xs:string external;

let $inputXml := doc("../../../database/students.xml")

let $students := $inputXml/Students


return
    <Note class="GINF2">
      <Modules>
         <Module code="{ $APOGEE }">
               { $students }
         </Module>
      </Modules>
   </Note>