<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <jsp:include page="../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/jrb/jrbApplyFor.css"/>" rel="stylesheet" type="text/css">
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

    <!--聚融宝资质申请-->
    <div class="cpjs">
        <div class="cpjs-1">
            <div class="cpjs-1-t"></div>
            <div class="cpjs-1-z">聚融宝资质申请</div>
        </div>
        <div class="cpjs-2">
            <div class="cpjs-2-1">公司名称：&nbsp;&nbsp;<samp class="zzsq-sa1">山东资润有限公司</samp></div>
            <div class="cpjs-2-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;税号：&nbsp;&nbsp;<samp class="zzsq-sa1">*************</samp></div>
            <div class="cpjs-2-1">申请额度：&nbsp;&nbsp;<input type="text" value="" id="" placeholder="请输入申请额度" class="inpu1">&nbsp;&nbsp;万元</div>
        </div>
    </div>
    <div style="width:100%; height:20px; margin-top:10px; background:#f3f3f3;"></div>

    <!--模拟计息示例-->
    <div class="cpjs">
        <div class="cpjs-1">
            <div class="cpjs-1-t-1"></div>
            <div class="cpjs-1-z">模拟计息示例</div>
        </div>
        <div class="lcjs1">
            以一笔100万订单为例：<br>
            1、用户提交订单时，需先支付20%的订单保证金即100万X20%=20万；<br>
            2、用户使用聚融宝融资90万支付货款（融资额度上限是订单总金额的90%）；<br>
            3、用户可以选择不同的融资期限，并在相应时间内支付融资款项和平台服务费”。
        </div>
    </div>
    <div style="width:100%; height:20px; background:#f3f3f3; margin-bottom:10px;"></div>


    <div class="bg1">
        <div class="bg1-1">&nbsp;&nbsp;申请贷款：&nbsp;90&nbsp;万元</div>
        <div class="bg1-1">&nbsp;&nbsp;支付现金：&nbsp;10&nbsp;万元</div>
    </div>

    <div class="bg2">
        <div class="bg2-1">
            <div class="bg2-1-1">期限</div>
            <div class="bg2-1-1">利率</div>
            <div class="bg2-1-1">利息</div>
            <div class="bg2-1-1">总计</div>
        </div>

        <div class="bg2-2">
            <div class="bg2-2-1">15天</div>
            <div class="bg2-2-1">2%</div>
            <div class="bg2-2-1">1.8万</div>
            <div class="bg2-2-1">91.8万</div>
        </div>
        <div class="bg2-2">
            <div class="bg2-2-1">一个月</div>
            <div class="bg2-2-1">5%</div>
            <div class="bg2-2-1">4.5万</div>
            <div class="bg2-2-1">94.5万</div>
        </div>
        <div class="bg2-2">
            <div class="bg2-2-1">两个月</div>
            <div class="bg2-2-1">6%</div>
            <div class="bg2-2-1">5.4万</div>
            <div class="bg2-2-1">95.4万</div>
        </div>
        <div class="bg2-2">
            <div class="bg2-2-1">三个月</div>
            <div class="bg2-2-1">7.5%</div>
            <div class="bg2-2-1">6.75万</div>
            <div class="bg2-2-1">96.75万</div>
        </div>
    </div>

    <div class="bg3">
        <div class="bg3-1">
            <div class="bg3-1-1">期限</div>
            <div class="bg3-1-2">利率</div>
            <div class="bg3-1-3">利息</div>
            <div class="bg3-1-3">总计</div>
        </div>

        <div class="bg3-2">
            <div class="bg3-2-1">延期5天(含5天)</div>
            <div class="bg3-2-2">10%</div>
            <div class="bg3-2-3">9万</div>
            <div class="bg3-2-3">99万</div>
        </div>
        <div class="bg3-2">
            <div class="bg3-2-1">延期超5天(不含5天)</div>
            <div class="bg3-2-2">15%</div>
            <div class="bg3-2-3">13.5万</div>
            <div class="bg3-2-3">103.5万</div>
        </div>
        <div class="bg3-2">
            <div class="bg3-2-1">延期超10天(不含10天)</div>
            <div class="bg3-2-2">
                <div class="bg3-2-2-1">15%并扣除保证金</div>
            </div>
            <div class="bg3-2-3">23.5万</div>
            <div class="bg3-2-3">113.5万</div>
        </div>
    </div>
    <!--提交-->
    <div class="sqjrb">
        <div class="sqjrb-1"><a href="/BiGeZaiXian/jurongbao/toJrbApplyProgress">提&nbsp;&nbsp;交</a></div>
    </div>
</div><!--主体-->
</body>
</html>