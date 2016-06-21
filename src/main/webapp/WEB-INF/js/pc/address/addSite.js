/*增加仓库地址js*/
$(document).ready(function () {

    // 省市下拉框选择改变触发事件
    $("#provcode").change(function () {
        getCitysByProvince($(this).val());
    })

    // 城市下拉框选择改变触发事件
    $("#citycode").change(function () {
        getDistrictsByCity($(this).val());

    })


    /**
     * 根据省市查找单位下的城市
     *
     */
    function getCitysByProvince(provinceId) {
        if (provinceId == "") {// 没有选择时
            $('#citycode').empty();
            $('#countycode').empty();
            return;
        }

        $.ajax({
            type: "GET",
            url: "/BiGeZaiXian/address/getCitysByProvince",
            data: {
                "provinceId": provinceId
            },
            dataType: "json",
            success: function (data) {
                $('#citycode').empty(); // 清空select里面的所有内容
                var html = '';
                $.each(data, function (index, value) {
                    html += '<option  value =' + value.ID + '>'
                        + value.NAME + '</option>';
                });
                $('#citycode').html(html);
                getDistrictsByCity($("#citycode option:selected").val());
            },
            error: function () {
                alert("请求失败！");

            }
        });
    }

    /**
     * 根据城市查找其所属的区县
     *
     */
    function getDistrictsByCity(cityId) {
        $.ajax({
            type: "GET",
            url: "/BiGeZaiXian/address/getDistrictsByCity",
            data: {
                "cityId": cityId
            },
            dataType: "json",
            success: function (data) {
                $('#countycode').empty(); // 清空select里面的所有内容
                var html = '';
                $.each(data, function (index, value) {
                    html += '<option  value ='
                        + value.ID + '>' + value.NAME + '</option>';
                });
                $('#countycode').html(html);
            },
            error: function () {
                alert("请求失败！");
            }
        });

    }

})
