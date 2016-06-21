$(function () {
    var surplusnum;//库存剩余数量
    var sellsurplusnum;//在售数量
    /**
     * 添加库存点击事件
     */

    $("a[type='addStock'],a[type='putaway'],button[type='outofStock']").click(function () {
        getStorageAndGood($(this));
    })


    /**
     * 添加库存添加保存按钮
     */
    $("#saveStock,#savePutaway,#saveoutofStock").click(function () {
        saveStock($(this));
    })

    /**
     * 库存明细 上架明细
     */
    $("a[type='stockDetail'],a[type='putawayDetail']").click(function () {
        getStockDetail($(this));
    })
    /**
     * 下架明细
     */
    $("button[type='outofStockDetail']").click(function () {
        getOutStockDetail($(this));
    })

/**
 * 弹出框关闭按钮后 刷新页面
 */
$("#closeSaveStock,#closePutaway,#closeoutofStock").click(function () {
    window.location.reload();//刷新当前页面.
})

})

/**
 * 添加库存获取商品仓库信息
 */

function getStorageAndGood(obj) {
    var storageId = obj.siblings("input.storageId").val();
    var storageName = obj.parent().siblings("td.storageName").find("a").text();
    if (obj.attr("type") == 'addStock') {
        $("#storageId").val(storageId);
        $("#storageName").text(storageName);
    }
    if (obj.attr("type") == 'putaway') {
        var meaname = $("#meaname").text();
        surplusnum = obj.parent().siblings("td.surplusnum").text();
        $("#putawaystorageId").val(storageId);
        $("#putawaystorageName").text(storageName);
        $("#surplusnum").text(surplusnum + meaname);
        $("#putawayInitNum").attr("placeholder", "现有库存剩余 " + surplusnum + meaname);
    }
    if (obj.attr("type") == 'outofStock') {
        //待优化
        var parent = obj.parent();
        var pricehastax = parent.siblings("td.pricehastax").text();
        $(".outofstockpage .mark").text(parent.siblings("td.mark").text());
        $(".outofstockpage .goodkindname").text(parent.siblings("td.goodkindname").text());
        $(".outofstockpage .producer").text(parent.siblings("td.producer").text());
        $(".outofstockpage .pricehastax").text(pricehastax);
        sellsurplusnum = parent.siblings("td.sellsurplusnum").text();
        $("#outofStockstorageName").text(parent.siblings("td.storagename").text());
        $("#outofStocksurplusnum").text(sellsurplusnum);
        $("#outofStockInitNum").attr("placeholder", "现有在售数量 " + sellsurplusnum);
        $("#pricehastax").val(removerThousands(pricehastax.replace("¥", "")));
    }

}


/**
 * 添加库存上架
 */
