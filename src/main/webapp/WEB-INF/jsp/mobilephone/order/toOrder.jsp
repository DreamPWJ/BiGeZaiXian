<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/mobilephone/good/toSpotList.js"/>"></script>
</head>
<body>
<section class="wrap">
  <a name="top"></a>
  <jsp:include page="../navigation.jsp"></jsp:include>
  <section class="products-list">
    <h3 class="detail-title">${good.GOODKIND} ${good.MARK}<span class="red"></span></h3>
    <ul>
      <li style="border-top: 1px solid #e6e6e6;">
        <p class="fl">
          <%--<a href="#"><img src="${object.PICURL}" width="100%"></a>--%>
          <a href="#">
            <c:choose>
              <c:when test="${good.PICURL == null}">
                <img src="<c:url value="/images/mobilephone/temporary/title.jpg"/>" style="width: 75px;height: 75px">
              </c:when>
              <c:otherwise>
                <img src="<c:url value="${good.PICURL}"/>" style="width: 75px;height: 75px">
              </c:otherwise>
            </c:choose>
          </a>
        </p>
        <div class="products-list-c">
          <p>牌号：${good.MARK} 产地：${good.PRODUCINGAREA}</p>
          <p class="plc-hi"><a href="" class="blue">
             ${good.MARK} ${good.PRODUCER}<span class="red"> </span></a></p>
          <p class="pt5p">含税单价：<span class="orange">￥${price}</span>元/${good.MEA}</p>
        </div>
      </li>
    </ul>

    <%--<span style=" " >--%>
      <h3 class="detail-title" style="border-bottom: 1px solid #e6e6e6;">
        <span>税率:<span class="orange">${good.RATE * 100}%</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <span>税额:<span class="orange">${price * number * good.RATE}</span>元</span>
      </h3>
      <h3 class="detail-title" style="border-bottom: 1px solid #e6e6e6;">
        <span style="">共<span class="orange">${number}</span>${good.MEA}&nbsp;&nbsp;&nbsp;&nbsp;
          实付：<span class="orange">${price * number}</span>元</span>
      </h3>
    <%--</span>--%>
    <%--<h3 class="detail-title" style="border-bottom: 1px solid #e6e6e6;">
      配送方式:
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自提<input type="radio" name="delivery" value="1">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;物流<input type="radio" name="delivery" value="2">
    </h3>--%>

    <%--<h3 class="detail-title" style="border-bottom: 1px solid #e6e6e6;">
      支付方式<span style="float: right">银行转帐</span>
    </h3>--%>
    <h3 class="detail-title" style="border-bottom: 1px solid #e6e6e6;">
      共1宗商品 <span style="float: right;">合计：<span class="orange">￥${price * number}</span>元</span>
    </h3>
    <h3 class="detail-title" style="border-bottom: 1px solid #e6e6e6;">
      应交保证金￥<span class="orange" id="margin">1000</span>元
      <span style="float: right">运费：<span class="orange">￥1000.00</span>元</span>
    </h3>
    <h3 class="detail-title" style="border-bottom: 1px solid #e6e6e6;">
      <span class="red">温馨提示：由于银行的限制，手机端暂时只支持您使用聚化平台的账户余额进行支付，若您的账户余额不足请先在电脑端进行充值，感谢您的配合。</span>
    </h3>
    <form action="/BiGeZaiXian/order/order" method="post" id="form">
      <input type="hidden" value="${companyId}" name="companyId">
      <input type="hidden" value="${storageId}" name="storageId">
      <input type="hidden" value="${goodId}" name="goodId">
      <input type="hidden" value="${price}" name="price">
      <input type="hidden" value="${number}" name="number">
      <input type="hidden" value="${source}" name="source">
      <div class="sub-order"><a href="javascript:void(0);" id="submit">提交订单</a></div>
    </form>
    <div>
      <span style="color: #FF0000;font-size: large">${msg_order}</span>
    </div>
  </section>
  <!--content end-->

  <script type="text/javascript">
    $(function(){

      $("#submit").click(function(){
        // 检查用户的账号余额
        var margin = Number($("#margin").html());// 应交的保证金
        var account = Number(${account});
        if(account < margin){
          alert("您的保证金不足，请使用电脑进行充值，手机暂时不支持该项业务!");
          return false;
        }
        // 检查配送方式是否已经勾选
//        var delivery = $('input[name="delivery"]:checked ').val();
//        alert(delivery);
        /*if(delivery != 1 && delivery != 2 ){
         alertMsg("请选择配送方式");
         return false;
         }*/
        $("#form").submit();
        /*if($("#title").text() == ''){
          alertMsg("需要填写发票信息。");
          return false;
        }else{
          $("#form").submit();
        }*/
      });

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

  <footer class="footer">
    <section class="footer-bar">

      <a href="/user/indexLogin">登录</a>
      <a href="/register/index" class="ml10p">注册</a>
      <a href="#top" class="fr">回到顶部</a>
    </section>
    <p class="copyright ffa">© m.juhuawang.com</p>
    <div style="display: none;">

      <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252962129'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/stat.php%3Fid%3D1252962129' type='text/javascript'%3E%3C/script%3E"));</script><span id="cnzz_stat_icon_1252962129"><a href="http://www.cnzz.com/stat/website.php?web_id=1252962129" target="_blank" title="站长统计">站长统计</a></span><script src=" http://s19.cnzz.com/stat.php?id=1252962129" type="text/javascript"></script><script src="http://c.cnzz.com/core.php?web_id=1252962129&amp;t=z" charset="utf-8" type="text/javascript"></script>
    </div>
  </footer>
</section>

</body></html>
