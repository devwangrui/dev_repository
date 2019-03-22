<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../js/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">
<c:set var="path" value="${pageCotext.request.contextPath }"></c:set>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>推送方案</title>

<!-- Bootstrap -->
<!--<link href="__ROOT__/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">-->
<!-- Font Awesome -->
<!--<link href="__ROOT__/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.css" rel="stylesheet">-->
<!-- Custom Theme Style -->
<!-- iCheck -->
<!--<link href="__ROOT__/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="__ROOT__/build/css/custom.min.css" rel="stylesheet">
    <link href="__ROOT__/build/css/node.css" rel="stylesheet">-->




<!-- Font Awesome -->
<link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/jquery.autocompleter.css" rel="stylesheet">
<!-- Custom Theme Style -->
<!-- iCheck -->
<link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/build/css/custom.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/baiduedit.css" />


<!-- Bootstrap -->
<link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/custom.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<!-- Font Awesome -->
<link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<!-- NProgress -->
<link href="${pageContext.request.contextPath }/css/nprogress.css" rel="stylesheet" type="text/css">
<!-- iCheck -->
<%-- <link href="${pageContext.request.contextPath }/css/green.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link href="${pageContext.request.contextPath }/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" type="text/css">
<!-- JQVMap -->
<link href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap-daterangepicker -->
<link
	href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/node.css" rel="stylesheet" type="text/css">

<!-- zTree -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/css/vendors/zTree/css/demo.css" type="text/css">  --%>
<%-- <link href="${pageContext.request.contextPath }/css/vendors/zTree/css/demo.css" rel="stylesheet" type="text/css"> --%>



</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="/Index/left.do"></jsp:include>
			<%@ include file="../Public/top.jsp"%>

			<!-- page content -->
			<div class="right_col">
				<!-- top tiles -->
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel" >
						<div class="x_title">
							<h2>
								节点管理 <small>提示信息</small>
							</h2>

							<div class="clearfix"></div>
						</div>

						<div class="x_content">


							 <div class="htmleaf-container"> 
								<div class="demo">
									 <div class="container"> 
										<div class="row">

											<div class="col-md-offset-3 col-md-6">

												<div class="tab" role="tabpanel" >

													<!-- Nav tabs -->

													<ul class="nav nav-tabs" role="tablist" id="myTab" >
														<li role="presentation" class="active"><a href="#Section1" aria-controls="home"
															role="tab" data-toggle="tab"><i class="fa fa-envelope-o"></i>一级权限</a></li>
														<c:forEach items="${YzNode }" var="vo">
															<li role="presentation"><a href="#${vo.id }" aria-controls="profile" role="tab"
																data-toggle="tab"><i class="fa fa-globe"></i><span>${vo.remark}</span></a></li>

														</c:forEach>
													</ul>
													<div class="tab-content tabs">



														<div role="tabpanel" class="tab-pane fade in active" id="Section1">
															<c:forEach items="${YzNode }" var="vo">
																<div class="alter">
																	<span>${vo.remark }</span>
																	<div class="hr">
																		<a
																			onclick="window.location.href='${pageContext.request.contextPath }/Rbac/node_add.do?pid=${vo.id }&level=2'"><img
																			ALT="添加二级权限" src="${pageContext.request.contextPath }/images/onto.png"
																			TITLE="添加二级权限" class="image"></a> <a
																			onclick="window.location.href='${pageContext.request.contextPath }/Rbac/node_add.do?id=${vo.id }'">
																			<img ALT="修改" src="${pageContext.request.contextPath }/images/to.png" TITLE="修改"
																			class="image">
																		</a> <a onclick="ok('${vo.id}')" class="del"><img ALT="删除"
																			src="${pageContext.request.contextPath }/images/86.png" TITLE="删除" class="image"></a>
																	</div>
																</div>
															</c:forEach>
														</div>
														<c:forEach items="${YzNode }" var="vo">
															<div class="tab-pane fade" id="${vo.id }">
																<div class="panel-group" id="accordion">
																	<c:forEach items="${vo.yzNode }" var="co">
																		<div class="panel panel-default">
																			<!-- 第一个容器 -->
																			<div class="panel-heading">
																				<h4 class="panel-title" style="display:inline-block;">
																					<a href="#collapse${co.id }" data-toggle="collapse" data-parent="#accordion">${co.remark }</a>
																				</h4>
																				<div class="ar">
																					<a
																						onclick="window.location.href='${pageContext.request.contextPath }/Rbac/node_add.do?pid=${co.id }&level=3'"><img
																						ALT="添加方法" src="${pageContext.request.contextPath }/images/onto.png"
																						TITLE="添加方法" class="image"></a> <a
																						onclick="window.location.href='${pageContext.request.contextPath }/Rbac/node_add.do?id=${co.id }'">
																						<img ALT="修改" src="${pageContext.request.contextPath }/images/to.png"
																						TITLE="修改" class="image">
																					</a> <a onclick="ok('${co.id}')" class="del"><img ALT="删除"
																						src="${pageContext.request.contextPath }/images/86.png" TITLE="删除"
																						class="image"></a>
																				</div>

																			</div>
																			<div id="collapse${co.id}" class="panel-collapse collapse">
																				<!-- 折叠菜单的部分collapse:开始时先隐藏 -->
																				<c:forEach items="${co.yzNode }" var="fo">
																					<div class="panel-body">
																						<span>${fo.remark }</span>
																						<div class="cr">
																							<a
																								onclick="window.location.href='${pageContext.request.contextPath }/Rbac/node_add.do?id=${fo.id }'">
																								<img ALT="修改" src="${pageContext.request.contextPath }/images/to.png"
																								TITLE="修改" class="image">
																							</a> <a onclick="ok('${fo.id}')" class="del"><img ALT="删除"
																								src="${pageContext.request.contextPath }/images/86.png" TITLE="删除"
																								class="image"></a>
																						</div>
																					</div>
																				</c:forEach>
																			</div>

																		</div>
																	</c:forEach>
																</div>
															</div>


														</c:forEach>

													</div>


												</div>

											</div>
										</div>
										<div class="x_content" STYLE="z-index: 999; position: fixed ! important; left: 91%; bottom: 8%;" >
											<button type="button" class="btn btn-success add" data-toggle="modal"
											onclick="window.location.href='${pageContext.request.contextPath }/Rbac/node_add.do?pid=0&level=1'">添加一级权限</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

	<%-- 	<script src="${pageContext.request.contextPath }/js/jquery.autocompleter/jquery.autocompleter.js"></script> --%>
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>
	<!--  <script src="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.js"></script>-->
	<!-- Datatables -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- Parsley -->
	<script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>
	<!--<script src="${pageContext.request.contextPath }/css/build/js/plan.js"></script>-->
	<script type="text/javascript">
		function ok(id) {
			var fdel = window.confirm("确定删除?");

			if (fdel) {

				window.location.href = "${pageContext.request.contextPath }/Rbac/node_delete.do?id="
						+ id;

			} else {

				return false;

			}
		}
	</script>
</body>
</html>

