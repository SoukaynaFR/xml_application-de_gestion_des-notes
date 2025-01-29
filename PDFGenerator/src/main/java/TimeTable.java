import net.sf.saxon.s9api.SaxonApiException;
import org.xml.sax.SAXException;

import javax.xml.transform.TransformerException;
import java.io.IOException;

public class TimeTable {
    private static final String MAIN_DIR;
    static {
        MAIN_DIR = "emploiTemps";
    }
    public void generateTimeTable(String outputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator timeTable = new PDFGenerator(MAIN_DIR);
        timeTable.convertToPDF(outputName);
    }
}
