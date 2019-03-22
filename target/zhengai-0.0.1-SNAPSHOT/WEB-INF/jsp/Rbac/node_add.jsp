<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>

<!DOCTYPE html>
<html lang="en">
<c:set var="path" value="${pageCotext.request.contextPath }"></c:set>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>权限管理 </title>
    <!-- Bootstrap -->
    <!-- <link href="__ROOT__/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"> 
    	<link href="${pageCotext.request.contextPath }/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <!-- Font Awesome -->
    	<!--<link href="${pageCotext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" >
    	<link href="${pageCotext.request.contextPath}/js/jquery.autocompleter/jquery.autocompleter.css" rel="stylesheet">
     <link href="__ROOT__/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"> 
    <link href="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.css" rel="stylesheet">-->
    
    <!-- Custom Theme Style -->
    <!-- iCheck -->
    <!--<link href="${pageCotext.request.contextPath}/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="${pageCotext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
     <link href="__ROOT__/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="__ROOT__/build/css/custom.min.css" rel="stylesheet"> -->
    
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/js/jquery.autocompleter/jquery.autocompleter.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/build/css/custom.css" rel="stylesheet">
  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/baiduedit.css" />
    
    
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/custom.css" rel="stylesheet" type="text/css">
    <%-- <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css"> --%>
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/css/nprogress.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/green.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath }/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" type="text/css">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" type="text/css"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/build/css/node.css" rel="stylesheet" type="text/css">
	

  </head>
  
 <script type="text/javascript">
  
  		function save(){
  			if($("#name").val()=="" && $("#remark").val()=="" && $("#id").val()==""){
  				alert("名称与备注至少有一样要填写");
  				return false;
  			}else{
  				$("#name").val();
  			
  				$("#remark").val();
  		
  				$("#id").val();
  			}
  		}

  </script> 
  


<body class="nav-md">
<div class="container body">
    <div class="main_container">
       <jsp:include page="/Index/left.do"></jsp:include>
       <%@ include file="../Public/top.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>
                        <%if( request.getParameter("id")!=null){
                    	   %> 
                    	   <%="节点修改"  %>
                      <% }else{ %> 
                    	  <%="节点添加"  %>
                     <% }%>
                        
                         <small>提示信息</small></h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left "   novalidate="" method="post"  action="${pageContext.request.contextPath }/Rbac/importnode.do">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">名称</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="name" id="name" class="form-control" placeholder="请输入.." value="${role.name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="remark" id="remark" class="form-control" placeholder="请输入.." value="${role.remark}">
                                </div>
                            </div>

                            <input type="hidden" value="${role.id}" name="id" id="id">
                            <input type="hidden" value="${role.pid}" name="pid" id="pid">
                            <input type="hidden" value="${role.level}" name="level" id="level">
                            <div class="ln_solid"></div>

                            <div class="x_content">
                                <button type="submit" class="btn btn-success" onclick="save()">提交</button>
                                <button type="button" class="btn btn-success" onclick="window.location.href='${pageContext.request.contextPath }/Rbac/node.do'">返回</button>
                            </div>
                        </form>
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
    var pid = '{$id}';
</script>
<!-- jQuery 
<script src="${pageCotext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>-->
<!-- <script src="__ROOT__/vendors/jquery/dist/jquery.min.js"></script> -->
<!-- Bootstrap -->
<!--<script src="${pageCotext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageCotext.request.contextPath}/js/jquery.autocompleter/jquery.autocompleter.js"></script>
<script src="__ROOT__/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.js"></script>  -->
<!-- Bootstrap Colorpicker -->
<!-- Custom Theme Scripts -->
<!--<script src="${pageCotext.request.contextPath}/build/js/custom.js"></script>
<script src="${pageCotext.request.contextPath}/build/js/plan.js"></script>
 <script src="__ROOT__/build/js/custom.js"></script>
<script src="__ROOT__/build/js/plan.js"></script> -->
<!-- jQuery -->
    <script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
  <script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>
  <!--  <script src="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.js"></script>-->
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath }/css/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/css/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Custom Theme Scripts -->
     <script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script> 
     <!--<script src="${pageContext.request.contextPath }/css/build/js/plan.js"></script>-->

</body>
</html>
