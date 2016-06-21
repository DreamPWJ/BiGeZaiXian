<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="packageMakerrz" class="com.juhuawang.util.pay.rizhao.PackageMaker"></jsp:useBean>
<jsp:useBean id="packageMakerzg" class="com.juhuawang.util.pay.zhongguo.PackageMaker"></jsp:useBean>
<jsp:useBean id="activeQuery" class="com.juhuawang.util.pay.zhongguo.ActiveQuery"></jsp:useBean>
<jsp:useBean id="rsaUtils" class="com.juhuawang.util.pay.rizhao.RSAUtils"></jsp:useBean>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>支付管理 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/orderpay.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ------------------------------------- begin -->
<div class="container">

    <div class="row">
        <div class="col-xs-12 top_titile">订单收银台</div>
        <div class="col-xs-12 paytype">选择支付方式</div>
        <div class="col-xs-12 paytype">
            <div class="col-xs-2"><label><input type="radio" name="paytype" checked> 商务支付</input> </label></div>
            <div class="col-xs-2"><label><input type="radio" name="paytype"> 线下支付</input> </label></div>
            <div class="col-xs-2"><label><input type="radio" name="paytype"> 聚融宝支付</input> </label></div>
        </div>
        <div class="col-xs-12 paytype">选择银行</div>
        <div class="col-xs-12 bankimg">
            <div class="col-xs-3 rizhao"><label><input type="radio" name="bank" checked/> <img
                    src="<c:url value='/images/pc/pay/zl7.png'/>"/></label></div>
            <div class="col-xs-3"><label><input type="radio" name="bank"/> <img
                    src="<c:url value='/images/pc/pay/zl1.png'/>"/>
            </label></div>

            <div class="col-xs-3"><label><input type="radio" name="bank"/> <img
                    src="<c:url value='/images/pc/pay/zl3.png'/>"/>
            </label></div>
            <div class="col-xs-3"><label><input type="radio" name="bank"/> <img
                    src="<c:url value='/images/pc/pay/zl4.png'/>"/>
            </label></div>
        </div>
        <div class="col-xs-12 bankimg">
            <div class="col-xs-3"><label><input type="radio" name="bank"/> <img
                    src="<c:url value='/images/pc/pay/zl6.png'/>"/>
            </label></div>
            <div class="col-xs-3"><label><input type="radio" name="bank"/> <img
                    src="<c:url value='/images/pc/pay/zl2.png'/>"/>
            </label></div>
        </div>

        <div class="col-xs-12 paydetail">
            <div class="col-xs-3 col-xs-offset-1"><label>牌号： ${paydetail.MARK}</label></div>
            <div class="col-xs-3"><label>订单号：<span id="orderno">${paydetail.ORDERNO}</span></label></div>
            <div class="col-xs-3"><label>总金额：￥<span id="finalmoney">${paydetail.FINALMONEY}</span></label></div>
        </div>
        <div class="col-xs-12">
            <div class="col-xs-6 col-xs-offset-1">
                <label>请输入商户交易账号：</label><input id="payccno" type="text" class="form-control placeholder-no-fix"
                                                autocomplete="on" placeholder="必填项" check-type="required number"/>
            </div>
        </div>

        <div class="col-xs-12 paybutton">
            <button id="affirmpay" type="button"
                    class="btn btn-success button-large pull-right"/>
            日照确认支付</button>
            <button id="affirmpayzg" type="button"
                    class="btn btn-success button-large pull-right"/>
            中行确认支付</button>
            <button id="affirmpayzgaq" type="button"
                    class="btn btn-success button-large pull-right"/>
            中行订单查询</button>
        </div>
    </div>

    <form id="affirmpayform" action="https://60.208.131.86:4810/authGate/B2BPay_810.do" method="post" target="_blank">
        <%--   加密后的发送报文 post提交 key值为msg--%>
        <input id="msg" type="hidden" name="msg" value=""/>
    </form>

    <form id="affirmpayzgform" action="http://180.168.146.79/PGWPortal/NB2BRecvOrder.do" method="post" target="_blank">
        <%--   加密后的发送报文 post提交 --%>
        <input id="merchantNo" type="hidden" name="merchantNo" value="${rsaUtils.base64Encode("7056".getBytes())}"/>
        <input id="version" type="hidden" name="version" value="${rsaUtils.base64Encode("1.0.1".getBytes())}"/>
        <input id="messageId" type="hidden" name="messageId" value="${rsaUtils.base64Encode("0000110".getBytes())}"/>
        <input id="security" type="hidden" name="security" value="${rsaUtils.base64Encode("P7".getBytes())}"/>
        <input id="signature" type="hidden" name="signature" value=""/>
        <input id="message" type="hidden" name="message" value=""/>
    </form>

    <form id="affirmpayzgaqform" action="http://180.168.146.79/PGWPortal/NB2BQueryOrder.do" method="post" target="_blank"
          >
        <%--   加密后的发送报文 post提交 --%>
        <input id="merchantNoaq" type="hidden" name="merchantNo" value="${rsaUtils.base64Encode("7056".getBytes())}"/>
        <input id="versionaq" type="hidden" name="version" value="${rsaUtils.base64Encode("1.0.1".getBytes())}"/>
        <input id="messageIdaq" type="hidden" name="messageId" value="${rsaUtils.base64Encode("0000111".getBytes())}"/>
        <input id="securityaq" type="hidden" name="security" value="${rsaUtils.base64Encode("P7".getBytes())}"/>
        <input id="signatureaq" type="hidden" name="signature" value=""/>
        <input id="messageaq" type="hidden" name="message" value=""/>
    </form>
