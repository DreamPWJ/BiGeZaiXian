<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <jsp:include page="../top.jsp"></jsp:include>
  <link rel="stylesheet" type="text/css" href="<c:url value="/plugins/bootstrap/css/bootstrap.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/mobilephone/index/index.css"/>"/>
  <script type="text/javascript" src="<c:url value="/js/jquery-1.11.0.min.js"/>"></script>
  <link href="<c:url value="/css/mobilephone/editorCompanyAddress.css"/>" rel="stylesheet" type="text/css" >
  <script type="text/javascript" src="<c:url value="/plugins/bootstrap3-validation.js"/>"></script>
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
    });
  </script>
</head>

<body>
<div class="zhongti">
  <!--头部-->
  <jsp:include page="../navigation.jsp"></jsp:include>
  <!--头部隐藏菜单栏-->

  <!--联系人-->
  <form action="/BiGeZaiXian/user/editReceiptAddress?type=${type}" id="form" method="post">
    <div class="form-group">
      <label for="linkMan" class="col-sm-2 control-label">联系人</label>
      <div class="col-sm-6">
        <input id="linkMan" type="text" check-type="required" value="${address.LINKMAN}" placeholder="请填写联系人的姓名" class="text1" name="linkMan" />
      </div>
    </div>

    <div class="form-group">
      <label for="mobphone" class="col-sm-2 control-label">手机号码</label>
      <div class="col-sm-6">
        <input id="mobphone" type="text" check-type="required phone" value="${address.MOBPHONE}" placeholder="请填写常用的手机号" class="text1" name="mobphone" />
      </div>
    </div>

    <div class="form-group">
      <label for="postal" class="col-sm-2 control-label">邮政编码</label>
      <div class="col-sm-6">
        <input id="postal" type="text" check-type="required" value="${address.POSTAL}" placeholder="请填写正确的邮编" class="text1" name="postal" />
      </div>
    </div>


    <%--<div class="lxr">
      <div class="lxr-1">联系人：</div>
      <input type="text" check-type="required" value="${address.linkman}" placeholder="请填写联系人的姓名" class="text1" name="linkMan" />
      <div class="lxr-1">手机号码：</div>
      <input type="text" check-type="required phone" value="${address.mobphone}" placeholder="请填写常用的手机号" class="text1" name="mobphone" />
    </div>--%>
    <input type="hidden" id="name_province" value="" name="name_province"/>
    <input type="hidden" id="name_city" value="" name="name_city"/>
    <input type="hidden" id="name_county" value="" name="name_county"/>
    <input type="hidden" id="defaultAddress" value="" name="defaultAddress"/>
    <%--${type}--%>
    <input type="hidden" id="addressId" name="addressId" value="${type==1?0:address.ID}"/>
    <!--收货地址-->
    <div class="shdz">公司地址</div>

    <!--收货地址信息-->
    <div class="dzxx">
      <!--省份-->
      <div class="xiala">
        省份：&nbsp;&nbsp;&nbsp;
        <select class="sel" id="province">
            <c:choose>
              <c:when test="${type==2}">
                <option value='${address.PROVCODE}' selected >
                    ${address.PROVINCE}
                </option>
              </c:when>
              <c:otherwise>
                <option value='0' selected >
                  -请选择省份-
                </option>
              </c:otherwise>
            </c:choose>
          <c:forEach items="${provinceList}" var="item">
            <option value='${item.ID}'>${item.NAME}</option>
          </c:forEach>
        </select>
      </div>
      <!--城市-->
      <div class="xiala">
        城市：&nbsp;&nbsp;&nbsp;
        <select class="sel" id="city">
          <c:choose>
            <c:when test="${type==2}">
              <option value='${address.CITYCODE}' selected >
                  ${address.CITY}
              </option>
            </c:when>
            <c:otherwise>
              <option value='0' selected >
                -请选择城市-
              </option>
            </c:otherwise>
          </c:choose>
        </select>
      </div>
      <!--县区-->
      <div class="xiala">
        县区：&nbsp;&nbsp;&nbsp;
        <select class="sel" id="county">
          <c:choose>
            <c:when test="${type==2}">
              <option value='${address.COUNTYCODE}' selected >
                  ${address.COUNTY}
              </option>
            </c:when>
            <c:otherwise>
              <option value='0' selected >
                -请选择区县-
              </option>
            </c:otherwise>
          </c:choose>
        </select>
      </div>

    </div>
    <!--街道-->
    <div class="form-group">
      <label for="addressDetail" class="col-sm-2 control-label">街道</label>
      <div class="col-sm-6">
        <input type="xiala-1-3" check-type="required" value="${address.ADDRESS}" id="addressDetail" name="addressDetail" placeholder="&nbsp;&nbsp;&nbsp;如：国际金融中心1号楼B座12楼" class="text1" />
      </div>
    </div>

    <!--勾选默认地址-->
    <div class="form-group col-sm-6">
      <span style="font-size: large">设置为默认地址</span>
      <span style="vertical-align: middle">
        <input type="checkbox" style="width: 18px;height:18px;" id="addressMark" <c:if test="${address.ADDRDEFAULTCODE=='001'}">checked</c:if> />
      </span>
    </div>

    <!--保存地址-->
    <div class="tjkc">
      <div style="width:140px; height:40px; line-height:40px; margin:0 auto;">
        <button type="submit" class="tjkc-1" id="submit" >保&nbsp;存&nbsp;地&nbsp;址</button>
      </div>
      <h1 style="color: #990000;font-size: large">${msg_update}</h1>
    </div>
  </form>

  <!--底部-->
  <jsp:include page="../footer.jsp"></jsp:include>
</div>
<script type="">
  $("#province").change(function(){
    // 获取选中的值
    var provinceId = $("#province").val();
    $.ajax({
      type: 'GET',
      url: '/BiGeZaiXian/user/getAjaxCity?provinceId='+provinceId,
      dataType: 'json',
      success: function(data){
        $("#city").html("");
        var str = "";
        $.each(data, function(i, value) {
          str += "<option value='"+value.ID+"'>"+value.NAME+"</option>";
        });
        $("#city").append(str);
      }
    });
  });

  $("#city").change(function(){
    var cityId = $("#city").val();
    $.ajax({
      type: 'GET',
      url: '/BiGeZaiXian/user/getAjaxCounty?cityId='+cityId,
      dataType: 'json',
      success: function(data){
        $("#county").html("");
        var str = "";
        $.each(data, function(i, value) {
          str += "<option value='"+value.ID+"'>"+value.NAME+"</option>";
        });
        $("#county").append(str);
      }
    });
  });

  $(function(){
    $("form").validation();
    //表单提交验证
    $("button[type='submit']").on('click', function (event) {
      // 2.最后要调用 valid()方法。
      if ($("form").valid() == false) {
        return false;
      }
    });
    $("#submit").click(function(){
//      alert($("#province").find("option:selected").text());
      $("#name_province").attr("value",$("#province").find("option:selected").val());
      $("#name_city").attr("value",$("#city").find("option:selected").val());
      $("#name_county").attr("value",$("#county").find("option:selected").val());
      // 检查默认地址是否选中
      var isChecked = $("#addressMark").is(':checked')
      if(isChecked == false){
        $("#defaultAddress").val('002');
      }
      if(isChecked == true){
        $("#defaultAddress").val('001');
      }
//      alert($("#defaultAddress").val());
      $("#form").submit;
    });
  });
</script>
</body>

</html>

