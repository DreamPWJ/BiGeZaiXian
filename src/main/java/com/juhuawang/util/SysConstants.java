package com.juhuawang.util;

/**
 * @author pwj 2015/7/19 0019.
 *         系统所有常量统一定义类
 */
public class SysConstants {
    /**
     * Oracle数据库相关信息
     */
    public static final String ORACLE_DATABASE_NAME = "juhuawang";//数据库名称(SID)
    public static final String ORACLE_DATABASE_USERNAME = "rjds";//数据库用户名
    public static final String ORACLE_DATABASE_PASSWORD = "Rjdsjhw001";//数据库密码
    //public static final String ORACLE_DATABASE_SAVEPATH = "G:/juhuawang/backupdatabase";//数据库导出文件保存路径
    public static final String ORACLE_DATABASE_SAVEPATH = "/home/juhuawang/backupdatabase";//linux数据库导出文件保存路径
    public static final String ORACLE_DATABASE_FILENAME = "juhuawangBackup";//数据库导出文件文件名

    /**
     * PC端程序和手机端程序的标示
     */
    public static final int SYS_PC = 1;//PC端程序
    public static final int SYS_MOBILEPHONE = 2;//手机端程序

    /**
     * 聚化网三证上传 图片保存的路径
     */

    // public static final String THREE_CREDENTIALS_FILENAME = "G:/juhuawang/threecredentials";
    public static final String THREE_CREDENTIALS_FILENAME = "/home/juhuawang/threecredentials";//linux

    /**
     * 聚化网商品发布图片保存的路径
     */
    // public static final String GOOD_PICTURES_FILENAME = "G:/juhuawang/goodpictures";
    public static final String GOOD_PICTURES_FILENAME = "/home/juhuawang/goodpictures";//linux
    /**
     * 默认的起始页
     */
    public static final int DEFAULT_PAGE_NO = 1;

    /**
     * 默认的分页显示数量
     */
    public static final int DEFAULT_PAGE_SIZE = 10;

    // 有效状态-有效
    public static final String STATUSCODE_VALID = "001";
    // 有效状态-无效
    public static final String STATUSCODE_INVALID = "002";

    // 订单来源-购物车
    public static final String ORDER_SOURCE_SHOPCART = "001";
    // 订单来源-直接下单
    public static final String ORDER_SOURCE_ORDERDIRECT = "002";

    // 注册类型-买家
    public static final String REGTYPE_BUYER = "001";
    // 注册类型-卖家
    public static final String REGTYPE_SELLER = "002";

    // 库存类型-入库
    public static final String STOCKCODE_STOCKIN = "001";
    // 库存类型-上架
    public static final String STOCKCODE_INSELL = "002";
    // 库存类型-下架
    public static final String STOCKCODE_DOWNSELL = "003";
    // 库存类型-售出
    public static final String STOCKCODE_SELLOUT = "004";
    // 库存类型-退货
    public static final String STOCKCODE_STOCKBACK = "005";
    // 库存类型-购物车
    public static final String STOCKCODE_CART = "006";
    // 库存类型-其他
    public static final String STOCKCODE_OTHER = "007";

    // 增值税率--上架价格未含税使用
    public static final double RATE_UPSELL = 1.17;

    // 订单状态-已下单
    public static final String ORDERSTATUS_NOPAY = "001";
    // 订单状态-商务支付待提货
    public static final String ORDERSTATUS_NOTAKEGOODS = "002001";
    // 订单状态-待收货
    public static final String ORDERSTATUS_SENTGOOD = "002004";
    // 订单状态-待评价
    public static final String ORDERSTATUS_NOEVALUATE = "002006";

    // 前台用户的认证状态
    public static final String AFFIRMREG_PASS = "003";

}

