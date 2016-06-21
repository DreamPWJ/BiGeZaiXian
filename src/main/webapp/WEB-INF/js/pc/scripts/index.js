// 初始化
$(function(){
    $("#xnav_li_detail").show();
  $("#xnav_li_1").removeClass("xnav_li");
  $("#xarrow").removeClass("xarrow");
  $("#xnav_li_detail").hide();
})

// 购物车
$(function(){
  $("#xcar_bg").mouseenter(function(){
    $("#xcar_bg").hide();
    $("#xcar_sel").show();
  })
  $("#xcar_sel").mouseleave(function(){
    $("#xcar_bg").show();
    $("#xcar_sel").hide();
  })
})

// nav
$(function(){
  $("#xnav_li_1").mouseenter(function(){
    $("#xnav_li_1").addClass("xnav_li");
    $("#xarrow").addClass("xarrow");
    $("#xnav_li_detail").show();
  })
  $("#xnav_li_detail").mouseleave(function(){
    $("#xnav_li_1").removeClass("xnav_li");
    $("#xarrow").removeClass("xarrow");
    $("#xnav_li_detail").hide();
  })
})
