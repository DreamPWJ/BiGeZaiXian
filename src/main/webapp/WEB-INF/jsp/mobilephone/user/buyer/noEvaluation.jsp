<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/26 0026
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/user/noEvaluation.css"/>" rel="stylesheet" type="text/css" >
  <%--<title>个人中心-待评价订单</title>--%>
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
<div class="zhongti">
  <jsp:include page="../../navigation.jsp"></jsp:include>
  <!--头部-->
  <!--头部隐藏菜单栏-->
  <div class="top-dh" id="n1" style="display:none;">
    <!--底线-->
    <div class="dx"></div>
  </div>

  <c:forEach items="${goodList}" var="item">
  <!--订单标题-->
  <div class="ddbt">
    <div class="ddbt-2">${item.PRODUCER}&nbsp;${item.GOODKIND}&nbsp;${item.MARK}</div>
    <div class="ddbt-3"><div class="ddbt-3-1"></div></div>
  </div>

  <!--订单详细-->
  <div class="ddxx">
    <div class="ddxx-1">
      <div class="ddxx-1-1"><img src="<c:url value="${item.PICURL}"/>"  style="width:54px; height:60px;" /></div>

      <div class="ddxx-1-2">
        <div class="ddxx-1-2-s">牌号：<samp class="asm">${item.MARK}</samp></div>
        <div class="ddxx-1-2-x">产地：<samp class="asm">${item.PRODUCER}&nbsp;${item.GOODKIND}</samp></div>
      </div>
      <div class="ddxx-1-3">
        <div class="ddxx-1-3-s">￥<samp class="asm">${item.PRICEHASTAX}.00</samp></div>
        <div class="ddxx-1-3-x">x&nbsp;<samp style=" font-size:14px; color:#B0B0B0">${item.AFFIRMNUM}</samp>&nbsp;${item.MEA}</div>
      </div>

    </div>
  </div>

  <!--运费,实付款-->
  <div class="yf">
    <div class="yf-1">共&nbsp;<samp id="" style="font-size:16px; font-weight:bold; color:#eb6100;">1</samp>&nbsp;宗货品</div>
    <div class="yf-2">运&nbsp;费：￥
      <samp id="" style="font-size:16px; color:#EB6100;"></samp>
    </div>
    <div class="yf-3">实&nbsp;付：￥
      <samp id="" style="font-size:16px; color:#EB6100;">
        ${item.PRICEHASTAX * item.AFFIRMNUM}
      </samp>
    </div>

  </div>

  <!--联系客服、取消订单、付款，按钮-->
  <div class="lqf">
    <div class="ycq-1">
      <div class="ycq-1-3"><a href="#">评价订单</a></div>
      <div class="yc"></div>
      <div class="ycq-1-2"><a href="#">查看物流</a></div>
      <div class="yc"></div>
      <div class="ycq-1-1"><a href="#">删除订单</a></div>
    </div>
  </div>
  <!--底线-->
  <div class="dx2"></div>
  </c:forEach>

  <!--底部-->
  <jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>
</html>
