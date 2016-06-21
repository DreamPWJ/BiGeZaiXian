<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>对不起, 你访问的页面不存在!</title>
    <!--css文件-->
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/error.css'/>" rel="stylesheet" type="text/css"/>

    <!--js文件-->
    <meta name="keywords" content="比格在线,HDPE,LDPE,LLDPE,PVC,塑料粒子,塑料原料"/>
    <meta name="description"
          content="比格在线是比格电子商务有限公司旗下的现货交易平台，借助互联网，协助买卖双方高效完成贸易。我们为上游供货商提供高效便捷的分销渠道，为用户提供HDPE、LDPE、PVC等塑料原料一站式的采购服务，致力于打造成中国最大的塑料原料电商服务平台。"/>
</head>
<body>
<div id="container">
    <img class="png" src="<c:url value='/images/pc/lostPage/404.png'/>">
    <img class="png msg" src="<c:url value='/images/pc/lostPage/404_msg.png'/>">
    <p><a href="<c:url value='/index/pcindex'/>" target="_blank"><img class="png" src="<c:url value='/images/pc/lostPage/404_to_index.png'/>"></a> </p>
</div>
<div id="cloud" class="png"></div>

</body>
</html>
