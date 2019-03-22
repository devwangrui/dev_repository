<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>教师管理</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/jquery.autocompleter.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/build/css/custom.css" rel="stylesheet">


</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
   <jsp:include page="/Index/left.do"></jsp:include>
       <!--  <include file="Public/left" /> -->
        <!-- top navigation -->
        <%@ include file="../Public/top.jsp" %>
        <!-- <include file="Public/top" /> -->

        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <!--<div class="x_title">-->
                        <!--<h2>æå¸ç®¡ç </h2>-->
                        <!--<div class="clearfix"></div>-->
                    <!--</div>-->
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <h3>教师管理</h3>
                    </div>
                    <div  class="col-md-3 col-sm-4 col-xs-6">
                        <form class="form-horizontal form-label-left" action="__URL__/index" method="post" >
                            <div class="input-group">
                                <input class="form-control" type="text" name="key">
                                <input type="hidden" name="s" value="1">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary">搜索</button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <div class="x_content">

                        <p>该模块可以让您对教师进行 <code>查看</code> 和 <code>修改</code>设置</p>

                        <div class="table-responsive">
                            <table class="table table-striped jambo_table bulk_action">
                                <thead>
                                <tr class="headings">

                                    <th class="column-title">序号 </th>
                                    <th class="column-title">工号 </th>
                                    <th class="column-title">姓名 </th>
                                    <th class="column-title no-link last"><span class="nobr">操作</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                              <!--   <volist name="a_list" id="vo" key="k"> -->
                              <c:forEach items="${page.list }" var="user" varStatus="index">
                                    <tr>
                                        <td>${user.id }</td>
                                        <td>${user.username }</td>
                                        <td>${user.name }</td>
                                        <td>
                                            <input type="hidden" value="${user.id }">
                                            <a href="${pageContext.request.contextPath }/Teacher/listRole.do?id=${user.id }"><i class="fa fa-eye">配置角色</i></a>
                                            <a href="${pageContext.request.contextPath }/Teacher/listElement.do?id=${user.id }"><i class="fa fa-eye">配置部门</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                               <!--  </volist> -->
                                </tbody>
                            </table>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <%@ include file="../tools/paging.jsp" %>
                            </div>
                        </div>
                        <div class="x_content">
                            <!--<button type="button" class="btn btn-success" onclick="window.location.href='__URL__/role_add/'">æ·»å </button>-->
                            <!--<button type="button" class="btn btn-success" onclick="window.location.href='__URL__/sys/'">åæ­¥æå¸ä¿¡æ¯</button>-->
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
