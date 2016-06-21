<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/jrbInstructions.css"/>" rel="stylesheet" type="text/css">
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
<div class="zhongti" id="tou">
    <!--头部-->
   <jsp:include page="../navigation.jsp"></jsp:include>
    <!--top-logo-->
    <jsp:include page="jrbTop.jsp"></jsp:include>
    <!--聚融宝产品介绍-->
    <div class="cpjs">
        <div class="cpjs-1">
            <div class="cpjs-1-t"></div>
            <div class="cpjs-1-z">聚融宝产品介绍</div>
        </div>
        <div class="cpjs-2">*产品描述：企业凭借自身信用，采用延期付款方式购买商品</div>
        <div class="cpjs-2">*延期付款期限：最长90天</div>
        <div class="cpjs-2">*商品种类：PE通用料</div>
    </div>
    <div style="width:100%; height:20px; background:#f3f3f3;"></div>
    <!--适用客户-->
    <div class="cpjs">
        <div class="cpjs-1">
            <div class="cpjs-1-t-1"></div>
            <div class="cpjs-1-z">适用客户</div>
        </div>
        <div class="cpjs-2">经聚化网审核，已成功申请聚化网交易会员资格的企业；</div>
        <div class="cpjs-2">希望通过企业信用实现融资便利的生产型企业；</div>
        <div class="cpjs-2">有能力支付一定比例的数额保证金；</div>
        <div class="cpjs-2">同意使用聚化网提供的第三方支付平台进行结算。</div>
        <div class="cpjs-2">（同意使用聚化网指定的监管银行进行结算）</div>
    </div>
    <div style="width:100%; height:20px; background:#f3f3f3;"></div>
    <!--图1-->
    <div class="imag1"></div>
    <!--操作流程-->
    <div class="czlc">
        <div class="czlc-1">操作流程</div>
    </div>
    <!--平台注册-->
    <div class="ptzc">
        <div class="ptzc-1">
            <div class="ptzc-1-1">平台注册</div>
        </div>
    </div>
    <div class="lcjs1">企业要首先在聚化网平台注册，并提交相关认证文件审核，成为聚化网平台用户；</div>
    <!--申请聚融宝资质-->
    <div class="ptzc">
        <div class="ptzc-1">
            <div class="ptzc-1-1">申请聚融宝资质</div>
        </div>
    </div>
    <div class="lcjs1" style="color:#6C6C6C;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业成为聚化网平台用户后，在平台的交易频次及金额达到申请条件后，可以向平台提出聚融宝使用资质的申请，并根据要求提交相关的审核材料。<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过聚化网平台的资质审核并与平台签署《聚融宝使用资质授权协议》，用户便具备聚融宝使用资质；
    </div>

    <!--授信-->
    <div class="ptzc">
        <div class="ptzc-1">
            <div class="ptzc-1-1">授信</div>
        </div>
    </div>
    <div class="lcjs1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过聚化网审核，并且获得聚融宝使用资质的用户，平台将根据其企业发展实力、交易状况等信息，向其提供一定额度的融资授信；</div>

    <!--网上交易-->
    <div class="ptzc">
        <div class="ptzc-1">
            <div class="ptzc-1-1">网上交易</div>
        </div>
    </div>
    <div class="lcjs1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;聚化网用户可以直接在网站上实现浏览、查询、下单、支付等全流程的网上交易；</div>

    <!--交纳保证金-->
    <div class="ptzc">
        <div class="ptzc-1">
            <div class="ptzc-1-1">交纳保证金</div>
        </div>
    </div>
    <div class="lcjs1" style="color:#6C6C6C;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为保证平台供求双方的交易无风险，用户在聚化网平台上提交订单时需同时支付一定比例的保证金，锁定购买货物，保证自身利益；
    </div>

    <!--使用聚融宝-->
    <div class="ptzc">
        <div class="ptzc-1">
            <div class="ptzc-1-1">使用聚融宝</div>
        </div>
    </div>
    <div class="lcjs1" style="color:#6C6C6C;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<samp class="czlc-san1">具备聚融宝使用资质的用户，在提交订单后，便可选择使用聚融宝方式赊购货物。</samp>自己填写赊购条款中的关键信息（还款时间、取货信息等），或在平台客服人员的指导下完成；
    </div>

    <!--货权凭证-->
    <div class="ptzc">
        <div class="ptzc-1">
            <div class="ptzc-1-1">货权凭证</div>
        </div>
    </div>
    <div class="lcjs1" style="color:#6C6C6C;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<samp class="czlc-san1">用户采用聚融宝方式赊购货物成功后，平台及时将相应订单的货权凭证转至用户。</samp>用户即可采用自取或物流的形式收取货物，进行生产；
    </div>

    <!--偿还货款-->
    <div class="ptzc">
        <div class="ptzc-1">
            <div class="ptzc-1-1">偿还货款</div>
        </div>
    </div>
    <div class="lcjs1" style="color:#6C6C6C;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货权凭证发生转移后，企业用户的应付账款和平台的应收帐款同时生成，需要用户在规定的时间内将货款和相关服务费用支付给平台；偿还完毕，该笔聚融宝业务完成。用户的信用额度恢复原值，可再度使用聚融宝赊购货物。
    </div>

    <!--金币飘带-->
    <div class="jinbi"></div>
    <div style="width:100%; height:20px; background:#f3f3f3;"></div>


    <!--融资案例-->
    <div class="czlc">
        <div class="czlc-1">融资案例</div>
    </div>

    <div class="rzjs" style=" margin-top:15px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A企业是一家塑料制品厂，每月需要原料PE约100吨。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从采购原料到制成塑料制品出售收回货款，需要<samp class="czlc-san1">60</samp>天时间。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;塑料制品的市场需求状况良好，但A企业没有足够的资金用于扩大生产。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<samp class="rzjs-san1">因此，具备聚化网聚融宝使用资质的A企业想到了在平台赊购的方式。</samp><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A企业根据自己的聚化网平台的信用额度，直接在平台上选购100吨货物并下单，在提交订单并支付较少保证金后，锁定了要购买的货物。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;然后采用聚融宝方式进行赊购申请，聚化网平台依据A企业的交易频次和额度，以最快的速度进行聚融宝业务审批。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<samp class="rzjs-san1">审批通过后A企业顺利取得货物的货权凭证，并及时用自提或物流的方式取得货物。</samp><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如此一来，A企业将原本用于采购原料的100多万元采购了两台新设备，扩大了生产规模，实现了企业发展升级。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业将货物进行加工销售，获得可观的销售收入，然后在约定的时间内（60天内）将货款和手续费用支付给平台。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<samp class="rzjs-san1">聚融宝给A企业的资金周转和企业发展提供了有力的支持。</samp><br>
    </div>
    <div style="width:100%; height:50px;"></div>


    <!--回顶部-->
    <div id="hdb">
        <a href="#tou">
            <img src="<c:url value="/images/mobilephone/jrb/jrbInstructions/pic006.png"/>" width="50" height="50">
        </a>
    </div>
    <!--我要申请聚融宝-->
    <div class="sqjrb">
        <div class="sqjrb-1"><a href="/BiGeZaiXian/jurongbao/toJrbApplyMain">我要申请聚融宝</a></div>
    </div>
    <!--底部-->
    <!--
            <div class="dib">
                <div class="tuic"><a href="#">退出登录</a></div>

                <div class="wz">&copy;&nbsp;m.juhuawang.com</div>
            </div>
    -->

</div><!--主体-->
</body>
</html>