function saveStock(obj) {
    var typeid = obj.attr("id");
    var flag;
    switch (typeid) {
        case  "saveStock":
            flag = "001";
            break;
        case  "savePutaway":
            flag = "002";
            break;
        case  "saveoutofStock":
            flag = "003";
            break;
    }

    var storageid;
    switch (flag) {
        case  "001":
            storageid = $("#storageId").val();
            break;
        case  "002":
            storageid = $("#putawaystorageId").val();
            break;
        case  "003":
            storageid = $("#outofStockstorageId").val();
            break;
    }

    var initnum;
    switch (flag) {
        case  "001":
            initnum = $("#initnum").val();
            break;
        case  "002":
            initnum = $("#putawayInitNum").val();
            break;
        case  "003":
            initnum = $("#outofStockInitNum").val();
            break;
    }

    if (flag == "002") {
        var putawayInitNum = $("#putawayInitNum").val();
        if (Number(surplusnum) < Number(putawayInitNum)) {
            alert("上架数量不能大于现有库存剩余数量！");
            return;
        }
    }

    if (flag == "003") {
        var outofStockInitNum = $("#outofStockInitNum").val();
        if (Number(sellsurplusnum) < Number(outofStockInitNum)) {
            alert("下架数量不能大于现有在售数量！");
            return;
        }
    }

    $.ajax({
        type: "GET",
        url: "/BiGeZaiXian/stock/addStock",
        cache: false,//不使用缓存
        data: {
            "goodid": $("#goodId").val(),
            "rate": $("#rate").val(),
            "storageid": storageid,
            "initnum": initnum,
            "pricehastax": $("#pricehastax").val(),
            "stockcode": flag
        },
        dataType: "json",
        success: function (data) {
            $('#stocdetinfo tbody').empty(); // 清空tbody里面的所有内容
            var html = "";
            $.each(data, function (index, item) {
                if (flag != "003") {
                    html += "<tr><td >"
                        + item.NAME
                        + " </td><td>"
                        + item.ADDRESS
                        + "</td><td>"
                        + item.INITNUM
                        + "</td><td>"
                        + ((typeof(item.AFFIRMNUM) == "undefined") ? "" : item.AFFIRMNUM)
                        + "</td><td>"
                        + ((typeof(item.SURPLUSNUM) == "undefined") ? "" : item.SURPLUSNUM)
                        + "</td><td>"
                        + ((typeof(item.SELLSURPLUSNUM) == "undefined") ? "" : item.SELLSURPLUSNUM)
                        + "</td><td>"
                        + ((typeof(item.SELLOUTNUM) == "undefined") ? "" : item.SELLOUTNUM)
                        + "</td><td> </td></tr>"
                }

                $('#stocdetinfo tbody').html(html);
            });

            switch (flag) {
                case  "001":
               /*   alert("添加库存成功！");*/
                    window.location.reload();
                    break;
                case  "002":
                   // alert("商品上架成功！");
                    window.location.reload();
                    break;
                case  "003":
                    alert("商品下架成功！");
                    window.location.reload();
                    break;
            }
        },

        error: function () {
            switch (flag) {
                case  "001":
                    alert("添加库存失败！");
                    break;
                case  "002":
                    alert("商品上架失败！");
                    break;
                case  "003":
                    alert("商品下架失败！");
                    break;
            }

        }
    });
}

/**
 * 库存上架明细
 */
function getStockDetail(obj) {
    var typeid = obj.attr("type");
    var flag = typeid == "stockDetail" ? true : false;
    var storageId = obj.siblings("input.storageId").val();
    var storageName = obj.parent().siblings("td.storageName").find("a").text();
    $("#detailname").text(flag ? "入库明细" : "上架明细");
    $("#storageNameDetail").text(storageName);
    $.ajax({
        type: "GET",
        url: "/BiGeZaiXian/stock/getStockDetail",
        cache: false,//不使用缓存
        data: {
            "goodid": $("#goodId").val(),
            "storageid": storageId,
            "stockcode": flag ? "001" : "002"
        },
        dataType: "json",
        success: function (data) {
            $('#stockDetail tbody').empty(); // 清空tbody里面的所有内容
            var html = "";
            $.each(data, function (index, item) {
                html += "<tr><td >"
                    + new Date(item.CREATETIME).Format("yyyy-MM-dd hh:mm:ss")
                    + " </td><td>"
                    + item.CODENO
                    + "</td><td>"
                    + ((typeof(item.PRICEHASTAX) == "undefined") ? "" : "￥" + formatTothousands(item.PRICEHASTAX))
                    + "</td><td>"
                    + item.INITNUM
                    + "</td><td>"
                    + ((typeof(item.AFFIRMNUM) == "undefined") ? "" : item.AFFIRMNUM)
                    + "</td></tr>"
            });

            $('#stockDetail tbody').html(html);

        },
        error: function () {
            alert("查询失败！");
        }
    });
}

    /**
     * 下架明细
     */
    function getOutStockDetail(obj) {

        $.ajax({
            type: "GET",
            url: "/BiGeZaiXian/stock/getStockDetail",
            cache: false,//不使用缓存
            data: {
                "goodid": $("#goodId").val(),
                "storageid": $("#outofStockstorageId").val(),
                "stockcode": "003"
            },
            dataType: "json",
            success: function (data) {
                $('#stockDetail tbody').empty(); // 清空tbody里面的所有内容
                var html = "";
                $.each(data, function (index, item) {
                    html += "<tr><td >"
                        + new Date(item.CREATETIME).Format("yyyy-MM-dd hh:mm:ss")
                        + " </td><td>"
                        + item.CODENO
                        + "</td><td>"
                        + ((typeof(item.PRICEHASTAX) == "undefined") ? "" : "￥" + formatTothousands(item.PRICEHASTAX))
                        + "</td><td>"
                        + item.INITNUM
                        + "</td>></tr>"
                });

                $('#stockDetail tbody').html(html);

            },
            error: function () {
                alert("查询失败！");
            }
        });
    }

