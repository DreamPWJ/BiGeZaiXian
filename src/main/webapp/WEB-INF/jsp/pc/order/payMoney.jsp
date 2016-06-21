<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>支付货款</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/order/payMoney.css'/>" rel="stylesheet" type="text/css">
</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--确认冻结保证金-->
    <div class="prompt">
        <div class="pt-1">
            <div class="pt-1-1">订单提交成功，请您尽快付款！订单号：<samp class="pt-sa1">${paymap.ordernum}</samp><%--，已冻结保证金4万，支付订单后返还--%>。
            </div>
            <div class="pt-1-2">应付金额：<samp class="pt-sa2">￥<fmt:formatNumber
                    value="${paymap.finalmoney}" pattern="#,#00.00"></fmt:formatNumber></samp></div>
        </div>
        <div class="pt-2">请您在提交订单后<samp class="pt-sa3">24小时</samp>内完成支付，否则订单会自动取消并扣除保证金！如有疑问，请立即联系平台客服人员进行解决！</div>
        <div class="pt-3">
            <!--订单-->
            <div class="pt-3-1">
                <div class="pt-3-1-1">订单</div>
                <div class="pt-3-1-2">
                    <samp class="pt-sa4">001</samp>
                    <samp class="pt-sa4">${paymap.payMoneyDetail.GOODKINDNAME}/${paymap.payMoneyDetail.MARK}</samp>
                    <samp class="pt-sa4">${paymap.payMoneyDetail.PACKTYPENAME}</samp>
                    <samp class="pt-sa4">${paymap.payMoneyDetail.PACKCONTENTNAME}</samp>
                    <samp class="pt-sa4">${paymap.payMoneyDetail.PRODUCER}</samp>
                    <samp class="pt-sa4">${paymap.payMoneyDetail.PRODUCINGAREA}</samp>
                    <samp class="pt-sa4">自提</samp>
                    <samp class="pt-sa4">${paymap.payMoneyDetail.NAME}</samp>
                    <samp class="pt-sa4">${paymap.payMoneyDetail.MOBPHONE}</samp>
                    <samp class="pt-sa4">山东省日照市东港区</samp>
                </div>
            </div>


        </div>
    </div>

    <!--支付-->
    <div class="ZiFu">
        <a href="#">
            <div class="ZiFu-1" id="z00" style="display:inline;">
                <label id="balancepay">
                    <input name="Fruit" id="c1" type="radio" value="" checked="checked" class="ZiFu-1-x"/>

                    <div class="ZiFu-1-1">账户可用余额：&nbsp;<samp class="ZiFu-sa1">￥<samp class="ZiFu-sa1">0.00</samp></samp>
                    </div>
                </label>

                <div class="ZiFu-1-2">
                    <!--余额足够-->
                    <div class="ZiFu-1-2-1" style="display:none;">
                        <div class="ZiFu-1v-t"></div>
                        <div class="ZiFu-1v-z"><samp class="ddt">您可以使用账户余额进行支付。</samp></div>
                    </div>
                    <!--余额不足-->
                    <div class="ZiFu-1-2-2" style="display:inline;">
                        <div class="ZiFu-1v-t"></div>
                        <div class="ZiFu-1v-z"><samp class="ddt">余额不足，请选择线下支付方式进行支付。或者去个人中心充值后再支付！<a
                                href="<c:url value='/account/torecharge'/>">充值</a></samp>
                        </div>
                    </div>
                </div>
            </div>
        </a>

        <div class="ZiFu-2" id="z03">
            <a href="#">
                <div class="ZiFu-2v" id="z01" style="display:inline;">
                    <label id="otherpay">
                        <input name="Fruit" id="c2" type="radio" value="" class="ZiFu-1-x1"/>

                        <div class="ZiFu-1-1">其他支付方式</div>
                    </label>
                </div>
            </a>


            <div class="ZiFu-2-1" id="z02" style="display:none;"><!--zong 隐藏-->
                <div class="TB">
                    <div class="R-BT-1">
                   <%--     <div class="R-BT-1-2">
                            <div class="R-BT-1-2-2" id="q1-1">商务支付</div>
                        </div>--%>
                        <div class="R-BT-1-2">
                            <div class="R-BT-1-2-1" id="q2">线下支付</div>
                        </div>
                  <%--      <div class="R-BT-1-2">
                            <div class="R-BT-1-2-1" id="q3">聚融宝</div>
                        </div>--%>
                    </div>
                </div>
                <div id="playselect">
                    <div class="CQL1" id="q1-1-1">

                        <div class="ZiFu-2-1-v2">
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/rz.jpg'/>" width="186"
                                                   height="40"/>
                            </div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/hxyh.jpg'/>" width="186"
                                                   height="40"/>
                            </div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/zggsyh.jpg'/>" width="186"
                                                   height="40"/></div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/zgjsyh.jpg'/>" width="186"
                                                   height="40"/></div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/zgmsyh.jpg'/>" width="186"
                                                   height="40"/></div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/zgnyyh.jpg'/>" width="186"
                                                   height="40"/></div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/zgyh.jpg'/>" width="186"
                                                   height="40"/>
                            </div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/zsyh.jpg'/>" width="186"
                                                   height="40"/>
                            </div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/zxyh.jpg'/>" width="186"
                                                   height="40"/>
                            </div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/zggdyh.jpg'/>" width="186"
                                                   height="40"/></div>
                            <div class="v2-1"><img src="<c:url value='/images/pc/bank/xyyh.jpg'/>" width="186"
                                                   height="40"/>
                            </div>
                        </div>
                    </div>


                    <div class="CQL2" id="q2-1-1">
                        <p class="time">支付最后时间 : <span>${paymap.lastDate}</span></p>
                      <%--  <p class="contact-info"><span>纳税人识别号：<strong>91371100MA3C3JN91D</strong></span><span>地址：日照市济南路国际金融中心1号楼B座12楼</span><span>联系电话：0633-2178262</span></p>--%>
                         <div id="bank-account">
                             <p class="account-title">平台银行账户 ：</p>
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
                                  <div class="account-show">
                                        <p class="more">更多银行</p>
                                        <p class="more">.....</p>
                                  </div>
                                  
                              </div>
                              <p class="prompt-info"><img src="<c:url value="/images/pc/account/ts.png"/>" alt="图标"/>
                                 平台在收到您的货款后，将自动发送收款确认信息至您的手机和邮箱 。你在接收到信息后，可以登录账户，查看 、编辑相关收货信息。如有疑问，
                                  敬请咨询平台客服。<%-- 咨询电话:  <span> 400-827-3009</span>  ,--%>或者在线留言。
                              </p>
                         </div>
                                <div class="btn-bottom">
                                    <button><a href="<c:url value="/order/toorderSuccess?ordernum=${paymap.ordernum}"/>">完成</a></button>
                                    <span>   请在支付后,到<a href="<c:url value="/order/toorderCenter"/>">订单详情</a>上传银行证明照片</span>
                                </div>
                    </div>


                </div>

            </div>
        </div>

        <!--输入密码--><%--
        <div class="SrMm">
            <div class="SrMm-1">
                <div class="SrMm-1-1">支付密码</div>
                <input type="password" id="" maxlength="6" class="in-SrMm"/>

                <div class="SrMm-1-1"><a href="#">忘记密码？</a></div>
            </div>
            <div class="SrMm-2">请输入6位数字支付密码</div>
        </div>--%>

        <!--确定/取消-->
   <%--     <div class="QdQx">
            <div class="QdQx-1">
                <button type="button" class="QdQx-1-1">立即支付</button>
            </div>
        </div>--%>

    </div>

