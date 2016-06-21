<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../top.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
    <link href="/BiGeZaiXian/css/mobilephone/user/shoppingCarts.css" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/mobilephone/cart.css"/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value="/js/mobilephone/jquery.1.4.2-min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/mobilephone/Calculation.js"/>"></script>

    <script>
        $(document).ready(function() {

            //jquery特效制作复选框全选反选取消(无插件)
            // 全选
            $(".allselect").click(function() {
                if($(this).attr("checked")){
                    $(".gwc_tb2 input[name=newslist]").each(function() {
                            $(this).attr("checked", true);
                    });
                } else {
                    $(".gwc_tb2 input[name=newslist]").each(function() {
                        $(this).attr("checked", false);
                    });
                }

                GetCount();
            });

            // 输出
            $(".gwc_tb2 input[name=newslist]").click(function() {
                GetCount();
            });
        });
        function GetCount() {
            var conts = 0;
            var aa = 0;
            $(".gwc_tb2 input[name=newslist]").each(function() {
                if ($(this).attr("checked")) {
                    for (var i = 0; i < $(this).length; i++) {
                        conts += parseInt($(this).val());
                        aa += 1;
                    }
                }
            });
            $("#shuliang").text(aa);
            $("#zong1").html((conts).toFixed(2));
            $("#jz1").css("display", "none");
            $("#jz2").css("display", "block");
        }
    </script>
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

        var num="";
        var cartId_checked="";
        var stockId_checked="";
        var cartId_unchecked="";
        var stockId_unchecked="";
        // 下单
        $("#jz2").click(function(){
            //遍历获取选中的checkbox
            <c:forEach items="${cartList}" var="item">
            $(".gwc_tb2 input[name=newslist]").each(function() {
                if($(this).attr("checked") && $(this).attr("id")=="newslist_${item.RN}"){
                    num += $("#text_box_${item.RN}").val()+",";
                    cartId_checked += $("#cart_${item.CARTID}").val()+",";
                    stockId_checked += $("#stock_${item.STOCKID}").val()+",";
                }
                if($(this).attr("checked")==false && $(this).attr("id")=="newslist_${item.RN}"){
                    cartId_unchecked += $("#cart_${item.CARTID}").val()+",";
                    alert("cartId_unchecked:"+cartId_unchecked);
                    stockId_unchecked += $("#stock_${item.STOCKID}").val()+",";
                    alert("stockId_unchecked:"+stockId_unchecked);
                }
            });
            </c:forEach>
            // form赋值
            $("#num").val(num);
            $("#cartId_checked").val(cartId_checked);
            $("#stockId_checked").val(stockId_checked);
            $("#cartId_unchecked").val(cartId_unchecked);
            $("#stockId_unchecked").val(stockId_unchecked);
            // form提交
            $("#form").submit();
        });
        // 删除
        <c:forEach items="${cartList}" var="item">
            $("#del_${item.CARTID}").click(function(){
                // 设置当前购物车为无效
                $.ajax({
                    type: "GET",
                    url: "/BiGeZaiXian/user/updateCartByAjax?cartId=${item.CARTID}&&stockId=${item.STOCKID}",
                    dataType: "json",
                    success: function(data){
                        $('#content_cart').empty();   //清空content_cart里面的所有内容
                        var html = '';
                        $.each(data, function(i, item){
//                            html += '<table cellpadding="0" cellspacing="0" class="gwc_tb2"> <tbody> <tr>';
                            html += '<tr>';
                            html += '<td class="tb2_td1"> <input type="checkbox" value="" name="newslist" id="newslist_'+item.RN+'"> </td>';
                            html += '<td class="tb2_td2">';
                            html += '<a href="#"><img style="width: 100px;height: 100px" src="<c:url value="/images/mobilephone/temporary/title.jpg"/>"></a> </td>';
                            html += '<td class="tb2_td3"> <p>牌号：'+item.MARK+'</p> <p>产地：'+item.PRODUCINGAREA+'</p> <p>';
                            html += '<label id="total_'+item.RN+'" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">'+item.PRICEHASTAX+'</label>元/'+item.MEA+' </p>';
                            html += '<input type="hidden" value="'+item.CARTID+'" id="cart_'+item.CARTID+'">';
                            html += '<input type="hidden" value="'+item.STOCKID+'" id="stock_'+item.STOCKID+'"> <p>';
                            html += '<input id="min_'+item.RN+'" name="" style=" width:20px; height:26px;border:1px solid #ccc;" type="button" value="-">';
                            html += '<input id="text_box_'+item.RN+'" name="" type="text" value="'+item.AFFIRMNUM+'" style=" width:30px; text-align:center; border:1px solid #ccc;">';
                            html += '<input id="add_'+item.RN+'" name="" style=" width:20px; height:26px;border:1px solid #ccc;" type="button" value="+"> </p> </td>';
                            html += '<td class="tb1_td7"> <div class="gwjs-1-4">';
                            html += '<button type="button" class="but1" id="del_'+item.CARTID+'"></button> </div> </td>';
                            html += '</tr>';
//                            html += '</tr></tbody></table>';
                        });
                        $('#content_cart').html(html);
                    }
                });
            });
        </c:forEach>
    });
    </script>
