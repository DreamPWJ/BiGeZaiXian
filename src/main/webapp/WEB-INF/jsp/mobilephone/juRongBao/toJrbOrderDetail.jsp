<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/orderDetails.css"/>" rel="stylesheet" type="text/css">

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
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>
    <!--订单-->
    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510180018</samp>
                <div class="HD-dd-1-z-1"><samp class="HD-sam2">95</samp>&nbsp;万</div>
            </div>
        </div>
        <!--订单展现信息-->
        <div class="HD-dd-2">
            <div class="HD-dd-2-1">
                贷款时间：<samp class="HD-sam3">2015-08-12</samp>
                <div class="HD-dd-2-1-1">贷款金额：<samp class="HD-sam4">65</samp>&nbsp;万</div>
            </div>
            <div class="HD-dd-2-1">
                期间：<samp class="HD-sam3">2015.08.12-11.20</samp>
                <div class="HD-dd-2-1-1">状态：<samp class="HD-sam4">还款中</samp></div>
            </div>
            <div class="HD-dd-2-1">
                待还金额：<samp class="HD-sam3">65</samp>&nbsp;万
                <div class="HD-dd-2-1-1">手续费：<samp class="HD-sam4">5</samp>&nbsp;万</div>
            </div>
            <div class="HD-dd-2-1">
                总金额：<samp class="HD-sam3">95</samp>&nbsp;万
                <div class="HD-dd-2-1-1">已还金额：<samp class="HD-sam4">30</samp>&nbsp;万</div>
            </div>

            <div class="HD-xx1">
                <div class="HD-xx1-1">
                    <div class="HD-xx1-1-1"><a href="#">还款明细</a></div>
                </div>
                <div class="HD-xx1-1">
                    <div class="HD-xx1-1-2"><a href="#">还款</a></div>
                </div>
            </div>
        </div>
    </div>
</div><!--主体-->

</body>
</html>
