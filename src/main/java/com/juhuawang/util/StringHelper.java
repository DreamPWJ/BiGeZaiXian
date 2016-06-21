package com.juhuawang.util;

import com.juhuawang.model.FrontUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * String 公用工具类
 *
 * @author pwj
 */
public class StringHelper {

    /**
     * 将String转换为Integer类型的List
     *
     * @param str
     * @param split
     * @return
     */
    public final static List<Integer> toIntegerList(String str, String split) {
        List<Integer> ret = new ArrayList<Integer>();
        if (str != null && !str.isEmpty()) {
            String[] strArray = str.split(split);

            for (String item : strArray) {
                if (!item.isEmpty())
                    ret.add(Integer.parseInt(item));
            }
        }
        return ret;
    }

    /**
     * MD5字符串加密
     *
     * @param str
     * @return
     * @throws NoSuchAlgorithmException
     */
    public final static String md5(String str) throws NoSuchAlgorithmException {
        final char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8',
                '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        byte[] btInput = str.getBytes();
        // 获得MD5摘要算法的 MessageDigest 对象
        MessageDigest md5Inst = MessageDigest.getInstance("MD5");
        // 使用指定的字节更新摘要
        md5Inst.update(btInput);
        // 获得密文
        byte[] bytes = md5Inst.digest();

        StringBuffer strResult = new StringBuffer();
        // 把密文转换成十六进制的字符串形式
        for (int i = 0; i < bytes.length; i++) {
            strResult.append(hexDigits[(bytes[i] >> 4) & 0x0f]);
            strResult.append(hexDigits[bytes[i] & 0x0f]);
        }
        return strResult.toString();
    }


    /**
     * SHA-1字符串加密
     *
     * @param str
     * @return
     * @throws NoSuchAlgorithmException
     */
    public final static String sha1(String str) throws NoSuchAlgorithmException {
        final char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8',
                '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        byte[] btInput = str.getBytes();
        // 获得SHA-1摘要算法的 MessageDigest 对象
        MessageDigest sha1Inst = MessageDigest.getInstance("SHA-1");
        // 使用指定的字节更新摘要
        sha1Inst.update(btInput);
        // 获得密文
        byte[] bytes = sha1Inst.digest();

        StringBuffer strResult = new StringBuffer();
        // 把密文转换成十六进制的字符串形式
        for (int i = 0; i < bytes.length; i++) {
            strResult.append(hexDigits[(bytes[i] >> 4) & 0x0f]);
            strResult.append(hexDigits[bytes[i] & 0x0f]);
        }
        return strResult.toString();
    }

    /**
     * 获取订单流水号  时间（到毫秒）+三位随机数
     *
     * @return
     */
    public static String getOrderNum() {
        try {
            Thread.sleep(1L);//处理并发问题 延迟1毫秒
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmsssss");
        String num = Integer.toString((int) ((999 - 100) * Math.random() + 100));//取得一个100-999的3位随机数字字符串
        String orderNum = format.format(date) + num;
        return orderNum;
    }


    /**
     * 通过request获得用户ip地址
     *
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        return ip;
    }

    /**
     * 获取当前请求的协议，ip,端口的url
     */
    public static String getIPAndPortURL(HttpServletRequest request){
        return "http://"+request.getHeader("Host");
    }

    /**
     * 获取当前登录对象
     */
    public static FrontUser getFrontUser(HttpServletRequest request) {
        return (FrontUser) request.getSession().getAttribute("frontUser");
    }

    /**
     * 通过request获得登陆用户id
     *
     * @param request
     * @return
     */
    public static Long getFrontUserId(HttpServletRequest request) {
        FrontUser user = (FrontUser) request.getSession().getAttribute("frontUser");
        if (user == null) {
            return 0l;
        }
        return user.getId();
    }

    /**
     * 通过request获得登陆用户名字
     *
     * @param request
     * @return
     */
    public static String getFrontUserLoginName(HttpServletRequest request) {
        FrontUser user = (FrontUser) request.getSession().getAttribute("frontUser");
        return user.getLogin();
    }

    /**
     * 通过request获得用户名
     *
     * @param request
     * @return
     */
    public static String getFrontUserName(HttpServletRequest request) {
        FrontUser user = (FrontUser) request.getSession().getAttribute("frontUser");
        return user.getName();
    }

    /**
     * 通过request获得登陆用户公司id
     *
     * @param request
     * @return
     */
    public static Long getCompanyID(HttpServletRequest request) {
        long companyID;
        try {
            companyID= (Long) request.getSession().getAttribute("companyID");
        }catch (NullPointerException e){
              return 0l;
        }
        return companyID;
    }

    /**
     * 获取系统当前的年月日  如默认格式yyyy-MM-dd等的字符串  formart标示格式时间类型
     */

    public static String formartDate(String formart) {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat(formart);
        String formartStr = format.format(date);
        return formartStr;
    }


    /**
     * 读取本地服务器硬盘上的图片，并显示到页面  用于jsp读取不在tomcat管理下的绝对路径的文件
     *
     * @param filePath
     * @param response
     */
    public static void showFileAsDisk(String filePath, HttpServletResponse response) {
        File file = new File(filePath);//根据filePath路径和文件名创建文件对象
        if (file.exists() && !"".equals(filePath)) {
            try {
                DataOutputStream dos = new DataOutputStream(response.getOutputStream());//数据数据流  通过响应response对象获取
                DataInputStream dis = new DataInputStream(new FileInputStream(file.getAbsolutePath()));//数据输入流通过文件路径获取
                byte[] data = new byte[2048];
                while ((dis.read(data)) != -1) {//读取指定文件输入流内容
                    dos.write(data);//输出流输入内容到页面
                    dos.flush();
                }
                dis.close();
                dos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 获取当前时间的时间差
     * @param minutes 分钟
     * @return
     */
    public static String getDateDiffer(int  minutes) {
        long curren = System.currentTimeMillis();
        curren += minutes * 60 * 1000;
        Date date = new Date(curren);
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm");
        return  dateFormat.format(date);
    }
}
