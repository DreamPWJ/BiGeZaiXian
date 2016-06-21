<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/account/bankAccount.css'/>" rel="stylesheet" type="text/css">
    <title>个人中心-账号管理-银行账号</title>

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--地址-->
    <div class="address">

    </div>

    <!--左边导航-->
    <%@ include file="../A_public/accountSideMenu.jsp" %>

    <!--右侧展示-->
    <div class="R-show">
        <div class="R-BT">
            <div class="R-BT-1">银行账号管理</div>
            <div class="R-BT-2">
                <div class="R-BT-2-1"><a href="<c:url value='/account/tonewBankAccount'/> ">添加银行账号</a></div>
            </div>
        </div>

        <!--总-->
        <div class="ZONG">
            <div class="yhzh">
                <div class="yhzh-1">银行账号</div>
                <div class="yhzh-2">开户银行</div>
                <div class="yhzh-3">详细网点</div>
                <div class="yhzh-4">默认</div>
                <div class="yhzh-5">操作</div>
            </div>
            <div class="Zhu-z"><!-----------------每页 10 条数据---------------------->
                <div class="Zhu">
                    <div class="Zhu-1"><samp class="Zhu-sa1">652458741254369874</samp></div>
                    <div class="Zhu-2"><samp class="Zhu-sa1">日照银行</samp></div>
                    <div class="Zhu-3"><samp class="Zhu-sa1">日照银行日照兴海支行</samp></div>
                    <div class="Zhu-4"><samp class="Zhu-sa2">默认</samp></div>
                    <div class="Zhu-5">
                        <button type="button" class="Zhu-5-1">设为默认</button>
                        <button type="button" class="Zhu-5-2">删除</button>
                    </div>
                </div>


            </div>


        </div>
    </div>
</div>
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>

</body>
</html>
