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
  <!--订单信息-->
  <table>
    <tbody>
      <tr>
        <td>编号</td>
        <td>货品名称</td>
        <td>生产商</td>
        <td>含税单价</td>
        <td>数量（吨）</td>
        <td>仓库</td>
        <td>税率</td>
        <td>税额</td>
        <td>总价</td>
      </tr>
      <!--订单数据-->
      <c:forEach items="${cartOrderList}" var="item">
        <tr>
          <td>${item.id}</td>
          <td>PE/HD7000F</td>
          <td>伊朗石化</td>
          <td>￥10000.00元</td>
          <td>20</td>
          <td>上海仓库</td>
          <td>17%</td>
          <td>1700.00元</td>
          <td>11700.00元</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <br/><br/><br/>
  <p>平台购买合同</p>
  <p>该订单已自动生成一份买卖合同，请用户仔细<a>预览</a>/<a>下载</a>!</p>
  <p>已选商品：2宗商品</p>
  <p>订单金额（含税）：40万</p>
  <p>支付方式</p>
  <p>应交保证金</p>
  <p>运费</p>
  <p>发票信息</p>
  <p>为保障双方利益，一旦违约，将扣除保证金</p>
  <p>应付总额（不含运费）:40万</p>
  <p><input type="submit" value="提交订单"/></p>
  <br/><br/><br/>
  <!--底部-->
  <jsp:include page="../foot_index.jsp"></jsp:include>
</div>

</body>
</html>
