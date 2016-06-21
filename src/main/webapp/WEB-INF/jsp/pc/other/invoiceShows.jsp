<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>发票说明</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/invoiceShows.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- begin -->
<div class="content">
    <div class="BT"></div>
    <div class="L">
        <div class="L-1">新手指南</div>
        <div class="L-2"><a href="<c:url value='/index/toprotocol'/>">比格服务协议</a></div>
        <div class="L-1">购物指南</div>
        <div class="L-2"><a href="javascript:void(0);">购物流程</a></div>
        <div class="L-1">支付与配送</div>
        <div class="L-2"><a href="<c:url value='/index/toonlinePay'/>">在线支付</a></div>
        <div class="L-2"><a href="javascript:void(0);">订单查询</a></div>
        <div class="L-1">售后服务</div>
        <div class="L-2"><a href="<c:url value='/index/tocomplaintsSuggestions'/>">投诉建议</a></div>
        <div class="L-2"><a href="<c:url value='/index/todeliveryInstructions'/>">提货说明</a></div>
        <div class="current">发票说明</div>
        <div class="L-2"><a href="<c:url value='/index/toreturnProcess'/>">货品退换</a></div>
    </div>

    <div class="R">
        <div class="R-1">发票说明</div>
        <div class="miaosu">
            <div class="detailcon-conbase">
                <h3>尊敬的顾客，您在比格在线购物后都会收到我们开具的正规发票，请您仔细阅读本须知。</h3>
            </div>
            <div class="smalltitle">一、发票的开具</div>
            <div class="detailcon-conbase">
                <p>1. 开具发票的金额以实际支付的金额为准。</p>

                <p>2. 比格在线提供的发票种类有"运输发票"和"增值税发票"两种。</p>
            </div>
            <div class="smalltitle">二、运输发票</div>
            <div class="detailcon-conbase">
                <p>1. 是要配送货物的情况下，开运输发票。</p>

                <p>2. 开具运输发票时，抬头默认为收货人"个人姓名"，请需要更改抬头的客户在修改信息中进行修改。</p>

                <p>3.
                    在货物提完后才开发票。每个人自然月20号前把货物提完的，发票当月寄出，在每个月20号后才把货物提完的，发票隔月寄出。未提完货物的，不予开发票。运输发票信息与您输入的信息一致的情况下，发票一经开出，恕不退换。</p>
            </div>
            <div class="smalltitle">三、增值税专用发票</div>
            <div class="detailcon-conbase">
                <p>1.为使客户能及时有效地使用增值税专用发票，请详细填写公司名称、地址、电话、税号、开户银行和帐号，并注意所填的内容须与纳税信息一致。公司名称必须为工商注册登记的
                    名称。公司的地址和电话是您开票信息上的地址和电话。税务登记号是您公司《税务登记证》的编号，一般为15位，请仔细核对后输入。开户银行名称与银行帐号两者必须都要填写 ，缺一不可。</p>

                <p>2.根据您输入的信息开具增值税专用发票，如影响认证抵扣，比格在线不会受理重新开具增值税专用发票的要求，请务必认真校对开票信息。</p>

                <p>3.增值税发票应该体现在订单详情里，客户把货物提走后，应该上比格在线点击确认收货，系统下一步就在订单详情里体现当月发票寄出或者隔月发票寄出，客户有要求的，客服
                    线下解决。发票说明应该在用户服务协议里规定。</p>

                <p>4.根据《 国家税务总局关于修订增值税专用发票使用规定的补充通知》（国税发[2007]18号）第一条第三项规定："因开票有误购买方拒收专用发票的，销售方须在专用发
                    票认证期限内向主管税务机关填报申请单，并在申请单上填写具体原因以及相对应蓝字专用发票的信息， 同时提供由购买方出具的写明拒收理由、错误具体项目以及正确内
                    容的书面材料，主管税务机关审核确认后出具通知单。销售方凭通知单开具红字专用发票。"</p>

                <p class="box">
                    1）开具红字发票申请单（敲好章）<br/>
                    2）税务登记证副本<br/>
                    3）发票<br/>
                    4）拒收证明<br/>
                    5）经办人身份证<br/>
                </p>

                <h3>温馨提示：</h3>

                <p class="box">
                    一个订单不能选择多种发票类型。<br/>
                    如果您对以上开票信息有任何疑义，可咨询您公司的财务人员。<br/>
                    如果您在收到货物时请检查发票，并在送货签收单上签字，一旦签字即代表您已收到发票，并且发票无误。<br/>
                    如果您在收到货物时未收到发票，&nbsp;&nbsp;请您在送货签收单上注明无发票，&nbsp;&nbsp;并及时与我们的客服人员联系，我们会尽快处理。
                </p>
            </div>
            <div class="smalltitle">四、发票的退换</div>
            <div class="detailcon-conbase">
                <p>1.如果您收到的发票与您输入的开票信息、订单信息不一致，请先联系我们的客服人员，我们会以最快的速度为你更换正确的发票。</p>

                <p>2.未经比格在线客服人员的允许，财务部门将不接受电话、传真、邮件、邮寄等形式的重开发票申请，如您擅自将发票寄到我公司的任一办公地址，在寄送过程中发生的发票遗 失、缺失等情况，恕我们概不负责。</p>
            </div>
        </div>
    </div>
</div>
<!-- content ----------- end -->
<div style="clear: both"></div>
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
