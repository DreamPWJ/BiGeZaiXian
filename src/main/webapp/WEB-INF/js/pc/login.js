$(function () {
    //注册成功提示
    if ($("#tiptool").length > 0) {
        $("#tiptool").slideDown(800);
        setTimeout(function () {
            $("#tiptool").slideUp(800);
        }, 4000)
    }
  /*   用户名获取失去焦点动画*/
/*    $("#loginname").focus(function(){
        $("#secret-hand-right").css({'animation': 'secret-animation-right 0.8s ','animation-fill-mode': 'forwards'});
        $("#secret-hand-left").css({'transform': 'translate(50px,-48px) scale(1.2)' ,'transition': 'all 0.8s'});
    }).blur(function(){
        $("#secret-hand-right").css({'animation': ''});
        $("#secret-hand-left").css({'transform': 'translate(0,0) scale(1)','transition': 'all 0s'});
    });*/
    /*   密码获取失去焦点动画*/
/*    $("#password").focus(function(){
        $("#secret-hand-left").css({'animation': 'secret-animation-left 0.8s ' , 'animation-fill-mode': 'forwards'});
        $("#secret-hand-right").css({'animation': 'secret-animation-right 0.8s ','animation-fill-mode': 'forwards'});
    }).blur(function(){
        $("#secret-hand-left").css({'animation': ''});
        $("#secret-hand-right").css({'animation': ''});
    })*/
});