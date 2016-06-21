<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/mobilephone/index/index.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
</head>
<body>
<section class="wrap">
  <a name="top">
  </a>
  <jsp:include page="../navigation.jsp"></jsp:include>
  <!--header stop-->
  <!--content stop-->
  <section class="inquiry">
    <div class="inquiry-cont">
      <div class="inq-pic">
        <div class="inq-pic-p shopping">
        </div>
        <p class="tac">
          赶快去购物吧！
        </p>
      </div>
    </div>
    <div class="to-shopping">
      <a href="/BiGeZaiXian">
        去购物
      </a>
    </div>
  </section>
  <!--content end-->
  <!--footer stop-->
  <jsp:include page="../foot_index.jsp"></jsp:include>
  <!--footer end-->
</section>
<!--商品询价弹出 stop-->
<script type="text/javascript">
  $(function() {
    var aDent = true;
    var oParent = $('.list-bar');
    var oNodeContent = $('.list-menu');
    oParent.click(function() {
      if (aDent) {
        oNodeContent.stop().slideDown(500);
      } else {
        oNodeContent.stop().slideUp(500);
      }
      aDent = !aDent;
    });
  });

  $(function() {
    $('.iap-list-checkbox').click(function() {
      $('.iap-list-checkbox').removeClass('curr');
      $(this).addClass('curr');
    });

    $('.inquiry-add').click(function() {
      $('.inq-pic').hide();
      $('.inquiry-add-lyer').show();
      $('.inquiry-add-popup').show();
    });

    $('.iap-q .close').click(function() {

      if ($('.in-j li').length == 0) {
        $('.inq-pic').show();
      } else {
        $('.inq-pic').hide();
      }

      $('.inquiry-add-lyer').hide();
      $('.inquiry-add-popup').hide();
    });

    $('.inquiry-add-lyer').css('height', $('body').height());

    $('.iap-q .blue').click(function() {

      var paiHao = $("#xph").val();
      var chanDi = $("#xcd").val();
      var shuLiang = $("#xnum").val();

      if (paiHao == '') {
        alert('请填写牌号');
        return false;
      }
      if (chanDi == '') {
        alert('请填写产地');
        return false;
      }

      if (shuLiang == '') {
        alert('请填写数量');
        return false;
      }

      if (! (/^(\+|-)?\d+$/.test(shuLiang))) {
        alert("数量必须是正整数！");
        return false;
      }

      $('.inquiry-add-lyer').hide();
      $('.inquiry-add-popup').hide();

    });

  });
</script>
<div class="inquiry-add-lyer" style="display: none; height: 600px;">
</div>
<div class="inquiry-add-popup" style="display:none;">
  <div class="inquiry-add-popup-wrap">
    <ul>
      <li class="iap-h3">
        添加询价物料
      </li>
      <li class="iap-list">
						<span>
							牌号
						</span>
        <p>
          <input type="text" class="iap-text" id="xph" placeholder="请填写牌号">
        </p>
      </li>
      <li class="iap-list">
						<span>
							产地
						</span>
        <p>
          <input type="text" class="iap-text" id="xcd" placeholder="请填写产地">
        </p>
      </li>
      <li class="iap-list">
						<span>
							数量
						</span>
        <p>
          <input type="text" placeholder="请填写数量" id="xnum" class="iap-text">
        </p>
      </li>
      <li class="iap-list">
						<span>
							地域
						</span>
        <p>
          <select class="iap-select">
            <option>
              全部
            </option>
            <option>
              上海
            </option>
            <option>
              北京
            </option>
          </select>
        </p>
      </li>
      <li>
        <p class="iap-list-checkbox curr">
          客户自提
        </p>
      </li>
      <li>
        <p class="iap-list-checkbox">
          委托配送
        </p>
      </li>
      <li class="iap-q">
        <a href="#" class="close">
          取消
        </a>
        <a href="#" class="blue">
          确定添加
        </a>
      </li>
    </ul>
  </div>
</div>
<!--商品询价弹出 end-->
</body>

</html>
