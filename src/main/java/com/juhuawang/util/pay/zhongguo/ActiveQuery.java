
package com.juhuawang.util.pay.zhongguo;
import java.util.Date;
import com.juhuawang.util.pay.rizhao.RSAUtils;
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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by pwj  on 2015/11/24 0024.
 * 中国银行订单信息主动查询
 */
public class ActiveQuery {
    private final static String CHARSET = "UTF-8";//编码格式

    public static void main(String[] args) throws Exception {
      getB2BBankInfo();
      //System.out.println(RSAUtils.base64Decode(new String("PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiID8+PHJlc3BvbnNlPjxoZWFkPg0KPHJlc3BvbnNlQ29kZT5PSzwvcmVzcG9uc2VDb2RlPg0KPHJlc3BvbnNlSW5mbz7miJDlip88L3Jlc3BvbnNlSW5mbz4NCjwvaGVhZD4NCjxib2R5Pg0KPG9yZGVyPg0KPG1lcmNoYW50Tm8+NzA1NjwvbWVyY2hhbnRObz4NCjxvcmRlck5vPjIwMTUxMDIyMTQzNDAwMDIwNTYzPC9vcmRlck5vPg0KPG9yZGVyU2VxPjExMjI3OTQ2NDwvb3JkZXJTZXE+DQo8Y3VycmVuY3k+MTU2PC9jdXJyZW5jeT4NCjxhbW91bnQ+MTcwMDAwMDwvYW1vdW50Pg0KPGxhc3RUcmFuVGltZT4yMDE1MTExOTE0NDQyMDwvbGFzdFRyYW5UaW1lPg0KPHJlZnVuZGVkQW1vdW50PjA8L3JlZnVuZGVkQW1vdW50Pg0KPG9yZGVyU3RhdHVzPlQxPC9vcmRlclN0YXR1cz4NCjxwYXllZUFjdE51bT48L3BheWVlQWN0TnVtPg0KPHBheWVlQWN0TmFtPjwvcGF5ZWVBY3ROYW0+DQo8Ym9jRmxhZz48L2JvY0ZsYWc+DQo8cGF5ZWVCbmtPcmc+PC9wYXllZUJua09yZz4NCjxwYXllZUNuYXBzPjwvcGF5ZWVDbmFwcz4NCjxwYXllZUlia251bT48L3BheWVlSWJrbnVtPg0KPHBheWVlQm5rTmFtPjwvcGF5ZWVCbmtOYW0+DQo8b3JkZXJUeXBlPjA8L29yZGVyVHlwZT4NCjxwYXlDYXRhbG9nPjE8L3BheUNhdGFsb2c+DQo8L29yZGVyPg0KPC9ib2R5Pg0KPC9yZXNwb25zZT4=".getBytes(), CHARSET)));
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
     * 获取报文格式的xml字符串  用于发送商户发送B2B订单查询报文数据  P7数字签名相关操作
     *
     * @param orderno 订单号
     */
    public static String getMessageXML(String orderno) {
        //创建Document对象  用于操作xml
        Document document = DocumentHelper.createDocument();
        document.setXMLEncoding(CHARSET);
        //在内存中组织创建xml格式
        Element root = document.addElement("request");//请求根目录
        Element head = root.addElement("head");//头部数据节点
        head.addElement("requestTime").setText(getTranDate());//
        Element body = root.addElement("body");//主体数据节点
        body.addElement("orderNos").setText(orderno);//商户订单号 商户平台系统提交银行的订单号格式：YYYYMMDDHHMISS+6位流水号 示例：20150226152159000002
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
     * 获取明文Base64编码报文格式的xml字符串  用于商户发送B2B订单查询发送报文数据  相关操作
     *
     * @param orderno 订单号
     */
    public static String getBase64MessageXML(String orderno) {
        //创建Document对象  用于操作xml
        Document document = DocumentHelper.createDocument();
        document.setXMLEncoding(CHARSET);
        //在内存中组织创建xml格式
        Element root = document.addElement("request");//请求根目录
        Element head = root.addElement("head");//头部数据节点
        head.addElement("requestTime").setText(getTranDate());//
        Element body = root.addElement("body");//主体数据节点
        body.addElement("orderNos").setText(orderno);//商户订单号 商户平台系统提交银行的订单号格式：YYYYMMDDHHMISS+6位流水号 示例：20150226152159000002
        return PKCS7Tool.base64Encode(document.asXML().getBytes()).replaceAll("[\r\n]", "");
        //  return document.asXML().replaceAll("[\r\n]", "");
    }


    /**
     * 商户发送B2B订单查询 中国B2B发送报文到银行接口并且接收返回信息
     */
    public static void getB2BBankInfo() {
        //创建HttpClientBuider对象
        HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
        //创建HttpClient对象
        CloseableHttpClient closeableHttpClient = httpClientBuilder.build();
        //创建POST请求对象 参数是访问服务器地址
        HttpPost httpPost = new HttpPost("http://180.168.146.79/PGWPortal/NB2BQueryOrder.do");//B2B接口http://180.168.146.79/PGWPortal/NB2BRecvOrder.do   http://127.0.0.1:8080/JuHuaWang/SSEServlet
        httpPost.setHeader("Content-Type", "text/plain charset=UTF-8");


        // 创建参数队列
        List<NameValuePair> formparams = new ArrayList<>();
        try {
            formparams.add(new BasicNameValuePair("merchantNo", RSAUtils.base64Encode("7056".getBytes())));
            formparams.add(new BasicNameValuePair("version", RSAUtils.base64Encode("1.0.1".getBytes())));
            formparams.add(new BasicNameValuePair("messageId", RSAUtils.base64Encode("0000111".getBytes())));
            formparams.add(new BasicNameValuePair("security", RSAUtils.base64Encode("P7".getBytes())));
            formparams.add(new BasicNameValuePair("signature", getMessageXML("20151022111000015491")));
            formparams.add(new BasicNameValuePair("message", getBase64MessageXML("20151022111000015491")));
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
                    System.out.println("-----------------中国银行商户发送B2B订单查询从服务器端取得响应数据文本:\n" + RSAUtils.base64Decode(new String(EntityUtils.toString(entity).getBytes(), CHARSET)));
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
