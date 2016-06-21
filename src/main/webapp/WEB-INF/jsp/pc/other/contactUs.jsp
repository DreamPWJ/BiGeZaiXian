<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>联系我们</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/other/contactUs.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--标题-->
    <div class="biaot">
        <div class="biaot-z">联系我们</div>
    </div>

    <!--主体--左-->
    <div class="ztL">
        <div class="L-1">您可以通过以下途径联系我们：</div>
        <div id="gaode-map-rizhao"></div>
        <div class="L-dz">
            <div class="L-dz-1">公司总部</div>
            <div class="L-dz-2">地址：临沂市平邑县蒙阳路与银花路交叉口东500米</div>
            <div class="L-dz-2">热线：400-818-1234</div>
            <div class="L-dz-2">电话：0539-3381111</div>
        </div>
    </div>
    <!--主体--右-->
    <div class="ztR">
        <div class="R-1">
            <div class="R-1-1"><a href="<c:url value='/index/toregister'/>">用户注册</a></div>
            <ul class="R-1-2" id="menu">
                <a href="<c:url value='/index/toaboutUs'/>">
                    <li>关于比格</li>
                </a>
                <a href="javascript:void(0);">
                    <li>诚聘英才</li>
                </a>
                <a href="<c:url value='/index/tolegalNotices'/>">
                    <li>法律声明</li>
                </a>
                <a href="<c:url value='/index/toprivacyStatement'/>">
                    <li>隐私声明</li>
                </a>
                <a href="<c:url value='/index/tocontactUs'/>">
                    <li style="color:#6C8CBF;">联系我们</li>
                </a>
                <a href="<c:url value='/index/touserGuides'/>">
                    <li>用户指南</li>
                </a>
            </ul>
        </div>

        <div class="R-2">
            <div class="R-2-1">客服热线：</div>
            <div class="R-2-2">400-818-1234</div>
            <br/>
            <div class="R-2-3">公司邮箱：</div>
            <div class="R-2-4">bgds@bigeonline.com</div>
            <%--<div class="R-2-1">--%>
                <%--<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1579995269&site=qq&menu=yes">--%>
                    <%--<img border="0" src="http://wpa.qq.com/pa?p=2:1579995269:41" alt="有事Q我" title="有事Q我"/>--%>
                <%--</a>--%>
            <%--</div>--%>
        </div>

        <%--<div class="R-3">--%>
            <%--<div class="R-3-ewm"></div>--%>
            <%--<div class="R-3-wz">扫描聚化网微信二维码</div>--%>
        <%--</div>--%>
    </div>

</div>
<!-- content ----------- 结束 -->
<div style="clear: both"></div>

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
<!--js文件-->
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<%--引入高德地图JavaScript API文件--%>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=87fc01936dd5ea9a5eeefa3e851e0b57"></script>
<script>
    window.onload = function () {
        var infoWindow;
        $("#gaode-map-rizhao").fadeIn(300);
        var $bigeMap = new AMap.Map('gaode-map-rizhao', {
            zoom: 120,
            center: [117.64677823, 35.48268868]
        });
        var info = [];
        info.push("<div><div style=\"font-size:14px;\"><b>比格在线</b></div> ");
        info.push("<div>电话 : 0539-3381111<br/>");
        info.push("地址 : 临沂市平邑县蒙阳路与银花路交叉口东500米</div></div>");
        infoWindow = new AMap.InfoWindow({
            content: info.join("<br/>")
        });
        infoWindow.open($bigeMap, $bigeMap.getCenter());
    }
</script>