package rizhaobank;

import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class PayGatePackageXMLErrorHandler implements ErrorHandler {

    private StringBuffer warning = new StringBuffer();
    private StringBuffer error = new StringBuffer();
    private StringBuffer fatalError = new StringBuffer();

    public void warning(SAXParseException e) throws SAXException {
        warning.append("\t").append(getMsg(e.getMessage())).append("\n");
    }

    public void error(SAXParseException e) throws SAXException {
        error.append("\t").append(getMsg(e.getMessage())).append("\n");
    }

    public void fatalError(SAXParseException e) throws SAXException {
        fatalError.append("\t").append(getMsg(e.getMessage())).append("\n");
    }

    private String getMsg(String str){
        int index;

        if((index = str.indexOf(":")) != -1){
            str = str.substring(index + 1);
        }

        return str;
    }

    public boolean hasError(){
        return warning.length()!=0 || error.length()!=0 || fatalError.length()!=0;
    }

    public String getErrors(){
        StringBuffer errors = new StringBuffer();

        if(warning.length()!=0){
            errors.append("Warning:").append("\n").append(warning);
        }

        if(error.length()!=0){
            errors.append("Error:").append("\n").append(error);
        }

        if(fatalError.length()!=0){
            errors.append("FatalError:").append("\n").append(fatalError);
        }

        return errors.toString();
    }

}
