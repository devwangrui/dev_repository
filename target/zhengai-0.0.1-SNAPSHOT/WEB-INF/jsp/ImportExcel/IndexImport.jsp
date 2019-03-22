<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ include file="../../../js/taglibs.jsp" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>指标导入</title>

    <!-- Font Awesome -->
    <!-- NProgress -->
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
    <link href="${pageContext.request.contextPath }/css/green.css" rel="stylesheet" type="text/css">
	
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

    
<!-- ************************************************************************************************************************************* -->
<!-- 2018.11.22 上午9:00 前台编码 -->
 <script type="text/javascript">  
 $(function(){
	 var result = $("#result").val();
	 if(result!=null && result!=''){
		 alert(result);
	 }
 });
 
 function warning(){
	  alert("导入数据前请务必了解一下文件的格式要求--->确定")
	 var diag = new Dialog();
		diag.Width = 1050;
		diag.Height = 400;
		diag.ShowButtonRow=true;
		diag.Title = "导入数据前的格式要求";
		diag.URL = "${path}/images/war.png";
		diag.OKEvent = function(){
			diag.close();
			};
		diag.show();
 }

 /*导入数据*/

function importUsers(){

	/* var FormDatas=new FormData($("#form-article-add")[0]); */

	var fileName=$("#excelfile").val();
	//验证文件格式
	var suffix = fileName.substr(fileName.lastIndexOf("."));  
	if("" == fileName){  
    	alert("未选择需要导入的Excel文件！");  
    	return false;  
	}  
	if(".xls" != suffix && ".xlsx" != suffix ){  
    	alert("请选择Excel格式的文件并按照指定格式导入数据！");  
    	return false;  
	}else{
		$("#form-article-add").submit();
	}

/* 
	$.ajax({

		type:'post',

		url:"/excel/import.do",

		async : true,

		cache : false,

		contentType : false,

		processData : false,

		data:FormDatas,
		
		success: function(result){
			alert(result.message);
			},

		error : function(result){
			alert(result.message);
		},
		
	}); */
 }
</script>          
<!-- ************************************************************************************************************************************* -->
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <%-- <jsp:include page="/Index/left.do"></jsp:include>--%>
       <%@ include file="../Public/left.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>指标导入${hello} <small>提示信息</small></h2>
                        
                        <div class="clearfix"></div>
                    </div>
                     
                    <div class="x_content">
                   <input type="hidden" id ="result" value="${result }">
                        <form id="form-article-add" class="form-horizontal form-label-left " enctype="multipart/form-data" method="post"  action="${path }/excel/import.do">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">层面类别</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="sort"  >
                                        <option>请选择</option>
                                        <option value="1" >学校</option>
                                        <option value="2" >分院</option>
                                        <option value="3" >专业</option>
                                        <option value="4" >班级</option>
                                        <option value="7" >课程</option>
                                        <option value="5" >老师</option>
                                        <option value="6" >学生</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">excel</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="file" multiple name="excelfile" id="excelfile" class="form-control" onclick="warning()" accept="application/json" >
                                    <a id="show" href="${path }/images/tishi.png" target="_blank" onclick="window.open(this.href,'','width=255,height=255');return false"/></a>
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                    <button type="button" class="btn btn-default antoclose" onClick="cancel();" >返回</button>
                                     <button type="button" onclick="importUsers()" class="btn btn-success" >提交</button>
                                    <!-- <input type="submit" class="btn btn-success" onclick="importUsers()" value="提交"> -->
                                </div>
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


    <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
    
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath }/css/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/css/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Custom Theme Scripts -->
	 <script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>
    <script src="${pageContext.request.contextPath }/css/build/js/target.js"></script>
    <!-- echarts -->
    <script src="${pageContext.request.contextPath }/js/echarts.common.min.js"></script>
<script src="${pageContext.request.contextPath }/css/vendors/echarts/map/js/world.js"></script>    

</body>
</html>
