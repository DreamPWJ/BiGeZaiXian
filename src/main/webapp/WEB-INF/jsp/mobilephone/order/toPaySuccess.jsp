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
    });
  </script>
</head>

<body>
<div class="zhongti">
  <!--头部-->
  <jsp:include page="../navigation.jsp"></jsp:include>

  <p>订单支付成功!</p>
  <p>订单号：XXXXXXX</p>
  <p>订单金额：40万</p>
  <p>返还保证金4万，感谢您在日聚购物，欢迎您再次光临！</p>
  <!--平台提示信息-->
  <p>平台将会按照您选择的物流方式进行配送</p>

  <p><a>账户查询</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>查看订单</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>返回首页</a></p>
  <!--底部-->
  <jsp:include page="../foot_index.jsp"></jsp:include>
</div>

</body>
</html>

