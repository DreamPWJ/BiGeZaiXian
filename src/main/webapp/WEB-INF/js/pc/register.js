$(function () {
    //确认密码验证
    $("#userConfirmPwd").blur(function () {
        var confirmpassword = $(this).val();
        var password = $("#password").val();
        if (confirmpassword != password) {
            $("#onfirmpwdgroup").addClass("has-error");
            $(this).parent().after("<span class='help-block' id='valierr'>两次输入的密码不一致。</span>");
        } else {
            $("#onfirmpwdgroup").addClass("has-success");
            $(this).parent().next("span").find("valierr").remove();
        }

    })
    $("#btnRegister").click(function () {
        if (!$("#agreementcheck").prop("checked")) {
            alert("请同意比格在线平台用户注册协议！");
            return false;
        }
    })


    /* 用户指南提示框  立刻调用*/
    var toolTip =(function () {
        var flag = localStorage.getItem("guideToolTip")
        if (flag != 1) {
            $("#tooltip").show();
        }
        var nbP = $('.container p').length;
        var w = parseInt($('.container p').css("width"));
        var max = (nbP - 1) * w;
        $("ul li[data-num='1']").addClass('active');
        $('.step span').html('步骤 1');

        $('body').on('click', '.btn', function () {
            var margL = parseInt($('.slider-turn').css('margin-left'));
            var modulo = margL % w;
            if (-margL < max && modulo == 0) {
                margL -= w;

                $('.slider-turn').animate({
                    'margin-left': margL
                }, 300);
                $('ul li.active').addClass('true').removeClass('active');
                var x = -margL / w + 1;
                $('ul li[data-num="' + x + '"]').addClass('active');
                $('.step span').html("步骤 " + x);
            }
            else {
            }
        });

        $('body').on('click', '.close', function () {
            $('.container').animate({
                'opacity': 0
            }, 600);
            $("#tooltip").fadeOut(300);
            $('.container').animate({
                'top': -1500
            }, {
                duration: 2300,
                queue: false
            });
        });
        localStorage.setItem("guideToolTip", 1);
    })();

});