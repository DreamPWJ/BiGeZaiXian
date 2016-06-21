<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线-产品详情</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/goodsdetail.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<div style="border-bottom: 1px solid #1CAAEB;"></div>
<!-- content ----------- begin -->
<div class="content">
    <div class="breadcrumb" ></div>
    <!--content--------left--->
    <div class="con-left left">
        <c:choose>
            <c:when test="${orderDetail.PICURL!=null && fn:contains(orderDetail.PICURL,'.')}">
                <div class="img-big">
                    <img src="<c:url value='/good/showPicture?pathname=${orderDetail.PICURL}'/>" title="商品图片"
                         width="220px"
                         height="200px"/>
                </div>
                <div>
                    <div class="img-small">
                        <img src="<c:url value='/good/showPicture?pathname=${orderDetail.PICURL}'/>" title="商品图片"
                             width="49" height="50"/>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="img-big">
                    <img src="<c:url value='/images/pc/goodsdetail/w.png'/>" title="暂无商品图片"
                         width="220px"
                         height="200px"/>
                </div>
                <div>
                    <div class="img-small">
                        <img src="<c:url value='/images/pc/goodsdetail/w.png'/>" title="暂无商品图片"
                             width="49" height="50"/>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <div style="clear: both;">
            <div class="title">非看不可</div>
            <div class="leftcont">
                <ul>
                    <li>
                        <div>
                            <div class="liimg">
                                <img src="<c:url value='/images/pc/goodsdetail/common.jpg'/>" width="48" height="48"
                                     style="border: 1px solid #C0C7CD;"/>
                            </div>
                            <div>
                                <p>LLDPE&nbsp;&nbsp;&nbsp;伊朗石化&nbsp;&nbsp;&nbsp;7000F</p>

                                <p><a class="orange">需议价</a></p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="liimg">
                                <img src="<c:url value='/images/pc/goodsdetail/common.jpg'/>" width="48" height="48"
                                     style="border: 1px solid #C0C7CD;"/>
                            </div>
                            <div>
                                <p>LLDPE&nbsp;&nbsp;&nbsp;伊朗石化&nbsp;&nbsp;&nbsp;7000F</p>

                                <p><a class="orange">需议价</a></p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <div class="title">热销榜单</div>
            <div class="leftcont">
                <ul>
                    <li>
                        <div>
                            <div class="liimg">
                                <img src="<c:url value='/images/pc/goodsdetail/common.jpg'/>" width="48" height="48"
                                     style="border: 1px solid #C0C7CD;"/>
                            </div>
                            <div>
                                <p>LLDPE&nbsp;&nbsp;&nbsp;伊朗石化&nbsp;&nbsp;&nbsp;7000F</p>

                                <p><a class="orange">需议价</a></p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--content---------right--->
    <div class="con-right right">
        <div class="con-right-top">
            <div class="con-right-top-left">
                <div>&nbsp;</div>
                <div style="text-align: left">
                    <span  id="ltitle">${orderDetail.MARK}/${orderDetail.GOODKINDNAME}</span>

                </div>
                <div style="text-align: left">比格价 ：
                    ￥
                    <span class="orange" id="lprice">
                        <fmt:formatNumber value="${orderDetail.PRICEHASTAX}" pattern="#,#00.00"></fmt:formatNumber></span> 元/
                    <span id="lmea">${orderDetail.MEACODENAME}</span>
                    <span class="blue">（最新价格）</span>
                    <span style="float: right;padding-right: 40px">产地：<span class="blue">${orderDetail.PRODUCINGAREA}</span></span>
                </div>
                <div style="text-align: left">
                    <%--产&nbsp;&nbsp;&nbsp;地 ：<span class="blue">${orderDetail.PRODUCINGAREA}</span>--%>
                    公司：<span class="blue">${orderDetail.COMPANYNAME}</span>
                        <span style="float: right">生产商：<span class="blue">${orderDetail.PRODUCER}</span></span></span>
                </div>
                <div style="text-align: left">
                    仓库地址：<span class="blue">${orderDetail.ADDRESS}</span>
                </div>
                <div>
                    <ul id="buynumber">
                        <li>购买数量 ：</li>
                        <li class="com"><a id="minusQuantity">-</a></li>
                        <li>
                            <input id="quantity" name="quantity" value="1.000" type="text" class="number"/>
                        </li>
                        <li class="com"><a id="plusQuantity">+</a></li>
                        <li>&nbsp;${orderDetail.MEACODENAME}&nbsp;(在售数量：<span
                                id="onsellnum">${orderDetail.ONSELLNUM}</span>)
                        </li>
                        <br/>
                        <li>购买金额 ：</li>
                        <li id="buyMoney" class="orange">
                            <fmt:formatNumber value="${orderDetail.PRICEHASTAX}" pattern="#,#00.00"></fmt:formatNumber>&nbsp;元</li>
                        <br/>
                        <c:set var="urlparams"
                               value="?goodId=${orderDetail.GOODID}&stockId=${orderDetail.STOCKID}&companyId=${orderDetail.COMPANYID}"></c:set>
                        <c:choose>
                            <c:when test="${msg_login!=false && msg_buyer==true && msg_upload!=false && msg_check!=false}">
                                <button class="btn btnc1">
                                    <a href="<c:url value='/order/tosubmitcart${urlparams}'/>" style="color: #ffffff;" id="placeorder">直接下单</a>
                                </button>
                            </c:when>
                            <c:otherwise>
                                <a style="color: #ffffff;"><button class="btn btnc1" id="orderDirect">直接下单</button></a>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>

            <div id="loadform" style="padding: 0px; background-color: #ffffff;"></div>
            <div id="error" style="line-height: 35px;"></div>
            <div class="con-right-top-right" style="text-align: left">
                <div style="height: 65px;"></div>
                <div class="line bold">&nbsp;&nbsp;在线客服</div>
                <div class="both">
                    &nbsp;&nbsp;<span>联&nbsp;系QQ：&nbsp;&nbsp;
                    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=250999043&site=qq&menu=yes">
                        <img border="0" src="http://wpa.qq.com/pa?p=2:250999043:41" alt="有事请Q我" title="有事Q我"/></a>
                    </span>
                </div>
                <div class="line">
                    <span>&nbsp;&nbsp;客服热线：&nbsp;&nbsp;</span>
                    <span class="phone">400-000-0000</span>
                </div>
                <div class="both" style="border-bottom:  1px solid #BEC3C6">&nbsp;&nbsp;交易时间：周一至周五&nbsp;8:30—17:00</div>
                <%--<div class="line"></div>--%>
            </div>
        </div>

        <div class="grid_20 grid_bottom ">
            <div class="uibox">
                <div class="uibox-order m0">
                    <div class="formsendcon-f" id="con">
                        <%--<ul class="order-tab" id="tag_div">
                            <li class="current"><a>商品详情</a></li>
                        </ul>--%>
                        <!--商品详情-->
                        <div class="uibox-con">
                            <div class="ui-title" style="text-align: left">&nbsp;&nbsp;&nbsp;<span style="color: #FFFBFE">产品参数</span></div></br>
                            <div class="ui-bot">
                                <table class="table table-striped table-bordered table-hover"
                                       id="data-table">
                                    <tr>
                                        <td align="right"><b>牌号：</b></td>
                                        <td class="kg1">${orderDetail.MARK}</td>
                                        <td align="right"><b>产品品种：</b></td>
                                        <td class="kg1">${orderDetail.GOODKINDNAME}</td>
                                        <td align="right"><b>仓库地址：</b></td>
                                        <td class="kg1">${orderDetail.ADDRESS}</td>
                                    </tr>

                                    <tr>
                                        <td align="right"><b>产地：</b></td>
                                        <td class="kg1">${orderDetail.PRODUCINGAREA}</td>
                                        <td align="right"><b>厂商：</b></td>
                                        <td class="kg1">${orderDetail.PRODUCER}</td>
                                        <td align="right"><b>价格：</b></td>
                                        <td class="kg1"><fmt:formatNumber value="${orderDetail.PRICEHASTAX}"
                                                                          pattern="#,#00.00"></fmt:formatNumber></td>
                                    </tr>
                                </table>
                            </div>
                            <%--<div class="ui-title" style="text-align: left">&nbsp;&nbsp;&nbsp;产品介绍</div>--%>
                            <%--<div class="ui-bot" style="width: 730px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>--%>
                            <div class="ui-title" style="text-align: left">&nbsp;&nbsp;&nbsp;<span style="color: #FFFBFE">产品展示</span></div></br>
                            <div>
                                <div style="height: 600px;text-align: left">
                                    <img style="width: 48%;height: 100%" src="<c:url value="/images/pc/goodsdetail/pe002.jpg"/>" alt=""/>
                                    <span>
                                        <img style="width: 48%;height: 100%" src="<c:url value="/images/pc/goodsdetail/pe006.jpg"/>" alt=""/>
                                    </span>
                                </div>
                                <div style="margin-top: 5px;text-align: left;height: 600px">
                                    <img style="width: 48%" src="<c:url value="/images/pc/goodsdetail/pe004.jpg"/>" alt=""/>
                                    <span>
                                        <img style="width: 48%" src="<c:url value="/images/pc/goodsdetail/pe007.jpg"/>" alt=""/>
                                    </span>
                                </div>
                            </div>
                            <!--726*240px-->
                            <div style="width: 730px;">
                                <%-- <img src="<c:url value='/images/pc/goodsdetail/logocc.png'/>" width="728" height="240"/>--%>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

