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
  <form id="form" method="post" action="/BiGeZaiXian/order/toPayOrder">
    <input type="hidden" name="companyId" value="${companyId}">
    <input type="hidden" name="storageId" value="${storageId}">
    <input type="hidden" name="goodId" value="${goodId}">
    <input type="hidden" name="price" value="${price}">
    <input type="hidden" name="number" value="${number}">
    <input type="hidden" name="source" value="${source}">
  </form>

  <!--页面提示信息-->
  <p>订单提交成功，请您尽快付款！</p>
  <p>订单号：${orderNo}</p>
  <p>
    已冻结保证金4万，支付订单后返还。
    <a>查看账户</a>
    <span>应付金额<span class="orange">40万</span></span>
  </p>
  <p>请您在提交订单后<span class="orange">2小时</span>内完成支付，否则订单会自动取消！如有疑问，请立即联系平台客服人员进行解决！</p>
  <p>
    倒计时
    <span class="red">目前供应商的货物已被您锁定，为保障供应商的合法权益，超过2小时，订单自动取消，并扣除保证金！如有特殊情况，请提前取消订单！</span>
  </p>

  <!--订单信息-->
  <table>
    <tbody>
      <tr>
        <td>PE/HD7000F</td>
        <td>木托</td>
        <td>火炬</td>
        <td>伊朗石化</td>
        <td>物流配送</td>
        <td>张三</td>
        <td>15000000000</td>
        <td>山东省日照市东港区烟台路一号</td>
      </tr>
      <tr>
        <td>PE/BL3</td>
        <td>木托</td>
        <td>火炬</td>
        <td>伊拉克石化</td>
        <td>物流配送</td>
        <td>张三</td>
        <td>15000000000</td>
        <td>山东省日照市东港区烟台路一号</td>
      </tr>
    </tbody>
  </table>
  <p>
    <input type="checkbox"/>
    账户可用余额：46万<span>您可以使用账户余额进行支付</span>
  </p>
  <p>支付密码：<input/></p>
  <p>
    <button type="submit" id="submit">立即支付</button>
  </p>
  <!--底部-->
  <jsp:include page="../foot_index.jsp"></jsp:include>
</div>

</body>
</html>

