<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <link href="<c:url value="/css/mobilephone/user/purchaseBid.css"/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <title>个人中心-采购竟价</title>
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
<jsp:include page="../../navigation.jsp"></jsp:include>
<div class="zhongti">
    <!--头部隐藏菜单栏-->
    <div class="top-dh" id="n1" style="display:none;">
        <!--底线-->
        <div class="dx"></div>
    </div>

    <!--求购货品-->
    <div class="qghp">
        <div class="qghp-1"><span style="color:red; ">*</span>求购货品：</div>
        <div class="qghp-2"><input type="text" value="" id="" class="text1" placeholder="请输入您要求购的货品名称"
                                   style="width:78%; height:40px;"/></div>
    </div>

    <!--数量-->
    <div class="shul">
        <div class="shul-1"><span style="color:red; ">*</span>数量：</div>
        <div class="shul-2"><input type="text" value="" id="" class="text1" placeholder="请输入您要求购的货品数量"
                                   style="width:78%; height:40px;"/>吨
        </div>
        <!--			<div class="shul-3">&nbsp;&nbsp;吨</div>-->
    </div>

    <!--接受价格-->
    <div class="shul">
        <div class="shul-1"><span style="color:red; ">*</span>接受价格：</div>
        <div class="shul-2"><input type="text" value="" id="" class="text1" placeholder="请输入您要求购的货品价格"
                                   style="width:78%; height:40px;"/>元
        </div>
        <!--			<div class="shul-3">&nbsp;&nbsp;元</div>-->
    </div>

    <!--底部-->
    <div class="dib">
        <div class="tuic"><a href="#">立即发布</a></div>

        <div class="wz">&copy;&nbsp;m.juhuawang.com</div>
    </div>

</div>
</body>
</html>
