package rizhaobank;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by pwj on 15/6/4.
 * 生成xml文档或BASE64 XML加密文档 用于接口调用的报文格式：报文头 + 报文体数据包
 */
public class PackageMaker {
    //统一设置编码格式
    public final static String CHARSETgb2312 = "gb2312";
    public final static String CHARSETGBK = "GBK";
    //交易序列号 交易序列号 23 位  YYYYMMDDHHMMSSCCCXXYYYY YYYYMMDD 年月日HHMMSS 小时分钟秒 CCC 银行提供的固定编号XX 银行为企业编号分配的两位编号YYYY 四位的顺序号（客户端唯一标识单笔指令序号）
    public static String serialNo = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "810" + "FU" + "2356";
    public static String serialNoDetail = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "810" + "FU" + "2358";

    public static void main(String[] args) throws Exception {
        XMLStringForSCP();//测试
    }

    /**
     * 生成xml文档XML加密文档的字符串 用于SCP安全客户端接口调用的报文格式：报文头 + 报文体xml格式数据发送
     */
    public static String XMLStringForSCP() {
        //生成Document对象 用来解析xml
        Document doc = DocumentHelper.createDocument();
        doc.setXMLEncoding(CHARSETgb2312);//设置xml编码格式

        //添加xml的元素并且添加文本数据
        Element root = doc.addElement("msg");
        //父级元素添加子集元素
        Element msg_head = root.addElement("msg_head");
        msg_head.addElement("msg_type").setText("0");
        msg_head.addElement("msg_id").setText("1005");
        msg_head.addElement("msg_sn").setText("0");
        msg_head.addElement("version").setText("1");
        //父级元素添加子集元素
        Element msg_body = root.addElement("msg_body");
        Element origin_data_len = msg_body.addElement("origin_data_len");
        Element origin_data = msg_body.addElement("origin_data");
        Element opReq = origin_data.addElement("opReq");
        opReq.addElement("opname").setText("enterpriseQry");
        opReq.addElement("cstNo").setText("100000001126");
        opReq.addElement("userNo").setText("101206");
        opReq.addElement("serialNo").setText(serialNo);
        opReq.addElement("userId").setText("XS");
        opReq.addElement("reqTime").setText("20140404095542");
/*      opReq.addElement("bankId").setText("810");*/
        Element ReqParam = opReq.addElement("ReqParam");

        ReqParam.addElement("accountNo").setText("8101010111014204210010000040");
        ReqParam.addElement("currencyType").setText("01");
        ReqParam.addElement("currIden").setText("0");
        //将数字签名原文长度赋值
        String xmlStr = Dom4jUtils.getXmlContentWithoutWhitespace(opReq);
        try {
            xmlStr = new String((xmlStr + getChinese(xmlStr)).getBytes(), CHARSETgb2312);//单独再加一遍汉字  汉字占两个长度
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        origin_data_len.setText(String.valueOf(xmlStr.length()));

        OutputFormat format = new OutputFormat();
        format.setEncoding(CHARSETgb2312);
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            XMLWriter writer = new XMLWriter(baos, format);
            writer.write(doc);//输出流方式写出document对象
            String docStr = new String(baos.toByteArray(), CHARSETgb2312);
            System.out.println("---------------格尔客户端SCP的XML:\n" + docStr.replaceAll("\n", ""));
            return docStr.replaceAll("[\r\n]", "");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 生成xml文档或BASE64 XML加密文档的字符串 用于接口调用的报文格式：报文头 + 报文体xml格式数据发送
     */
    public static String XMLStringForBank() {
        //生成Document对象 用来解析xml
        Document doc = DocumentHelper.createDocument();
        doc.setXMLEncoding(CHARSETGBK);
        //添加xml的元素并且添加文本数据
        Element root = doc.addElement("BankData");
        //父级元素添加子集元素
        Element sign = root.addElement("Sign");
        Element signedData = sign.addElement("SignedData");
        sign.addElement("PubKey").setText("11");

        Element opReq = root.addElement("opReq");
        opReq.addElement("opname").setText("enterpriseQry");
        opReq.addElement("cstNo").setText("100000001126");
        opReq.addElement("userNo").setText("101206");
        opReq.addElement("serialNo").setText(serialNo);
        opReq.addElement("userId").setText("XS");
        opReq.addElement("reqTime").setText("20140404095542");
     /*   opReq.addElement("bankId").setText("810");*/
        Element ReqParam = opReq.addElement("ReqParam");

        ReqParam.addElement("accountNo").setText("8101010111014204210010000040");
        ReqParam.addElement("currencyType").setText("01");
        ReqParam.addElement("currIden").setText("0");


        //xml元素生成没有空格的String字符串
        /*String opReqXml = Dom4jUtils.getXmlContentWithoutWhitespace(opReq);*/
        String encryptedOpReqXml = null;
        try {
            //base64编码加密后的xml
           /* encryptedOpReqXml = RSAUtils.encode(RSAUtils.base64Encode(opReqXml.getBytes()));*/
            encryptedOpReqXml = HttpClient.getSCPInfo();
            //base64编码加密后的xml放入signedData元素中
            signedData.setText(encryptedOpReqXml);
            OutputFormat format = new OutputFormat();
            format.setEncoding(CHARSETGBK);


            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            XMLWriter writer = new XMLWriter(baos, format);
            writer.write(doc);//输出流方式写出document对象

            String docStr = new String(baos.toByteArray(), CHARSETGBK);
            //交易序列号 长度 23 位
       /*     String serialNo = "00040404095532810XS0002";*/
            //交易名称 长度为25  左补零
            String opname = "0000000000000000000000000" + "enterpriseQry";
            opname = opname.substring(opname.length() - 25);
            //报文主体长度为8	 左补零（上传报文体长度）
            String meslen = "00000000" + String.valueOf(docStr.length());
            meslen = meslen.substring(meslen.length() - 8);

            //银企直连交易报文头和报文体组合最终报文
            docStr = (serialNo + opname + meslen) + docStr;
            docStr = new String(docStr.getBytes(), CHARSETGBK);
        /*  String base64Doc = RSAUtils.base64Encode(baos.toByteArray());*/

            System.out.println("---------------银企直连报文XML:\n" + docStr);
      /*    System.out.println("-------------BASE64 XML:\n" + base64Doc);*/
            return docStr.trim();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }


    /**
     * 获取签名原文中的中文  <origin_data_len>中文字符长度占2位</origin_data_len>处理
     */
    public static String getChinese(String str) {
        Pattern p = null;
        Matcher m = null;
        String values = "";//总的中文字符串
        String value = "";//单个中文字符串
        //获取中文的正则表达式
        p = Pattern.compile("[\u4e00-\u9fa5]");
        m = p.matcher(str);

        while (m.find()) {
            value = m.group(0);
            values += value;
        }

        return values;
    }


    /**
     * 交易明细查询接口  生成xml文档XML加密文档的字符串 用于SCP安全客户端接口调用的报文格式：报文头 + 报文体xml格式数据发送
     */
    public static String queryAccHisDetailForSCP() {
        //生成Document对象 用来解析xml
        Document doc = DocumentHelper.createDocument();
        doc.setXMLEncoding(CHARSETgb2312);//设置xml编码格式

        //添加xml的元素并且添加文本数据
        Element root = doc.addElement("msg");
        //父级元素添加子集元素
        Element msg_head = root.addElement("msg_head");
        msg_head.addElement("msg_type").setText("0");
        msg_head.addElement("msg_id").setText("1005");
        msg_head.addElement("msg_sn").setText("0");
        msg_head.addElement("version").setText("1");
        //父级元素添加子集元素
        Element msg_body = root.addElement("msg_body");
        Element origin_data_len = msg_body.addElement("origin_data_len");
        Element origin_data = msg_body.addElement("origin_data");
        Element opReq = origin_data.addElement("opReq");
        opReq.addElement("opname").setText("queryAccHisDetail");
        opReq.addElement("cstNo").setText("100000001126");
        opReq.addElement("serialNo").setText(serialNoDetail);
        opReq.addElement("userNo").setText("101206");
        opReq.addElement("userId").setText("XS");
        opReq.addElement("reqTime").setText("20140404095542");
        Element ReqParam = opReq.addElement("ReqParam");

        ReqParam.addElement("accountNo").setText("8101010111014204210010000040");
        ReqParam.addElement("beginDate").setText("20150906");
        ReqParam.addElement("endDate").setText("20150906");

        //将数字签名原文长度赋值
        String xmlStr = Dom4jUtils.getXmlContentWithoutWhitespace(opReq);
        try {
            xmlStr = new String((xmlStr + getChinese(xmlStr)).getBytes(), CHARSETgb2312);//单独再加一遍汉字  汉字占两个长度
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        origin_data_len.setText(String.valueOf(xmlStr.length()));

        OutputFormat format = new OutputFormat();
        format.setEncoding(CHARSETgb2312);
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            XMLWriter writer = new XMLWriter(baos, format);
            writer.write(doc);//输出流方式写出document对象
            String docStr = new String(baos.toByteArray(), CHARSETgb2312);
            System.out.println("---------------查询明细记录格尔客户端SCP的XML:\n" + docStr.replaceAll("\n", ""));
            return docStr.replaceAll("[\r\n]", "");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 交易明细查询接口  生成xml文档或BASE64 XML加密文档的字符串 用于接口调用的报文格式：报文头 + 报文体xml格式数据发送
     */
    public static String queryAccHisDetailForBank() {
        //生成Document对象 用来解析xml
        Document doc = DocumentHelper.createDocument();
        doc.setXMLEncoding(CHARSETGBK);
        //添加xml的元素并且添加文本数据
        Element root = doc.addElement("BankData");
        //父级元素添加子集元素
        Element sign = root.addElement("Sign");
        Element signedData = sign.addElement("SignedData");
        sign.addElement("PubKey").setText("00");

        Element opReq = root.addElement("opReq");
        opReq.addElement("opname").setText("queryAccHisDetail");
        opReq.addElement("cstNo").setText("100000001126");
        opReq.addElement("serialNo").setText(serialNoDetail);
        opReq.addElement("userNo").setText("101206");
        opReq.addElement("userId").setText("XS");
        opReq.addElement("reqTime").setText("20140404095542");
        Element ReqParam = opReq.addElement("ReqParam");

        ReqParam.addElement("accountNo").setText("8101010111014204210010000040");
        ReqParam.addElement("beginDate").setText("20150906");
        ReqParam.addElement("endDate").setText("20150906");


        String encryptedOpReqXml = null;
        try {

            encryptedOpReqXml = HttpClient.getSCPInfo();
            //base64编码加密后的xml放入signedData元素中
            signedData.setText(encryptedOpReqXml);
            OutputFormat format = new OutputFormat();
            format.setEncoding(CHARSETGBK);


            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            XMLWriter writer = new XMLWriter(baos, format);
            writer.write(doc);//输出流方式写出document对象

            String docStr = new String(baos.toByteArray(), CHARSETGBK);
            //交易序列号 长度 23 位
       /*     String serialNo = "00040404095532810XS0002";*/
            //交易名称 长度为25  左补零
            String opname = "0000000000000000000000000" + "queryAccHisDetail";
            opname = opname.substring(opname.length() - 25);
            //报文主体长度为8	 左补零（上传报文体长度）
            String meslen = "00000000" + String.valueOf(docStr.length());
            meslen = meslen.substring(meslen.length() - 8);

            //银企直连交易报文头和报文体组合最终报文
            docStr = (serialNoDetail + opname + meslen) + docStr;
            docStr = new String(docStr.getBytes(), CHARSETGBK);

            System.out.println("---------------查询明细记录银企直连报文XML:\n" + docStr);

            return docStr.trim();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

}
