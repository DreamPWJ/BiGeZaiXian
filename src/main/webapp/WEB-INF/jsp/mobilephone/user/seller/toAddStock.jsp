<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap/css/bootstrap.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/plugins/bootstrap3-validation.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/seller/addInventorys.css"/>" rel="stylesheet" type="text/css">
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

            $("form").validation();
            //表单提交验证
            $("button[type='submit']").on('click', function (event) {
                // 2.最后要调用 valid()方法。
                if ($("form").valid() == false) {
                    return false;
                }
            });
        });
    </script>
</head>

<body>
<div class="zhongti">
    <!--头部-->
    <jsp:include page="../../navigation.jsp"></jsp:include>
    <!--产品明细-->
    <div class="comx">
        <div class="comx-1"><samp>${good.GOODKIND}/${good.MARK}</samp></div>
        <div class="comx-2">
            <div class="comx-2-l">牌号：<samp class="sa2">${good.MARK}</samp></div>
            <div class="comx-2-r">计量单位：<samp class="sa2">${good.MEA}</samp></div>
        </div>
        <div class="comx-2">
            <div class="comx-2-l">品种：<samp class="sa2">${good.GOODKIND}</samp></div>
            <div class="comx-2-r">包装单位：<samp class="sa2">${good.PACKAGE}</samp></div>
        </div>
        <div class="comx-2">
            <%--<div class="comx-2-l">单价：<samp class="sa2">9800.00</samp>元</div>--%>
            <div class="comx-2-r">用途级别：<samp class="sa2">${good.USE}</samp></div>
        </div>
        <div class="comx-2">
            <div class="comx-2-l">产地：<samp class="sa2">${good.PRODUCINGAREA}</samp></div>
            <div class="comx-2-r">包装类型：<samp class="sa2">${good.PACKTYPE}</samp></div>
        </div>
        <div class="comx-2">
            <div class="comx-2-l">产商：<samp class="sa2">${good.PRODUCER}</samp></div>
            <div class="comx-2-r">包装说明：<samp class="sa2">${good.PACKCONTENT}</samp></div>
        </div>
    </div>

    <form action="/BiGeZaiXian/good/addStock" method="post">
        <input type="hidden" name="companyId" value="${companyId}">
        <input type="hidden" name="goodId" value="${goodId}">
        <input type="hidden" name="storageId" value="${storageId}">
        <input type="hidden" name="mea" value="${mea}">
        <input type="hidden" name="stockNow" value="${stockNow}">
        <input type="hidden" name="storageAddress" value="${storageAddress}">

        <div class="tjkc">
            <div class="ckxx-1">
                <div class="ckxx-1-t"></div>
                <div class="ckxx-1-z">添加库存</div>
            </div>

            <!--现有库存-->
            <div class="xykx">
                <div class="xykx-1">现有库存：</div>
                <div class="xykx-2"><samp class="sa2">${stockNow}</samp>&nbsp;${good.MEA}</div>
            </div>

            <!--仓库地址-->
            <div class="cangk">
                <div class="cangk-1">仓库地址：</div>
                <div class="cangk-2"><samp class="sa2">${storageAddress}</samp></div>
            </div>

            <!--入库数量-->
            <div class="form-group">
                <label for="stockIn" class="col-sm-2 control-label">入库数量</label>
                <div class="col-sm-6">
                    <input type="text" value="${stockIn}" class="form-control" id="stockIn" name="stockIn" check-type="required number" required-message="请填写入库数量">
                </div>
            </div>

            <!--底线2-->
            <div class="dix2"></div>

            <!--保存-->
            <div class="baoc">
                <div class="baoc-1">
                    <button type="submit" class="baoc-butt">提&nbsp;&nbsp;交</button>
                </div>
            </div>
            <h1 style="color: #990000;font-size: large;margin-left: 15px">${msg_addStock}</h1>
        </div>
    </form>

    <!--底部-->
    <jsp:include page="../../footer.jsp"></jsp:include>
</div>

</body>
</html>
