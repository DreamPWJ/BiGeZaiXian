<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="rsaUtils" class="com.juhuawang.util.pay.rizhao.RSAUtils"></jsp:useBean>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/account/recharge.css'/>" rel="stylesheet" type="text/css">
    <title>个人中心-我的比格-充值</title>
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
            <div class="R-BT-1">充值</div>
        </div>

        <!--充值---总-->
        <div class="Cz">
            <div class="Cz1">
                <div class="Cz1-1">选择银行：</div>
                <div class="Cz1-2">
                    <div class="Cz1-2-1"><img src="<c:url value='/images/pc/account/zh.jpg'/>" width="20" height="20"/>
                    </div>
                    <div class="Cz1-2-2"> 中国银行</div>
                    <div class="Cz1-2-3"><img src="<c:url value='/images/pc/account/yhsh.png'/>" width="54"
                                              height="20"/></div>
                    <div class="Cz1-2-4">****</div>
                </div>
                <a href="javascript:GH();">
                    <div class="Cz1-3">
                        <div class="Cz1-3-1">更换银行&nbsp;&or;</div>
                    </div>
                </a>
                <a href="javascript:TJ();">
                    <div class="Cz1-4">
                        <div class="Cz1-4-1">+&nbsp;银行商户</div>
                    </div>
                </a>
            </div>

            <!--更换银行-->
            <div class="ghyh" id="hh1" style="display:none;">
                <div class="ghyh-0">
                    <div class="ghyh-1">
                        <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value"></div>
                        <div class="ghyh-1-2">
                            <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/jh.jpg'/>" width="20"
                                                         height="20"/></div>
                            <div class="ghyh-1-2-2"> 中国建设银行</div>
                        </div>
                    </div>
                    <div class="ghyh-1">
                        <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value"></div>
                        <div class="ghyh-1-2">
                            <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/zh.jpg'/>" width="20"
                                                         height="20"/></div>
                            <div class="ghyh-1-2-2"> 中国银行</div>
                        </div>
                    </div>
                    <div class="ghyh-1">
                        <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value"></div>
                        <div class="ghyh-1-2">
                            <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/jt.jpg'/>" width="20"
                                                         height="20"/></div>
                            <div class="ghyh-1-2-2"> 交通银行</div>
                        </div>
                    </div>
                    <div class="ghyh-1">
                        <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value"></div>
                        <div class="ghyh-1-2">
                            <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/rh.jpg'/>" width="20"
                                                         height="20"/></div>
                            <div class="ghyh-1-2-2"> 日照银行</div>
                        </div>
                    </div>
                </div>
                <a href="">
                    <div class="ghyh-2">
                        <div class="ghyh-2-1">确定</div>
                    </div>
                </a>
            </div>


            <!--添加银行-->
            <div class="ghyh" id="tj1" style="display:none;">
                <div class="ghyh-0">
                    <div class="ghyh-1">
                        <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value"></div>
                        <div class="ghyh-1-2">
                            <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/jh.jpg'/>" width="20"
                                                         height="20"/></div>
                            <div class="ghyh-1-2-2"> 中国建设银行</div>
                        </div>
                    </div>
                    <div class="ghyh-1">
                        <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value"></div>
                        <div class="ghyh-1-2">
                            <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/zh.jpg'/>" width="20"
                                                         height="20"/></div>
                            <div class="ghyh-1-2-2"> 中国银行</div>
                        </div>
                    </div>
                    <div class="ghyh-1">
                        <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value"></div>
                        <div class="ghyh-1-2">
                            <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/jt.jpg'/>" width="20"
                                                         height="20"/></div>
                            <div class="ghyh-1-2-2"> 交通银行</div>
                        </div>
                    </div>
                    <div class="ghyh-1">
                        <div class="ghyh-1-1"><input type="radio" name="hyh" style="margin:0px;" value="value"></div>
                        <div class="ghyh-1-2">
                            <div class="ghyh-1-2-1"><img src="<c:url value='/images/pc/account/rh.jpg'/>" width="20"
                                                         height="20"/></div>
                            <div class="ghyh-1-2-2"> 日照银行</div>
                        </div>
                    </div>
                </div>
                <div class="ghyh-3">
                    <div class="ghyh-3-1">请输入银行商户号：</div>
                    <input type="text" class="ghyh-3-2">

                    <div class="ghyh-3-1">手机号：</div>
                    <input type="text" class="ghyh-3-2" placeholder="请输入银行预留手机号">
                </div>

                <a href="">
                    <div class="ghyh-2">
                        <div class="ghyh-2-1">保存</div>
                    </div>
                </a>
            </div>


            <form id="affirmpayzgform" action="http://180.168.146.79/PGWPortal/NB2BRecvOrder.do" method="post"
              >
                <%--   加密后的发送报文 post提交 --%>
                <input id="merchantNo" type="hidden" name="merchantNo"
                       value="${rsaUtils.base64Encode("7056".getBytes())}"/>
                <input id="version" type="hidden" name="version" value="${rsaUtils.base64Encode("1.0.1".getBytes())}"/>
                <input id="messageId" type="hidden" name="messageId"
                       value="${rsaUtils.base64Encode("0000110".getBytes())}"/>
                <input id="security" type="hidden" name="security" value="${rsaUtils.base64Encode("P7".getBytes())}"/>
                <input id="signature" type="hidden" name="signature" value=""/>
                <input id="message" type="hidden" name="message" value=""/>

                <div class="Cz1">
                    <div class="Cz1-1">充值金额：</div>
                    <input type="number" class="Cz2-1" id="money"/>

                    <div class="Cz2-2">元</div>
                </div>

                <!--<div class="Cz1">
                    <div class="Cz1-1">支付密码：</div>
                    <input type="text" class="Cz2-1"/>
                    <div class="Cz3-1"><a href="#">忘记密码？</a></div>
                </div>-->

                <div class="congzi">
                    <button id="affirmpayzg" type="button" class="congzi-1">充值</button>
                </div>
            </form>


        </div>

    </div>
    <!--右侧展示-->


    <div style=" width:100%; height:100px; clear:left; border-bottom:1px solid #E0E0E0; margin-bottom:20px;"></div>
    <!--勿删-->
</div>


<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/commonUtil.js'/>"></script>
<script type="application/javascript">
    $(function () {
        /**
         *生成六位随机数
         **/
        function mathRand() {
            var num = "";
            for (var i = 0; i < 6; i++) {
                num += Math.floor(Math.random() * 10);
            }
            return num;
        }

        /**
         *中国确认支付按钮点击事件
         **/
        $("#affirmpayzg").click(function () {
            var orderno = new Date().Format("yyyyMMddhhmmss") + mathRand();
            var amount = $("#money").val();
            $.ajax({
                type: "get",
                url: "/BiGeZaiXian/recharge/getMessageXML",
                data: {'orderno': orderno, 'amount': amount*100},
                dataType: "text",
                cache: false,
                success: function (data) {
                    $("#signature").val(data);
                    $.ajax({
                        type: "get",
                        url: "/BiGeZaiXian/recharge/getBase64MessageXML",
                        data: {'orderno': orderno, 'amount': amount*100},
                        dataType: "text",
                        cache: false,
                        success: function (data) {
                            $("#message").val(data);
                            $("#affirmpayzgform").submit();
                            return false;
                        }
                    })
                }
            })
        })

    })
</script>