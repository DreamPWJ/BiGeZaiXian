<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/freezeFunds.css"/>" rel="stylesheet" type="text/css">

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

            <!--订单展示1-->
            $("#title_order1").click(function(){
                $("#content_order1").toggle();
            });
            <!--订单展示2-->
            $("#title_order2").click(function(){
                $("#content_order2").toggle();
            });
            <!--订单展示3-->
            $("#title_order3").click(function(){
                $("#content_order3").toggle();
            });
        });
    </script>
</head>

<body>
<div class="zhongti" id="tou">
    <!--头部-->
    <jsp:include page="../navigation.jsp"></jsp:include>
    <!--搜索-->
    <div class="shsu">
        <form>
            <jsp:include page="search.jsp"></jsp:include>
        </form>
    </div>

    <!--订单-->
    <div class="HD-dd">
        <div class="HD-dd-1" id="title_order1">
                <div class="HD-dd-1-t"></div>
                <div class="HD-dd-1-z">
                    订单：<samp class="HD-sam1">201510180018</samp>
                    <div class="HD-dd-1-z-1"><samp class="HD-sam2">已冻结</samp></div>
                </div>
        </div>
        <!--订单展现信息-->
        <div class="HD-dd-2" id="content_order1" style="display: none;">
            <div class="HD-dd-2-1">
                贷款时间：<samp class="HD-sam3">2015-08-12</samp>
                <div class="HD-dd-2-1-1">总金额(含手续费)：<samp class="HD-sam4">65</samp>&nbsp;万</div>
            </div>
            <div class="HD-dd-2-2">
                期间：<samp class="HD-sam3">2015.08.12-11.20</samp>
                <div class="HD-dd-2-1-2">保证金：<samp class="HD-sam2">10</samp>&nbsp;万</div>
            </div>

        </div>
    </div>
    <div style="width:auto; height:30px; clear:left; background:#F3F3F3;"></div>
    <!--订单 2-->
    <div class="HD-dd">
        <div class="HD-dd-1" id="title_order2">
                <div class="HD-dd-1-t"></div>
                <div class="HD-dd-1-z">
                    订单：<samp class="HD-sam1">201510190019</samp>
                    <div class="HD-dd-1-z-1"><samp class="HD-sam2">已冻结</samp></div>
                </div>
        </div>
        <!--订单展现信息-->
        <div class="HD-dd-2" id="content_order2" style="display:none;">
            <div class="HD-dd-2-1">
                贷款时间：<samp class="HD-sam3">2015-08-18</samp>
                <div class="HD-dd-2-1-1">总金额(含手续费)：<samp class="HD-sam4">75</samp>&nbsp;万</div>
            </div>
            <div class="HD-dd-2-2">
                期间：<samp class="HD-sam3">2015.08.18-11.26</samp>
                <div class="HD-dd-2-1-2">保证金：<samp class="HD-sam2">10</samp>&nbsp;万</div>
            </div>

        </div>
    </div>
    <div style="width:auto; height:30px; clear:left; background:#F3F3F3;"></div>
    <!--订单 3-->
    <div class="HD-dd">
        <div class="HD-dd-1" id="title_order3">
                <div class="HD-dd-1-t"></div>
                <div class="HD-dd-1-z">
                    订单：<samp class="HD-sam1">201510200020</samp>
                    <div class="HD-dd-1-z-1"><samp class="HD-sam2">已冻结</samp></div>
                </div>
        </div>
        <!--订单展现信息-->
        <div class="HD-dd-2" id="content_order3" style="display:none;">
            <div class="HD-dd-2-1">
                贷款时间：<samp class="HD-sam3">2015-09-15</samp>
                <div class="HD-dd-2-1-1">总金额(含手续费)：<samp class="HD-sam4">85</samp>&nbsp;万</div>
            </div>
            <div class="HD-dd-2-2">
                期间：<samp class="HD-sam3">2015.09.15-11.29</samp>
                <div class="HD-dd-2-1-2">保证金：<samp class="HD-sam2">10</samp>&nbsp;万</div>
            </div>

        </div>
    </div>
    <div style="width:auto; height:30px; clear:left; background:#F3F3F3;"></div>
</div><!--主体-->

</body>
</html>
