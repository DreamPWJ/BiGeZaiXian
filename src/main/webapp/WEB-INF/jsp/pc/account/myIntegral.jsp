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
    <link href="<c:url value='/css/pc/account/myIntegral.css'/>" rel="stylesheet" type="text/css">
    <title>个人中心-账号管理-我的积分</title>

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--地址-->


<!--左边导航-->
<%@ include file="../A_public/accountSideMenu.jsp" %><!--左边导航-->


<!--右侧展示-->
<div class="R-show">
    <div class="R-BT">我的积分</div>

    <!--总-->
    <div class="ZONG">
        <div class="Jif">
            <div class="Jif-1">
                <div class="Jif-1-1">可用积分</div>
                <div class="Jif-1-2"><samp class="Jif-sa1">985.00</samp></div>
            </div>
            <div class="Jif-2">
                <div class="Jif-2-1"><a href="javascript:void();">兑换商品与优惠卷</a></div>
            </div>
        </div>
    </div>

</div>
<!--右侧展示-->
</div>
</div>
<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
