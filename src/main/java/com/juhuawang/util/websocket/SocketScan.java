package com.juhuawang.util.websocket;

/**
 * Created by pwj  on 2015/8/7 0007.
 * 网络爬虫技术原理  搜索引擎使用网络爬虫寻找网络内容
 * 每到一个网页就用抓取程序将这个网页抓下来，将内容抽取出来，同时抽取超链接，作为进一步爬行的线索
 * 做一些指定网站查询后的数据的抓取
 */

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.*;
import java.util.ArrayList;
import java.util.List;


public class SocketScan {

    private static final int MAX_SIZE = 10;//最大爬虫技术次数
    public static List<String> httpContextList = new ArrayList<String>();

    public static void main(String[] args) {
        // 得到网站URL，并读取出来
        String httpContext = searchHttpContexts("http://www.sumibuy.com/");
        System.out.println("httpContext size: " + httpContextList.size());

        for (String string : httpContextList) {
            System.out.println(string);
            System.out.println();
            System.out.println("分隔符==============================================================================");
            System.out.println();
        }


    }

    /**
     * 通过url获取http链接的网页内容流
     */
    private static String getHttpContext(String urlPath) throws MalformedURLException, IOException {
        //URL对象创建
        URL url = new URL(urlPath);
        //RUL 链接
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        //获取链接输入流
        BufferedInputStream input = new BufferedInputStream(conn.getInputStream());
        //字节数组对象
        byte[] b = new byte[1024];
        int temp;
        StringBuilder sb = new StringBuilder();
        //读取输入流
        while ((temp = input.read(b)) != -1) {
            String value = new String(b);
            sb.append(value);
        }
        return sb.toString();
    }

    /**
     * 通过http获取的网页内容得到网页中所有的url超链接的集合  实现层级爬虫
     */
    private static List<String> GetURLByHttpContext(String httpContext) {
        //url集合对象
        List<String> urlList = new ArrayList<String>();
        //href标记
        String mark = "href=\"";
        //标记长度
        int len = mark.length();
        int start = 0;
        int end = 0;
        while ((start = httpContext.indexOf(mark, start)) != -1) {
            start = start + len;
            end = httpContext.indexOf("\"", start);
            urlList.add(httpContext.substring(start, end));//截取href中的url链接加入集合中
        }
        return urlList;
    }

    /**
     * 同步递归查询搜索http网页内容组合
     */
    private synchronized static String searchHttpContexts(String urlPath) {
        try {
            //http内容大于最大爬虫次数 结束
            if (httpContextList.size() > MAX_SIZE) {
                return null;
            }
            String sb = getHttpContext(urlPath);
            //将页面内容代码加到集合ttpContextList
            httpContextList.add(sb);
            //获得网页中url对象技术
            List<String> urlList = GetURLByHttpContext(sb.toString());
            if (urlList.size() > 0) {
                for (String subUrl : urlList) {
                    //递归调用
                    String subHttpContext = searchHttpContexts(subUrl);
                    if (httpContextList.size() > MAX_SIZE) {
                        return null;
                    }
                    httpContextList.add(subHttpContext);
                }
            }
            return sb;
        } catch (UnknownHostException e) {

            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }



}