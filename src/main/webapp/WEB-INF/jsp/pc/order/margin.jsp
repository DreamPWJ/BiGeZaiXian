<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>冻结保证金</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/order/margin.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--确认冻结保证金-->
    <div class="QrDj">
        <div class="QrDj-1">
            <div class="QrDj-1-t"></div>
            <div class="QrDj-1-1">确认冻结保证金</div>
        </div>
        <div class="QrDj-2">冻结保证金<samp class="QrDj-sa1">4万</samp>元，支付完成后返还。</div>
        <div class="QrDj-3">
            <div class="QrDj-3-t"></div>
            <div class="QrDj-3-1">特别提醒：保证金作为保障供应商的合法权益，当缴纳保证金后，货物将被您锁定2小时。2小时内支付货款、或取消订单，保证金将返回。</div>
        </div>
        <div class="QrDj-4">若超过<samp class="QrDj-sa2">2小时</samp>未支付全部货款取消订单，保证金将转为违约金，用于弥补卖方和平台的损失。如有特殊原因，可联系客服中心。</div>
    </div>

    <!--支付-->
    <div class="ZiFu">
        <div class="ZiFu-1" id="z00">
            <label id="balancepay">
                <input name="Fruit" id="c1" type="radio" value="" checked="checked" class="ZiFu-1-x"/>

                <div class="ZiFu-1-1">账户可用余额：&nbsp;<samp class="ZiFu-sa1">￥<samp
                        class="ZiFu-sa1">460,000.00</samp></samp></div>
            </label>

            <div class="ZiFu-1-2">
                <!--余额足够-->
                <div class="ZiFu-1-2-1" style="display:none;">
                    <div class="ZiFu-1v-t"></div>
                    <div class="ZiFu-1v-z">您可以使用账户余额进行支付。</div>
                </div>
                <!--余额不足-->
                <div class="ZiFu-1-2-2" style="display:inline-block;">
                    <div class="ZiFu-1v-t"></div>
                    <div class="ZiFu-1v-z">余额不足，请选择其他支付方式，您也可以去个人中心<a href="<c:url value='/account/torecharge'/>">充值</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="ZiFu-2" id="z03">
            <a href="#">
                <div class="ZiFu-2v" id="z01" style="display:inline;">
                    <label id="otherpay"> <input name="Fruit" id="c2" type="radio" value="" class="ZiFu-1-x1"/>

                        <div class="ZiFu-1-1">其他支付方式</div>
                    </label>

                </div>
            </a>

            <div class="ZiFu-2-1" id="z02" style="display:none;"><!--zong 隐藏-->
                <div class="ZiFu-2-1-v1">当您选择日照银行时，请先到个人中心，进行<a
                        href="<c:url value='/account/tonewBankAccount'/>">账号绑定</a>。
                </div>
                <div class="ZiFu-2-1-v2">
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/rz.jpg'/>" width="186" height="40"/></div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/hxyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/zggsyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/zgjsyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/zgmsyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/zgnyyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/zgyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/zsyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/zxyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/zggdyh.jpg'/>" width="186" height="40"/>
                    </div>
                    <div class="v2-1"><img src="<c:url value='/images/pc/bank/xyyh.jpg'/>" width="186" height="40"/>
                    </div>
                </div>
            </div>
        </div>

        <!--输入密码-->
        <div class="SrMm">
            <div class="SrMm-1">
                <div class="SrMm-1-1">支付密码</div>
                <input type="password" id="" maxlength="6" class="in-SrMm"/>

                <div class="SrMm-1-1"><a href="#">忘记密码？</a></div>
            </div>
            <div class="SrMm-2">请输入6位数字支付密码</div>
        </div>

        <!--确定/取消-->
        <div class="QdQx">
            <div class="QdQx-1">
                <button type="button" class="QdQx-1-1">确定</button>
                <button type="button" class="QdQx-1-2">取消订单</button>
            </div>
        </div>

    </div>


</div>
<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>"></script>
<script type="application/javascript">
    $(function () {
        $("#otherpay,#balancepay").click(function () {
            if ($(this).attr("id") == "otherpay") {
                $("#z02").slideDown("500");
            } else {
                $("#z02").slideUp("500");
            }

        })

        $(".ZiFu-2-1-v2 .v2-1>img").click(function () {
            var parent=$(this).parent();
            parent.siblings().removeClass("v2-1-pigeon");
            if(parent.hasClass("v2-1-pigeon")){
                parent.removeClass("v2-1-pigeon");
            }else{
                parent.addClass("v2-1-pigeon");
            }

        });

    })
</script>