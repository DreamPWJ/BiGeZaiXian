<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/InAuditA.css"/>" rel="stylesheet" type="text/css">

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
    <!--top-logo-->
    <div class="top-logo">
        <div class="top-logo-1">
            <div class="logo1">
                <div class="logo1-1">审核中</div>
                <div class="logo1-2">您申请的聚融宝额度已提交</div>
            </div>
            <div class="logo2">
                <div class="logo2-1"><img src="<c:url value="/images/mobilephone/jrb/Apublic/pic008.png"/>" class="shz-im"></div>
            </div>
        </div>
    </div>

    <!--提示信息-->
    <div class="shz-tsxx">
        您提交的聚融宝资质申请正在审核中，我们将会尽快处理，并及时将处理结果通过平台通知、短信或人工电话的形式通知您。
    </div>

    <!--返回聚化网首页-->
    <div class="shz-an"><div class="shz-an-1"><a href="#">返回聚化网首页</a></div></div>
</div><!--主体-->
</body>
</html>
