//  window.Modal = function ()调用说明 
/* 四个选项都是可选参数
 Modal.alert(
 {
 msg: '内容',
 title: '标题',
 btnok: '确定',
 btncl:'取消'
 });

 如需增加回调函数，后面直接加 .on( function(e){} );
 点击“确定” e: true
 点击“取消” e: false
 Modal.confirm(
 {
 msg: "是否删除角色？"
 })
 .on( function (e) {
 alert("返回结果：" + e);
 });*/
/**
 * @author pwj  公共js代码
 */
$(function () {
    // js 重写 bootstrap 样式 alert/confirm 消息窗口
    // Modal放入window对象中
    window.Modal = function () {
        var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
        var alr = $("#ycf-alert");
        var ahtml = alr.html();		// 关闭时恢复 modal html 原样，供下次调用时 replace 用
        // var _init = function () {
        // alr.on("hidden.bs.modal", function (e) {
        // $(this).html(ahtml);
        // });
        // }();

        /* html 复原不在 _init() 里面做了，重复调用时会有问题，直接在 _alert/_confirm 里面做 */

        var _alert = function (options) {
            alr.html(ahtml); // 复原
            alr.find('.ok').removeClass('btn-success').addClass('btn-primary');
            alr.find('.cancel').hide();
            _dialog(options);

            return {
                on: function (callback) {
                    if (callback && callback instanceof Function) {
                        alr.find('.ok').click(function () {
                            callback(true)
                        });
                    }
                }
            };
        };

        var _confirm = function (options) {
            alr.html(ahtml); // 复原
            alr.find('.ok').removeClass('btn-primary').addClass('btn-success');
            alr.find('.cancel').show();
            _dialog(options);

            return {
                on: function (callback) {
                    if (callback && callback instanceof Function) {
                        alr.find('.ok').click(function () {
                            callback(true)
                        });
                        alr.find('.cancel').click(function () {
                            callback(false)
                        });
                    }
                }
            };
        };

        var _dialog = function (options) {
            var ops = {
                msg: "提示内容",
                title: "操作提示",
                btnok: "确定",
                btncl: "取消"
            };

            $.extend(ops, options);

            console.log(alr);

            var html = alr.html().replace(reg, function (node, key) {
                return {
                    Title: ops.title,
                    Message: ops.msg,
                    BtnOk: ops.btnok,
                    BtnCancel: ops.btncl
                }[key];
            });

            alr.html(html);
            alr.modal({
                width: 500,
                backdrop: 'static'
            });
        }

        return {
            alert: _alert,
            confirm: _confirm
        }

    };

    /**
     * 格式化数字,金额千分位格式  jsp有自己千分位格式化  用于js处理数据的
     */
    window.formatTothousands = function (num) {
        return (num.toFixed(2) + '')
            .replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');

    }
    /**
     * js处理数据去除千分位格式转成数字
     */
    window.removerThousands = function (num) {
        var x = num.split(',');
        return parseFloat(x.join(""));
    }


    /**
     * js获取url ?后面的参数项的值  传入key的到value
     * @param name
     * @returns {null}
     */
    window.getQueryString= function (name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }

    /** 在js里面格式化日期
     *对Date的扩展，将 Date 转化为指定格式的String
     *月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
     *年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
     *例子：
     * (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
     * (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
     */
    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    /**
     *为了保证页面输出安全，防止XSS跨站攻击 我们经常需要对一些特殊的字符进行转义将<, >, &, "进行转义
     */
    function escapeHtml(str) {
        return str.replace(/[<>”&]/g, function (match) {
            switch (match) {
                case '<' :
                    return '<';
                case '>':
                    return '>';
                case '&' :
                    return '&';
                case ' \' ':
                    return '"';
            }
        });
    }

    try {
        $.getScript("/BiGeZaiXian/plugins/bootstrap3-validation.js").complete(function() {
            //表单验证
            $("form").validation(
                function () {

                },
                {reqmark: false});//false去除必填项的*号

            //表单提交验证
            $("input[type='submit'],button[type='submit']").on('click', function (event) {
                // 2.最后要调用 valid()方法。
                if ($("form").valid() == false) {
                    return false;
                }
            })
        })
    } catch (e) {
        console.error("比格在线jsp没有引入bootstrap3-validation.js文件!");
    }
    /**
     * 修改各浏览器全局alert样式统一
     */
    alertAll();
    function alertAll() {
        div = $('<div></div>');
        div.css({
            'background-color': '#1caaeb',
            'width': '400px',
            'height': '40px',
            'line-height': '40px',
            'position': 'fixed',
            'left': '0px',
            'left': '0px',
            'right': '0px',
            'margin': 'auto',
            'top': '1px',
            'z-index': '10000',
            'color': '#ffffff',
            'border-radius': '12px',
            'margin-bottom': '20px',
            'font-family': "微软雅黑",
            'font-size': '16px',
            'font-weight': 'bolder'
        });

        var btn = $('<span>×</span>').css({
            'position': 'relative',
            'right': '15px',
            'top': '0px!important',
            'cursor': 'pointer',
            'float': 'right',
            'font-size': '20px'
        });
        var span = $('<span><p  id="alert_content"></p></span>');
        span.css({"text-align": "center"})
        div.append(btn).append(span);
        div.hide();
        $("body").append(div);

        btn.click(function () {
            div.slideUp('300');
        });

        window.alert = function () {
            var str = ' '
            for (var i = 0; i < arguments.length; i++) {
                str += arguments[i] + ' ';
            }
            $("#alert_content").text(str);
            div.slideDown('300', function () {
                setTimeout(function () {
                    div.slideUp('slow');
                }, 5000);
            });
        }
    }
});


