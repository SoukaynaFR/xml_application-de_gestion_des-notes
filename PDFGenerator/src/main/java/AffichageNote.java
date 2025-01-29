import net.sf.saxon.s9api.SaxonApiException;
import org.xml.sax.SAXException;

import javax.xml.transform.TransformerException;
import java.io.IOException;

public class AffichageNote {
    private static final String NORMALE_DIR;
    private static final String RATT_DIR;

    static {
        NORMALE_DIR = "affichageNotes/affichageNormale";
        RATT_DIR = "affichageNotes/affichageRatt";
    }
    public void generateAffichageNormaleByModule(String codeModule, String OutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator Affichage = new PDFGenerator(NORMALE_DIR);
        Affichage.parseXmlDatabase("APOGEE", codeModule);
        Affichage.convertToPDF(OutputName);
    }

    public void generateAffichageRattByModule(String codeModule, String OutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator Affichage = new PDFGenerator(RATT_DIR);
        Affichage.parseXmlDatabase("APOGEE", codeModule);
        Affichage.convertToPDF(OutputName);
    }
}
