<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在线支付</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/onlinePay.css'/>" rel="stylesheet" type="text/css">
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
        <div class="current">在线支付</div>
        <div class="L-2"><a href="javascript:void(0);">订单查询</a></div>
        <div class="L-1">售后服务</div>
        <div class="L-2"><a href="<c:url value='/index/tocomplaintsSuggestions'/>">投诉建议</a></div>
        <div class="L-2"><a href="<c:url value='/index/todeliveryInstructions'/>">提货说明</a></div>
        <div class="L-2"><a href="<c:url value='/index/toinvoiceShows'/>">发票说明</a></div>
        <div class="L-2"><a href="<c:url value='/index/toreturnProcess'/>">货品退换</a></div>
    </div>

    <div class="R">
        <div class="R-1">在线支付</div>
        <div class="miaosu">
            <div class="detailcon-conbase">
                <p>
                    比格在线为您提供的网上支付方式有中国银行，中国工商银行，中国农业银行，招商银行，中国建设银行，交通银行，广东发展银行，浦发银行，中信银行，兴业银行，上海银行，中国民生银行，中国光大银行，深圳发展银行。</p>
                <p class="color-red">温馨提醒：目前各银行对于网上支付均有卡种、金额的限制，因各银行政策不同，建议您在申请网上支付功能时向银行咨询相关事宜。</p>
                <h3>银行卡在线支付详情介绍：</h3>
                <table class="table-basebg">
                    <tr>
                        <th colspan="5" class="color">电脑支付端认证支付银行列表和限额表</th>
                    </tr>
                    <tr>
                        <th>银行</th>
                        <th>支付方式</th>
                        <th>卡种类</th>
                        <th>单日单笔限额（万元）</th>
                        <th>备注</th>
                    </tr>
                    <tr>
                        <td>工商银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>100</td>
                        <td>U盾</td>
                    </tr>
                    <tr>
                        <td>农业银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡、准贷记卡</td>
                        <td>无限额</td>
                        <td>农行K宝</td>
                    </tr>
                    <tr>
                        <td>建设银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡、准贷记卡</td>
                        <td>50</td>
                        <td>二代网银盾</td>
                    </tr>
                    <tr>
                        <td>中国银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>10</td>
                        <td>中银e令或中银e盾</td>
                    </tr>
                    <tr>
                        <td>招商银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>无限额</td>
                        <td>专业版网上支付</td>
                    </tr>
                    <tr>
                        <td>交通银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>100</td>
                        <td>开通U盾</td>
                    </tr>
                    <tr>
                        <td>邮储银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>200</td>
                        <td>USB-KEY以及银行短信服务</td>
                    </tr>
                    <tr>
                        <td>成都银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>10</td>
                        <td>U盾</td>
                    </tr>
                    <tr>
                        <td>浦发银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>无限额</td>
                        <td>开通数字证书版网上支付</td>
                    </tr>
                    <tr>
                        <td>兴业银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>100</td>
                        <td>开通证书保护或短信口令</td>
                    </tr>
                    <tr>
                        <td>光大银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡、信用卡</td>
                        <td>50</td>
                        <td>办理阳光网盾</td>
                    </tr>
                    <tr>
                        <td>民生银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>50</td>
                        <td>办理otp或者u宝</td>
                    </tr>
                    <tr>
                        <td>中信银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>100</td>
                        <td>办理移动证书</td>
                    </tr>
                    <tr>
                        <td>广发银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡、信用卡</td>
                        <td>30</td>
                        <td>Key盾</td>
                    </tr>
                    <tr>
                        <td>杭州银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>无限额</td>
                        <td>开通专业版网上支付功能</td>
                    </tr>
                    <tr>
                        <td>北京农商银行</td>
                        <td>网上银行</td>
                        <td>储蓄卡</td>
                        <td>50</td>
                        <td>办理手机认证</td>
                    </tr>
                </table>
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
