<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>比格在线 - 注册</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/pc/register.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/font-awesome.css'/>" rel="stylesheet" type="text/css"><%-- 字体图表库--%>
</head>

<body>
<!--头部------------------------------------开始-->
<div class="top1">
    <div class="top2">
        <div class="top3">
            <div class="top3-1">您好，欢迎来到比格在线电商平台！</div>
            <div class="top3-2"><a href="<c:url value='/index/pcindex'/> ">首页</a><a
                    href="<c:url value='/index/tologin'/>"
                    class="top3-2-2" >登录</a>
            </div>
        </div>
        <div class="top4">
       <%--     <div class="top4-3">热线：400-827-3009</div>--%>
            <div class="top4-2"><a href="<c:url value='/index/toprotocol'/>">帮助中心</a></div>
        </div>
    </div>
</div>
<div class="top-bgcolor">
    <div class="logo_area">
        <h1 class="header-logo">
            <a href="<c:url value='/index/pcindex'/>"></a>
        </h1>

        <div class="loginhotline"></div>
    </div>
</div>

<!--头部------------------------------------结束-->

<!--主体------------------------------------开始-->
<div class="content">
    <div class="login-left">
        <h3> <i class="fa fa-pencil-square-o"></i> 用户注册</h3>

        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form id="regForm" action="<c:url value='/user/reg?flag=1'/>"
                  class="form-horizontal" method="post">

                <div class="form-body">
                    <div class="row">


                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3">注册类型</label>

                                <div class="radio col-xs-2">
                                    <label>
                                        <input type="radio" name="guestcode" value="001" checked>
                                        <strong>买家</strong>
                                    </label>
                                </div>
                                <div class="radio col-xs-2">
                                    <label>
                                        <input type="radio" name="guestcode" value="002">
                                        <strong>卖家</strong>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="login">用户名</label>
                                <div class="col-xs-6">
                                    <input id="login" name="login"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="5-35个英文、数字任意组合"
                                           check-type="required charornurmber" minlength="5"/>
                                </div>
                                <div><span class="red" >${msg_userName}</span> </div>
                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="password">密码</label>

                                <div class="col-xs-6">
                                    <input id="password" name="password" type="password"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="8~16位的数字与字母组合"
                                           check-type="required password" minlength="8"/>

                                </div>
                            </div>
                        </div>
                        <!--/span-->
                        <!--/span-->
                        <div class="col-xs-12">
                            <div id="onfirmpwdgroup" class="form-group">
                                <label class="control-label col-xs-3" for="userConfirmPwd">确认密码</label>
                                <div class="col-xs-6">
                                    <input id="userConfirmPwd" name="userConfirmPwd" type="password"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="再次输入上面的密码"
                                           check-type="required" minlength="8"/>

                                </div>
                            </div>
                        </div>
                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="companyName" >公司名称</label>
                                <div class="col-xs-6">
                                    <input id="companyName" name="company"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="您所属公司的全称"
                                           check-type="required"/>
                                </div>
                            </div>
                        </div>

                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="accountContact" >联系人</label>

                                <div class="col-xs-6">
                                    <input id="accountContact" name="name"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="负责在本平台业务的联系人姓名"
                                           check-type="required"/>
                                </div>
                            </div>
                        </div>
                        <!--/span-->

                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="accountContactWay">联系手机</label>

                                <div class="col-xs-6">
                                    <input id="accountContactWay" name="mobphone"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="格式：11位手机号"
                                           check-type="phone"/>
                                </div>
                            </div>
                        </div>
                        <!--/span-->
                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="phone">联系电话</label>

                                <div class="col-xs-6">
                                    <input id="phone" name="phone"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="格式：0577-88888888"
                                           check-type="tel"/>
                                </div>
                            </div>
                        </div>
                        <!--/span-->

                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="email" >注册邮箱</label>

                                <div class="col-xs-6">
                                    <input id="email" name="email"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="您所属公司或联系人常用邮箱"
                                           check-type="required mail"/>
                                </div>
                            </div>
                        </div>
                        <!--/span-->

                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="addressCn" >联系地址</label>

                                <div class="col-xs-6">
                                    <input id="addressCn" name="address"
                                           class="form-control placeholder-no-fix"
                                           autocomplete="on"
                                           placeholder="您所属公司的详细通信地址"
                                           check-type="required"/>
                                </div>
                            </div>
                        </div>
                        <!--/span-->

                        <!--/span-->
                        <div class="col-xs-12">
                            <div class="form-group">

                                <div class="col-xs-6 col-xs-offset-3">
                                    <div class="checkbox">
                                        <label>
                                            <input id="agreementcheck" type="checkbox">
                                            <span>
                                            我已阅读并同意<a id="agreementLink" target="_blank"
                                                              href="<c:url value='/index/toprotocol'/>"><i class="fa fa-hand-o-right"></i>比格在线用户注册协议</a></span>
                                        </label>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!--/span-->
                    </div>

                </div>


                <div class="col-xs-11">
                    <button id="btnRegister" type="submit"
                            class="btn btn-success ">
                        申请注册
                    </button>
                </div>

            </form>
            <!-- END FORM-->
        </div>


    </div>
    <div class="login-right">
        <h3>
            <span>已有比格在线账号？</span>
        </h3>
        <ul class="infotext">
            <li>
                <i class="ico1"></i>
                    <span>
                        <h4>金融服务</h4>
                        <p>提升资金，高效服务</p>
                    </span>
            </li>
            <li>
                <i class="ico2"></i>
                    <span>
                        <h4>其他服务</h4>
                        <p>我们的服务，值得信任</p>
                    </span>
            </li>
        </ul>
        <div>
            <a class="input-dl" id="loginBtn" href="<c:url value='/index/tologin'/>" >前往登录</a>
        </div>
    </div>
</div>

<div id="tooltip">
    <div class="container">
        <h1>比格在线 指南</h1>
        <span class="close">关闭</span>

        <div class="slider-container">
            <div class="slider-turn">
                <p>
                    首先您要在比格在线注册用户 请按要求填写真实信息 方便我们对您公司的审核！
                </p>

                <p>
                    注册成功后 请先登录比格在线 去个人中心 > 账号管理 > 认证附件 上传三证信息
                    注册 上传三证成功后 比格在线平台人员会尽快对您公司和证件真实性进行审核
                </p>

                <p>
                    您公司以及三证有效性真实性审核通过以后  您可以去个人中心 > 商品发布 > 新增商品 进行商品信息录入

                </p>
                <p>  商品发布成功后  商品发布 > 我的商品 > 详情 进行添加库存 上架等操作  等待平台入库审核完成  便可线上交易
                </p>

                <p>
                    最后感谢您选择比格在线 <a href="<c:url value="/index/touserGuides"/> " title="新手指南">新手指南</a>
                </p>
            </div>
        </div>

        <div class="bottom-tp">
            <div class="step">
                <span></span>
                <ul>
                    <li data-num="1"></li>
                    <li data-num="2"></li>
                    <li data-num="3"></li>
                    <li data-num="4"></li>
                    <li data-num="5"></li>

                </ul>
            </div>
            <button class="btn">下一步</button>
        </div>
    </div>
</div>
<script src="<c:url value='/js/pc/A_public/jquery-1.11.1.min.js'/>" type="text/javascript"></script>
<!--主体------------------------------------结束-->
<%@ include file="../A_public/foot.jsp" %>

</body>
</html>

<!--js文件-->
<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/> " type="text/javascript"></script>
<script src="<c:url value='/js/pc/register.js'/>" type="text/javascript"></script>
