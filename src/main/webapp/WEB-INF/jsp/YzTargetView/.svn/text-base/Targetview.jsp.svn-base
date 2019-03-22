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
    <title>模板配置</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/css/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="${pageContext.request.contextPath }/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/jquery.datatables.min.css" rel="stylesheet">
    <!--datables.css-->
    <%-- <link rel="stylesheet"  href="${pageContext.request.contextPath }/css/datables.css" /> --%>
    <link href="${pageContext.request.contextPath }/css/datatables.css" rel="stylesheet">
    <script>
        
    </script>
    
    <script type="text/javascript">
    
    
    function selectedId(){
       var sort = $("#select_sort").val();	
       
       if(sort==0){
    	   sort=1;
       }
    window.location.href = "${path}/YzTargetView/listYzTargetViewConditon.do?sort="+sort;
       
       
    }
    
    function update(id,title,sort){
    	$("#id").val(id);
    	$("#title").val(title);
    	$("#sort").val(sort);

    } 
    
    
    function del(id){
    	var msg ="确定要删除吗~？";
    	if(confirm(msg)==true){
    		window.location.href = "${path}/YzTargetView/deleteTargetView.do?id="+id;
    		
    	}else{
    		return false;
    	}
    }
    
    function a(){
    	alert("功能未开通...")
    }
    function sending(){
    	alert("功能未开通...")
    }
    </script>
</head>

<body class="nav-md">
<div class="container body">

    <!-- <include file="Public/left" /> -->
   <jsp:include page="/Index/left.do"></jsp:include>
    <!-- top navigation -->
   <!--  <include file="Public/top" /> -->
   <%@ include file="../Public/top.jsp" %>

        <!-- /top navigation -->
        <!--中间内容-->
        <div class="right_col" role="main">
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>模板配置 <small>当前位置/网站配置</small></h2>
                            <div class="clearfix"></div>
                        </div>

                        <div class="x_content">
                            <div class="col-md-3 col-sm-3 col-xs-4">
                                <select class="form-control c_select" onchange="selectedId()" id="select_sort">
                                     <option value="0">请选择</option>
                                   <c:forEach items="${layerList }" var="vo">
                                    <option  value="${vo.id }" <c:if test="${vo.id == sort }">selected</c:if> >${vo.title }</option>
                                    </c:forEach>
                                 </select>
                            </div>
                            <button type="button" class="btn btn-success add" onclick="a()">批量分配指标</button>
                            <!-- <button type="button" class="btn btn-success add" onclick="window.location='__URL__/many'">批量分配指标</button> -->
                            <button type="button" class="btn btn-success add" data-toggle="modal" data-target="#addm">新增模板</button>
                        </div>
                        <div class="x_content"> <br />
                            <table class="table table-striped jambo_table bulk_action">
                                <thead>
                                <tr class="headings">
                                    <th class="column-title">模板名称 </th>
                                    <th class="column-title">创建人 </th>
                                    <th class="column-title no-link last"><span class="nobr">操作</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                 <c:forEach items="${list }" var="vo" varStatus="k">
                                <!-- <volist name="a_list" id="vo" key="k"> -->
                                    <tr>
                                        <td>${vo.title }</td>
                                        <td>${vo.yzUser.name }</td>
                                        
                                        <td>

                                            <a href="${pageContext.request.contextPath }/YzTargetView/listView.do?id=${vo.id }&sort=${vo.sort }"><i class="fa fa-certificate">分配指标</i></a>
                                            <a href="javaScript:void(0)" onclick="sending()"><i class="fa fa-external-link">发起诊改</i></a>
                                            <%-- <a href="__URL__/transform/id/${vo.id }"><i class="fa fa-external-link">发起诊改</i></a> --%>
                                            <a href="javascript:;" class="s_edit" data-toggle="modal" onclick="update('${vo.id }','${vo.title }','${vo.sort }')" data-target="#add"><i class="fa fa-eye">修改</i></a>
                                            <a href="javascript:;" class="s_edit" onclick="del(${vo.id })" ><i class="fa fa-trash-o">删除</i></a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                              <!--   </volist> -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            
            <div id="add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">添加模板</h4>
                        </div>
                        <div class="modal-body">
                            <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left "  method="post"  action="${path }/YzTargetView/updateTargetView.do">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">模板类别</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control" name="sort" id="sort" required="required">
                                            <option value="1">学校</option>
                                            <option value="2">分院</option>
                                            <option value="3">专业</option>
                                            <option value="4">班级</option>
                                            <option value="7">课程</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">模板名称</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" required="required" name="title" id="title" class="form-control" placeholder="请输入..">
                                    </div>
                                </div>
                                <input type="hidden" name="id" id="id" value="0">
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                        <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-success">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
            
      <!-- 新增模版 -->
       <div id="addm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">添加模板</h4>
                        </div>
                        <div class="modal-body">
                            <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left "  method="post"  action="${path }/YzTargetView/addTargetViewLayer.do">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">模板类别</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control" name="sort" id="sort" required="required">
                                            <option value="1">学校</option>
                                            <option value="2">分院</option>
                                            <option value="3">专业</option>
                                            <option value="4">班级</option>
                                            <option value="7">课程</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">模板名称</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" required="required" name="title"  class="form-control" placeholder="请输入..">
                                    </div>
                                </div>
                                
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                        <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-success">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /page content -->
    </div>
</div>
<!-- jQuery -->
<script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>

<!-- iCheck -->
<script src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>

<!--必要-->
<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>


</body>



</html>