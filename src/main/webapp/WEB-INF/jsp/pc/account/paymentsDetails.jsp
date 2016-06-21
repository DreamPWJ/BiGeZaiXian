<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/account/paymentsDetails.css'/>" rel="stylesheet" type="text/css">
    >
    <title>个人中心-我的比格-收支明细</title>
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--左边导航-->
    <%@ include file="../A_public/accountSideMenu.jsp" %><!--左边导航--><!--左边导航-->
    <!--右侧展示-->
    <div class="R-show">
        <div class="R-BT">
            <div class="R-BT-1">
                <div class="R-BT-1-1">收支明细</div>
                <div class="R-BT-1-2">
                    <a href="javascript:CZJL();">
                        <div class="R-BT-1-2-1" id="cz1" style="display:inline;">充值记录</div>
                    </a>

                    <div class="R-BT-1-2-2" id="cz1-1" style="display:none;">充值记录</div>
                </div>

                <div class="R-BT-1-2">
                    <a href="javascript:TXJL();">
                        <div class="R-BT-1-2-1" id="tx1" style="display:inline;">提现记录</div>
                    </a>

                    <div class="R-BT-1-2-2" id="tx1-1" style="display:none;">提现记录</div>
                </div>
            </div>

        </div>

        <!--明细---总-->
        <div class="Mx">
            <div class="szmx" id="mx2" style="display:inline;">
                <div class="szmx-1">
                    <div class="szmx-1-1"><a href="#">最近一个月&nbsp;&or;</a></div>
                    <div class="szmx-1-2">收入：&nbsp;<samp class="szmx-sa1">0.00<%--98000.00--%></samp>&nbsp;元</div>
                    <div class="szmx-1-2">支出：&nbsp;<samp class="szmx-sa2">0.00<%--98000.00--%></samp>&nbsp;元</div>
                </div>
                <div class="szmx-2">
                    <div class="szmx-2-1">流水号</div>
                    <div class="szmx-2-2">日期</div>
                    <div class="szmx-2-3">名称-备注</div>
                    <div class="szmx-2-4">收入（元）</div>
                    <div class="szmx-2-5">支出（元）</div>
                    <div class="szmx-2-6">账户余额</div>
                </div>


                <!--充值记录-->
                <div class="czjl" id="cz2" style="display:none;">
                    <div class="szmx-1">
                        <div class="szmx-1-1"><a href="#">最近一个月&nbsp;&or;</a></div>
                        <div class="szmx-1-2">收入：&nbsp;<samp class="szmx-sa1">98000.00</samp>&nbsp;元</div>
                    </div>
                    <div class="szmx-2">
                        <div class="czjl-1">流水号</div>
                        <div class="czjl-2">充值时间</div>
                        <div class="czjl-3">充值使用银行</div>
                        <div class="czjl-4">充值金额</div>
                    </div>
                    <div class="szmx-3"><!--每页可录入15条数据-->
                        <div class="szmx-3-1">
                            <div class="czjl-1-1"><samp class="szmx-sa0">201510001235129</samp></div>
                            <div class="czjl-1-2"><samp class="szmx-sa0">2015-10-02 12:11:26</samp></div>
                            <div class="czjl-1-3"><samp class="szmx-sa0">中国建设银行</samp></div>
                            <div class="czjl-1-4"><samp class="szmx-sa1">9800.000.00</samp></div>
                            <!--#FF6600-->
                        </div>
                        <div class="szmx-3-1"></div>
                        <div class="szmx-3-1"></div>
                        <div class="szmx-3-1"></div>
                        <div class="szmx-3-1"></div>
                        <div class="szmx-3-1"></div>
                        <div class="szmx-3-1"></div>
                        <div class="szmx-3-1">
                            <div class="czjl-1-1"><samp class="szmx-sa0">201510001235129</samp></div>
                            <div class="czjl-1-2"><samp class="szmx-sa0">2015-10-02 12:11:26</samp></div>
                            <div class="czjl-1-3"><samp class="szmx-sa0">中国建设银行</samp></div>
                            <div class="czjl-1-4"><samp class="szmx-sa1">9800.000.00</samp></div>
                            <!--#FF6600-->
                        </div>
                    </div>

                    <!--分页-->
                    <div class="Fy">
                        <!--分页-->
                        <ul class="L4">
                            <li class="L4-1" onclick="MenuClick(this)" style="background:#FF6501;"><samp
                                    class="lsa4">首页</samp></li>
                            <li class="L4-2" onclick="MenuClick(this)" style="margin-left:10px;"><samp class="lsa4">
                                &lt;</samp></li>
                            <li class="L4-2" onclick="MenuClick(this)" style="margin-left:10px;"><samp
                                    class="lsa4">1</samp></li>
                            <li class="L4-2" onclick="MenuClick(this)" style="margin-left:10px;"><samp
                                    class="lsa4">2</samp></li>
                            <li class="L4-2" onclick="MenuClick(this)" style="margin-left:10px;"><samp
                                    class="lsa4">3</samp></li>
                            <li class="L4-2" onclick="MenuClick(this)" style="margin-left:10px;"><samp
                                    class="lsa4">4</samp></li>
                            <li class="L4-2" onclick="MenuClick(this)" style="margin-left:10px;"><samp
                                    class="lsa4">5</samp></li>
                            <li class="L4-2" onclick="MenuClick(this)" style="margin-left:10px;"><samp class="lsa4">
                                &gt;</samp></li>
                            <li class="L4-1" onclick="MenuClick(this)" style="margin-left:10px;"><samp
                                    class="lsa4">尾页</samp></li>
                            <li class="L4-3" style="margin-left:10px;">共<samp class="lsa4">10</samp>页</li>
                        </ul>
                    </div>
                </div>


                <!--提现记录-->
                <div class="txjl" id="tx2" style="display:none;">
                    <div class="szmx-1">
                        <div class="szmx-1-1"><a href="#">最近一个月&nbsp;&or;</a></div>
                        <div class="szmx-1-2">提现：&nbsp;<samp class="szmx-sa2">100</samp>&nbsp;元</div>
                    </div>
                    <div class="szmx-2">
                        <div class="czjl-1">流水号</div>
                        <div class="czjl-2">充值时间</div>
                        <div class="czjl-3">充值使用银行</div>
                        <div class="czjl-4">提现金额</div>
                    </div>
                    <div class="szmx-3"><!--每页可录入15条数据-->
                        <div class="szmx-3-1">
                            <div class="czjl-1-1"><samp class="szmx-sa0">201510001235129</samp></div>
                            <div class="czjl-1-2"><samp class="szmx-sa0">2015-10-02 12:11:26</samp></div>
                            <div class="czjl-1-3"><samp class="szmx-sa0">中国建设银行</samp></div>
                            <div class="czjl-1-4"><samp class="szmx-sa2">-100.00</samp></div>
                            <!--#FF6600-->
                        </div>

                        <div class="szmx-3-1">
                            <div class="czjl-1-1"><samp class="szmx-sa0">201510001235129</samp></div>
                            <div class="czjl-1-2"><samp class="szmx-sa0">2015-10-02 12:11:26</samp></div>
                            <div class="czjl-1-3"><samp class="szmx-sa0">中国建设银行</samp></div>
                            <div class="czjl-1-4"><samp class="szmx-sa2">-100.00</samp></div>
                            <!--#FF6600-->
                        </div>
                    </div>

                    <!--分页-->

                </div>
            </div>

        </div>
        <!--右侧展示-->
    </div>
</div>
<div style=" width:100%; height:100px; clear:left; border-bottom:1px solid #E0E0E0; margin-bottom:20px;"></div>
<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
