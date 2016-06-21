<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/poundage.css"/>" rel="stylesheet" type="text/css">

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
    <!--搜索-->
    <div class="shsu">
        <form>
            <jsp:include page="search.jsp"></jsp:include>
        </form>
    </div>

    <!--订单的手续费-->
    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510180018</samp>
                <div class="HD-dd-1-z-1">手续费：<samp class="HD-sam2">5</samp>&nbsp;万</div>
            </div>
        </div>
    </div>
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510190019</samp>
                <div class="HD-dd-1-z-1">手续费：<samp class="HD-sam2">5</samp>&nbsp;万</div>
            </div>
        </div>
    </div>
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510200020</samp>
                <div class="HD-dd-1-z-1">手续费：<samp class="HD-sam2">5</samp>&nbsp;万</div>
            </div>
        </div>
    </div>
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510210021</samp>
                <div class="HD-dd-1-z-1">手续费：<samp class="HD-sam2">5</samp>&nbsp;万</div>
            </div>
        </div>
    </div>
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510220022</samp>
                <div class="HD-dd-1-z-1">手续费：<samp class="HD-sam2">5</samp>&nbsp;万</div>
            </div>
        </div>
    </div>
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510230023</samp>
                <div class="HD-dd-1-z-1">手续费：<samp class="HD-sam2">5</samp>&nbsp;万</div>
            </div>
        </div>
    </div>
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510240024</samp>
                <div class="HD-dd-1-z-1">手续费：<samp class="HD-sam2">5</samp>&nbsp;万</div>
            </div>
        </div>
    </div>
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>

    <div class="HD-dd">
        <div class="HD-dd-1">
            <div class="HD-dd-1-t"></div>
            <div class="HD-dd-1-z">
                订单：<samp class="HD-sam1">201510250025</samp>
                <div class="HD-dd-1-z-1">手续费：<samp class="HD-sam2">5</samp>&nbsp;万</div>
            </div>
        </div>
    </div>
    <div style="width:auto; height:20px; clear:left; background:#F3F3F3;"></div>
</div><!--主体-->

</body>
</html>
