package com.juhuawang.util.pay.zhongguo;


import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.io.IOException;

import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;;
import java.util.Date;
import java.util.List;


/**
 * Created by pwj  on 2015/11/13 0010.
 * 中国银行B2B支付报文打包组织类
 */
public class PackageMaker {

    private final static String CHARSET = "UTF-8";//编码格式

    public static void main(String[] args) {
        // System.out.println(getTranDate()); ;
        // getB2BBankInfo();
        // getMessageXML("20140226152159000002", "888");
        //  getB2BBankInfo();

    }

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
    public static String getMessageXML(String orderno, String amount) {
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
        body.addElement("backNotifyUrl").setText("http://58.58.180.104:8888/JuHuaWang/order/toorderSuccess");//通知商户URL 银行完成交易获得明确交易状态后向该URL发送通知
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
        return signData.replaceAll("[\r\n]", "");
        //return document.asXML().replaceAll("[\r\n]", "");
    }

    /**
     * 获取明文Base64编码报文格式的xml字符串  用于发送报文数据  相关操作
     *
     * @param amount  总金额
     * @param orderno 订单号
     */
    public static String getBase64MessageXML(String orderno, String amount) {
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
        body.addElement("backNotifyUrl").setText("http://58.58.180.104:8888/JuHuaWang/order/toorderSuccess");//通知商户URL 银行完成交易获得明确交易状态后向该URL发送通知
        body.addElement("closeTime").setText("20160226152159");//超时时间(仅中行网银支付适用)格式：YYYYMMDDHHMISS 示例：20140226152159
        body.addElement("subMerchantInfo").setText("");//二级商户信息
        return PKCS7Tool.base64Encode(document.asXML().getBytes()).replaceAll("[\r\n]", "");
        //return document.asXML().replaceAll("[\r\n]", "");
    }

    /**
     * 中国B2B发送报文到银行接口并且接收返回信息
     */
    public static void getB2BBankInfo() {
        //创建HttpClientBuider对象
        HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
        //创建HttpClient对象
        CloseableHttpClient closeableHttpClient = httpClientBuilder.build();
        //创建POST请求对象 参数是访问服务器地址
        HttpPost httpPost = new HttpPost("http://180.168.146.79/PGWPortal/NB2BRecvOrder.do");//B2B接口http://180.168.146.79/PGWPortal/NB2BRecvOrder.do   http://127.0.0.1:8080/JuHuaWang/SSEServlet
        //httpPost.setHeader("Content-Type", "text/xml charset=UTF-8");
        // 创建参数队列
        List<NameValuePair> formparams = new ArrayList<NameValuePair>();
        try {
            formparams.add(new BasicNameValuePair("msg", getMessageXML("20150226152159000001", "888")));
            UrlEncodedFormEntity uefEntity = new UrlEncodedFormEntity(formparams, CHARSET);
            httpPost.setEntity(uefEntity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //执行请求 获取服务器返还的响应对象
        try {
            //执行get请求
            CloseableHttpResponse httpResponse = closeableHttpClient.execute(httpPost);
            //响应状态
            System.out.println("-----------------响应状态status:" + httpResponse.getStatusLine());
            //检查响应的状态是否正常 检查状态码的值是否等于200
            int code = httpResponse.getStatusLine().getStatusCode();
            if (code == 200) {
                //获取响应消息实体
                HttpEntity entity = httpResponse.getEntity();
                //判断响应实体是否为空
                if (entity != null) {
                    System.out.println("-----------------中国银行B2B商务支付从服务器端取得响应数据文本:\n" + EntityUtils.toString(entity).getBytes());
                    System.out.println("-----------------");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //关闭流并释放资源
                closeableHttpClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }


}