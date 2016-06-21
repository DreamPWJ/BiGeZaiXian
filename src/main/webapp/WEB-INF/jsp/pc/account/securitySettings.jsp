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
    <link href="<c:url value='/css/pc/account/securitySettings.css'/>" rel="stylesheet" type="text/css">
    <title>个人中心-账号管理-安全设置</title>
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--地址-->

<!--左边导航-->
<%@ include file="../A_public/accountSideMenu.jsp" %>
<!--左边导航-->

<!--右侧展示-->
<div class="R-show">
    <div class="R-BT">安全设置</div>

    <!--总-->
    <div class="ZONG">
        <div class="Aqjb">
            <div class="Aqjb-1">安全级别</div>
            <div class="Aqjb-2">
                <div class="Aqjb-2-1"></div>
                <div class="Aqjb-2-2"></div>
            </div>
            <div class="Aqjb-3"><samp class="Aqjb-sa1">中</samp></div>
            <div class="Aqjb-4"><samp class="Aqjb-sa1">建议您全部启用安全设置，以保障账户与资金安全。</samp></div>
        </div>
        <!--登录密码-->
        <div class="dlmm">
            <div class="dlmm-1">
                <div class="dlmm-1-1"><img src="<c:url value='/images/pc/account/025.png'/>" width="32" height="32"/></div>
                <div class="dlmm-1-2">登录密码</div>
                <div class="dlmm-1-3"><img src="<c:url value='/images/pc/account/026.png'/>" width="16" height="16"/></div>
                <div class="dlmm-1-4"><samp class="dlmm-sa1">互联网账号存在被盗风险，建议您定期更改密码以保护账户安全。</samp></div>
                <div class="dlmm-1-5"><a href="<c:url value='/account/tochangePassword'/> ">修改</a></div>
            </div>
        </div>
        <!--邮箱验证-->
        <div class="dlmm">
            <div class="dlmm-1">
                <div class="dlmm-1-1"><img src="<c:url value='/images/pc/account/022.png'/>" width="32" height="32"/></div>
                <div class="dlmm-1-2">邮箱验证</div>
                <div class="dlmm-1-3"><img src="<c:url value='/images/pc/account/024.png'/>" width="16" height="16"/></div>
                <div class="dlmm-1-4"><samp class="dlmm-sa2">验证后，可用于快速找回登录密码，接收账户余额变动提醒。</samp></div>
                <div class="dlmm-1-5"><a href="#">立即验证</a></div>
            </div>
        </div>
        <!--手机验证-->
        <div class="dlmm">
            <div class="dlmm-1">
                <div class="dlmm-1-1"><img src="<c:url value='/images/pc/account/022.png'/>" width="32" height="32"/></div>
                <div class="dlmm-1-2">手机验证</div>
                <div class="dlmm-1-3"><img src="<c:url value='/images/pc/account/024.png'/>" width="16" height="16"/></div>
                <div class="dlmm-1-4"><samp class="dlmm-sa2">您验证的手机：15984756547，若以丢失或停用请立即更换，以免账户被盗。</samp></div>
                <div class="dlmm-1-5"><a href="#">立即验证</a></div>
            </div>
        </div>
        <!--支付密码-->
        <div class="dlmm">
            <div class="dlmm-1">
                <div class="dlmm-1-1"><img src="<c:url value='/images/pc/account/022.png'/>" width="32" height="32"/></div>
                <div class="dlmm-1-2">支付密码</div>
                <div class="dlmm-1-3"><img src="<c:url value='/images/pc/account/023.png'/>" width="16" height="16"/></div>
                <div class="dlmm-1-4"><samp class="dlmm-sa2">启用支付密码后，在使用账户资产时，需通过支付密码进行身份认证。</samp></div>
                <div class="dlmm-1-5"><a href="#">立即验证</a></div>
            </div>
        </div>
    </div>
</div>
</div>
<!--右侧展示-->

</div>
<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
