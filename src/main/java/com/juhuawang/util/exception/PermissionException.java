package com.juhuawang.util.exception;

/**
 * @author pwj  2015-07-20
 *         权限自定义异常类
 *         自定义异常类的主要作用是区分异常发生的位置，当用户遇到异常时，
 *         根据异常名就可以知道哪里有异常，根据异常提示信息进行修改。
 */
public class PermissionException extends Exception {////继承任何标准异常类

    /**
     * serialVersionUID相当于java类的身份证。主要用于版本控制。(64位的哈希字段)
     * serialVersionUID作用是序列化时保持版本的兼容性，即在版本升级时反序列化仍保持对象的唯一性。
     */
    private static final long serialVersionUID = -6008004025445496953L;

    /**
     * 用来创建指定参数对象
     *
     * @param msg 打印异常信息字符串
     */
    public PermissionException(String msg) {
        super(msg);  //调用超类构造器
    }

}