</div>
<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>"></script>
<script type="application/javascript">
    $(function () {

       $("#otherpay,#balancepay").click(function () {
            if ($(this).attr("id") == "otherpay") {
                $("#q1-1").parent().addClass("select-pay-way");
                $("#z02").slideDown("500");
            } else {
                $("#z02").slideUp("500");
            }

        })

        /*      /!*    选择三种支付类型*!/
        $("#q1-1,#q2,#q3").click(function () {
            var index = $(this).parent().index();
            var id = $(this).attr("id");
            $(this).parent().siblings().removeClass("select-pay-way");
            $(this).parent().addClass("select-pay-way");
            $("#playselect>div").not("#playselect>div:eq(" + index + ")").slideUp("500");
            $("#playselect>div").eq(index).slideDown("500");
            if (id == "q2") {
                $(".SrMm,.QdQx").hide();
            } else {
                $(".SrMm,.QdQx").show();
            }

        })

        $(".ZiFu-2-1-v2 .v2-1>img").click(function () {
            var parent = $(this).parent();
            parent.siblings().removeClass("v2-1-pigeon");
            if (parent.hasClass("v2-1-pigeon")) {
                parent.removeClass("v2-1-pigeon");
            } else {
                parent.addClass("v2-1-pigeon");
            }

        });*/

    })
</script>
