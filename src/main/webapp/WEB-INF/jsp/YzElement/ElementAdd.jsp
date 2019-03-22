<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ include file="../../../js/taglibs.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>指标匹配管理 </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath }/css/vendors/animate.css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/build/css/custom.css" rel="stylesheet" type="text/css">
  <!-- --------------------------------------------------------------------------------------------------------- -->  

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- iCheck -->
<link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet" type="text/css">

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet" type="text/css">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/css/nprogress.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/build/css/custom.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath }/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" type="text/css">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" type="text/css">
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/fonts/fontawesome-webfont.ttf?v=4.6.3" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/fonts/fontawesome-webfont.woff?v=4.6.3" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/fonts/fontawesome-webfont.woff2?v=4.6.3" rel="stylesheet" type="text/css">
    <link  href="${pageContext.request.contextPath }/css/baiduedit.css" rel="stylesheet" type="text/css" >
    <!-- ztree -->
	
    <!-- Custom Theme Style -->
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>


</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- <include file="Public/left" /> -->
         <jsp:include page="/Index/left.do"></jsp:include>
        <!-- top navigation -->
       <!--  <include file="Public/top" /> -->
        <%@ include file="../Public/top.jsp" %>

        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <!--<div class="x_title">-->
                    <!--<h2>教师管理 </h2>-->
                    <!--<div class="clearfix"></div>-->
                    <!--</div>-->
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <h3>指标匹配管理</h3>
                    </div>
                    <div  class="col-md-3 col-sm-4 col-xs-6">
                        <form class="form-horizontal form-label-left" action="__URL__/add" method="post" >
                            <div class="input-group">
                                <input class="form-control" type="text" name="key">
                                <input type="hidden" name="id" value="{$id}">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary">搜索</button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <div class="x_content">

                        <p>该模块可以让您对教师进行<code>查看</code>和<code>修改</code>设置</p>

                        <div class="table-responsive">
                            <table class="table table-striped jambo_table bulk_action">
                                <thead>
                                <tr class="headings">
                                    <th class="column-title" width="10%"></th>
                                    <th class="column-title">模板名称 </th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- <volist name="a_list" id="vo" key="k"> -->
                                <c:forEach items="${list }" var="vo">
                                    <tr>
                                        <td><input type="checkbox" name="view[]" value="${vo.id}" class="view_checkbox" <c:if test="${vo.juge==1 }">checked='checked'</c:if>> </td>
                                        <td>${vo.title}</td>
                                    </tr>
                                  
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                
                            </div>
                        </div>

                            <div class="x_content">
                            	<input type="hidden" name="e_id" id="eid" value="${id}">
                                <input type="hidden" name="s" id="s" value="${sort}"> 
                                <button type="submit" class="btn btn-success" onclick="save()">提交</button>
                                <button type="button" class="btn btn-primary" onclick="window.location.href='${path}/YzElement/listYzElement.do?sort=${sort}'">返回</button>
                            </div>
                        <!-- </form> -->
                    </div>
                </div>
            </div>
            <!-- /top tiles -->
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>

        </footer>
        <!-- /footer content -->
    </div>
</div>

<script>
    var URL = '__URL__';
</script>
<!-- jQuery -->
<script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath }/js/custom.js"></script>
   
    
<script>
   function save(){
	var groupCheckbox = $("input[name='view[]']");
	var pry='';
	var id=$("#eid").val();
	var sort=$("#s").val();
	for (var i = 0; i < groupCheckbox.length; i++) {
		if (groupCheckbox[i].checked) {
			var val = groupCheckbox[i].value;
			pry+=val+",";
		}	
	}
	var msg='是否确定提交数据！....';
	if(confirm(msg)==true){
		window.location.href='${path }/YzElement/addConfig.do?id='+id+'&juge='+pry+'&sort='+sort;
	}else{
		return false;
	}
    }
</script>
</body>
</html>
