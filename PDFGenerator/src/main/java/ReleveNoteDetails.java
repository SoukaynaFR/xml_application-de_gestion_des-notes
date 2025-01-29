import net.sf.saxon.s9api.SaxonApiException;
import org.xml.sax.SAXException;

import javax.xml.transform.TransformerException;
import java.io.IOException;

public class ReleveNoteDetails {
    private static final String MAIN_DIR;

    static {
        MAIN_DIR = "releveNoteDetails";
    }
    public void enerateReleveNoteByApogee(String codeApogee, String OutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator releveNote = new PDFGenerator(MAIN_DIR);
        releveNote.parseXmlDatabase("APOGEE", codeApogee);
        releveNote.convertToPDF(OutputName);

    }
    public void generateReleveNoteByCNE(String codeCNE, String OutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator releveNote = new PDFGenerator(MAIN_DIR);
        releveNote.parseXmlDatabase("CNE", codeCNE);
        releveNote.convertToPDF(OutputName);

    }
}
