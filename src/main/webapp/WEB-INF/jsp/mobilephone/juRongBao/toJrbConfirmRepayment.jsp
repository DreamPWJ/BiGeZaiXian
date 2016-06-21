<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/alsoMoney.css"/>" rel="stylesheet" type="text/css">

    <script type="text/javascript">
        $(function(){
            var aDent = true;
            var oParent = $('.list-bar');
            var oNodeContent = $('.list-menu');
            oParent.click(function(){
                if(aDent){
                    oNodeContent.stop().slideDown(500);
                }else{
                    oNodeContent.stop().slideUp(500);
                }
                aDent = !aDent;
            });
        });
    </script>
</head>

<body>
<div class="zhongti" id="tou">
    <!--头部-->
    <jsp:include page="../navigation.jsp"></jsp:include>

    <%--<div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>--%>
    <!--输入金额-->
    <div class="HK-sr">
        <div class="HK-sr-1">还款金额&nbsp;&nbsp;</div>
        <input type="text" placeholder="0.00" class="HK-sr-2">
    </div>

    <!--提示-->
    <div class="HK-ts">
        待还<samp class="HK-sam1">6565</samp>万元，到期还款日：<samp class="HK-sam2">15-11-12</samp>
    </div>

    <!--显示-->
    <div class="HK-xs">
        ￥<samp class="HK-sam3">9999.999999</samp>
    </div>

    <!--确定-->
    <div class="HK-qd">
        <div class="HK-qd-1"><a href="#">确认还款</a></div>
    </div>
</div><!--主体-->

</body>
</html>
