<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/28 0028
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <script type="text/javascript" src="<c:url value="/plugins/app.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>"/>
    <link href="<c:url value="/plugins/select2/select2_conquer.css"/>" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/plugins/select2/select2.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/plugins/bootstrap3-validation.js"/>"></script>

    <link href="<c:url value="/css/mobilephone/seller/goodsReleased.css"/>" rel="stylesheet" type="text/css">
    <style type="text/css"></style>


</head>

<body>
<div class="zhongti">
    <!--头部-->
    <jsp:include page="../../navigation.jsp"></jsp:include>
    <!--头部隐藏菜单栏-->
    <div class="top-dh" id="n1" style="display:none;">
        <!--底线-->
        <div class="dx"></div>
    </div>
    <form action="/BiGeZaiXian/user/saveGood" method="post" id="form">
        <!--品种-->
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label col-md-6">品种</label>
                <div class="col-md-6">
                    <select name="goodkindcode" class="form-control placeholder-no-fix chosen-select" autocomplete="off" id="goodkindcode">
                        <c:forEach items="${goodKindCode}" var="item">
                            disabled
                            <c:if test="${item.LEVE==1}">
                                <option value="${item.LEVELCODE}" disabled>${item.NAME}</option>
                            </c:if>
                            <c:if test="${item.LEVE==2}">
                                <option value="${item.LEVELCODE}" disabled class="select2-disabled2">${item.NAME}</option>
                            </c:if>
                            <c:if test="${item.LEVE==3}">
                                <option value="${item.LEVELCODE}">${item.NAME}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <!--牌号-->
        <div class="col-md-3">
            <div class="form-group">
                <label for="mark" class="control-label col-md-6">牌号</label>
                <div class="col-md-6">
                    <input type="text" class="form-control" check-type="required" id="mark" name="mark" placeholder="请输入牌号">
                </div>
            </div>
        </div>
        <!--用途级别-->
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label col-md-6">用途级别</label>
                <div class="col-md-6">
                    <select name="usecode" class="form-control placeholder-no-fix chosen-select" autocomplete="off" id="usecode">
                        <c:forEach items="${useCode}" var="item">
                            <option value="${item.LEVELCODE}">${item.NAME}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <!--产地-->
        <div class="col-md-3">
            <div class="form-group">
                <label for="producingarea" class="control-label col-md-6">产地</label>
                <div class="col-md-6">
                    <input type="text" check-type="required" class="form-control" id="producingarea" name="producingarea" placeholder="请输入产地">
                </div>
            </div>
        </div>
        <!--供应商-->
        <div class="col-md-3">
            <div class="form-group">
                <label for="producer" class="control-label col-md-6">供应商</label>
                <div class="col-md-6">
                    <input type="text" check-type="required" class="form-control" id="producer" name="producer" placeholder="请输入供应商">
                </div>
            </div>
        </div>
        <!--包装类型-->
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label col-md-6">包装类型</label>
                <div class="col-md-6">
                    <select name="packtypecode" class="form-control placeholder-no-fix chosen-select" autocomplete="off" id="packtypecode">
                        <c:forEach items="${packTypeCode}" var="item">
                            <option value="${item.LEVELCODE}">${item.NAME}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <!--包装说明-->
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label col-md-6">包装说明</label>
                <div class="col-md-6">
                    <select name="packcontent" class="form-control placeholder-no-fix chosen-select" autocomplete="off" id="packcontent">
                        <c:forEach items="${packContent}" var="item">
                            <option value="${item.LEVELCODE}">${item.NAME}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <!--计量单位-->
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label col-md-6">计量单位</label>
                <div class="col-md-6">
                    <select name="meacode" class="form-control placeholder-no-fix chosen-select" autocomplete="off" id="meacode">
                        <c:forEach items="${meaCode}" var="item">
                            <option value="${item.LEVELCODE}">${item.NAME}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <!--包装单位-->
        <%--<div class="col-md-3">
            <div class="form-group">
                <label class="control-label col-md-6">包装单位</label>
                <div class="col-md-6">
                    <select name="packagecode" class="form-control placeholder-no-fix chosen-select" autocomplete="off" id="packagecode">
                        <c:forEach items="${packageCode}" var="item">
                            <option value="${item.LEVELCODE}">${item.NAME}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>--%>
        <!--换算关系-->
        <%--<div class="col-md-3">
            <div class="form-group">
                <label for="convertnum" class="control-label col-md-6">换算关系</label>
                <div class="col-md-6">
                    <input type="text" check-type="required" class="form-control" id="convertnum" name="convertnum" placeholder="请输入换算关系">
                </div>
            </div>
        </div>--%>
        <!--描述-->
        <div class="col-md-3">
            <div class="form-group">
                <label for="content" class="control-label col-md-6">商品描述</label>
                <div class="col-md-6">
                    <input type="text" check-type="required" class="form-control" id="content" name="content" placeholder="请输入商品描述">
                </div>
            </div>
        </div>
        <!--仓库地址-->
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label col-md-6">仓库地址</label>
                <div class="col-md-6">
                    <select name="storageid" class="form-control placeholder-no-fix chosen-select" autocomplete="off" id="storageid">
                        <c:forEach items="${storage}" var="item">
                            <option value="${item.ID}">${item.NAME}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <!--税率-->
        <div class="col-md-3">
            <div class="form-group">
                <label for="rate" class="control-label col-md-6">税率</label>
                <div class="col-md-6">
                    <input type="text" check-type="required" class="form-control" id="rate" name="rate" placeholder="请输入商品税率">
                </div>
            </div>
        </div>
        <!--入库数量-->
        <div class="col-md-3">
            <div class="form-group">
                <label for="initnum" class="control-label col-md-6">入库数量</label>
                <div class="col-md-6">
                    <input type="text" check-type="required" class="form-control" id="initnum" name="initnum" placeholder="请输入入库数量">
                </div>
            </div>
        </div>
        <!--立即发布-->
        <%--<div class="tjkc">
            <div style="width:140px; height:40px; line-height:40px; margin:0 auto;">
                <!--<div class="tjkc-1"><a href="#">立&nbsp;即&nbsp;发&nbsp;布</a></div>-->
                <button id="submit" type="submit" class="tjkc-1"><a href="#">立&nbsp;即&nbsp;发&nbsp;布</a></button>
            </div>
        </div>--%>
        <div class="col-md-11 input-bottom" style="text-align: center">
            <button type="submit" class="btn btn-success ">
                发布商品
            </button>
        </div>
    </form>
    <!--底线-->
    <div class="dx2"></div>

    <!--底部-->
    <jsp:include page="../../footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
    $(function () {
        var aDent = true;
        var oParent = $('.list-bar');
        var oNodeContent = $('.list-menu');
        oParent.click(function () {
            if (aDent) {
                oNodeContent.stop().slideDown(500);
            } else {
                oNodeContent.stop().slideUp(500);
            }
            aDent = !aDent;
        });

        $(".chosen-select").select2();
        $("form").validation();

        if('${msg_good}'!= ''){
            alert("${msg_good}");
        }


    });

    //表单提交验证
    $("button[type='submit']").on('click', function (event) {
        // 2.最后要调用 valid()方法。
        if ($("form").valid() == false) {
            return false;
        }

    });

</script>
</body>
</html>
