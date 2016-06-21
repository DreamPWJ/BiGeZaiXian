<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
  <link href="<c:url value="/css/mobilephone/user/toOrderNoPay.css"/>" rel="stylesheet" type="text/css" >
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <title>个人中心-待支付订单</title>
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
    <!--底线-->
    <div class="dx"></div>
  </div>
<c:forEach items="${orderList}" var="item">
  <!--订单标题-->
  <div class="ddbt">
    <div class="ddbt-2">${item.PRODUCINGAREA}&nbsp;${item.GOODKIND}&nbsp;${item.MARK}</div>
    <div class="ddbt-3"><div class="ddbt-3-1"></div></div>
  </div>

  <!--订单详细-->
  <div class="ddxx">
    <div class="ddxx-1">
      <div class="ddxx-1-1">
        <img src="<c:url value="${item.PICURL}"/>"  style="width:54px; height:60px;" alt="这是一张图片"/>
      </div>

      <div class="ddxx-1-2">
        <div class="ddxx-1-2-s">牌号：<samp class="asm">${item.MARK}</samp></div>
        <div class="ddxx-1-2-z">产地：<samp class="asm">${item.PRODUCINGAREA}&nbsp;${item.GOODKIND}</samp></div>
        <div class="ddxx-1-2-x"><samp class="asm">${item.MARK}</samp></div>
      </div>
      <div class="ddxx-1-3">
        <div class="ddxx-1-3-s">￥<samp class="asm">${item.PRICEHASTAX}</samp></div>
        <div class="ddxx-1-3-x">x&nbsp;<samp style=" font-size:14px; color:#B0B0B0">${item.AFFIRMNUM}</samp>&nbsp;吨</div>
      </div>

    </div>
  </div>

  <!--运费,实付款-->
  <div class="yf">
    <%--<div class="yf-1">运费：</div>
    <div class="yf-2">￥10,000.00</div>--%>
    <div class="sfk-1">实付款(不含运费)：</div>
    <div class="sfk-2">￥${item.PRICEHASTAX * item.AFFIRMNUM}</div>
  </div>

  <!--订单号，成交时间-->
  <div class="ddh">
    <div id="" class="ddh-1">订单号：<samp style=" font-size:14px; color:#666">${item.ORDERNO}</samp></div>
    <div id="" class="ddh-1">聚融宝订单号：<samp style=" font-size:14px; color:#666">002646879870542</samp></div>
    <div id="" class="ddh-1">成交时间：
      <samp style=" font-size:14px; color:#666">&nbsp;
        <fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
      </samp>
    </div>

  </div>

  <!--底线-->
  <div class="dx"></div>

  <!--联系客服、取消订单、付款，按钮-->
  <div class="lqf">
    <div class="ycq-1">
      <div class="ycq-1-3"><a href="#">付&nbsp;款</a></div>
      <div class="yc"></div>
      <div class="ycq-1-2"><a href="#">取消订单</a></div>
      <div class="yc"></div>
      <div class="ycq-1-1"><a href="#">联系客服</a></div>
    </div>
  </div>
</c:forEach>
  <!--底部-->
<jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>
</html>

