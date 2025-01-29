import net.sf.saxon.s9api.SaxonApiException;
import org.xml.sax.SAXException;

import javax.xml.transform.TransformerException;
import java.io.IOException;

public class ReleverNoteVNV {
    private static final String MAIN_DIR;

    static {
        MAIN_DIR = "releverNoteVNV";
    }
    public void generateReleveNoteVNVByApogee(String codeApogee, String OutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator releveNote = new PDFGenerator(MAIN_DIR);
        releveNote.parseXmlDatabase("APOGEE", codeApogee);
        releveNote.convertToPDF(OutputName);

    }
    public void generateReleveNoteVNVByCNE(String codeCNE, String OutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator releveNote = new PDFGenerator(MAIN_DIR);
        releveNote.parseXmlDatabase("CNE", codeCNE);
        releveNote.convertToPDF(OutputName);

    }
}
