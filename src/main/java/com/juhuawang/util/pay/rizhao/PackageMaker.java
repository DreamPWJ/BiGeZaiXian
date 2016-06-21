package com.juhuawang.util.pay.rizhao;

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

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * Created by pwj  on 2015/11/10 0010.
 * B2B支付报文打包组织类
 */
public class PackageMaker {

    private final static String CHARSET = "UTF-8";//编码格式

    public static void main(String[] args) {
        getB2BBankInfo();
    }

    /**
     * 获取当前格式化的时间
     */
    protected static String getTranDate() {
        Date nowDate = new Date();
        //格式化时间格式
        String formatDate = (new SimpleDateFormat("YYYY-MM-dd").format(nowDate)) + "T" + (new SimpleDateFormat("HH:mm:ss").format(nowDate));
        return formatDate;
    }


    /**
     * 获取报文格式的xml字符串  用于发送报文数据  RSA数字加密相关操作
     *
     * @param payment 总金额
     * @param payccno 付款账号
     * @param orderno 订单号
     */
    public static String getMessageXML(String payccno, String payment, String orderno) throws Exception {
        //创建Document对象  用于操作xml
        Document document = DocumentHelper.createDocument();
        document.setXMLEncoding(CHARSET);
        //在内存中组织创建xml格式
        Element root = document.addElement("BankData", "http://www.bylife.com/schema/payGatePackage_810");//根目录
        Element opReq = root.addElement("opReq");//交易请求数据节点
        opReq.addElement("CHANNALNUM").setText("2002");//渠道号 默认值：2002
        opReq.addElement("TRANTYPE").setText("0");//交易类型  0：消费，1：撤销，2：退货 默认值：0
        opReq.addElement("MERCHANTID").setText("8102002001");// 商户编号 默认值：8102002001
        opReq.addElement("MERCHANTNAME").setText("日聚电子商务");// 商户名称 默认值：日聚电子商务
        opReq.addElement("PAYMENT").setText(payment);//订单金额  长度22
        opReq.addElement("ORDERID").setText(orderno);// 订单号
        opReq.addElement("TRANDATE").setText(getTranDate());//订单日期 格式：YYYY-MM-DDThh:mm:ss 如：2015-06-02T15:03:01
        opReq.addElement("REACCNO").setText("8101010111014204210010016770");//收款账号
        opReq.addElement("PAYACCNO").setText(payccno);//付款账号370100201020001861
        opReq.addElement("MERCHANTURL").setText("http://58.58.180.104:8888/JuHuaWang/order/toorderSuccess");//支付结果信息通知URL地址
        opReq.addElement("CURCODE").setText("01");//币种编号 默认值：01(人民币)
        opReq.addElement("REMARK").setText("这是备注信息!");//备注
        //  System.out.println("xmlString============="+document.asXML());
        //xml字符串用于报文传输
        String xmlString = RSAUtils.encode(RSAUtils.base64Encode(document.asXML().getBytes()));
        return xmlString;

    }

    /**
     * B2B发送报文到银行接口并且接收返回信息
     */
    public static void getB2BBankInfo() {
        //创建HttpClientBuider对象
        HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
        //创建HttpClient对象
        CloseableHttpClient closeableHttpClient = httpClientBuilder.build();
        //创建POST请求对象 参数是访问服务器地址
        HttpPost httpPost = new HttpPost("http://localhost:8080/JuHuaWang/b2BPayGateServlet");//B2B接口https://60.208.131.86:4810/authGate/B2BPay_810.do  http://127.0.0.1:8080/JuHuaWang/SSEServlet
        //httpPost.setHeader("Content-Type", "text/xml charset=UTF-8");

        // 创建参数队列
        List<NameValuePair> formparams = new ArrayList<NameValuePair>();
        try {
            formparams.add(new BasicNameValuePair("msg", getMessageXML("370100201020001861", "666", "370100201020001861")));
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
                    System.out.println("-----------------B2B商务支付从城商联盟服务器端取得响应数据文本:\n" + RSAUtils.base64Decode(RSAUtils.decode(new String(EntityUtils.toString(entity).getBytes(), CHARSET))));
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