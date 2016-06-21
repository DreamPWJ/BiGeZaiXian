<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/css/pc/A_public/top.css'/>" rel="stylesheet" type="text/css"/>
</head>


<!--head------------------------------------begin-->
<div class="top">
    <!-- top -->
    <nav class="navbar navbar-default navbar-fixed-top xtop" role="navigation">
        <div class="xcn row">
            <div class="col-lg-4 xtop_left">
                    <span class="navbar-text xtop_left_label">您好，欢迎来到比格在线！
                    </span>
            </div>
            <div class="col-lg-4 col-lg-offset-4 xtop_right">
                <div class="navbar-right">
                    <a class="navbar-link xtop_lnk" href="<c:url value='/order/toorderCenter'/>"
                       target="_parent">会员中心</a>
                    <label class="xnav_sep">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</label>
                    <a class="navbar-link xtop_lnk" href="<c:url value='/index/toprotocol'/>" target="_parent">帮助中心</a>
                    <label class="xnav_sep">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</label>
                    <a class="navbar-link xtop_lnk">400-827-3009</a>
                </div>
            </div>
        </div>
    </nav>
    <div class="xhead">
        <div class="row">
            <div class="col-lg-4">
                <!-- py2 -->
                <a href="<c:url value='/index/pcindex'/>" target="_parent">
                    <div class="xlogo"></div>
                </a>
            </div>
            <div class="col-lg-5 col-lg-offset-3 xhead_search">
                <div class="xsearch">
                    <form action="<%--mall.html--%>" class="bs-example bs-example-form xsearch_form" role="form"
                          id="search">
                        <div class="input-group navbar-right">
                            <input id="data" type="text" class="form-control" placeholder="分类/品牌/厂商"/>
                                <span class="input-group-btn">
                                    <input type="button" value="搜索" class="btn btn-danger" id="dd"/>
                                </span>
                            <input id="searchdata" type="hidden" name="searchdata" value=""/>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-default xnav" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand xnav_brand" href="#" target="_parent">塑料大卖场</a>
        </div>
        <ul class="nav navbar-nav xnav_item">
            <li class="active xnav_item_act"><a href="<c:url value='/index/pcindex'/>">首页</a></li>
            <li><a href="<c:url value='/mall/toMall'/>">聚化商城</a></li>
            <li><a href="<c:url value='/index/tosupplier'/>">供应商</a></li>
            <li><a href="<c:url value='/index/toservice'/>">聚融宝</a></li>
            <li><a href="<c:url value='/index/toreleaseFor'/>">发布求购</a></li>
            <li><a href="<c:url value='/index/pcindex#ch'/>">资讯中心</a></li>
            <li><a href="<c:url value='/index/tocompanyProfile'/>" target="_parent">公司简介</a></li>
            <li><a href="<c:url value='/index/tocontactUs'/>" target="_parent">联系我们</a></li>
        </ul>
    </nav>
</div>
<!--head------------------------------------end-->

<script type="text/javascript">
    $("#dd").click(function () {
        var $data = $("#data").val();
        $("#searchdata").val($data);
        $("#search").submit();
        return false;
    });
</script>