</div>
<!-- content ------------------------------------- end -->
<%-- 底部公共div--%>

<%@ include file="../A_public/foot.jsp" %>
</body>
</html>

<!--js文件-->
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<%--<script type="text/javascript" src="<c:url value='/js/commonUtil.js'/>"></script>--%>
<script>
    $(function () {
        /**
         *日照确认支付按钮点击事件
         **/

        $("#affirmpay").click(function () {
            var payccno = $("#payccno").val();
            var messagexml = "${packageMakerrz.getMessageXML(payccno,paydetail.FINALMONEY,paydetail.ORDERNO)}";
            $("#msg").val(messagexml);
            $("#affirmpayform").submit();
            return false;
        })

        /**
         *中国确认支付按钮点击事件
         **/

        $("#affirmpayzg").click(function () {
            var messagexml = "${packageMakerzg.getMessageXML(paydetail.ORDERNO,paydetail.FINALMONEY*100)}";
            $("#signature").val(messagexml);
            var base64messagexml = "${packageMakerzg.getBase64MessageXML(paydetail.ORDERNO,paydetail.FINALMONEY*100)}";
            $("#message").val(base64messagexml);
            $("#affirmpayzgform").submit();
            return false;
        })

        /**
         *中国确认支付按钮点击事件
         **/

        $("#affirmpayzgaq").click(function () {
            var messagexml = "${activeQuery.getMessageXML(paydetail.ORDERNO)}";
            $("#signatureaq").val(messagexml);
            var base64messagexml = "${activeQuery.getBase64MessageXML(paydetail.ORDERNO)}";
            $("#messageaq").val(base64messagexml);
            $("#affirmpayzgaqform").submit();
          /* $.ajax({
                type: "get",
                url: "http://180.168.146.79/PGWPortal/NB2BQueryOrder.do",
                data: {"merchantNo":$("#merchantNoaq").val(),"version":$("#versionaq").val(),"messageId":$("#messageIdaq").val(),"security":$("#securityaq").val(),"signature":$("#signatureaq").val(),"message":$("#messageaq").val()},
                dataType: "jsonp",
                jsonp: 'jsoncallback',
                success: function (data) {
                    if (data != "") {
                        alert(data);
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){
                    alert("请求数据异常，状态码：" + XMLHttpRequest.status);
                }
            })*/
           return false
    })

    /*  $(".bankimg img").click(function () {
     $("input[name='bank']:checked").prop("checked", false);
     $(this).prev("input[name='bank']").prop("checked", true);
     })*/

    })
    ;
</script>