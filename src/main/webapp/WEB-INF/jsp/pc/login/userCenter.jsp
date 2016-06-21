<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户中心 - 比格网</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/userCenter.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">

    <%@ include file="../A_public/accountSideMenu.jsp" %>
    <!--右侧展示-->
    <div class="R-show">
        <div class="R-BT">我的比格</div>

        <div class="R-show1">
            <div class="R-show1-S">
                <div class="R-show1-S-l">
                    <div class="R-show1-S-l-t">
                        <div class="S-l-t-1"></div>
                    </div>
                    <div class="R-show1-S-l-z1">账户金额：<samp class="Rs-sam1">0.00</samp>&nbsp;元</div>
                    <div class="R-show1-S-l-an">
                        <div class="S-l-an-1" style="background:#1CAAEB;"><a href="#">充值</a></div>
                        <div class="S-l-an-2"><a href="#">提现</a></div>
                        <div class="S-l-an-2"><a href="#">收支明细</a></div>
                    </div>
                </div>

                <div class="R-show1-S-r">
                    <div class="R-show1-S-r-1">
                        <div class="S-r-1-1">
                            <div class="S-r-1-1-1">
                                <div class="S-r-1-1-1-a"></div>
                                可用额度
                            </div>
                        </div>

                        <div class="S-r-1-2">
                            <div class="S-r-1-2-1">可提现金额</div>
                            <div class="S-r-1-2-1">不可提现金额</div>
                            <div class="S-r-1-2-1"><samp class="c1">合计</samp></div>
                        </div>

                        <div class="S-r-1-3">
                            <div class="S-r-1-2-1"><samp class="c0">0.00</samp>&nbsp;元</div>
                            <div class="S-r-1-2-1"><samp class="c0">0.00</samp>&nbsp;元</div>
                            <div class="S-r-1-2-1"><samp class="c1">0.00</samp>&nbsp;元</div>
                        </div>
                    </div>

                    <div class="R-show1-S-r-2">
                        <div class="S-r-2-1">
                            <div class="S-r-2-1-1">
                                <div class="S-r-2-1-1-a"></div>
                                不可用额度
                            </div>
                        </div>

                        <div class="S-r-2-2">
                            <div class="S-r-2-2-1">暂时冻结金额</div>
                            <div class="S-r-2-2-1"><samp class="c1">合计</samp></div>
                        </div>

                        <div class="S-r-2-3">
                            <div class="S-r-2-3-1"><samp class="c0">0.00</samp>&nbsp;元</div>
                            <div class="S-r-2-3-1"><samp class="c1">0.00</samp>&nbsp;元</div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="R-show1-X">
                <div class="show1-X-1">
                    <div class="show1-X-1-1">
                        <div class="X-1-1-1">
                            <div class="X-1-1-1-1">我的积分：</div>
                            <div class="X-1-1-1-2"><samp class="c2">0</samp></div>
                            <div class="X-1-1-1-2a">分</div>
                            <div class="X-1-1-1-3"><a href="#">赚取积分</a></div>
                            <div class="X-1-1-1-4"><a href="#">积分使用记录</a></div>
                        </div>
                    </div>

                    <div class="show1-X-1-1">
                        <div class="X-1-1-1">
                            <div class="X-1-1-1-1">联系电话：</div>
                            <div class="X-1-1-1-5"><samp class="c2">${usersinfo.MOBPHONE}</samp></div>
                        </div>
                    </div>

                    <div class="show1-X-1-1">
                        <div class="X-1-1-1">
                            <div class="X-1-1-1-1">专属客服：</div>
                            <div class="X-1-1-1-5"><samp class="c2">大菠萝</samp></div>
                        </div>
                    </div>
                </div>


                <div class="show1-X-2">
                    <div class="show1-X-2-1">
                        <div class="X-2-1-1">
                            <div class="X-2-1-1-1">我的银行商户号：</div>
                            <div class="X-2-1-1-2"><samp class="c2">1</samp></div>
                            <div class="X-2-1-1-4">个银行商户号</div>
                            <div class="X-2-1-1-3"><a href="#">添加</a></div>
                        </div>
                    </div>
                    <div class="show1-X-2-1">
                        <div class="X-2-1-1">
                            <div class="X-2-1-1-1">注册邮箱：</div>
                            <div class="X-2-1-1-4"><samp class="c2">${usersinfo.EMAIL}</samp></div>
                        </div>
                    </div>
                    <div class="show1-X-2-1">
                        <div class="X-2-1-1">
                            <div class="X-2-1-1-1">客服手机/电话：</div>
                            <div class="X-2-1-1-4"><samp class="c2">18862353568</samp>/<samp
                                    class="c2">400-827-3009</samp></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div class="R-show2">
            <div class="show2-1">
                <div class="show2-1-1">
                    <a href="javascript:GO1();">
                        <div class=" show2-1-1-1" id="A1" style="display:none;">
                            全部订单<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                        </div>
                    </a>

                    <div class=" show2-1-1-2" id="A1-1" style="display:inline;">
                        全部订单<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                    </div>
                </div>


                <div class="show2-1-2">
                    <a href="javascript:GO2();">
                        <div class=" show2-1-1-3" id="B1" style="display:inline;">
                            待发货<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                        </div>
                    </a>

                    <div class=" show2-1-1-4" id="B1-1" style="display:none;">
                        待发货<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                    </div>
                </div>

                <div class="show2-1-2">
                    <a href="javascript:GO3();">
                        <div class=" show2-1-1-3" id="C1" style="display:inline;">
                            已发货<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                        </div>
                    </a>

                    <div class=" show2-1-1-4" id="C1-1" style="display:none;">
                        已发货<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                    </div>
                </div>

                <div class="show2-1-2">
                    <a href="javascript:GO4();">
                        <div class=" show2-1-1-3" id="D1" style="display:inline;">
                            已收货<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                        </div>
                    </a>

                    <div class=" show2-1-1-4" id="D1-1" style="display:none;">
                        已收货<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                    </div>
                </div>

                <div class="show2-1-2">
                    <a href="javascript:GO5();">
                        <div class=" show2-1-1-3" id="E1" style="display:inline;">
                            已退货<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                        </div>
                    </a>

                    <div class=" show2-1-1-4" id="E1-1" style="display:none;">
                        已退货<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                    </div>
                </div>

                <div class="show2-1-2">
                    <a href="javascript:GO6();">
                        <div class=" show2-1-1-3" id="F1" style="display:inline;">
                            已取消<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                        </div>
                    </a>

                    <div class=" show2-1-1-4" id="F1-1" style="display:none;">
                        已取消<samp class="c3">（</samp><samp class="c3">0</samp><samp class="c3">）</samp>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <%-- 底部公共div--%>
    <%@ include file="../A_public/foot.jsp" %>
</body>
</html>
