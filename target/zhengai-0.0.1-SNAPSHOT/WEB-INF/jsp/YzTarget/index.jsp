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


    <title>预警值设置 </title>

    <!-- Bootstrap -->
    <link href="${path }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${path }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <!-- NProgress -->
    <!-- bootstrap-daterangepicker -->
    <link href="${path }/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="${path }/css/build/css/custom.min.css" rel="stylesheet">
<script type="text/javascript">

   function updataObj(id,title,stand,rank,remark){
	   
               $("#nid").val(id); 	 
               $("#title").val(title); 	 
               $("#stand").val(stand); 	 
               $("#rank").val(rank); 	 
               $("#remark").val(remark); 	 
	
  }
   
   function deleteObj(id,rid,sort){
	   var msg = "确认要删除这条预警数据吗？~";
	   
	   if(confirm(msg)){
		   window.location.href="${path}/YzTargetSort1/deleteNotice.do?id="+id+"&rid="+rid+"&sort="+sort;
	   }else{
		   return false;
	   }
   }

</script>

</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <!-- <include file="Public/left" /> -->
        <jsp:include page="/Index/left.do"></jsp:include>
        <!-- top navigation -->
       <!--  <include file="Public/top" /> -->
       <%@ include file="../Public/top.jsp" %>

        <!-- page content -->
        <div class="right_col" role="main">

            <!-- top tiles -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>预警值设置 </h2>

                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">

                        <div class="table-responsive">
                            <table class="table table-striped jambo_table bulk_action">
                                <thead>
                                <tr class="headings">
                                    <th class="column-title">序号 </th>
                                    <th class="column-title">预警类别</th>
                                    <th class="column-title">排序</th>
                                    <th class="column-title">预警分值</th>
                                    <!--<th class="column-title">预警周期</th>-->
                                    <th class="column-title">备注</th>
                                    <th class="column-title no-link last"><span class="nobr">操作</span>
                                    </th>
                                    <th class="bulk-actions" colspan="9">
                                        <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                                    </th>
                                </tr>
                                </thead>

                                <tbody>
                                    <!-- <volist name="a_list" id="vo" key="k"> -->
                                    <c:forEach items="${list }" var="vo" varStatus="vs">
                                        <tr class="even pointer">
                                            <td class=" ">${vs.count }</td>
                                            <td class=" ">${vo.title}</td>
                                            <td class=" ">${vo.rank}</td><!--  -->
                                            <td class=" ">${vo.stand } <c:if test="${vo.standSortS == 2 }">%</c:if></td>
                                            <!--<td class=" ">{$vo.gotime|date='d/m/Y', ###} - {$vo.endtime|date='d/m/Y', ###}</td>-->
                                            <td>${vo.remark}</td>
                                            <td class=" last">
                                                <input type="hidden" value="${vo.id}">
                                                <input type="hidden" value="${vo.stand}">
                                                <a href="javascript:void(0);" class="s_edit" onclick="updataObj('${vo.id}','${vo.title}','${vo.stand}','${vo.rank}','${vo.remark}' )" data-toggle="modal" data-target="#add_box"><i class="fa fa-eye">修改</i></a>
                                                <a href="javascript:void(0);" onclick="deleteObj('${vo.id}','${id }','${sort }')"><i class="fa fa-trash">删除</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>   
                                   <!--  </volist> -->
                                </tbody>

                            </table>
                            <div class="x_content">
                                <button type="button" class="btn btn-success add" data-toggle="modal" data-target="#add_box1">添加预警值</button>
                                <a class="btn btn-success" href="${path}/YzTargetSort1/listYzTargetSort.do?sort=${sort}">返回</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- /top tiles -->


            <!-- 修改弹出层开始 -->

            <div id="add_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">添加预警值</h4>
                        </div>
                        <div class="modal-body">
                            <form id="demo-form2"  class="form-horizontal form-label-left "  method="post"  action="${path }/YzTargetSort1/updataNotice.do">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">预警类别</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" required="required" name="title" id="title" class="form-control" placeholder="请输入..">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">标准值</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" required="required" name="stand" id="stand" class="form-control" placeholder="请输入..">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">排序</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" required="required" name="rank" id="rank" class="form-control" placeholder="请输入..">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" name="remark" id="remark" class="form-control" placeholder="请输入..">
                                    </div>
                                </div>
                                <!-- <input type="hidden" name="pid" id="pid"> -->
                                <input type="hidden" name="sort" value="${sort }">
                                <input type="hidden" name="id" id="nid" >
                                <input type="hidden" name="rid" value="${id }" >
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
            
            
            <!-- 添加弹出层开始 -->

            <div id="add_box1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">添加预警值</h4>
                        </div>
                        <div class="modal-body">
                            <form id="demo-form2"  class="form-horizontal form-label-left "  method="post"  action="${path }/YzTargetSort1/addNotice.do">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">预警类别</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" required="required" name="title"  class="form-control" placeholder="请输入..">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">标准值</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" required="required" name="stand"  class="form-control" placeholder="请输入..">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">排序</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" required="required" name="rank"  class="form-control" placeholder="请输入..">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" name="remark"  class="form-control" placeholder="请输入..">
                                    </div>
                                </div>
                                <!-- <input type="hidden" name="pid" id="pid"> -->
                                <input type="hidden" name="sort" value="${sort }">
                                <input type="hidden" name="rid" value="${id }" >
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
        <!-- /page content -->

        <!-- footer content -->
        <footer>

        </footer>
        <!-- /footer content -->
    </div>
</div>
</div>
    <script>
        var URL = '__URL__';
        var pid = '{$pid}';
    </script>
    <!-- jQuery -->
    <script src="${path }/css/vendors/jquery/dist/jquery.min.js"></script>
<!-- jQuery -->
<script src="${path }/css/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${path }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- bootstrap-daterangepicker -->
    <script src="${path }/css/vendors/moment/min/moment.min.js"></script>
    <script src="${path }/css/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Bootstrap Colorpicker -->

<!-- Custom Theme Scripts -->
<script src="${path }/css/build/js/custom.js"></script>
    <script src="${path }/css/build/js/notice.js"></script>
</body>
</html>
