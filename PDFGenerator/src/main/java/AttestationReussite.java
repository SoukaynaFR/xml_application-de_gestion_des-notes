import net.sf.saxon.s9api.SaxonApiException;
import org.xml.sax.SAXException;

import javax.xml.transform.TransformerException;
import java.io.IOException;

public class AttestationReussite {
    private static final String MAIN_DIR;

    static {
        MAIN_DIR = "attestationReussite";
    }
    public void generateAttestationByApogee(String codeApogee, String frontOutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator Attestation = new PDFGenerator(MAIN_DIR);
        Attestation.parseXmlDatabase("APOGEE", codeApogee);
        Attestation.convertToPDF(frontOutputName);
    }

    public void generateAttestationByCNE(String codeCNE, String frontOutputName) throws IOException, SaxonApiException, TransformerException, SAXException {
        PDFGenerator Attestation = new PDFGenerator(MAIN_DIR);
        Attestation.parseXmlDatabase("CNE", codeCNE);
        Attestation.convertToPDF(frontOutputName);
    }
}
