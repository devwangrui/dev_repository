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


    <title>权限管理 </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/jquery.autocompleter.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
    
    <script type="text/javascript">
    function getCheckedRoleId(){
    	
    	var result = "";
    	$("tr input:checked").each(function(){
    	      
    		result = result + $(this).val()+"," ;
    	});
    	
    	return result;
    }

    
    function getRID(){
    	
        var roleIds = getCheckedRoleId();
    	
    	$("#roleIds").val(roleIds);
    	alert("要分配的角色对应的序号是："+$("#roleIds").val()+" "+"点击确定可以完成角色分配");
    	
    }
    
    
    </script>


</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- <include file="Public/left" /> -->
        <jsp:include page="/Index/left.do"></jsp:include>
        <!-- top navigation -->
        <!-- <include file="Public/top" /> -->
        <%@ include file="../Public/top.jsp" %>

        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>配置角色 </h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <p>该模块可以让您对用户进行<code>配置角色</code>设置</p>
                        <form id="demo-form2"  method="post"  action="${pageContext.request.contextPath }/Teacher/updateUserRole.do">
                        <div class="table-responsive">
                            <table class="table table-striped jambo_table bulk_action">
                                <thead>
                                <tr class="headings">
                                    <th class="column-title">序号 </th>
                                    <th class="column-title">名称 </th>
                                    <th class="column-title">描述 </th>
                                    <th class="column-title no-link last"><span class="nobr">操作</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                               <!--  <volist name="a_list" id="vo" key="k"> -->
                               <c:forEach items="${allRole }" var="role" >
                                 
                                    <tr>
                                        <td>${role.id }</td>
                                        <td>${role.name }</td>
                                        <td>${role.remark }</td>
                                        <td>
                                            <input type="checkbox"  value="${role.id }" <c:if test="${role.option==1 }">checked</c:if>  >
                                        </td>
                                    </tr>
                                    
                                    </c:forEach>
                                <!-- </volist> -->
                                </tbody>
                            </table>
                        </div>
                        <input type="hidden" name="userId" value="${yzUser.id }">
                        <input type="hidden" name="roleIds" id= "roleIds">
                        <div class="x_content">
                            <button type="submit" onclick="getRID()" class="btn btn-success">提交</button>
                            <button type="button" class="btn btn-success" onclick="window.location='${pageContext.request.contextPath }/Teacher/listTeacher.do'">返回</button>
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
<!-- jQuery -->
<script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>


<!-- <script src="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.js"></script> -->
<!-- Bootstrap Colorpicker -->
<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>
<%-- <script src="${pageContext.request.contextPath }/css/build/js/plan.js"></script> --%>

</body>
</html>
