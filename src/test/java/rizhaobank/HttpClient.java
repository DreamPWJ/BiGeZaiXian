package rizhaobank;


import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;

import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;


import java.io.*;

import java.net.Socket;


/**
 * @author pwj on 2015/6/10
 *         HttpClient实现客户端请求服务器端并返回数据
 */
public class HttpClient {
    static Socket server;

    public static void main(String[] args) {
        try {
            getBankInfo();
       /*     test();    */
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 获取SCP安全客户端的数字签名 用于银行接口报文组合
     */
    public static String getSCPInfo() throws Exception {

        server = new Socket("192.168.90.133", 8011);
        BufferedReader in = new BufferedReader(new InputStreamReader(server.getInputStream()));
        PrintWriter out = new PrintWriter(server.getOutputStream());

/*        String str = PackageMaker.XMLStringForSCP();*/  //查询余额
        //查询明细交易
        String str = PackageMaker.queryAccHisDetailForSCP();
        out.println(str);
        out.flush();

        StringBuffer sb = new StringBuffer();
        String tmp = null;
        while ((tmp = in.readLine()) != null) {
            sb.append(tmp);
        }
     /*  System.out.println("Socket从服务器端取得数据:" + sb.toString());*/
        String s = sb.toString();

        s = !s.contains("<signed_data>") ? "" : s.substring(s.indexOf("<signed_data>"), s.indexOf("</signed_data>")).replace("<signed_data>", "");

        out.close();
        server.close();

        return s;
    }

    /**
     * 获取银企直连接口返回交易信息
     */
    public static void getBankInfo() {

        //创建HttpClientBuider对象
        HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
        //创建HttpClient对象
        CloseableHttpClient closeableHttpClient = httpClientBuilder.build();
        //创建POST请求对象 参数是访问服务器地址
        HttpPost httpPost = new HttpPost("http://192.168.90.133:7071/yqbank/APIReqServlet");/*https://60.208.131.86:4810/yqbank/APIReqServlet  http://www.marschen.com/data1.html*/
        httpPost.setHeader("Content-Type", "text/xml;charset=GBK");
        try {
            //查询余额
    /*      httpPost.setEntity(new StringEntity(PackageMaker.XMLStringForBank()));*/
            //查询明细交易
            httpPost.setEntity(new StringEntity(PackageMaker.queryAccHisDetailForBank()));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // 创建参数队列
    /*  List<NameValuePair> formparams=new ArrayList<NameValuePair>();
        formparams.add(new BasicNameValuePair("msg",PackageMaker.xmlString()));*/


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
                   /*  System.out.println(" 编码头contentEncoding:" + entity.getContentEncoding());*/
                    System.out.println();
                    System.out.println("-----------------从城商联盟服务器端取得响应数据文本:\n" + EntityUtils.toString(entity, "GBK"));
                }

     /*         InputStream in = entity.getContent();
                BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                String line = reader.readLine();
                System.out.println("HTTP从服务器端取得数据" + line);*/
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


/*
    public static void test() {
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL("http://192.168.90.133:7071/yqbank/APIReqServlet").openConnection();
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestMethod("POST");
            connection.connect();
            OutputStream os = connection.getOutputStream();
            os.write(PackageMaker.XMLStringForBank().getBytes());
            os.flush();
            os.close();

            InputStream is = connection.getInputStream();
            int i = 0;
            int a = 0;
            byte[] b = new byte[is.available()];
            while ((a = is.read()) != -1) {
                b[i] = (byte) a;
                i++;
            }
            String s = new String(b);
            System.out.println(s);
            //connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
*/


}
