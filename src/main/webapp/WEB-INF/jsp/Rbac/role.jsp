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

  
    <title>推送方案 </title>
    
    
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/jquery.autocompleter.css" rel="stylesheet">
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

<script type="text/javascript">

function ok(id){
	  var fdel=window.confirm( "确定删除?");
	
      if (fdel){
    	  
    	  window.location.href="${pageContext.request.contextPath }/Rbac/role_delete.do?id="+id;
    	  
      } else {
    	  
    	  return false; 
    	  
    	  }
}

</script>


  </head>
<body class="nav-md">
    <div class="container body">
   <!--    <include file="Public/left" /> -->
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
                        <h2>角色管理 </h2>

                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">

                        <p>该模块可以让您对角色进行<code>查看</code>和<code>修改</code>设置</p>

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
                                  <!--<volist name="a_list" id="vo" key="k">-->
                                   <c:forEach items="${list }" var="p" varStatus="k">
                                    <tr>
                                       	<td>${k.count}</td>
                                        <td>${p.name}</td>
                                        <td>${p.remark}</td>
                                        <td>
                                            <input type="hidden" value="${p.id}" id="id" name="id">
                                            <a onclick="window.location.href='${pageContext.request.contextPath }/Rbac/role_add.do?id=${p.id }'"><i class="fa fa-eye" >修改</i></a>
                                            <a onclick="ok('${p.id }')"><i class="fa fa-trash">删除</i></a>
                                            <a onclick="window.location.href='${pageContext.request.contextPath }/Rbac/access.do?id=${p.id }'"><i class="fa fa-eye" >配置节点</i></a>
                                        </td>
                                    </tr>
                                  </c:forEach>
                               <!-- </volist>-->
                                </tbody>
                            </table>
                        </div>
                        <div class="x_content">
                            <button type="button" class="btn btn-success" onclick="window.location.href='${pageContext.request.contextPath }/Rbac/role_add.do'">添加</button>
                        </div>

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
    
  
    

    <script>var URL = '__URL__';</script>
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

