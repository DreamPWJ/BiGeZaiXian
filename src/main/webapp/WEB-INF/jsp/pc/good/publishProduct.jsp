<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商品发布 - 比格在线</title>
    <link rel="shortcut icon" href="<c:url value='/images/pc/A_public/miniLogo.png'/>" type="image/x-icon"/>
    <link href="<c:url value='/css/pc/A_public/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/A_public/base.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/plugins/select2/select2_conquer.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/css/pc/publishProduct.css'/>" rel="stylesheet" type="text/css">

</head>

<body>
<%-- 头部公共div--%>
<%@ include file="../A_public/top.jsp" %>
<!-- content ----------- begin -->
<div class="content">
    <div class="container_25">
        <div class="grid_25"></div>
        <div class="grid_5">
            <%@ include file="../A_public/accountSideMenu.jsp" %>
        </div>
        <div class="grid_20">
            <div class="rightcon">
                <div class="uibox">
                    <div class="uibox-head">
                        <h1 class="titbase displine">商品入库
                            <c:if test="${sessionScope.get('companyID')==0||sessionScope.get('companyID')==null||!msg}">
                       <span><a id="it-tip" href="<c:url value='/account/toattachment' />">请您上传三证，通过公司审核后才能发布商品！</a>
                           </span></c:if>
                        </h1>
                    </div>
                    <div class="uibox-order">
                        <div class="formsendcon-f" id="con">

                            <div class="uibox-con">
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <form action="<c:url value='/good/saveGood'/>"
                                          class="form-horizontal" method="post" enctype="multipart/form-data">
                                        <div class="form-body">
                                            <div class="row">
                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">品种</label>

                                                        <div class="col-md-5">
                                                            <select id="goodkindcode" name="goodkindcode"
                                                                    class="form-control  chosen-select"  <%--multiple="multiple"--%>>

                                                                <c:forEach items="${goodKindCode}" var="item">
                                                                    disabled
                                                                    <c:if test="${item.LEVE==1}">
                                                                        <option value="${item.LEVELCODE}"
                                                                                disabled>${item.NAME}</option>
                                                                    </c:if>
                                                                    <c:if test="${item.LEVE==2}">
                                                                        <option value="${item.LEVELCODE}"
                                                                                disabled class="select2-disabled2">
                                                                                ${item.NAME}</option>
                                                                    </c:if>
                                                                    <c:if test="${item.LEVE==3}">
                                                                        <option value="${item.LEVELCODE}">${item.NAME}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>

                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">牌号</label>

                                                        <div class="col-md-5">
                                                            <input name="mark"
                                                                   class="form-control placeholder-no-fix"
                                                                   autocomplete="on"
                                                                   placeholder="必填项"
                                                                   check-type="required"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">用途级别</label>

                                                        <div class="col-md-5">
                                                            <select id="usecode" name="usecode"
                                                                    class="chosen-select form-control">
                                                                <c:forEach items="${useCode}" var="item">
                                                                    <option value="${item.LEVELCODE}">${item.NAME}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">产地</label>

                                                        <div class="col-md-5">
                                                            <input name="producingarea"
                                                                   class="form-control placeholder-no-fix"
                                                                   autocomplete="on"
                                                                   placeholder="必填项"
                                                                   check-type="required"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">生产商</label>

                                                        <div class="col-md-5">
                                                            <input name="producer"
                                                                   class="form-control placeholder-no-fix"
                                                                   autocomplete="on"
                                                                   placeholder="必填项"
                                                                   check-type="required"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">包装类型</label>

                                                        <div class="col-md-5">
                                                            <select id="packtypecode" name="packtypecode"
                                                                    class="chosen-select form-control">
                                                                <c:forEach items="${packTypeCode}" var="item">
                                                                    <option value="${item.LEVELCODE}">${item.NAME}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">包装说明</label>

                                                        <div class="col-md-5">
                                                            <select id="packcontent" name="packcontent"
                                                                    class="chosen-select form-control">
                                                                <c:forEach items="${packContent}" var="item">
                                                                    <option value="${item.LEVELCODE}">${item.NAME}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--/span-->
                                                <%--          <div class="col-md-12">
                                                              <div class="form-group">
                                                                  <label class="control-label col-md-3">包装单位</label>

                                                                  <div class="col-md-5">
                                                                      <select id="packagecode" name="packagecode"
                                                                              class="chosen-select form-control">
                                                                          <c:forEach items="${packageCode}" var="item">
                                                                              <option value="${item.LEVELCODE}">${item.NAME}</option>
                                                                          </c:forEach>
                                                                      </select>
                                                                  </div>
                                                              </div>
                                                          </div>--%>
                                                <!--/span-->
                                                <!--/span-->
                                                <%--             <div class="col-md-12">
                                                                 <div class="form-group">
                                                                     <label class="control-label col-md-3">换算关系</label>

                                                                     <div class="col-md-5">
                                                                         <input name="convertnum"
                                                                                class="form-control placeholder-no-fix"
                                                                                autocomplete="on"
                                                                                placeholder="必填项"
                                                                                check-type="required"/>
                                                                     </div>
                                                                 </div>
                                                             </div>--%>
                                                <!--/span-->

                                                <!--商品图片预览-->
                                                <div class="col-md-12">
                                                    <label class="control-label col-md-3 "></label>

                                                    <div id="imagepreview" class="col-md-5"></div>
                                                </div>
                                                <!--商品图片上传-->
                                                <div class="col-md-12  input-bottom">
                                                    <label class="control-label col-md-3">商品图片</label>

                                                    <div class="col-md-5"><a href="javascript:void (0);" class="file"
                                                                             style="color:#ffffff">上传图片
                                                        <input id="img" type="file" name="filepic"/>
                                                    </a></div>

                                                </div>

                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">描述</label>

                                                        <div class="col-md-5">
                                                            <input id="content" name="content"
                                                                   class="form-control placeholder-no-fix"
                                                                    />
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->

                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">仓库地址</label>

                                                        <div class="col-md-5">
                                                            <select id="storageid" name="storageid"
                                                                    class="chosen-select form-control">
                                                                <c:forEach items="${storage}" var="item">
                                                                    <option value="${item.ID}">${item.NAME}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">税率</label>

                                                        <div class="col-md-5">
                                                            <input name="rate"
                                                                   class="form-control placeholder-no-fix"
                                                                   autocomplete="on"
                                                                   placeholder="必填项"
                                                                   check-type="required number"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">入库数量</label>

                                                        <div class="col-md-5">
                                                            <input name="initnum"
                                                                   class="form-control placeholder-no-fix"
                                                                   autocomplete="on"
                                                                   placeholder="必填项"
                                                                   check-type="required number"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->

                                                <!--/span-->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-3">计量单位</label>

                                                        <div class="col-md-5">
                                                            <select id="meacode" name="meacode"
                                                                    class="chosen-select form-control">
                                                                <c:forEach items="${meaCode}" var="item">
                                                                    <option value="${item.LEVELCODE}">${item.NAME}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>

                                        </div>

                                        <div class="col-md-11 input-bottom">
                                            <button id="collectionSave" type="submit"
                                                    class="btn btn-info "  style="background-color:#1CAAEB"
                                                    <c:if test="${sessionScope.get('companyID')==0||!msg}">disabled</c:if>>
                                                保存
                                            </button>
                                        </div>

                                    </form>
                                    <!-- END FORM-->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:if test="${success}">
    <div id="tiptool">发布成功</div>
</c:if>

<!-- content ----------- end -->
<%-- 底部公共div--%>
<%@ include file="../A_public/foot.jsp" %>

</div>
</body>
</html>

<script src="<c:url value='/js/pc/A_public/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/plugins/app.js'/>" type="text/javascript"></script>
<script src="<c:url value='/plugins/select2/select2.min.js'/> " type="text/javascript"></script>
<script src="<c:url value='/js/commonUtil.js'/> " type="text/javascript"></script>

<script type="text/javascript">

    $(function () {
        $(".chosen-select").select2({
            /*   placeholder: "必填项"*/
        });
        //上传图片预览方法
        $('#img').change(function () {
            var file = this.files[0]; //选择上传的文件
            var r = new FileReader();
            r.readAsDataURL(file); //Base64
            $(r).load(function () {
                $('#imagepreview').html('<img src="' + this.result + '" width="120px" height="120px" alt="商品图片" />');
            });
        });
        //发布成功提示
        if ($("#tiptool").length > 0) {
            $("#tiptool").slideDown(800);
            setTimeout(function () {
                $("#tiptool").slideUp(800);
            }, 3000)
        }

    });

</script>

