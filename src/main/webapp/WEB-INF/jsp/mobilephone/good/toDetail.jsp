<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <%--<script type="text/javascript" src="<c:url value="/js/mobilephone/good/toSpotList.js"/>"></script>--%>
</head>
<body>
<section class="wrap">
  <a name="top">
  </a>
  <jsp:include page="../navigation.jsp"></jsp:include>
  <!--content stop-->
  <c:choose>
  <c:when test="${msg_good eq '暂时没有该牌号的商品信息请等待。。。'}">
    <span style="color: #990000;font-size: large">${msg_good}</span>
  </c:when>
  <c:otherwise >
  <section class="detail">
    <article class="slider" style="height: 320px">
      <!--scroll-->
      <div class="scroll relative">
        <div class="scroll_box" id="scroll_img" style="visibility: visible;">
          <ul class="scroll_wrap" style="width: 924px;">
            <c:choose>
              <c:when test="${goodPicList != []}">
                <c:forEach items="${goodPicList}" var="item">
                  <c:if test="${item.ORD==null}">
                    <li data-index="0" style="width: 462px; left: 0px; transition-duration: 300ms; -webkit-transition-duration: 300ms; -webkit-transform: translate(0px, 0px) translateZ(0px);">
                      <a href="javascript:void(0);">
                        <img src="<c:url value="/good/showPicture?pathname=${item.PICURL}"/>" width="320px" height="320px" alt="这是一张图片">
                      </a>
                    </li>
                  </c:if>
                  <c:if test="${item.ORD==1}">
                    <li data-index="0" style="width: 462px; left: 0px; transition-duration: 300ms; -webkit-transition-duration: 300ms; -webkit-transform: translate(-462px, 0px) translateZ(0px);">
                      <a href="javascript:void(0);">
                        <img src="<c:url value="/good/showPicture?pathname=${item.PICURL}"/>" width="320px" height="320px" alt="这是一张图片">
                      </a>
                    </li>
                  </c:if>
                  <c:if test="${item.ORD==2}">
                    <li data-index="1" style="width: 462px; left: -462px; transition-duration: 300ms; -webkit-transition-duration: 300ms; -webkit-transform: translate(0px, 0px) translateZ(0px);">
                      <a href="javascript:void(0);">
                        <img src="<c:url value="/good/showPicture?pathname=${item.PICURL}"/>" width="320px" height="320px" alt="这是一张图片">
                      </a>
                    </li>
                  </c:if>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <li data-index="0" style="width: 462px; left: 0px; transition-duration: 300ms; -webkit-transition-duration: 300ms; -webkit-transform: translate(-462px, 0px) translateZ(0px);">
                  <a href="javascript:void(0);">
                    <img src="<c:url value="/images/mobilephone/temporary/7000F.jpg"/>" width="320px" alt="这是一张图片">
                  </a>
                </li>
                <li data-index="1" style="width: 462px; left: -462px; transition-duration: 300ms; -webkit-transition-duration: 300ms; -webkit-transform: translate(0px, 0px) translateZ(0px);">
                  <a href="javascript:void(0);">
                    <img src="<c:url value="/images/mobilephone/temporary/7000F.jpg"/>" width="320px" alt="这是一张图片">
                  </a>
                </li>
              </c:otherwise>
            </c:choose>
          </ul>
        </div>
        <ul class="scroll_position" id="scroll_position">
          <li class=" ">
            <a href="javascript:void(0);">
            </a>
          </li>
          <li class="on">
            <a href="javascript:void(0);">
            </a>
          </li>
        </ul>
      </div>
      <!--scroll-->
      <div class="detail-price">
        <a class="btn-sc" id="collection" href="javascript:void(0);">
        </a>
      </div>
    </article>
    <div class="info">
      <a href="/BiGeZaiXian/good/toInfo">
        产品信息
      </a>
    </div>
    <h3 class="detail-title">
        牌号：${good.MARK} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产地：${good.PRODUCINGAREA} &nbsp;&nbsp;&nbsp;&nbsp;品种：${good.GOODKIND}
    </h3>
    <p class="detail-text">
      <span class="orange">
          价格：￥${price}元/${good.MEA}
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          库存：${onsellNum}${good.MEA}
          <input type="hidden" value="${onsellNum}" id="stockNum">
      </span>
    </p>
    <div class="detail-num clearfix">
      <div class="detail-n clearfix">
        <span class="fl">
            数　量：
        </span>
        <i class="left">
        </i>
        <input style="width: 100px" class="dn-text" type="text" value="5" id="number">
        <i class="right">
        </i>
      </div>
      <input type="hidden" value="0" id="useable_num">
      <input type="hidden" value="804" id="sku_id">
      <input type="hidden" value="5" id="minimum">
    </div>
    <%--<div class="detail-evalua clearfix">--%>
      <%--<p class="detail-c">--%>
        <%--商品评价--%>
						<%--<span class="fr">--%>
							<%--<i class="orange">--%>
                              <%--1--%>
                            <%--</i>--%>
							<%--人评价--%>
							<%--<i class="orange">--%>
                              <%--100%--%>
                            <%--</i>--%>
							<%--好评--%>
						<%--</span>--%>
      <%--</p>--%>
    <%--</div>--%>
    <%--<div class="detail-pl">
      <a href="#" class="orange">
        产品评论(1)<span style="float: right;margin-right: 20px">2人评价</span>
      </a>
    </div>--%>
    <div class="detail-fixed">

      <form action="" method="post" id="form">
        <input type="hidden" value="${companyId}" name="companyId">
        <input type="hidden" value="${storageId}" name="storageId">
        <input type="hidden" value="${goodId}" name="goodId">
        <input type="hidden" value="${price}" name="price">
        <input type="hidden" value="${onsellNum}" name="number" id="num">
        <input type="hidden" value="${onsellNum}" name="onsellNum">
        <input type="hidden" value="" name="source" id="source">
          <a href="javascript:void(0);" class="btn-cell" id="shopCart">
		<span>
			加入购物车
		</span>
          </a>
          <a href="javascript:void(0);" class="btn-buy" id="show_b2c">
		<span>
			立即下单
		</span>
          </a>
      </form>
    </div>
  </section>
  </c:otherwise>
  </c:choose>
  <!--content end-->
  <script type="text/javascript">
    $(function() {
    if(${msg_guest == '您的账号属于供应商不能购买商品，请使用购买商账号进行购买'}){
      alert("${msg_guest}");
    }

      //加入购物车
      var is_booking = false;

      $("#shopCart").click(function() {
        addToCart();
      });

      $("#show_b2c").click(function() {
        addToDirect();
      });

      $("#show_futures").click(function() {
        addToDirectFuture();
      });

      $("#show_usd").click(function() {
        addToDirectUsd();
      });

      $("#warehouse_out").click(function() {

        var st_id = $("#city_id option:selected").val();

        var url = "/user/inquiryTmp/product_id/798/st_id/" + st_id;
        window.location.href = url;
      });

      // 加入购物车
      function addToCart() {
        var st_id = $("#city_id option:selected").val();
        var useable_num = Number($("#useable_num").val());
        var product_num = Number($(".dn-text").val());
        var stockNum = $("#stockNum").val();

        $("#num").val(product_num);
        $("#source").val("001");// 下单来源--购物车
        if (product_num == 0) {
          alertMsg("不可以购买0吨。");
          return false;
        }
        if(product_num > stockNum){
          alertMsg("您购买的数量超出了库存的数量");
          return false;
        }
        var sku_id = $("#sku_id").val();
        var is_booking_val = (true == is_booking) ? 1 : 0;
        $("#form").attr("action","/BiGeZaiXian/order/addToCart");
        $("#form").submit();
      }

      //立即下单
      function addToDirect() {
        var st_id = $("#city_id option:selected").val();

        var useable_num = Number($("#useable_num").val());
        var product_num = Number($(".dn-text").val());
        var stockNum = $("#stockNum").val();

        $("#num").val(product_num);
        $("#source").val("002");// 下单来源--直接下单
        if (product_num == 0) {
          alertMsg("不可以购买0吨。");
          return false;
        }
        if(product_num > stockNum){
          alertMsg("您购买的数量超出了库存数");
          return false;
        }
        var sku_id = $("#sku_id").val();
        var is_booking_val = (true == is_booking) ? 1 : 0;
        $("#form").attr("action","/BiGeZaiXian/order/toOrder");
        $("#form").submit();
      }

      //购买期货
      function addToDirectFuture() {
        var st_id = $("#city_id option:selected").val();

        var useable_num = Number($("#useable_num").val());
        var product_num = Number($(".dn-text").val());

        if (product_num == 0) {
          alertMsg("不可以购买0吨。");
          return false;
        }
        var sku_id = $("#sku_id").val();
        var is_booking_val = (true == is_booking) ? 1 : 0;
        var url = "/order/directFuture/st/$6/sku_id/$1/is_booking/$2/product_num/$3";
        url = url.replace('$1', sku_id).replace('$2', is_booking_val).replace('$3', product_num).replace('$6', st_id);

        window.location = url;
      }

      //美金盘
      function addToDirectUsd() {
        var st_id = $("#city_id option:selected").val();

        var useable_num = Number($("#useable_num").val());
        var product_num = Number($(".dn-text").val());

        if (product_num == 0) {
          alertMsg("不可以购买0吨。");
          return false;
        }

        var sku_id = $("#sku_id").val();
        var is_booking_val = (true == is_booking) ? 1 : 0;
        var url = "/order/directUsd/st/$6/sku_id/$1/is_booking/$2/product_num/$3";
        url = url.replace('$1', sku_id).replace('$2', is_booking_val).replace('$3', product_num).replace('$6', st_id);

        window.location = url;
      }

      // 轮播
      var bullets = document.getElementById('scroll_position').getElementsByTagName('li');
      var slider = Swipe(document.getElementById('scroll_img'), {
        auto: 5000,
        continuous: false,
        callback: function(pos) {
          var i = bullets.length;
          while (i--) {
            bullets[i].className = ' ';
          }
          bullets[pos].className = 'on';
        }
      });

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

      $(".left").click(function() {
        $(".dn-text").val(Number($(".dn-text").val()) - 1);
        var minimum = $("#minimum").val();
        if (Number($(".dn-text").val()) < minimum) {
          alert('抱歉，该产品最低起订量' + minimum + '吨，如有问题请咨询客服。');
          $('.dn-text').focus();
          $(".dn-text").val(minimum);
        }
      });

      $(".right").click(function() {
        $(".dn-text").val(Number($(".dn-text").val()) + 1);
      });
    });

    $(function() {
      var prurl = "/region/subRegions/id/%d%d";
      $("#province_id").change(function() {
        var v = $("#province_id").val();
        if (v > 0) {
          $.ajax({
            type: 'GET',
            dataType: 'json',
            url: prurl.replace('%d%d', v),
            success: function(data) {
              var str = '<option value="0">请选择....</option>';
              if (data) {
                for (a in data) {
                  str += '<option zip="' + data[a].region_zip + '" areano="' + data[a].region_areano + '" value="' + data[a].region_id + '">' + data[a].region_name + '</option>';
                }
              }
              $("#city_id").html(str);
            }
          });
        } else {
          var str = '<option value="0">请选择....</option>';
          $("#city_id").html(str);
        }
      });
    });

    $(function() {
      var error_cfg = {
        1 : '未登录',
        2 : 'product_id不能为空',
        3 : '此商品已经收藏过了',
        4 : '每个用户最多收藏10个商品',
        5 : '收藏失败',
        10 : '收藏成功'
      };

      $("#collection").click(function() {
        var url = "/json/collectProduct";
        $.post(url, {
                  product_id: "798"
                },
                function(data) {
                  if (data == '1') {
                    window.location.href = "/user/indexLogin";
                  } else {
                    alertMsg(error_cfg[data]);
                    window.location.reload();
                  }
                });
      });
    });
  </script>
  <!--footer stop-->
  <footer class="footer">
    <section class="footer-bar">
      <a href="/BiGeZaiXian/user/toLogin">
        登录
      </a>
      <a href="/BiGeZaiXian/user/toReg" class="ml10p">
        注册
      </a>
      <a href="#top" class="fr">
        回到顶部
      </a>
    </section>
    <p class="copyright ffa">
      © m.juhuawang.com
    </p>
    <div style="display: none;">
      <script type="text/javascript">
        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://": " http://");
        document.write(unescape("%3Cspan id='cnzz_stat_icon_1252962129'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/stat.php%3Fid%3D1252962129' type='text/javascript'%3E%3C/script%3E"));
      </script>
					<span id="cnzz_stat_icon_1252962129">
						<a href="http://www.cnzz.com/stat/website.php?web_id=1252962129" target="_blank"
                           title="站长统计">
                          站长统计
                        </a>
					</span>
      <script src=" http://s19.cnzz.com/stat.php?id=1252962129" type="text/javascript">
      </script>
      <script src="http://c.cnzz.com/core.php?web_id=1252962129&amp;t=z" charset="utf-8"
              type="text/javascript">
      </script>
    </div>
  </footer>
  <!--footer end-->
</section>
</body>

</html>