</div>
<div style="display: none" id="include_login">
    <jsp:include page="include_login.jsp"></jsp:include>
</div>
<div class="theme-popover-mask" style="display: none"></div>
<!-- content ----------- end -->

<%-- 底部公共div --%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>

<!--js文件-->
<script src="<c:url value='/js/pc/scripts/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/>" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function () {
        //单价去千分位
        var price = removerThousands($("#lprice").text());
        //返回页面重新计算金额
        if ($("#quantity").val() != 1.000) {
            var n = $("#quantity").val();//购买数量
            var num = parseInt(n);
            $("#quantity").val(num.toFixed(3));
            $("#buyMoney").text(formatTothousands(price * num));
        }

        //直接下单
        $("#orderDirect").click(function(){
            $('.theme-popover-mask').fadeIn(100);
            $('#include_login').slideDown(200);
        });
        //关闭
        $("#close").click(function(){
            $('.theme-popover-mask').fadeOut(100);
            $('#include_login').slideUp(200);
        });

        /**
         *实现购物车加数量
         */
        $("#plusQuantity").click(function () {
            var n = $("#quantity").val();//购买数量
            var num = parseInt(n) + 1;
            var onsellnum = $("#onsellnum").text();
            if (num > onsellnum) {
                $("#placeorder").parent("button").attr("disabled", true);
                alert("购买量不能大于在售数量！");
                return;
            } else {
                $("#placeorder").parent("button").attr("disabled", false);
            }

            $("#quantity").val(num.toFixed(3));
            $("#buyMoney").text(formatTothousands(price * num));


        });

        /**
         *实现购物车减数量
         */
        $("#minusQuantity").click(function () {
            var n = $("#quantity").val();
            var num = parseInt(n) - 1;
            if (num == 0) {
                return;
            }
            $("#quantity").val(num.toFixed(3));
            $("#buyMoney").text(formatTothousands(price * num));
        });

        /**
         * 手动填写购买数量
         */
        $("#quantity").keyup(function () {
            var num = $("#quantity").val();//购买数量
            var onsellnum = $("#onsellnum").text();
            if (Number(num) > Number(onsellnum)) {
                $("#placeorder").parent("button").attr("disabled", true);
                alert("购买量不能大于在售数量！");
                return;
            } else {
                $("#placeorder").parent("button").attr("disabled", false);
            }

            $("#buyMoney").text(formatTothousands(price * num));

        })

        /**
         * 数量失去焦点事件
         */
        $("#quantity").blur(function () {
            var num = $("#quantity").val();//购买数量
            if (Number(num) <= 0) {
                $("#placeorder").parent("button").attr("disabled", true);
                alert("购买量不能小于0！");
                return;
            } else {
                $("#placeorder").parent("button").attr("disabled", false);
            }
            $("#quantity").val(Number(num).toFixed(3));
            $("#buyMoney").text(formatTothousands(price * num));
        })
        /**
         * 点击下单事件 获取购买数量 购买金额
         */
        $("#placeorder").click(function (e) {
            e.stopPropagation();//阻止冒泡
            var href = $(this).attr("href");
            var quantity = $("#quantity").val();//购买数量
            var buyMoney = removerThousands($("#buyMoney").text());//购买金额
            href = href + "&quantity=" + quantity + "&buyMoney=" + buyMoney;
            $(this).attr("href", href);
        });

    });

</script>