import net.sf.saxon.s9api.*;

import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.xmlgraphics.util.MimeConstants;
import org.xml.sax.SAXException;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Objects;


public class PDFGenerator {
    private static final String RESOURCES_DIR;
    private static final String OUTPUT_DIR;
    private static final String CONF_DIR;
    private final String typeGenerator;

    public PDFGenerator(String typeGenerator) {
        this.typeGenerator = typeGenerator;
    }

    static {
        System.setProperty("javax.xml.transform.TransformerFactory", "com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl");
        RESOURCES_DIR = "src//main//resources//templates//";
        CONF_DIR = "src//main//resources//fop//fop.xconf";
        OUTPUT_DIR = "src//main//resources//output//";
    }

    private static void serializeXdmValueToFile(Processor processor, XdmValue value, String outputFilePath)
            throws SaxonApiException {
        // Create a Serializer using the Processor
        Serializer serializer = processor.newSerializer(new File(outputFilePath));
        serializer.setOutputProperty(Serializer.Property.METHOD, "xml");
        serializer.setOutputProperty(Serializer.Property.INDENT, "yes");

        // Serialize the XdmValue to an XML file
        serializer.serializeXdmValue(value);
    }

    public void parseXmlDatabase(String keyID, String keyValue) throws IOException, SaxonApiException {
        // XQuery file
        String searchParam = Objects.equals(keyID, "APOGEE") ? "loadbyAPOGEE": "loadbyCNE";
        File xqueryFile = new File(RESOURCES_DIR + this.typeGenerator + "//" + searchParam + ".xquery");

        // Output XML file path
        String outputFilePath = RESOURCES_DIR + this.typeGenerator + "//data.xml";

        // Create a Processor
        Processor processor = new Processor(false);
        XQueryEvaluator evaluator = getXdmItems(keyID, keyValue, xqueryFile, processor);

        // Evaluate the XQuery
        XdmValue result = evaluator.evaluate();

        // Process the result and write to an XML file
        serializeXdmValueToFile(processor, result, outputFilePath);
    }

    private static XQueryEvaluator getXdmItems(String keyID, String keyValue, File xqueryFile, Processor processor) throws SaxonApiException, IOException {
        // Load the XQuery file
        XQueryCompiler compiler = processor.newXQueryCompiler();
        XQueryExecutable exp = compiler.compile(xqueryFile);

        // Create a new XQuery evaluator
        XQueryEvaluator evaluator = exp.load();

        // Set the value as an external variable
        QName apogeeParam = new QName(keyID);
        XdmAtomicValue apogeeAtomicValue = new XdmAtomicValue(keyValue);
        evaluator.setExternalVariable(apogeeParam, apogeeAtomicValue);
        return evaluator;
    }

    public void convertToPDF(String outputName) throws IOException, SAXException, TransformerException {
        // the XSL FO file
        StreamSource xslFile = new StreamSource(new File(RESOURCES_DIR +
                this.typeGenerator + "//data.xsl"));

        // the XML file which provides the input
        StreamSource xmlSource = new StreamSource(new File(RESOURCES_DIR +
                this.typeGenerator + "//data.xml"));

        // The Conf File
        File confFile = new File(CONF_DIR);

        // The output file:
        String outputFile = OUTPUT_DIR + "//" + outputName + ".pdf";

        // XML + XSL Processing:
        FopFactory fopFactory = FopFactory.newInstance(confFile);
        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer(xslFile);
        Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, new FileOutputStream(outputFile));

        Result result = new SAXResult(fop.getDefaultHandler());
        transformer.transform(xmlSource, result);
    }
}
