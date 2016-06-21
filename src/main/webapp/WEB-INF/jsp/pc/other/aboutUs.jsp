<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>关于我们</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/aboutUs.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--标题-->
    <div class="biaot">
        <div class="biaot-z">关于我们</div>
    </div>

    <!--主体--左-->
    <div class="ztL">
        <div class="L-1">
            <img src="<c:url value='/images/pc/A_public/bigelogo.png'/>" width="130" height="94"
                 style="float:left;margin-right: 20px;"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;比格在线（www.bigeonline.com）是山东比格电子商务有限公司旗下的大宗现货交易平台，深耕塑料、化工原材料交易业务，是化工“互联网+产业+金融”的第一电商平台。<br/><br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;比格在线为上游原材料供应商提供便捷高效的互联网展示、销售平台，为下游工厂即购买商提供一站式的互联网采购服务，集资讯、仓储、交易、支付、融资和物流等全部功能模块于平台一体。<br/><br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过独有的信用评级、仓储物流和融资服务体系，彻底解决目前其他行业电商平台面临的实际问题，率先实现线上交易与线下体验无缝结合，做到平台构筑与产业发展相向而行，致力于打造成中国最大的塑料、化工原料电商服务平台。<br/><br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;比格在线家真正深度整合行业资源、融合产业和金融，在行业中首次实现从“信息化平台”到“交易化平台”的跨越。自今年3月份运营以来，总计平台成交量突破12亿，且在稳步增长之中。可以说，比格在线一出生就风华正茂，其所特有的平台理念和服务模式，势必将成为国内塑化行业第一电商平台。
        </div>


        <div class="L-bt">平台账户</div>
        <div id="bank-account">
            <div class="account-wrap">
                <div class="account-show">
                    <img src="<c:url value='/images/pc/bank/zgnyyh.jpg'/>" alt="中国农业"/>
                    <p>账号 ：<span>515651001040039547888</span>  </p>
                    <p>收款人 : 山东比格电子商务有限公司</p>
                    <p>开户行 : 中国农业银行日照分行</p>
                </div>
                <div class="account-show"><img src="<c:url value='/images/pc/bank/hxyh.jpg"'/>" alt="华夏银行"/>
                    <p>账号 ：<span>551625000000013459322</span> </p>
                    <p>收款人 : 山东比格电子商务有限公司</p>
                    <p>开户行 : 华夏银行股份有限公司日照分行</p>
                </div>

            </div>
        </div>
    </div>
    <!--主体--右-->
    <div class="ztR">
        <div class="R-1">
            <div class="R-1-1"><a href="<c:url value='/index/toregister'/> ">用户注册</a></div>
            <ul class="R-1-2" id="menu">
                <a href="<c:url value='/index/toaboutUs'/>">
                    <li style="color:#6C8CBF;">关于比格</li>
                </a>
                <a href="javascript:void(0);">
                    <li>诚聘英才</li>
                </a>
                <a href="<c:url value='/index/tolegalNotices'/>">
                    <li>法律声明</li>
                </a>
                <a href="<c:url value='/index/toprivacyStatement'/>">
                    <li>隐私声明</li>
                </a>
                <a href="<c:url value='/index/tocontactUs'/>">
                    <li>联系我们</li>
                </a>
                <a href="<c:url value='/index/touserGuides'/>">
                    <li>用户指南</li>
                </a>
            </ul>
        </div>

        <div class="R-2">
            <div class="R-2-1">客服热线：</div>
            <div class="R-2-2">400-818-1234</div>
            <br/>
            <div class="R-2-3">公司邮箱：</div>
            <div class="R-2-4">bgds@bigeonline.com</div>

        </div>


    </div>

    <div class="fgx"></div>




    <!--主体------------------------------------结束-->


</div>


<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
