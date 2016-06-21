<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>账号管理 - 比格在线</title>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/account/basicInformation.css'/>" rel="stylesheet" type="text/css">


</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- 开始 -->
<div class="content">
    <!--地址-->
    <div class="address">

    </div>

    <!--左边导航-->
    <%@ include file="../A_public/accountSideMenu.jsp" %>
    <!--左边导航-->


    <!--右侧展示-->
    <div class="R-show">
        <div class="R-BT">
            <div class="R-BT-1">
                <div id="jbzl" class="R-BT-1-1">基本资料</div>
                <div class="R-BT-1-2">
                    <a href="javascript:BJYHZL();">
                        <div class="R-BT-1-2-1" id="cz1" style="display:inline;">编辑用户资料</div>
                    </a>

                    <div class="R-BT-1-2-2" id="cz1-1" style="display:none;">编辑用户资料</div>
                </div>
            </div>
        </div>

        <!--总-->
        <div class="ZONG">
            <!--基本资料-->
            <div class="Jbzl" id="cz2-1" style="display:inline;">
                <div class="Jbzl-1">联系人信息</div>
                <!--用户名-->
                <div class="Jbzl-2">
                    <div class="Jbzl-2-1">用户名：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1">${baseinfo.LOGIN}</samp></div>
                </div>
                <!--邮箱-->
                <div class="Jbzl-2">
                    <div class="Jbzl-2-1">邮箱：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1">${baseinfo.EMAIL}</samp></div>
                </div>
                <!--QQ-->
        <%--        <div class="Jbzl-2">
                    <div class="Jbzl-2-1">QQ：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1"></samp></div>
                </div>--%>
                <!--姓名-->
                <div class="Jbzl-2">
                    <div class="Jbzl-2-1">姓名：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1">${baseinfo.USERNAME}</samp></div>
                </div>
                <!--手机-->
                <div class="Jbzl-2">
                    <div class="Jbzl-2-1">手机：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1">${baseinfo.MOBPHONE}</samp></div>
                </div>

                <div class="Jbzl-3">公司信息</div>
                <!--公司名称-->
                <div class="Jbzl-2">
                    <div class="Jbzl-2-1">公司名称：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1">${baseinfo.COMPANYNAME}</samp></div>
                </div>
                <!--公司电话-->
                <div class="Jbzl-2">
                    <div class="Jbzl-2-1">公司电话：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1">${baseinfo.PHONE}</samp></div>
                </div>
                <!--公司传真-->
       <%--         <div class="Jbzl-2">
                    <div class="Jbzl-2-1">公司传真：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1"></samp></div>
                </div>--%>
                <!--公司行业-->
                <div class="Jbzl-2">
                    <div class="Jbzl-2-1">公司行业：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1">贸易公司</samp></div>
                </div>
                <!--公司地址-->
                <div class="Jbzl-2">
                    <div class="Jbzl-2-1">公司地址：</div>
                    <div class="Jbzl-2-2"><samp class="Jbzl-sa1">${baseinfo.ADDRESS}</samp></div>
                </div>
            </div>


            <!--编辑用户资料-->
            <div class="Bjyh" id="cz2" style="display:none;">
                <div class="Jbzl-1">编辑用户资料</div>
                <!--用户名-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1">用户名：</div>
                    <input type="text" placeholder="${baseinfo.LOGIN}" class="Bjyh-2-2"/>
                </div>
                <!--邮箱-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1">邮箱：</div>
                    <input type="text" placeholder="${baseinfo.EMAIL}" class="Bjyh-2-2"/>
                </div>
                <!--QQ-->
           <%--     <div class="Bjyh-2">
                    <div class="Bjyh-2-1">QQ：</div>
                    <input type="text" placeholder="" class="Bjyh-2-2"/>
                </div>--%>
                <!--姓名-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1">姓名：</div>
                    <input type="text" placeholder="${baseinfo.USERNAME}" class="Bjyh-2-2"/>
                </div>
                <!--手机-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1">手机：</div>
                    <input type="text" placeholder="${baseinfo.MOBPHONE}" class="Bjyh-2-2"/>
                </div>
                <!--公司名称-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1">公司名称：</div>
                    <input type="text" placeholder="${baseinfo.COMPANYNAME}" class="Bjyh-2-2"/>
                </div>
                <!--公司电话-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1">公司电话：</div>
                    <input type="text" placeholder="${baseinfo.PHONE}" class="Bjyh-2-2"/>
                </div>
                <!--公司传真-->
         <%--       <div class="Bjyh-2">
                    <div class="Bjyh-2-1">公司传真：</div>
                    <input type="text" placeholder="" class="Bjyh-2-2"/>
                </div>--%>
                <!--公司行业-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1">公司行业：</div>
                    <select name="select"  class="Bjyh-2-3">
                        <option value="选择品牌">贸易公司</option>
                        <option value="选择品牌1">*****</option>
                        <option value="选择品牌2">*****</option>
                    </select>
                </div>
                <!--公司地址-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1">公司地址：</div>
                    <select name="select"  class="Bjyh-2-3-1">
                        <option value="山东省">山东省</option>
                        <option value="1">*****</option>
                        <option value="2">*****</option>
                    </select>
                    <select name="select"  class="Bjyh-2-3-1">
                        <option value="日照市">日照市</option>
                        <option value="1">*****</option>
                        <option value="2">*****</option>
                    </select>
                    <select name="select"  class="Bjyh-2-3-1">
                        <option value="东港区">东港区</option>
                        <option value="1">*****</option>
                        <option value="2">*****</option>
                    </select>
                </div>
                <!--详细地址-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1"></div>
                    <input type="text" placeholder="${baseinfo.ADDRESS}" class="Bjyh-2-2"/>
                </div>
                <!--间隔-->
                <div style="width:950px; height:20px; float:left;"></div>
                <!--保存-->
                <div class="Bjyh-2">
                    <div class="Bjyh-2-1"></div>
                    <div class="Jbzl-2-2">
                        <button type="button" class="Bjyh-2-4">保存</button>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!--右侧展示-->
</div>
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>
</body>
</html>


<script>
    $(function () {
        $("#cz1").click(function () {
            $("#cz2").show();
            $("#cz2-1").hide();
        })
        $("#jbzl").click(function () {
            $("#cz2-1").show();
            $("#cz2").hide();
        })
    })
</script>