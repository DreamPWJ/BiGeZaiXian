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
    <link href="<c:url value='/css/pc/account/changePassword.css'/>" rel="stylesheet" type="text/css">
    <title>个人中心-账号管理-安全设置-修改密码</title>

</head>

<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--地址-->
    <div class="address">
    </div>
    <!--左边导航-->
    <%@ include file="../A_public/accountSideMenu.jsp" %>
</div>
<!--左边导航-->


<!--右侧展示-->
<div class="R-show">
    <div class="R-BT">
        <div class="R-BT-1">修改密码</div>
        <div class="R-BT-2"><a href="<c:url value='/account/tosecuritySettings'/>">返回安全设置</a></div>
    </div>

    <!--总-->
    <div class="ZONG">

        <div class="xgmm">修改登陆密码</div>
        <!--两种验证切换-->
        <div class="Xzyz">
            <!--通过手机验证-->
            <div class="Xzyz-1">
                <a href="javascript:SJ();">
                    <div class="Xzyz-1-1" id="s1" style="display:none;">
                        <div class="Xzyz-1-1-1">
                            <div class="Xzyz-1-1-1-1"><img src="<c:url value='/images/pc/account/028.png'/>" width="44" height="54"/>
                            </div>
                            <div class="Xzyz-1-1-1-2">通过手机验证</div>
                            <div class="Xzyz-1-1-1-3">如果您的手机还在正常使用，请选择此方式。</div>
                        </div>
                    </div>
                </a>

                <div class="Xzyz-1-2" id="s2" style="display:inline;">
                    <div class="Xzyz-1-1-1">
                        <div class="Xzyz-1-1-1-1"><img src="<c:url value='/images/pc/account/028.png'/>" width="44" height="54"/></div>
                        <div class="Xzyz-1-1-1-2">通过手机验证</div>
                        <div class="Xzyz-1-1-1-3">如果您的手机还在正常使用，请选择此方式。</div>
                    </div>
                </div>
            </div>
            <!--通过邮箱验证-->
            <div class="Xzyz-2">
                <a href="javascript:YX();">
                    <div class="Xzyz-2-1" id="yx1" style="display:inline;">
                        <div class="Xzyz-1-1-1">
                            <div class="Xzyz-1-1-1-1"><img src="<c:url value='/images/pc/account/029.png'/>" width="44" height="54"/>
                            </div>
                            <div class="Xzyz-1-1-1-2">通过邮箱验证</div>
                            <div class="Xzyz-1-1-1-3">如果您的邮箱还在正常使用，请选择此方式。</div>
                        </div>
                    </div>
                </a>

                <div class="Xzyz-2-2" id="yx2" style="display:none;">
                    <div class="Xzyz-1-1-1">
                        <div class="Xzyz-1-1-1-1"><img src="<c:url value='/images/pc/account/029.png'/>" width="44" height="54"/></div>
                        <div class="Xzyz-1-1-1-2">通过邮箱验证</div>
                        <div class="Xzyz-1-1-1-3">如果您的邮箱还在正常使用，请选择此方式。</div>
                    </div>
                </div>
            </div>
        </div>

        <!--手机填写验证-->
        <div class="txyz" id="s3" style="display:inline;">
            <!--手机号码-->
            <div class="txyz-1">
                <div class="txyz-1-1">手机号码：</div>
                <div class="txyz-1-2"><samp class="txyz-sa">159****6617</samp></div>
            </div>
            <!--请填写手机验证码-->
            <div class="txyz-2">
                <div class="txyz-2-1">请填写手机验证码：</div>
                <input type="text" class="txyz-2-2"/>

                <div class="txyz-2-3"><a href="#">获取手机验证码</a></div>
            </div>
            <!--输入新密码-->
            <div class="txyz-2">
                <div class="txyz-2-1">输入新密码：</div>
                <input type="text" class="txyz-2-2"/>
            </div>
            <!--确认新密码-->
            <div class="txyz-2">
                <div class="txyz-2-1">确认新密码：</div>
                <input type="text" class="txyz-2-2"/>
            </div>
            <div class="txyz-2" style="margin-top:20px">
                <div class="txyz-2-1"></div>
                <button type="button" class="txyz-3-2">保&nbsp;&nbsp;存</button>
            </div>
        </div>

        <!--邮箱填写验证-->
        <div class="txyz" id="yx3" style="display:none;">
            <!--我的邮箱-->
            <div class="txyz-1">
                <div class="txyz-1-1">我的邮箱：</div>
                <div class="txyz-1-2"><samp class="txyz-sa">1595652@qq.com</samp></div>
            </div>
            <!--请填写邮箱验证码-->
            <div class="txyz-2">
                <div class="txyz-2-1">请填写邮箱验证码：</div>
                <input type="text" class="txyz-2-2"/>

                <div class="txyz-2-3"><a href="#">获取邮箱验证码</a></div>
            </div>
            <!--输入新密码-->
            <div class="txyz-2">
                <div class="txyz-2-1">输入新密码：</div>
                <input type="text" class="txyz-2-2"/>
            </div>
            <!--确认新密码-->
            <div class="txyz-2">
                <div class="txyz-2-1">确认新密码：</div>
                <input type="text" class="txyz-2-2"/>
            </div>
            <div class="txyz-2" style="margin-top:20px">
                <div class="txyz-2-1"></div>
                <button type="button" class="txyz-3-2">保&nbsp;&nbsp;存</button>
            </div>

        </div>

    </div>

</div>
<!--右侧展示-->

</div>
<!-- content ----------- 结束 -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>
