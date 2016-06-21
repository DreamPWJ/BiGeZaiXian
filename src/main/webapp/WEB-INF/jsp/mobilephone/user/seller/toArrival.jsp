<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap/css/bootstrap.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/plugins/bootstrap3-validation.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/seller/putaway.css"/>" rel="stylesheet" type="text/css">
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

            $("#upSell").blur(function(){
                var stockNow = Number($("#stockNow").val());
                alert("stockNow:"+stockNow);
                var num = Number($("#upSell").val());
                alert("num:"+num);
                if(num > stockNow){
                    alert("上架数量不能大于库存数量");
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

    <form action="/BiGeZaiXian/good/arrival" method="post">
        <input type="hidden" name="companyId" value="${companyId}">
        <input type="hidden" name="storageId" value="${storageId}">
        <input type="hidden" name="goodId" value="${goodId}">
        <input type="hidden" name="storageAddress" value="${storageAddress}">
        <input type="hidden" name="mea" value="${mea}">
        <div class="tjkc">
            <div class="ckxx-1">
                <div class="ckxx-1-t"></div>
                <div class="ckxx-1-z">库存上架</div>
            </div>

            <!--现有库存-->
            <div class="xykx">
                <div class="xykx-1">现有库存：</div>
                <input id="stockNow" type="hidden" value="${availableStock.STOCKAVAILABLE}">
                <div class="xykx-2"><samp class="sa2">${availableStock.STOCKAVAILABLE}</samp>&nbsp;${mea}</div>
            </div>

            <!--仓库地址-->
            <div class="cangk">
                <div class="cangk-1">仓库地址：</div>
                <div class="cangk-2"><samp class="sa2">${storageAddress}</samp></div>
            </div>

            <!--上架数量-->
            <div class="form-group">
                <label for="upSell" class="col-sm-2 control-label">上架数量</label>
                <div class="col-sm-6">
                    <input type="text" value="${upSell}" class="form-control" id="upSell" name="upSell" check-type="required number" required-message="请填写上架数量">
                </div>
            </div>

            <!--价格-->
            <div class="form-group">
                <label for="price" class="col-sm-2 control-label">价格</label><span style="float: right;margin-right: 20px">&nbsp;元</span>
                <div class="col-sm-6">
                    <input type="text" value="${price}" class="form-control" id="price" name="price" check-type="required number" required-message="请填写上价格">
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
        </div>
    </form>
    <h1 style="color: #990000;font-size: large;margin-left: 20px">${msg_arrival}</h1>
    <!--底部-->
    <jsp:include page="../../footer.jsp"></jsp:include>
</div>

</body>
</html>
