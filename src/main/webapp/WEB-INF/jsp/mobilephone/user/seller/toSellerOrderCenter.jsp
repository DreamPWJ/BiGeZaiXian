<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
    <link href="<c:url value="/css/mobilephone/seller/orderCenter.css"/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value="/js/commonUtil.js"/>"></script>

    <script type="text/javascript">
        $(function(){
            var aDent = true;
            var oParent = $('.list-bar');
            var oNodeContent = $('.list-menu');
            oParent.click(function(){
                if(aDent){
                    oNodeContent.stop().slideDown(500);
                }else{
                    oNodeContent.stop().slideUp(500);
                }
                aDent = !aDent;
            });

            var url="";
            var commonFun = function(){
                $.ajax({
                    type: "GET",
                    url: url,
                    dataType: "json",
                    success: function(data){
                        $("#order").html("");// 清空内容
                        var html = '';
                        $.each(data, function(i, item){
                            html += '<div class="ann1-2">';
                            html +='<div class="ann2-1-1">'+item.ROWNUM+'</div>';
                            html +='<div class="ann2-1-2"><a href="#">'+item.ORDERNO+'</a></div>';
                            html +='<div class="ann2-1-3">';
                            html += (new Date(item.CREATETIME)).Format("yyyy-MM-dd hh:mm:ss");
                            html +='</div>';
                            html +='<div class="ann2-1-4" style=" color:#EB6100;">￥<samp>'+item.TOTAL+'</samp></div>';
                            html +='<div class="ann2-1-5">'+item.ORDERSTATUS+'</div>';
                            html += '</div>';
                        });
                        $('#order').html(html);
                    }
                });
            }
            // 受理中
            $("#accept").click(function(){
                url = "/BiGeZaiXian/order/getAjaxOrders?type=001";
                commonFun();
            });
            // 进行中
            $("#proceed").click(function(){
                url = "/BiGeZaiXian/order/getAjaxOrders?type=001";
                commonFun();
            });
            // 已完成
            $("#finish").click(function(){
                url = "/BiGeZaiXian/order/getAjaxOrders?type=001";
                commonFun();
            });
            // 已拒绝
            $("#refuse").click(function(){
                url = "/BiGeZaiXian/order/getAjaxOrders?type=001";
                commonFun();
            });
            // 已取消
            $("#cancel").click(function(){
                url = "/BiGeZaiXian/order/getAjaxOrders?type=002";
                commonFun();
            });
        });

    </script>
</head>

<body>
<div class="zhongti">
    <!--头部-->
    <jsp:include page="../../navigation.jsp"></jsp:include>

    <!--订单路径-->
    <div class="ddlj">
        <samp>销售订单</samp>&nbsp;&gt;&nbsp;<samp>订单状态</samp>
    </div>

    <!--订单选择-->
    <div class="ddxz">
        <div class="ddxz-1">
            <div class="changes" onmouseover="this.className='changes'" onmouseout="this.className='normals'">全部</div>
            <div id="accept" class="normal" onmouseover="this.className='change'" onmouseout="this.className='normal'">受理中</div>
            <div id="proceed" class="normal" onmouseover="this.className='change'" onmouseout="this.className='normal'">进行中</div>
            <div id="finish" class="normal" onmouseover="this.className='change'" onmouseout="this.className='normal'">已完成</div>
            <div id="refuse" class="normal" onmouseover="this.className='change'" onmouseout="this.className='normal'">已拒绝</div>
            <div id="cancel" class="normal" onmouseover="this.className='change'" onmouseout="this.className='normal'">已取消</div>
        </div>
    </div>

    <!--搜索-->
    <form>
        <div class="shous">
            <div class="shous-1"><input type="text" value="" id="" placeholder="请输入订单流水号"
                                        style="width:100%; height:40px; font-size:14px; color:#666;"></div>
            <div class="shous-2">
                <button type="submit" class="xFast_form_btn">
                    <div class="shous-2-t"></div>
                </button>
            </div>
        </div>
    </form>

    <!--全部订单展示-->
    <div id="an1" style="display:inline;" class="ann1">
        <div class="ann1-1">
            <div class="ann1-1-1">序号</div>
            <div class="ann1-1-2">订单流水号</div>
            <div class="ann1-1-3">下单时间</div>
            <div class="ann1-1-4">金额</div>
            <div class="ann1-1-5">状态</div>
        </div>
        <div id="order">
        <c:forEach items="${orderList}" var="item">
            <div class="ann1-2">
                <div class="ann2-1-1">${item.ROWNUM}</div>
                <div class="ann2-1-2"><a href="#">${item.ORDERNO}</a></div>
                <div class="ann2-1-3">
                    <fmt:formatDate value="${item.CREATETIME}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </div>
                <div class="ann2-1-4" style=" color:#EB6100;">￥<samp>${item.TOTAL}</samp></div>
                <div class="ann2-1-5">${item.ORDERSTATUS}</div>
            </div>
        </c:forEach>
        </div>
        <!--这里可写分页-->
    </div>

    <!--受理中信息展现-->
    <div id="an2" style="display:none;" class="ann2">
        <div style="width:auto; height:400px; margin:0px 22px; line-height:400px; font-size:28px; color:#FF0000; background:#FF99FF; text-align:center">
            受理中
        </div>
    </div>

    <!--进行中信息展现-->
    <div id="an3" style="display:none;" class="ann2">
        <div style="width:auto; height:400px; margin:0px 22px; line-height:400px; font-size:28px; color:#99CC00; background:#FF99FF; text-align:center">
            进行中
        </div>
    </div>

    <!--已完成信息展现-->
    <div id="an4" style="display:none;" class="ann2">
        <div style="width:auto; height:400px; margin:0px 22px; line-height:400px; font-size:28px; color:#3300FF; background:#FF99FF; text-align:center">
            已完成
        </div>
    </div>

    <!--已拒绝信息展现-->
    <div id="an5" style="display:none;" class="ann2">
        <div style="width:auto; height:400px; margin:0px 22px; line-height:400px; font-size:28px; color:#FFFF00; background:#333; text-align:center">
            已拒绝
        </div>
    </div>

    <!--已取消信息展现-->
    <div id="an6" style="display:none;" class="ann2">
        <div style="width:auto; height:400px; margin:0px 22px; line-height:400px; font-size:28px; color:#000000; background:#FF99FF; text-align:center">
            已取消
        </div>
    </div>


    <!--与分割线-->
    <div style="width:100%; height:50px; "></div>

    <!--底部-->
    <jsp:include page="../../footer.jsp"></jsp:include>
</div>


</body>
</html>
