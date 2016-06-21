<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线-公司简介</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/companyProfile.css' />" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!--主体------------------------------------开始-->
<div class="Gsjj-main">
    <div class="gsjj-bt">公司简介</div>
    <div class="gsjj-dx"></div>

    <div class="gsjj-s1">
        <p class="gsjj-s1-l">
            比格在线是山东比格电子商务有限公司旗下的塑料化工原料现货交易平台，深耕塑料、化工原材料交易业务，是化工“互联网+产业+金融” 的第一电商平台。
            平台为上游原材料供应商提供便捷高效的互联网展示、销售平台，为下游工厂既购买商提供一站式的互联网采购服务，集资讯、仓储、交易、支付、融资
            和物流等全部功能模块于平台一体，率先实现线上交易与线下体验无缝结合，做到平台构筑与产业发展相向而行，致力于打造成中国最大的塑料、化工原料
            电商服务平台。
        </p>

        <div class="gsjj-s1-r"><img src="<c:url value='/images/pc/companyProfile/gsjj1.jpg' />" width="334"
                                    height="184"/></div>
    </div>

    <div class="gsxx-x1">
        <div class="gsxx-x1-0">公司信息</div>
        <div class="gsxx-x1-l">
            <div class="gsxx-x1-l-xx">公司名称：山东日聚电子商务有限公司</div>
            <div class="gsxx-x1-l-xx">网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：www.juhuawang.com</div>
            <div class="gsxx-x1-l-xx">总部地址：日照市济南路国际金融中心1号楼B座12楼</div>
            <div class="gsxx-x1-l-xx">运营中心：上海市长宁区金钟路968号凌空SOHO 2号楼506-507室</div>
            <div class="gsxx-x1-l-xx">客服热线：400-827-3009</div>
        </div>
        <div class="gsxx-x1-r"><img src="<c:url value='/images/pc/companyProfile/gsjj2.jpg' />" width="334"
                                    height="184"/></div>
    </div>


</div>
<!--主体------------------------------------结束-->

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
