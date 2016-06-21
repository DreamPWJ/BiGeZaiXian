<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线新闻</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/news.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<div class="container">
    <div class="L1-2"><img src="<c:url value='/images/pc/news/pt001.png'/> "/><a class="newMain" href="<c:url value='/news/toinformationcenter'/>">资讯中心》${code}</a></div><!--行情内容-->

    <div class="row">
        <div class="col-xs-12 news_title">${newsdetails.title}</div>
    </div>

    <div class="row news_time">
        <div class="col-xs-3 col-xs-offset-3">作者： ${newsdetails.author}

        </div>
        <div class="col-xs-3">发布时间： <ftm:formatDate
                value="${newsdetails.updatetime==null?newsdetails.createtime:newsdetails.updatetime}"
                pattern="yyyy-MM-dd HH:mm:ss"/>

        </div>
    </div>
    <div class="row">
        <div id="content" class="col-xs-12 news_content">${newsdetails.content}</div>
    </div>

</div>
<br/>
<!-- content ----------- end -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
<!--js文件-->
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>