</head>

<body>
<div class="zhongti">
    <!--头部-->
    <jsp:include page="../navigation.jsp"></jsp:include>
    <div class="gwc" style=" margin:auto;">
        <form method="post" id="form" action="/BiGeZaiXian/order/toCartOrder">
            <input type="hidden" name="num" value="" id="num">
            <input type="hidden" name="cartId_checked" value="" id="cartId_checked">
            <input type="hidden" name="stockId_checked" value="" id="stockId_checked">
            <input type="hidden" name="cartId_unchecked" value="" id="cartId_unchecked">
            <input type="hidden" name="stockId_unchecked" value="" id="stockId_unchecked">
        </form>
        <!---商品加减算总数---->
        <script>
         <c:forEach items="${cartList}" var="item">
            $(function () {
                var t = $("#text_box_${item.RN}");
                $("#add_${item.RN}").click(function () {
                    t.val(parseInt(t.val()) + 1)
                    setTotal();
                    GetCount();
                })
                $("#min_${item.RN}").click(function () {
                    t.val(parseInt(t.val()) - 1)
                    setTotal(); GetCount();
                })
                function setTotal() {
                    $("#total_${item.RN}").html((parseInt(t.val()) * ${item.PRICEHASTAX}).toFixed(2));
                    $("#newslist_${item.RN}").val(parseInt(t.val()) * ${item.PRICEHASTAX});
                }
                setTotal();
            })
         </c:forEach>
        </script>

        <table cellpadding="0" cellspacing="0" class="gwc_tb2">
            <div >
            <tbody id="content_cart">
            <c:forEach items="${cartList}" var="item">

            <tr>
                <td class="tb2_td1">
                    <input type="checkbox" value="" name="newslist" id="newslist_${item.RN}">
                </td>
                <td class="tb2_td2">
                    <a href="#"><img style="width: 100px;height: 100px" src="<c:url value="/images/mobilephone/temporary/title.jpg"/>"></a>
                </td>
                <td class="tb2_td3">
                    <p>牌号：${item.MARK}</p>
                    <p>产地：${item.PRODUCINGAREA}</p>
                    <p>
                        <label id="total_${item.RN}" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">${item.PRICEHASTAX}</label>元/${item.MEA}
                    </p>
                    <input type="hidden" value="${item.CARTID}" id="cart_${item.CARTID}">
                    <input type="hidden" value="${item.STOCKID}" id="stock_${item.STOCKID}">
                    <p>
                        <input id="min_${item.RN}" name="" style=" width:20px; height:26px;border:1px solid #ccc;" type="button" value="-">
                        <input id="text_box_${item.RN}" name="" type="text" value="${item.AFFIRMNUM}" style=" width:30px; text-align:center; border:1px solid #ccc;">
                        <input id="add_${item.RN}" name="" style=" width:20px; height:26px;border:1px solid #ccc;" type="button" value="+">
                    </p>

                </td>
                <td class="tb1_td7">
                    <div class="gwjs-1-4">
                        <button type="button" class="but1" id="del_${item.CARTID}"></button>
                    </div>
                </td>
            </tr>

            </c:forEach>
            </tbody>
            </div>
        </table>

        <!---总数---->
        <script>
            $(function () {
                $(".quanxun").click(function () {
                    setTotal();
                    //alert($(lens[0]).text());
                });
                function setTotal() {
                    var len = $(".tot");
                    var num = 0;
                    for (var i = 0; i < len.length; i++) {
                        num = parseInt(num) + parseInt($(len[i]).text());

                    }
                    //alert(len.length);
                    $("#zong1").text(parseInt(num).toFixed(2));
                    $("#shuliang").text(len.length);
                }
                //setTotal();
            })
        </script>
        <table cellpadding="0" cellspacing="0" class="gwc_tb3">
            <tbody>
                <tr>
                    <td class="tb1_td1"><input id="checkAll" class="allselect" type="checkbox"></td>
                    <td class="tb1_td1">全选</td>
                    <td class="tb3_td2">已选商品
                        <label id="shuliang" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label>
                        件</td>
                    <td class="tb3_td3">合计(含税):<span>￥</span><span style=" color:#ff5500;">
                        <label id="zong1" style="color:#ff5500;font-size:14px; font-weight:bold;"></label>
                        </span></td>
                    <td class="tb3_td4">
                        <span id="jz1">下单</span>
                        <button style=" display:none;" class="jz2" id="jz2">下单</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--底部-->
    <jsp:include page="../footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
    $(function () {
        $("input[name='hobby']").click(function () {
            $("input[name='hobby']:checked").length == $("input[name='hobby']").length ? $("#checkAll").attr("checked", true) : $("#checkAll").attr("checked", false);
        });
        $("#checkAll").click(function () {
//            $("input[name='hobby']").attr("checked", this.checked);
            $('[name=hobby]:checkbox').attr('checked',this.checked);/*checked为true时为默认显示的状态*/
        });

    });
</script>
</body>
</html>

