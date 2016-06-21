package com.juhuawang.util.pay.zhongguo;



import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by pwj  on 2015/11/13 0010.
 * 中国银行B2B充值支付报文打包组织类
 */
@Controller
@RequestMapping("/recharge")
public class Recharge {
    private final static String CHARSET = "UTF-8";//编码格式

    /**
     * 获取当前格式化的时间
     */
    protected static String getTranDate() {
        Date nowDate = new Date();
        //格式化时间格式
        String formatDate = (new SimpleDateFormat("yyyyMMddHHmmss").format(nowDate));
        return formatDate;
    }

    /**
     * 获取报文格式的xml字符串  用于发送报文数据  P7数字签名相关操作
     *
     * @param amount  总金额
     * @param orderno 订单号
     */
    @RequestMapping("/getMessageXML")
    public static void getMessageXML(String orderno, String amount,PrintWriter out) {
        //创建Document对象  用于操作xml
        Document document = DocumentHelper.createDocument();
        document.setXMLEncoding(CHARSET);
        //在内存中组织创建xml格式
        Element root = document.addElement("request");//请求根目录
        Element head = root.addElement("head");//头部数据节点
        head.addElement("requestTime").setText(getTranDate());//
        Element body = root.addElement("body");//主体数据节点
        body.addElement("orderNo").setText(orderno);//商户订单号 商户平台系统提交银行的订单号格式：YYYYMMDDHHMISS+6位流水号 示例：20150226152159000002
        body.addElement("currency").setText("156");//币种 人民币：156
        body.addElement("amount").setText(amount);//金额 单位：分
        body.addElement("orderTime").setText("20150226152159");//商户订单时间格式：YYYYMMDDHHMISS 示例：20150226152159
        body.addElement("orderNote").setText("");//订单描述 如果全中文最多允许60个汉字长度
        body.addElement("backNotifyUrl").setText("http://www.juhuawang.com/JuHuaWang/order/toorderSuccess");//通知商户URL 银行完成交易获得明确交易状态后向该URL发送通知
        body.addElement("closeTime").setText("20160226152159");//超时时间(仅中行网银支付适用)格式：YYYYMMDDHHMISS 示例：20140226152159
        body.addElement("subMerchantInfo").setText("");//二级商户信息
        String signData = "";
        try {
            PKCS7Tool tool = PKCS7Tool.getSigner("E:\\B2B.pfx", "111111", "111111");
            signData = tool.sign(document.asXML().getBytes());
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // System.out.println("xmlString=============" + document.asXML());
        //数字签名的xml字符串用于报文传输
        // System.out.println("数字签名数据signData=========" + signData);
          String  signDataStr= signData.replaceAll("[\r\n]", "");
          out.print(signDataStr);
          out.close();
        //return document.asXML().replaceAll("[\r\n]", "");
    }

    /**
     * 获取明文Base64编码报文格式的xml字符串  用于发送报文数据  相关操作
     *
     * @param amount  总金额
     * @param orderno 订单号
     */
    @RequestMapping("/getBase64MessageXML")
    public static void getBase64MessageXML(String orderno, String amount,PrintWriter out) {
        //创建Document对象  用于操作xml
        Document document = DocumentHelper.createDocument();
        document.setXMLEncoding(CHARSET);
        //在内存中组织创建xml格式
        Element root = document.addElement("request");//请求根目录
        Element head = root.addElement("head");//头部数据节点
        head.addElement("requestTime").setText(getTranDate());//
        Element body = root.addElement("body");//主体数据节点
        body.addElement("orderNo").setText(orderno);//商户订单号 商户平台系统提交银行的订单号格式：YYYYMMDDHHMISS+6位流水号 示例：20150226152159000002
        body.addElement("currency").setText("156");//币种 人民币：156
        body.addElement("amount").setText(amount);//金额 单位：分
        body.addElement("orderTime").setText("20150226152159");//商户订单时间格式：YYYYMMDDHHMISS 示例：20140226152159
        body.addElement("orderNote").setText("");//订单描述 如果全中文最多允许60个汉字长度
        body.addElement("backNotifyUrl").setText("http://www.juhuawang.com/JuHuaWang/order/toorderSuccess");//通知商户URL 银行完成交易获得明确交易状态后向该URL发送通知
        body.addElement("closeTime").setText("20160226152159");//超时时间(仅中行网银支付适用)格式：YYYYMMDDHHMISS 示例：20140226152159
        body.addElement("subMerchantInfo").setText("");//二级商户信息
        String  signDataStr= PKCS7Tool.base64Encode(document.asXML().getBytes()).replaceAll("[\r\n]", "");
        out.print(signDataStr);
        out.close();
        //return document.asXML().replaceAll("[\r\n]", "");
    }



}