<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link href="<c:url value='/css/pc/A_public/top.css'/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value='/css/font-awesome.css'/>" rel="stylesheet" type="text/css"><%-- 字体图标库--%>
<!--头部------------------------------------开始-->
<div class="top">
    <!-- top -->
    <nav class="navbar navbar-default navbar-fixed-top xtop" role="navigation">
        <div class="xcn row">
            <div class="col-xs-6 xtop_left">
                <span class="navbar-text xtop_left_label">您好，欢迎来到比格在线！</span>
                <c:if test="${sessionScope.get('frontUser')==null}">
                    <a href="<c:url value='/index/tologin'/> ">登录</a>
                    <label class="xtop_sep"></label>
                    <a href="<c:url value='/index/toregister'/> ">注册</a>
                </c:if>
                <c:if test="${sessionScope.get('frontUser')!=null}">
                    <a href="<c:url value='/account/touserCenter'/> ">
                            ${sessionScope.get('frontUser').login}</a>
                    <label class="xtop_sep"></label>
                    <a href="<c:url value='/index/tologin'/> ">退出</a>
                </c:if>
            </div>
            <div class="col-xs-6  xtop_left">
                <div class="navbar-right">
                    <c:if test="${sessionScope.get('frontUser')==null}">
                        <a class="navbar-link xtop_lnk" href="<c:url value='/index/tologin'/>"><i class="fa fa-gear"></i>个人中心</a>
                    </c:if>
                    <c:if test="${sessionScope.get('frontUser')!=null}">
                        <a class="navbar-link xtop_lnk" href="<c:url value='/account/touserCenter'/>"><i class="fa  fa-gears"></i> 个人中心</a>
                    </c:if>
                    <label class="xnav_sep"></label>
       <%--             <a class="navbar-link xtop_lnk" >客户热线：400-827-3009</a>--%>
                    <label class="xnav_sep"></label>
                    <a class="navbar-link xtop_lnk">交易时间：工作日8:00--17:00</a>
                </div>
            </div>
        </div>
    </nav>
    <div class="xhead">
        <div class="row">
            <div class="col-xs-3">
                <a href="<c:url value='/index/pcindex'/>">
                    <div class="xlogo"></div>
                </a>
            </div>

            <div class="col-xs-6  xhead_search">
                <div class=" xsearch">
                    <div class="bs-example bs-example-form xsearch_form" role="form" id="search">
                        <div class="input-group">
                            <input type="text" id="wholesearchcontent" class="form-control " placeholder="按品种/牌号/厂商进行搜索"/>
                                    <span class="input-group-btn">
                                        <a id="wholesearch" href="<c:url value='/mall/toMall'/>">
                                            <input  type="button" value="搜索" class="btn btn-danger"/></a>
                                    </span>
                        </div>
                    </div>
                </div>
            </div>

            <!--购物车-->
            <div class="col-xs-3">
                    <div id="shopping-cart"><i class="fa fa-shopping-cart"></i> 购物车</div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-default xnav" role="navigation">
        <div class="navbar-header"  <c:if test="${flag!='首页'}"> style="height: 38px;" </c:if> >
            <a class="navbar-brand xnav_brand" href="<c:url value='/mall/toMall'/>"><i class="fa fa-bars"></i>塑料大卖场</a>
            <span>好产品就在比格商城</span>
        </div>

        <ul id="navbar" class="nav navbar-nav xnav_item">
            <li <c:if test="${flag=='首页'}"> class="xnav_item_act" </c:if> ><a
                    href="<c:url value='/index/pcindex'/>">首页</a></li>
            <li <c:if test="${flag=='聚化商城'}"> class="xnav_item_act" </c:if>><a
                    href="<c:url value='/mall/toMall'/>">比格商城</a></li>
            <li <c:if test="${flag=='聚融宝'}"> class="xnav_item_act" </c:if>><a
                    href="<c:url value='/index/toservice'/>">比格金融</a></li>
            <li <c:if test="${flag=='供应商'}"> class="xnav_item_act" </c:if>><a href="#<%--<c:url value='/index/tosupplier'/>--%>">产业生态</a>
            </li>
            <li <c:if test="${flag=='资讯中心'}"> class="xnav_item_act" </c:if>><a
                    href="<c:url value='/news/toinformationcenter'/>">资讯中心</a>
            </li>
            <li <c:if test="${flag=='关于我们'}"> class="xnav_item_act" </c:if>><a
                    href="<c:url value='/index/toaboutUs'/>"
                    target="_parent">关于我们</a></li>
          <%--  <li <c:if test="${flag=='新手指南'}"> class="xnav_item_act" </c:if>><a
                    href="<c:url value='/index/touserGuides'/>"
                    target="_parent">新手指南</a></li>--%>
        </ul>
    </nav>
    <%--顶部消息提示框--%>
    <div id="tooltip"><p></p></div>
</div>

<!--头部------------------------------------结束-->
<!--js文件-->
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/top.js'/>" type="text/javascript"></script>
