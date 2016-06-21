package com.juhuawang.util.pay.rizhao;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * @author pwj
 *         B2B银行平台接口Servlet类  接收用户数据并且返回处理结果
 */
@WebServlet("/b2BPayGateServlet")
public class B2BPayGateServlet extends HttpServlet {
    private static final long serialVersionUID = -5032588854093962738L;

    private final static String CHARSET = "UTF-8";//编码格式

    //银行接口dopost方法
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取客户发送的加密报文 key为msg
        String msg = request.getParameter("msg");
        try {
            //先RSA解密后base64解码
            String xml = RSAUtils.base64Decode(RSAUtils.decode(msg));
            //xml字符串生成Document对象用于
            Document doc = DocumentHelper.parseText(xml);
            //处理登录日照银行企业网银、确认订单信息、扣款等业务逻辑

            //确认支付成功，返回日聚电商平台
            Element root = doc.getRootElement();
            Element opReq = root.element("opReq");
            String returnUrl = opReq.element("MERCHANTURL").getTextTrim();
            String payment = opReq.element("PAYMENT").getTextTrim();
            String orderId = opReq.element("ORDERID").getTextTrim();
/*          request.setAttribute("merchantUrl", returnUrl);
            request.setAttribute("sendStr", getBankXml(payment, orderId));*/
            PrintWriter out = response.getWriter();
            out.println(getBankXml(payment, orderId));

        } catch (Exception e) {
            e.printStackTrace();
        }
        // request.getRequestDispatcher("http://58.58.180.104:8888/JuHuaWang/order/toorderSuccess").forward(request, response);

    }

    /**
     * 组织银行接口返回的报文
     *
     * @param payment
     * @param orderId
     * @return
     * @throws Exception
     */

    private String getBankXml(String payment, String orderId) throws Exception {
        Document doc = DocumentHelper.createDocument();
        doc.setXMLEncoding(CHARSET);
        Element root = doc.addElement("BankData");
        Element opReq = root.addElement("opReq");
        opReq.addElement("CHANNALNUM").setText("2002");
        opReq.addElement("TRANTYPE").setText("0");
        opReq.addElement("MERCHANTID").setText("8102002001");
        opReq.addElement("MERCHANTNAME").setText("日聚电子商务");
        opReq.addElement("PAYMENT").setText(payment);
        opReq.addElement("ORDERID").setText(orderId);
        opReq.addElement("RESPCODE").setText("0");
        opReq.addElement("RESPSSAGE").setText("支付成功");
        String encodexml = RSAUtils.encode(RSAUtils.base64Encode(doc.asXML().getBytes(CHARSET)));
        //System.out.println("======================++++++++" + RSAUtils.base64Decode(RSAUtils.decode(new String(encodexml.getBytes(),CHARSET))));
        return encodexml;
    }



}
