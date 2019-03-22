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


    <title> </title>

    <!-- Bootstrap -->
    <link href="${path}/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${path}/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${path}/css/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${path}/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="${path}/css/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="${path}/css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${path}/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${path}/css/build/css/custom.css" rel="stylesheet">

    <style>

    </style>
</head>

<body class="nav-md">
<div class="container body">
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
                    <h2>图表管理 </h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="table-responsive">
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                            <tr class="headings">
                                <th>
                                    <input type="checkbox" id="check-all" class="flat">
                                </th>
                                <th class="column-title">标题 </th>
                                <th class="column-title">图表</th>
                                <th class="column-title">添加时间</th>
                                <th class="column-title no-link last"><span class="nobr">编辑</span>
                                </th>
                                <th class="bulk-actions" colspan="6">
                                    <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- <volist name="a_list" id="vo"> -->
                            <c:forEach items="${chart }" var="vo">
                                <tr class="even pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">${vo.title}</td>
                                    <c:forEach items="${vo.userList }" var="co">
                                    <td class=" "><img src="${path}/images/chart/${co.img}" alt="" height="40px" style="cursor: pointer;"></td>
                                    </c:forEach>
                                    <td class=" ">${vo.editTime}</td>
                                    <td class=" last">
                                        <a href="${path}/YzTargetSort1/addChart.do?id=${vo.id}&tid=${id }&sort=${sort }"><i class="fa fa-eye">修改</i></a>
                                        <a href="${path}/YzTargetSort1/delectYzTarget.do?id=${vo.id}&tid=${id }&sort=${sort }"><i class="fa fa-trash">删除</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="x_content">
                          <button type="button" class="btn btn-success add" onclick="window.location='${path}/YzTargetSort1/addChart.do?tid=${id }&sort=${sort }'">添加图表</button>
                        <button type="button" class="btn btn-success add" onclick="window.location='${path}/YzTargetSort1/pageConfig.do?id=${id }&sort=${sort }'">页面配置</button>
                        <button type="button" class="btn btn-primary" onclick="window.location='${path}/YzTargetSort1/listYzTargetSort.do?sort=${sort }'">返回</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->
    <!-- footer content -->
    <footer>

    </footer>
    <!-- /footer content -->
</div>


<!-- jQuery -->
<script src="${path}/css/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${path}/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${path}/css/vendors/iCheck/icheck.min.js"></script>
<!-- Parsley -->
<script src="${path}/css/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="${path}/css/build/js/custom.js"></script>


</body>
</html>
