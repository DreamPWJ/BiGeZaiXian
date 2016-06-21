package rizhaobank;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.io.SAXValidator;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.File;

/**
 * Created by pwj 2015/4/28.
 * 验证xml格式是否正确
 */
public class ValidateTest {

    public static void main(String[] args) throws Exception {
        Document doc = new SAXReader().read(
                new File(ValidateTest.class.getResource("/payGatePackage_810.xml").toURI().toURL().getFile()));
        String xsdPath = ValidateTest.class.getResource("payGatePackage_810.xsd").toURI().toURL().getFile();

        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setValidating(true);
        factory.setNamespaceAware(true);

        SAXParser parser = factory.newSAXParser();
        parser.setProperty("http://java.sun.com/xml/jaxp/properties/schemaLanguage",
                "http://www.w3.org/2001/XMLSchema");
        parser.setProperty("http://java.sun.com/xml/jaxp/properties/schemaSource",
                "file:" + xsdPath);
        SAXValidator validator = new SAXValidator(parser.getXMLReader());

        PayGatePackageXMLErrorHandler errorHandler = new PayGatePackageXMLErrorHandler();
        validator.setErrorHandler(errorHandler);
        validator.validate(doc);

        if(errorHandler.hasError()){
            System.out.println(errorHandler.getErrors());
        }else{
            System.out.println("验证成功!");

            Element root = doc.getRootElement();
            Element opReq = root.element("opReq");
            String text = Dom4jUtils.getXmlContentWithoutWhitespace(opReq);
            System.out.println(text);

        }

    }
}
