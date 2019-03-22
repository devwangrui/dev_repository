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
    
    <script type="text/javascript">
    
    function update(id,title,rank,icon){
    	
    	$("#id").val(id);
    	$("#title").val(title);
    	$("#rank").val(rank);
    	$("#icon").val(icon);
    	
    }
    
    function deleteYs(id){
    	var msg = "确定要删除吗~？";
    	if(confirm(msg)==true){
    		window.location.href = "${path }/PageIndex/delete.do?id="+id;
    	}else{
    		return false;
    	}
    }
    
    </script>


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
                                <th class="column-title">系统名称 </th>
                                <th class="column-title">排序</th>
                                <th class="column-title no-link last"><span class="nobr">编辑</span>
                                </th>
                                <th class="bulk-actions" colspan="6">
                                    <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- <volist name="a_list" id="vo"> -->
                            <c:forEach items="${list }" var="vo">
                                <tr class="even pointer">
                                    <td class="a-center ">
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td class=" ">${vo.title }</td>
                                    <td class=" ">${vo.rank }</td>
                                    <td class=" last">
                                       <!--  <input type="hidden" value="{$vo.id}">
                                        <input type="hidden" value="{$vo.icon}"> -->
                                        <a href="${path }/PageIndex/pageEdit.do?id=${vo.id}"><i class="fa fa-edit">页面管理</i></a>
                                        <a href="javascript:;" class="s_edit" onclick="update('${vo.id}','${vo.title }','${vo.rank }','${vo.icon }')" data-toggle="modal" data-target="#add_two_box1"><i class="fa fa-eye">修改</i></a>
                                        <a href="javascript:void(0);" onclick="deleteYs(${vo.id})"><i class="fa fa-trash">删除</i></a>
                                    </td>
                                </tr>
                              </c:forEach>  
                            <!-- </volist> -->
                            </tbody>
                        </table>
                    </div>
                    <div class="x_content">
                        <button type="button" class="btn btn-success add" data-toggle="modal" data-target="#add_two_box">添加系统</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /top tiles -->
        <!--添加 弹出层开始 -->

        <div id="add_two_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel">添加系统</h4>
                    </div>
                    <div class="modal-body">
                        <form id="demo-form2"  class="form-horizontal form-label-left "  method="post"  action="${path }/PageIndex/sava.do">

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">系统名称</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" required="required" name="title"  class="form-control" placeholder="请输入..">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">图标</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" required="required" name="icon"  class="form-control" placeholder="请输入..">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">排序</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" required="required" name="rank"  class="form-control" placeholder="请输入..">
                                </div>
                            </div>
                            <!-- <input type="hidden" name="id" id="id" > -->
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
        <!-- 弹出层结束 -->
        
         <!--修改 弹出层开始 -->

        <div id="add_two_box1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel">添加系统</h4>
                    </div>
                    <div class="modal-body">
                        <form id="demo-form2"  class="form-horizontal form-label-left "  method="post"  action="${path }/PageIndex/update.do">

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">系统名称</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" required="required" name="title" id="title" class="form-control" placeholder="请输入..">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">图标</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" required="required" name="icon" id="icon" class="form-control" placeholder="请输入..">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">排序</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" required="required" name="rank" id="rank" class="form-control" placeholder="请输入..">
                                </div>
                            </div>
                            <input type="hidden" name="id" id="id" >
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
        <!-- 弹出层结束 -->
        
    </div>
    <!-- /page content -->
    <!-- footer content -->
    <footer>

    </footer>
    <!-- /footer content -->
</div>
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
<script src="${pageContext.request.contextPath }/css/build/js/page.js"></script>


</body>
</html>
