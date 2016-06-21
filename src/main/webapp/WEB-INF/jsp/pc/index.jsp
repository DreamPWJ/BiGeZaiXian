<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../share/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head lang="zh">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="比格在线,HDPE,LDPE,LLDPE,PVC,塑料粒子,塑料原料"/>
    <meta name="description"
          content="比格在线网是山东比格在线电子商务有限公司旗下的现货交易平台,借助互联网,协助买卖双方高效完成贸易,我们为上游供货商提供高效便捷的分销渠道,为用户提供HDPE,LDPE,LLDPE,PVC,塑料粒子,塑料原料等一站式的采购服务,致力于打造成中国最大的塑料原料电商服务平台"/>
    <title>比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/index.css'/>" rel="stylesheet" type="text/css">
    <!--[if lt IE 10]>
        <script type="text/javascript">
         ieGo();
         //IE10以下html5和css3兼容性问题暂不支持
         function ieGo() {
             location.href = '/BiGeZaiXian/index/toupdateIE';
         }
     </script>
  < ![endif]-->

    <!--js文件-->
    <script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
    <script type="text/javascript">
        (function () {
            //是否要切换
            // changeView();
            <c:if test="${flag!='首页'}">
            window.location.href = "/BiGeZaiXian/index/pcindex";
            </c:if>
            //根据设备尺寸改变链接   PC端和手机端切换
            function changeView() {
                if ($(window).width() < 800) {//浏览器当前窗口可视区域宽度  正式发布要注释  测试用
                    window.location.href = "/BiGeZaiXian/index/index";
                }
                var isMobile = {//是否是移动设备
                    Android: function () {
                        return navigator.userAgent.match(/Android/i) ? true : false;
                    },
                    BlackBerry: function () {
                        return navigator.userAgent.match(/BlackBerry/i) ? true : false;
                    },
                    iOS: function () {
                        return navigator.userAgent.match(/iPhone|iPad|iPod/i) ? true : false;
                    },
                    Windows: function () {
                        return navigator.userAgent.match(/IEMobile/i) ? true : false;
                    },
                    any: function () {
                        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Windows());
                    }
                };
                if (isMobile.any()) {//是移动设备
                    window.location.href = "/BiGeZaiXian/index/index";
                } else {//是PC设备
                    <c:if test="${flag!='首页'}">
                    window.location.href = "/BiGeZaiXian/index/pcindex";
                    </c:if>

                }

            }

            //窗口改变事件 方便 PC端和手机端切换调试
            /*      $(window).resize(function () {
             changeView();
             });*/


        })();

    </script>
</head>
<body>

