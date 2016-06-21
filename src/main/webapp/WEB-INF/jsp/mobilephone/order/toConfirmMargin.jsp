<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>

  <script type="text/javascript">
    $(function () {
      var aDent = true;
      var oParent = $('.list-bar');
      var oNodeContent = $('.list-menu');
      oParent.click(function () {
        if (aDent) {
          oNodeContent.stop().slideDown(500);
        } else {
          oNodeContent.stop().slideUp(500);
        }
        aDent = !aDent;
      });

      $("#submit").click(function(){
        $("#form").submit();
      });
    });
  </script>
</head>

<body>
<div class="zhongti">
  <!--头部-->
  <jsp:include page="../navigation.jsp"></jsp:include>

  <!--订单信息_隐藏-->
  <form method="post" action="/BiGeZaiXian/order/toPayMargin" id="form">
    <input type="hidden" name="companyId" value="${companyId}">
    <input type="hidden" name="storageId" value="${storageId}">
    <input type="hidden" name="goodId" value="${goodId}">
    <input type="hidden" name="price" value="${price}">
    <input type="hidden" name="number" value="${number}">
    <input type="hidden" name="source" value="${source}">
  </form>

  <!--页面提示信息-->
  <p>确认冻结保证金</p>
  <p>将冻结保证金4万元，支付后返还。</p>
  <p>特别提醒：保证金作为保障供应商的合法权益，当缴纳保证金后，货物将被您锁定2小时。2小时内支付货款，或取消订单，保证金将返还。</p>
  <p>若超过2小时未支付全部货款或取消订单，保证金将被扣除。</p>
  <p>如有特殊原因，可联系人工客服协商解决。</p>
  <p>保证金规则、作用</p>
  <p>支付密码：<input/></p>
  <p>
    <button type="submit" id="submit">确定</button>
    <button>取消</button>
  </p>
  <!--底部-->
  <jsp:include page="../foot_index.jsp"></jsp:include>
</div>

</body>
</html>