/**
 *
 *JqueryPagination公共分页代码块插件
 * 必须在页面没加载完成时加载执行
 * 需引入jquery.pagination-1.2.7.min.js 和jquery.pagination.css
 * html页面 如
 *       <div id="page" class="m-pagination pull-right"></div>
 *       <input type="hidden" id="totalcount" value="${totalcount}"/>
 *       <input type="hidden" id="urlpage" value="/BiGeZaiXian/mall/toMall" pagepoint="pagepoint"  />
 */
try {
    $.getScript("/BiGeZaiXian/plugins/JqueryPagination/jquery.pagination-1.2.7.min.js").complete(function(){
        JHWpage();
        });
} catch (e) {
    console.error("比格在线jsp没有引入jquery.pagination-1.2.7.min.js文件!");
}

function JHWpage() {
    var urlpage = $("#urlpage").val(); //获取请求url
    var pagepoint = "#" + $("#urlpage").attr("pagepoint") || "";//翻页定位锚点
    $("#page").page({
        total: $("#totalcount").val(),//获取总条数
        pageSize: $("#pageSize").val(),//每页显示数据条数
        firstBtnText: '首页',
        lastBtnText: '尾页',
        prevBtnText: '上一页',
        nextBtnText: '下一页',
        showInfo: true,
        infoFormat: '共{total}条'
    });
    $("#page").on("pageClicked", function (event, pageIndex) {//点击分页条查询
        var flag = urlpage.indexOf("?") == -1 ? "?" : "&";
        window.location.href = urlpage + flag + "pageIndex=" + (pageIndex + 1) + pagepoint;
    })

    //获取url链接 ?参数变量的值(截取等号后面的部分)
    var loc =getQueryString("pageIndex");
    //分页刷新后重新标记分页条的当前页数
    $(".m-pagination-page li").each(function (index) {
        if ($(this).children("a").text() == loc) {
            $(this).siblings().removeClass("active").end().addClass("active");
            return;
        }

    })


}

/**
 * 调试用的打印到浏览器console控制台信息的公共log方法  支持多参数和对象打印
 */

function log(){
    var args=Array.prototype.slice.call(arguments);//将arugments是个伪数组转化成标准数组
    args.unshift("比格在线控制台打印自定义log方法信息:");//数组unshift方法添加数组前缀
    console.log.apply(console,args);//多参数和对象打印
}