<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/reimbursementDetail.css"/>" rel="stylesheet" type="text/css">

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

    <!--明细-->
    <div class="mx1">
        <!--单位-->
        <div class="dw">金额单位：万&nbsp;&nbsp;</div>
        <div class="mx1-1">
            <div class="mx1-1-1">订&nbsp;单&nbsp;号</div>
            <div class="mx1-1-2"><samp class="mx-sam1">201510110018</samp></div>
        </div>
        <div class="mx1-2">
            <div class="mx1-1-1">已还金额</div>
            <div class="mx1-1-2"><samp class="mx-sam1">9999.999999</samp></div>
        </div>
        <div class="mx1-3">
            <div class="mx1-1-1">待还金额</div>
            <div class="mx1-1-2"><samp class="mx-sam1">9999.999999</samp></div>
        </div>
    </div>

    <!--明细1-->
    <div class="mx2">
        <div class="mx2-1"><samp class="mx-sam2">20150902</samp></div>
        <div class="mx2-2"><samp class="mx-sam2">30</samp></div>
        <div class="mx2-2"><samp class="mx-sam2">65</samp></div>
    </div>

    <!--明细2-->
    <div class="mx2">
        <div class="mx2-1"><samp class="mx-sam2">20150902</samp></div>
        <div class="mx2-2"><samp class="mx-sam2">30</samp></div>
        <div class="mx2-2"><samp class="mx-sam2">65</samp></div>
    </div>

    <!--明细3-->
    <div class="mx2">
        <div class="mx2-1"><samp class="mx-sam2">20150902</samp></div>
        <div class="mx2-2"><samp class="mx-sam2">30</samp></div>
        <div class="mx2-2"><samp class="mx-sam2">65</samp></div>
    </div>
</div><!--主体-->

</body>
</html>