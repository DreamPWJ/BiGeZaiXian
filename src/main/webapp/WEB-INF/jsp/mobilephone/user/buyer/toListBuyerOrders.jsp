<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/14 0014
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../../top.jsp"></jsp:include>
  <link href="<c:url value="/css/allOrders.css"/>" rel="stylesheet" type="text/css" >
  <title>个人中心-全部订单</title>
  <script type="text/javascript">
    function $(id) {
      return document.getElementById(id);
    }

    function reg() {
      if ($("n1").style.display == "none") {
        $("n1").style.display = "inline";
      }else if($("n1").style.display == "inline"){
        $("n1").style.display = "none";
      }
    }

  </script>
</head>

<body>
<div class="zhongti">
  <!--头部-->
  <div class="v2">
    <a href="#"><div class="v2-1"></div></a>
    &nbsp;全部订单
    <a href="javascript:reg();"><div class="v2-3"></div></a>		</div>
  <!--头部隐藏菜单栏-->
  <div class="top-dh" id="n1" style="display:none;">
    <div class="top-dh-1"><div class="top-dh-1-1">
      <a href="#"><div class="too1"></div></a>
    </div></div>
    <div class="top-dh-2"><div class="top-dh-2-1">
      <a href="#"><div class="too1"></div></a>
    </div></div>
    <div class="top-dh-3"><div class="top-dh-3-1">
      <a href="#"><div class="too1"></div></a>
    </div></div>
    <div class="top-dh-4"><div class="top-dh-4-1">
      <a href="#"><div class="too1"></div></a>
    </div></div>
    <!--底线-->
    <div class="dx"></div>
  </div>

  <!--待支付订单-->
  <div class="ddl">
    <div class="ddl-1"></div>
    <div class="ddl-2"><a href="/BiGeZaiXian/user/toOderNoPay">待支付订单</a></div>
    <div class="ddl-3"><div class="ddl-3-1"></div></div>
  </div>

  <!--待提货订单-->
  <div class="ddl">
    <div class="ddl-1"></div>
    <div class="ddl-2"><a href="noSinceSubmit.html">待提货订单</a></div>
    <div class="ddl-3"><div class="ddl-3-1"></div></div>
  </div>

  <!--待收货订单-->
  <div class="ddl">
    <div class="ddl-1"></div>
    <div class="ddl-2"><a href="#">待收货订单</a></div>
    <div class="ddl-3"><div class="ddl-3-1"></div></div>
  </div>

  <!--待评价订单-->
  <div class="ddl">
    <div class="ddl-1"></div>
    <div class="ddl-2"><a href="#">待评价订单</a></div>
    <div class="ddl-3"><div class="ddl-3-1"></div></div>
  </div>

  <!--信息条-卖家已发货-->
  <div class="xxt">
    <div class="xxt-1"></div>
    <div class="xxt-2">科威特石化&nbsp;HDPE&nbsp;EGDA-6888</div>
    <div class="xxt-3"><div class="xxt-3-1"></div><a href="#">卖家已发货</a></div>
  </div>

  <!--订单详细-->
  <div class="ddxx">
    <div class="ddxx-1">
      <div class="ddxx-1-1"><img src="../personalCenter/sp-1.jpg" style="width:54px; height:60px;" /></div>

      <div class="ddxx-1-2">
        <div class="ddxx-1-2-s">牌号：<samp class="asm">6888</samp></div>
        <div class="ddxx-1-2-z">产地：<samp class="asm">科威特石化&nbsp;HDPE</samp></div>
        <div class="ddxx-1-2-x"><samp class="asm">EGDA-6888</samp></div>
      </div>
      <div class="ddxx-1-3">
        <div class="ddxx-1-3-s">￥<samp class="asm">10,850.00</samp></div>
        <div class="ddxx-1-3-x">x&nbsp;<samp style=" font-size:14px; color:#B0B0B0">50</samp>&nbsp;吨</div>
      </div>
    </div>

    <div class="ddxx-2">
      <div class="ddxx-2-1">
        共&nbsp;<samp style=" font-size:14px; color:#B0B0B0">50</samp>&nbsp;吨&nbsp;&nbsp;
        实付：<samp style=" font-size:14px; color:#000000;">500,000.00</samp>
      </div>

      <div class="ddxx-2-2"></div>
    </div>
  </div>

  <!--延长收货-查看物流-确认收货-->
  <div class="ycq">
    <div class="ycq-1">
      <div class="ycq-1-3"><a href="#">确认收货</a></div>
      <div class="yc"></div>
      <div class="ycq-1-2"><a href="#">查看物流</a></div>
      <div class="yc"></div>
      <div class="ycq-1-1"><a href="#">延长收货</a></div>
    </div>
    <div class="ycq-2"></div>
  </div>



  <!--信息条-选择自提-->
  <div class="xxt">
    <div class="xxt-1"></div>
    <div class="xxt-2">科威特石化&nbsp;HDPE&nbsp;EGDA-6888</div>
    <div class="xxt-3"><div class="xxt-3-1"></div><a href="#">卖家已发货</a></div>
  </div>

  <!--订单详细-->
  <div class="ddxx">
    <div class="ddxx-1">
      <div class="ddxx-1-1"><img src="../personalCenter/sp-1.jpg" style="width:54px; height:60px;" /></div>

      <div class="ddxx-1-2">
        <div class="ddxx-1-2-s">牌号：<samp class="asm">6888</samp></div>
        <div class="ddxx-1-2-z">产地：<samp class="asm">科威特石化&nbsp;HDPE</samp></div>
        <div class="ddxx-1-2-x"><samp class="asm">EGDA-6888</samp></div>
      </div>
      <div class="ddxx-1-3">
        <div class="ddxx-1-3-s">￥<samp class="asm">10,850.00</samp></div>
        <div class="ddxx-1-3-x">x&nbsp;<samp style=" font-size:14px; color:#B0B0B0">50</samp>&nbsp;吨</div>
      </div>
    </div>

    <div class="ddxx-2">
      <div class="ddxx-2-1">
        共&nbsp;<samp style=" font-size:14px; color:#B0B0B0">50</samp>&nbsp;吨&nbsp;&nbsp;
        实付：<samp style=" font-size:14px; color:#000000;">500,000.00</samp>				</div>
      <div class="ddxx-2-2"></div>
    </div>
  </div>

  <!--取消订单-延期提货-我已提货-->
  <div class="ycq">
    <div class="ycq-1">
      <div class="ycq-1-3"><a href="#">我已提货</a></div>
      <div class="yc"></div>
      <div class="ycq-1-2"><a href="#">延期提货</a></div>
      <div class="yc"></div>
      <div class="ycq-1-1"><a href="#">取消订单</a></div>
    </div>
    <div class="ycq-2"></div>
  </div>



  <!--底部-->
  <div class="dib">
    <div class="tuic"><a href="#">退出登录</a></div>

    <div class="wz">&copy;&nbsp;m.juhuawang.com</div>
  </div>
</div>
</body>
</html>

