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
    
    <link href="${pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/green.css" rel="stylesheet" type="text/css">
     <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" type="text/css"/>
     <link href="${pageContext.request.contextPath }/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/nprogress.css" rel="stylesheet" type="text/css">
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
    <div class="main_container" >
       <!--  <include file="Public/left" /> -->
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
                    <!--<div class="x_title">-->
                    <!--<h2>教师管理 </h2>-->
                    <!--<div class="clearfix"></div>-->
                    <!--</div>-->
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <h3>指标匹配管理</h3>
                    </div>
                    <div  class="col-md-3 col-sm-4 col-xs-6">
                        <form class="form-horizontal form-label-left" action="${pageContext.request.contextPath }/YzElement/selectCondition.do " method="post" >
    <!-- -----          搜索框 -->
                            <div class="input-group">
                                <input class="form-control" type="text" name="title" value="${title }">
                                <input type="hidden" name="sort" value="${sort} ">
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
                                    <th class="column-title">序号 </th>
                                    <th class="column-title">部门 </th>
                                    <th class="column-title">部门人数 </th>
                                    <th class="column-title no-link last"><span class="nobr">操作</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- <volist name="a_list" id="vo" key="k"> ${empty str}-->
                                <c:forEach items="${page.list }" var="yzPor" varStatus="vs">
                                   
                                    <tr>
                                        <td>${vs.count }</td>
                                      
                                        <td>${yzPor.title }</td> 
                                        
                                        <td></td>
                                        <td>
                                            <input type="hidden" value="{$vo.id}">
                                            <a href="${path }/YzElement/configTemplete.do?id=${yzPor.id}&sort=${sort}"><i class="fa fa-eye">配置模板</i></a>
                                            <a href="${path }/YzElement/configTarget.do?sort=${sort}&id=${yzPor.id}"><i class="fa fa-anchor">配置指标</i></a>
                                        </td>
                                    </tr>
       
                                </c:forEach>
                                </tbody>
                            </table>
                            
                            <!-- page? -->
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <%@ include file="../tools/elementPaging.jsp" %>
                            </div>
                        </div>
                        <div class="x_content">
                            <!--<button type="button" class="btn btn-success" onclick="window.location.href='__URL__/role_add/'">添加</button>-->
                            <!--<button type="button" class="btn btn-success" onclick="window.location.href='__URL__/sys/'">同步教师信息</button>-->
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


<!-- jQuery -->
<script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>

<script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
 
   
</body>
</html>
