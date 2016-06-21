<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/noThrough.css"/>" rel="stylesheet" type="text/css">

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
                <div class="logo1-1">审核未通过</div>
                <div class="logo1-2">是哪里出现纰漏了呢？？？</div>
            </div>
            <div class="logo2">
                <div class="logo2-1"><img src="<c:url value="/images/mobilephone/jrb/Apublic/pic013.png"/>" class="shz-im"></div>
            </div>
        </div>
    </div>
    <!--提示信息-->
    <div class="shz-tsxx">
        <samp class="shz-tsxx-1">您的聚融宝资质申请未通过，原因可能是：</samp><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;1.&nbsp;未通过平台对企业的初步审核。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;2.&nbsp;未通过信保公司的信用担保审核。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;3.&nbsp;未通过银行的信用审核。<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;如需了解详细信息，敬请拨打平台客服热线：<samp class="shz-tsxx-2">400-827-3009</samp> 或者与在线客服人员取得联系！
    </div>

    <!--返回聚化网首页-->
    <div class="shz-an">
        <div class="shz-an-1">
            <div class="shz-an-1-1">
                <div class="shz-an-1-1-1"><a href="#">返回我的聚融宝</a></div>
            </div>
            <div class="shz-an-1-1">
                <div class="shz-an-1-1-2"><a href="#">返回聚化网首页</a></div>
            </div>
        </div>
    </div>

</div><!--主体-->

</body>
</html>