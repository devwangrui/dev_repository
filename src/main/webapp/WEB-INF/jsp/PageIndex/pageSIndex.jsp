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


    <title>页面管理 </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
	<SCRIPT TYPE="text/javascript">
	
	function deleteC(id){
    	var msg = "确定要删除吗~？";
    	if(confirm(msg)==true){
    		window.location.href = "${path }/PageIndex/deleteController.do?id="+id;
    	}else{
    		return false;
    	}
    }
	
	
	
	
	
	</SCRIPT>

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
                    <h2>页面管理 </h2>
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
                                <th class="column-title">页面名称 </th>
                                <th class="column-title">排序</th>
                                <th class="column-title">状态</th>
                                <th class="column-title">更新时间</th>
                                <th class="column-title no-link last"><span class="nobr">编辑</span>
                                </th>
                                <th class="bulk-actions" colspan="6">
                                    <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                           <!--  <volist name="a_list" id="vo"> -->
                           <c:forEach items="${list }" var="vo">
                                <tr class="even pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">${vo.title}</td>
                                    <td class=" ">${vo.rank}</td>
                                    <!-- <td class=" "><if condition="$vo.is_show == 1">列表显示<else/>影藏</if></td> -->
                                    <td class=" "><c:if test="${vo.isShow==1 }">列表显示</c:if><c:if test="${vo.isShow==0 }">影藏</c:if></td>
                                    <td class=" ">${vo.editTime}</td>
                                    <td class=" last">
                                        <input type="hidden" value="${vo.id}">
                                        <%-- <input type="hidden" value="${vo.icon}"> --%>
                                        <a href="${path }/PageIndex/updatePage.do?id=${vo.id}"><i class="fa fa-eye">修改</i></a>
                                        <a onclick="deleteC(${vo.id})"><i class="fa fa-trash">删除</i></a>
                                    </td>
                                </tr>
                                </c:forEach>
                         <!--    </volist> -->
                            </tbody>
                        </table>
                    </div>
                    <div class="x_content">
                        <button type="button" class="btn btn-success add" onclick="window.location='${path}/PageIndex/addPage.do?id=${pid }'">添加页面</button>
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
<!-- Parsley -->
<script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>

</body>
</html>