<%-- 头部公共div--%>
<%@ include file="A_public/top.jsp" %>
<div class="xcn">
    <!-- main   -->
    <div class="row xmain">
        <div class="col-xs-2 xmain_left">
            <div class="list-group xmain_left_lbx">
                <div class="list-group-item xmain-left-lbx-item">
                    <a href="<c:url value='/mall/toMall?goodKindName=PE'/>">
                        <span class="list-group-item-heading ximain-left-lbx-item">  <i class="fa fa-bolt"></i><strong>HDPE</strong></span>
                        <span class="ximain-left-lbx-item-num">${PEMarkTotal}个牌号</span> </a>
                </div>
                <div class="list-group-item xmain-left-lbx-item">
                    <a href="<c:url value='/mall/toMall?goodKindName=PE'/>">
                        <span class="list-group-item-heading ximain-left-lbx-item"><i class="fa fa-sitemap"></i><strong>LDPE</strong></span>
                        <span class="ximain-left-lbx-item-num">${PEMarkTotal}个牌号</span> </a>
                </div>
                <div class="list-group-item xmain-left-lbx-item">
                    <a href="<c:url value='/mall/toMall?goodKindName=PE'/>">
                        <span class="list-group-item-heading ximain-left-lbx-item"><i
                                class="fa fa-object-ungroup"></i><strong>LLDPE</strong></span>
                        <span class="ximain-left-lbx-item-num">${PEMarkTotal}个牌号</span> </a>
                </div>
                <div class="list-group-item xmain-left-lbx-item">
                    <a href="<c:url value='/mall/toMall?goodKindName=PP'/>">
                        <span class="list-group-item-heading ximain-left-lbx-item"><i class="fa fa-flask"></i><strong>PPHM</strong></span>
                        <span class="ximain-left-lbx-item-num">${PPMarkTotal}个牌号</span> </a>
                </div>
                <div class="list-group-item xmain-left-lbx-item">
                    <a href="<c:url value='/mall/toMall?goodKindName=PP'/>">
                        <span class="list-group-item-heading ximain-left-lbx-item"><i class="fa fa-cubes"></i><strong>PPCP</strong></span>
                        <span class="ximain-left-lbx-item-num">${PPMarkTotal}个牌号</span> </a>
                </div>
                <div class="list-group-item xmain-left-lbx-item">
                    <a href="<c:url value='/mall/toMall?goodKindName=PVC'/>">
                        <span class="list-group-item-heading ximain-left-lbx-item"><i class="fa fa-heart"></i><strong>PVC</strong></span>
                        <span class="ximain-left-lbx-item-num">${PVCMarkTotal}个牌号</span> </a>
                </div>
            </div>
            <div class="xweek"><i class="fa fa-area-chart"></i>一周完成：${PEPPPVCDealCount}单</div>

            <table class="table table-condensed xweek_table">
                <tbody>
                <c:forEach var="item" items="${PEPPPVCDeal}">
                    <tr>
                        <td class="text-overflow">${item.MARK}</td>
                        <td>已下<span><fmt:formatNumber value="${item.INITNUM}"
                                                      pattern="0.000"></fmt:formatNumber></span>${item.MEANAME}</td>
                    </tr>
                </c:forEach>
                </tbody>
                <c:if test="${PEPPPVCDealCount==0}">
                    <!-- CSS3 动画-->
                    <a href="#" class="circle">
                        <div class="mask">
                            <div class="info">
                                <h3>稍后回来哟</h3>

                                <p>本周暂无订单信息</p>
                            </div>
                        </div>
                        <div class="border"></div>
                    </a>
                </c:if>
            </table>

        </div>

        <div class="col-xs-12 xmain_middle">
            <div class="bannerbase">
                <ul id="slider">
                    <li style="background: url('<c:url
                            value='/images/pc/index/ban001.jpg'/>')  no-repeat center center;">
                        <%--<a href="<c:url value="/index/toservice" />"></a>--%></li>
                    <li style="background: url('<c:url
                            value='/images/pc/index/ban002.jpg'/>') no-repeat center center;">
                        <a href="javascript:void(0)"></a></li>
                    <li style="background: url('<c:url
                            value='/images/pc/index/ban003.jpg'/>')  no-repeat center center;"></li>
                </ul>
                <div class="naviSlider">
                    <ul id="naviSlider">
                        <li class="on"></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
            <div id="company">
                <h2><i class="fa fa-bank"></i>最新入驻企业<i class="fa fa-trophy"></i></h2>
                <img src="<c:url value="/images/pc/index/company.png"/>" alt="最新入驻企业"/>
            </div>
            <div class="xpower">
                <div class="xpower_top">
                    <span class="xpower_lbl"> <i class="fa fa-line-chart"></i>今日行情</span>
                        <span class="xpower_lbl_right"><i class="fa fa-clock-o"></i>  <fmt:formatDate
                                value="<%=new java.util.Date()%>"
                                pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></span>
                </div>
                <table class="table xpower_table" id="todayoilprice">

                </table>
                <div id="findgood">
                    <div class="findgood-title">
                        <i class="fa fa-truck"></i> 快速找货
                    </div>
                    <div class="findgood-content-wrap">
                        <textarea id="findgood-content"
                                  placeholder="在比格在线写下您的真实需求，包括牌号、数量、交货地等，我们会第一时间帮您找到货"></textarea>
                        <input type="tel" id="findgood-phone" placeholder="手机号码"/>
                        <button id="findgood-btn">帮你找货</button>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- second -->
    <div class="xban3">
        <div class="col-xs-4 xban3_left">600家企业热情加盟</div>
        <div class="col-xs-8 xban3_lbl">世界500强资源支持&nbsp;&nbsp;&nbsp;降解产业联盟背书</div>
    </div>

    <!-- pdt -->
    <div>
        <div class="row">
            <div class="col-xs-3 xPdt_head"><i class="fa fa-bookmark"></i>聚乙烯 PE</div>
            <div class="col-xs-2 col-xs-offset-7"><a href="<c:url value="/mall/toMall?goodKindName=PE"/>"><span
                    class="xPdt_head_right"><i class="fa fa-ellipsis-h"></i></span></a></div>
        </div>
        <div class="xPdt_line"></div>
        <div class="row">
            <div class="xzxbj">
                <table class="table">
                    <thead class="xPdt_table_head">
                    <tr>
                        <th>牌号/品种</th>
                        <th>厂商</th>
                        <th>单价</th>
                        <th>在售量</th>
                        <th>产地</th>
                        <th>公司</th>
                        <th>时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody class="xPdt_table_cnt">
                    <c:forEach var="item" items="${PE}">
                        <tr>
                            <td class="mark-goodkind">
                                <a href="<c:url value='/good/togoodsdetail?goodId=${item.GOODID}&stockId=${item.STOCKID}&sellsurplusnum=${item.SELLSURPLUSNUM}&companyId=${item.COMPANYID}'/>"
                                        >
                                        ${item.MARK} / ${item.GOODKINDNAME}</a></td>
                            <td>${item.PRODUCER}</td>
                            <td class="price">￥<fmt:formatNumber value="${item.PRICEHASTAX}"
                                                                 pattern="#,#00.00"></fmt:formatNumber></td>
                            <td><fmt:formatNumber value="${item.SELLSURPLUSNUM}"
                                                  pattern="0.000"></fmt:formatNumber>${item.MEANAME}</td>
                            <td>${item.PRODUCINGAREA}</td>
                            <td>${item.COMPANYNAME}</td>
                            <td>${item.DIFFERTIME}</td>
                            <td>
                                <a href="<c:url value='/good/togoodsdetail?goodId=${item.GOODID}&stockId=${item.STOCKID}&sellsurplusnum=${item.SELLSURPLUSNUM}&companyId=${item.COMPANYID}'/>">
                                    <button type="button" class="btn btn-danger btn-xs">查看</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>
            <div class="xfk">
                <div class="xpdt_nav_right">PE 成交动态<i class="fa fa-circle-o-notch fa-spin"></i></div>
                <table class="table chengjiao-table">
                    <tr>
                        <th>牌号</th>
                        <th>数量</th>
                        <th>单价</th>
                        <th>时间</th>
                    </tr>
                </table>
                <div id="pe">
                    <ul>
                        <c:forEach var="item" items="${PEDeal}">
                            <li>
                                <table width="100%">
                                    <tr>
                                        <td width="28%" class="text-overflow">${item.MARK}</td>
                                        <td></td>
                                        <td width="20%" class="text-overflow-1">${item.INITNUM}${item.MEANAME}</td>
                                        <td></td>
                                        <td class="price text-overflow" width="32%">￥<fmt:formatNumber
                                                value="${item.PRICEHASTAX}"
                                                pattern="#,#00.00"></fmt:formatNumber></td>
                                        <td></td>
                                        <td width="20%">${item.DIFFERTIME}</td>
                                    </tr>
                                </table>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

            </div>
        </div>


        <div class="">
            <div class="row">
                <div class="col-xs-3 xPdt_head"><i class="fa fa-bookmark"></i>聚丙烯 PP</div>
                <div class="col-xs-2 col-xs-offset-7 "><a href="<c:url value="/mall/toMall?goodKindName=PP"/>"><span
                        class="xPdt_head_right"><i class="fa fa-ellipsis-h"></i></span></a></div>
            </div>
            <div class="xPdt_line"></div>
            <div class="row ">
                <div class="xzxbj">
                    <table class="table">
                        <thead class="xPdt_table_head">
                        <tr>
                            <th>牌号/品种</th>
                            <th>厂商</th>
                            <th>单价</th>
                            <th>在售量</th>
                            <th>产地</th>
                            <th>公司</th>
                            <th>时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody class="xPdt_table_cnt">
                        <c:forEach var="item" items="${PP}">
                            <tr>
                                <td class="mark-goodkind">
                                    <a href="<c:url value='/good/togoodsdetail?goodId=${item.GOODID}&stockId=${item.STOCKID}&sellsurplusnum=${item.SELLSURPLUSNUM}&companyId=${item.COMPANYID}'/>"
                                            >
                                            ${item.MARK} / ${item.GOODKINDNAME}</a></td>
                                <td>${item.PRODUCER}</td>
                                <td class="price">￥<fmt:formatNumber value="${item.PRICEHASTAX}"
                                                                     pattern="#,#00.00"></fmt:formatNumber></td>
                                <td><fmt:formatNumber value="${item.SELLSURPLUSNUM}"
                                                      pattern="0.000"></fmt:formatNumber>${item.MEANAME}</td>
                                <td>${item.PRODUCINGAREA}</td>
                                <td>${item.COMPANYNAME}</td>
                                <td>${item.DIFFERTIME}</td>
                                <td>
                                    <a href="<c:url value='/good/togoodsdetail?goodId=${item.GOODID}&stockId=${item.STOCKID}&sellsurplusnum=${item.SELLSURPLUSNUM}&companyId=${item.COMPANYID}'/>">
                                        <button type="button" class="btn btn-danger btn-xs ">查看</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="xfk">
                    <div class="xpdt_nav_right">PP 成交动态<i class="fa fa-circle-o-notch fa-spin"></i></div>
                    <table class="table chengjiao-table">
                        <tr>
                            <th>牌号</th>
                            <th>数量</th>
                            <th>单价</th>
                            <th>时间</th>
                        </tr>
                    </table>
                    <div id="pp">
                        <ul>

                            <c:forEach var="item" items="${PPDeal}">
                                <li>
                                    <table width="100%">
                                        <tr>
                                            <td width="28%" class="text-overflow">${item.MARK}</td>
                                            <td></td>
                                            <td width="20%" class="text-overflow-1">${item.INITNUM}${item.MEANAME}</td>
                                            <td></td>
                                            <td class="price text-overflow" width="32%">￥<fmt:formatNumber
                                                    value="${item.PRICEHASTAX}"
                                                    pattern="#,#00.00"></fmt:formatNumber></td>
                                            <td></td>
                                            <td width="20%">${item.DIFFERTIME}</td>
                                        </tr>
                                    </table>
                                </li>
                            </c:forEach>

                        </ul>
                    </div>

                </div>
            </div>


            <div class="">
                <div class="row">
                    <div class="col-xs-3 xPdt_head"><i class="fa fa-bookmark"></i>聚氯乙烯 PVC</div>
                    <div class="col-xs-2 col-xs-offset-7 "><a
                            href="<c:url value="/mall/toMall?goodKindName=PVC"/>"><span
                            class="xPdt_head_right"><i class="fa fa-ellipsis-h"></i></span></a></div>
                </div>
                <div class="xPdt_line"></div>
                <div class="row ">
                    <div class="xzxbj">
                        <table class="table">
                            <thead class="xPdt_table_head">
                            <tr>
                                <th>牌号/品种</th>
                                <th>厂商</th>
                                <th>单价</th>
                                <th>在售量</th>
                                <th>产地</th>
                                <th>公司</th>
                                <th>时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody class="xPdt_table_cnt">
                            <c:forEach var="item" items="${PVC}">
                                <tr>
                                    <td class="mark-goodkind">
                                        <a href="<c:url value='/good/togoodsdetail?goodId=${item.GOODID}&stockId=${item.STOCKID}&sellsurplusnum=${item.SELLSURPLUSNUM}&companyId=${item.COMPANYID}'/>"
                                                >
                                                ${item.MARK} / ${item.GOODKINDNAME}</a></td>
                                    <td>${item.PRODUCER}</td>
                                    <td class="price">￥<fmt:formatNumber value="${item.PRICEHASTAX}"
                                                                         pattern="#,#00.00"></fmt:formatNumber></td>
                                    <td><fmt:formatNumber value="${item.SELLSURPLUSNUM}"
                                                          pattern="0.000"></fmt:formatNumber>${item.MEANAME}</td>
                                    <td>${item.PRODUCINGAREA}</td>
                                    <td>${item.COMPANYNAME}</td>
                                    <td>${item.DIFFERTIME}</td>
                                    <td>
                                        <a href="<c:url value='/good/togoodsdetail?goodId=${item.GOODID}&stockId=${item.STOCKID}&sellsurplusnum=${item.SELLSURPLUSNUM}&companyId=${item.COMPANYID}'/>">
                                            <button type="button" class="btn btn-danger btn-xs ">查看</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="xfk">
                        <div class="xpdt_nav_right">PVC 成交动态<i class="fa fa-circle-o-notch fa-spin"></i></div>
                        <table class="table chengjiao-table">
                            <tr>
                                <th>牌号</th>
                                <th>数量</th>
                                <th>单价</th>
                                <th>时间</th>
                            </tr>
                        </table>
                        <div id="pvc">
                            <ul>
                                <c:forEach var="item" items="${PVCDeal}">
                                    <li>
                                        <table width="100%">
                                            <tr>
                                                <td width="28%" class="text-overflow">${item.MARK}</td>
                                                <td></td>
                                                <td width="20%"
                                                    class="text-overflow-1">${item.INITNUM}${item.MEANAME}</td>
                                                <td></td>
                                                <td class="price text-overflow" width="32%">￥<fmt:formatNumber
                                                        value="${item.PRICEHASTAX}"
                                                        pattern="#,#00.00"></fmt:formatNumber></td>
                                                <td></td>
                                                <td width="20%">${item.DIFFERTIME}</td>
                                            </tr>
                                        </table>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>

                    </div>
                </div>


                <!-- third -->
                <div class="xban3">
                    <div class="col-xs-4 xban3_left">线下十年信誉保障</div>
                    <div class="col-xs-8 xban3_lbl">业内无不良诚信记录&nbsp;&nbsp;&nbsp;零风险采购</div>
                </div>
                <a name="newsanchor"></a>

                <div class="xMedia_out">
                    <div class="row">
                        <div class="col-xs-3 xMedia_his_col">
                            <div class="xMedia_title_left"><i class="fa fa-refresh fa-spin"></i>往期活动</div>
                            <img src="<c:url value="/images/pc/index/wangqi.png"/>" alt="往期活动"/>
                        </div>
                        <div class="col-xs-8 xMedia">
                            <div class="row">
                                <div class="col-xs-4 xMedia_col">
                                    <div class="xMedia_title_left"><i class="fa fa-refresh fa-spin"></i>比格动态</div>
                                    <ul class="xMedia_list">
                                        <c:forEach var="item" items="${news001002}">
                                            <li><a class="text-overflow_news"
                                                   href="<c:url value='/index/tonews?id=${item.ID}'/>"
                                                   target="_blank" title="${item.TITLE}">${item.TITLE}</a></li>
                                        </c:forEach>


                                    </ul>
                                </div>
                                <div class="col-xs-4 xMedia_col">
                                    <div class="xMedia_title_left"><i class="fa fa-refresh fa-spin"></i>市场分析</div>
                                    <ul class="xMedia_list">
                                        <c:forEach var="item" items="${news001003}">
                                            <li><a class="text-overflow_news"
                                                   href="<c:url value='/index/tonews?id=${item.ID}'/>"
                                                   target="_blank" title="${item.TITLE}"
                                                    >${item.TITLE}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="col-xs-4 xMedia_col">
                                    <div class="xMedia_title_left"><i class="fa fa-refresh fa-spin"></i>行业资讯</div>
                                    <ul class="xMedia_list">
                                        <c:forEach var="item" items="${news001004}">
                                            <li><a class="text-overflow_news"
                                                   href="<c:url value='/index/tonews?id=${item.ID}'/>"
                                                   target="_blank" title="${item.TITLE}"
                                                    >${item.TITLE}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- 侧边栏按钮组--%>
            <div id="sidebar">
                <ul>
                    <li><a id="side-info-top" href="#" class="side-btn"><i class="fa fa-chevron-up fa-2x"></i></a>
                        <a  href="#" c class="side-info">返回顶部</a>
                    </li>
                    <li><a href="javascript:void(0)" class="side-btn"><i class="fa fa-shopping-cart fa-2x"></i></a>
                        <a href="#" class="side-info">购物车</a>
                    </li>
                    <li><a href="javascript:void(0)" class="side-btn"><i class="fa fa-comments fa-2x"></i></a>
                        <a href="#" class="side-info">联系客服</a>
                    </li>
                </ul>
            </div>
            <%-- 底部公共div--%>
            <%@ include file="A_public/foot.jsp" %>
</body>
</html>
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/A_public/jquery.vticker.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value='/js/pc/A_public/index.js'/>" type="text/javascript" charset="utf-8"></script>
