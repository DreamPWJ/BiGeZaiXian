<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线 - 金融宝！</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/jurongbao/jrbHomePage.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>

<!-- content ----------- begin -->
<div class="it-banner it-pr">
    <div><img src="<c:url value='/images/pc/service/banner01.jpg'/>" width="100%"/></div>
    <div class="it-fs14 it-tcenter it-pa it-bapply">
        <br>

        <p>年化利率最高&nbsp;<span style="color:#0066CC;">10%</span></p>

        <p>累计授信额度达&nbsp;<span style="color:#0066CC;">10亿</span></p>

        <p>园区企业无门槛限制</p>
        <br>

        <p><a class="btn btn-success" data-toggle="modal" data-target="#apply">现在申请</a></p>
    </div>
</div>
<div class="main">
    <div class="it-body">
        <div class="row it-mt100">
            <div class="col-xs-4">
                <hr class="it-hrbd it-mt16"/>
            </div>
            <div class="col-xs-4 it-tcenter it-fs22" style="letter-spacing:8px;">他们都是比格金融的企业用户</div>
            <div class="col-xs-4">
                <hr class="it-hrbd it-mt16"/>
            </div>
        </div>
        <div class="row">
            <img src="<c:url value='/images/pc/service/102029.jpg'/>" width="100%"/>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <hr class="it-hrbd">
            </div>
        </div>
        <div class="row it-mt50">
            <div class="col-xs-6">
                <div class="it-tcenter it-fs24">仓单融资</div>
            </div>
            <div class="col-xs-6">
                <div class="it-tcenter it-fs24">信用融资</div>
            </div>
        </div>
        <div class="row it-fs18">
            <div class="col-xs-6 it-bright">
                <h1><strong>特征</strong></h1>

                <p class="it-pcon">平台生产企业客户以自由原材料或制成品为质押物，向平台申请融资支持，以扩大再生产能录。</p>

                <h1><strong>要求</strong></h1>

                <p class="it-pcon">平台注册用户：产业园区入驻企业；塑料化工行业优秀的生产加工企业。</p>

                <h1><strong>模式</strong></h1>

                <p><img src="<c:url value='/images/pc/service/125611.jpg'/>"/></p>

                <p class="it-tcenter it-mt50"><a id="apl-1" class="btn btn-success" data-toggle="modal"
                                                 data-target="#apply">立即申请</a></p>
            </div>
            <div class="col-xs-6">
                <h1><strong>特征</strong></h1>

                <p class="it-pcon">无抵押、无担保融资模式，在平台上的主要操作形式为供应链融资模式。</p>

                <h1><strong>要求</strong></h1>

                <p class="it-pcon">平台注册用户：产业园区入驻企业；塑料化工行业优秀的生产加工企业。</p>

                <h1><strong>模式</strong></h1>

                <p><img src="<c:url value='/images/pc/service/125537.jpg'/>"/></p>

                <p class="it-tcenter it-mt50"><a id="apl-2" class="btn btn-success" data-toggle="modal"
                                                 data-target="#apply">立即申请</a></p>
            </div>
        </div>
        <div class="row" style="height: 100px;"></div>
    </div>
</div>
<div class="modal fade" id="apply" role="dialog" aria-hidden="true" aria-labelledby="applytilte" tabindex="-1"
     style="font-family:微软雅黑">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div class="modal-title it-tcenter" id="applytilte">
                    <h4 style="font-weight: bold;font-size: 20px;">快速申请金融服务</h4>

                    <p>20秒快速完成申请</p>
                </div>
            </div>
            <div class="modal-body it-fs14">
                <form id="form1" class="form-horizontal">
                    <div class="form-body">
                        <div class="row it-mb5  form-group">
                            <div class="col-xs-4 it-tright">
                                <span><i style="color: red;">*</i>&nbsp;&nbsp;联&nbsp;系&nbsp;人：</span>
                            </div>
                            <div class="col-xs-8 ">
                                <input id="customerName" name="username" type="text" placeholder="请输入您的姓名"
                                       class="it-text" check-type="required "/>
                            </div>
                        </div>
                        <div class="row it-mb5 form-group">
                            <div class="col-xs-4 it-tright">
                                <span><i style="color: red;">*</i>&nbsp;手机号码：</span>
                            </div>
                            <div class="col-xs-8 ">
                                <input id="phone" type="text" name="telphone" placeholder="请输入您的手机号码" class="it-text"
                                       check-type="required phone"/>
                            </div>
                        </div>
                        <div class="row it-mb5 form-group">
                            <div class="col-xs-4 it-tright  ">
                                <span><i style="color: red;">*</i>&nbsp;公司名称：</span>
                            </div>
                            <div class="col-xs-8 ">
                                <input id="companyName" name="companyname" type="text" placeholder="请输入您的公司名称"
                                       class="it-text" check-type="required"/>
                            </div>
                        </div>
                        <div class="modal-footer it-tcenter"><input type="submit" id="applyNow" class="btn btn-info"
                                                                    value="立即申请金融服务"/></div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript" src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/commonUtil.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/pc/jrb/jrb.js'/>"></script>
<!-- content ----------- end -->

<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
<script>

</script>