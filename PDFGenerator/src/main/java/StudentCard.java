import net.sf.saxon.s9api.SaxonApiException;
import org.xml.sax.SAXException;

import javax.xml.transform.TransformerException;
import java.io.IOException;

public class StudentCard {
    private static final String FRONT_DIR;
    private static final String BACK_DIR;

    static {
        FRONT_DIR = "carteEtudiant/front";
        BACK_DIR = "carteEtudiant/back";
    }
    private void generateBackCard(String backOutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
            PDFGenerator StudentCard = new PDFGenerator(BACK_DIR);
            StudentCard.convertToPDF(backOutputName);
    }
    private void generateFrontCardByApogee(String codeApogee, String frontOutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator StudentCard = new PDFGenerator(FRONT_DIR);
        StudentCard.parseXmlDatabase("APOGEE", codeApogee);
        StudentCard.convertToPDF(frontOutputName);

    }
    private void generateFrontCardByCNE(String codeCNE, String frontOutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator StudentCard = new PDFGenerator(FRONT_DIR);
        StudentCard.parseXmlDatabase("CNE", codeCNE);
        StudentCard.convertToPDF(frontOutputName);

    }
    public void generateStudentCardByApogee(String codeApogee, String frontOutputName, String backOutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        generateBackCard(backOutputName);
        generateFrontCardByApogee(codeApogee, frontOutputName);
    }

    public void generateStudentCardByCNE(String codeCNE, String frontOutputName, String backOutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        generateBackCard(backOutputName);
        generateFrontCardByCNE(codeCNE, frontOutputName);
    }
}
