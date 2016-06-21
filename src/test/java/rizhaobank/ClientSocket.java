package rizhaobank;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;


/**
 * Created by pwj on 2015/7/9 0009.
 * 客户端获取数字签名的Socket测试类
 */
public class ClientSocket {
    //统一设置编码格式
  /*  public final static String CHARSET = "GBK";*/
    static Socket server;

    public static void main(String[] args) throws Exception {

        getSCPInfo();

/*        System.out.println("时间："+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));*/


    }

    public static String getSCPInfo() throws Exception {
       /*   server = new Socket(InetAddress.getLocalHost(), 8010);*/
        server = new Socket("192.168.90.133", 8011);
        BufferedReader in = new BufferedReader(new InputStreamReader(server.getInputStream()));
        PrintWriter out = new PrintWriter(server.getOutputStream());

        String str = PackageMaker.XMLStringForSCP();
        out.println(str);
        out.flush();

        StringBuffer sb = new StringBuffer();
        String tmp = null;
        while ((tmp = in.readLine()) != null) {
            sb.append(tmp);
        }
        System.out.println("格尔客户端Socket从服务器端取得数据:" + sb.toString());
        String s = sb.toString();

        s = !s.contains("<signed_data>") ? "" : s.substring(s.indexOf("<signed_data>"), s.indexOf("</signed_data>")).replace("<signed_data>", "");

/*      System.out.println("============++++"+s);*/

        out.close();
        in.close();
        server.close();
        return s;
    }


}