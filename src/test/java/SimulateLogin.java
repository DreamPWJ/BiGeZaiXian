import org.apache.commons.io.IOUtils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by pwj  on 2015/8/18 0018.
 * Java实现模拟登陆
 */
public class SimulateLogin {
    public static void main(String[] args) {
        Simulate();
    }

    public static void Simulate() {
        // 连接地址（通过阅读html源代码获得，即为登陆表单提交的URL）
        String surl = "http://192.168.90.133:8080/JuHuaManagement/account/saveLogin";
        String cookieVal = null;
        HttpURLConnection connection = null;
        /**
         * 首先要和URL下的URLConnection对话。 URLConnection可以很容易的从URL得到。比如： // Using
         * java.net.URL and //java.net.URLConnection
         */
        URL url = null;
        try {
            url = new URL(surl);
            connection = (HttpURLConnection) url.openConnection();
            /**
             * 然后把连接设为输出模式。URLConnection通常作为输入来使用，比如下载一个Web页。
             * 通过把URLConnection设为输出，你可以把数据向你个Web页传送。下面是如何做：
             */
            connection.setDoOutput(true);
            /**
             * 最后，为了得到OutputStream，简单起见，把它约束在Writer并且放入POST信息中，例如： ...
             */
            OutputStreamWriter out = null;

            out = new OutputStreamWriter(connection.getOutputStream(), "GBK");

            //其中的memberName和password也是阅读html代码得知的，即为表单中对应的参数名称
            try {
                out.write("username=pwj&password=rjds123456"); // post的关键所在！
                // remember to clean up
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

            // 取得cookie，相当于记录了身份，供下次访问时使用
            cookieVal = connection.getHeaderField("Set-Cookie");
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

/*        String s = "http://192.168.90.133:8080/JuHuaManagement/home/index";
        //重新打开一个连接
        try {
            url = new URL(s);
            HttpURLConnection resumeConnection = (HttpURLConnection) url.openConnection();
            if (cookieVal != null) {
                //发送cookie信息上去，以表明自己的身份，否则会被认为没有权限
                resumeConnection.setRequestProperty("Cookie", cookieVal);
            }
            resumeConnection.connect();*/
        try {
            InputStream urlStream = connection.getInputStream();
            BufferedReader bufferedReader = new BufferedReader(
                    new InputStreamReader(urlStream));
            String ss = null;
            String total = "";
            while ((ss = bufferedReader.readLine()) != null) {
                total += ss;
            }
            IOUtils.write(total, new FileOutputStream("d:/index.html"));
            bufferedReader.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }


}
