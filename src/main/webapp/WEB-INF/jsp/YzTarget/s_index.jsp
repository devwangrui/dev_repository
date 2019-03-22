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

  
    <title>用户管理 </title>
    
    
    
    <link href="${pageContext.request.contextPath }/css/build/css/custom.css" rel="stylesheet" type="text/css">
  <!-- --------------------------------------------------------------------------------------------------------- -->  
    
    
    
   <!--  图标-->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- iCheck -->
<link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet" type="text/css">

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet" type="text/css">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/css/nprogress.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/green.css" rel="stylesheet" type="text/css">
	
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath }/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" type="text/css">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" type="text/css">
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">
    
    <link  href="${pageContext.request.contextPath }/css/baiduedit.css" rel="stylesheet" type="text/css" >

    <!-- Custom Theme Style -->
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	
   
    
    <script type="text/javascript">
    /*   添加二级表单   */
   function selectByID(id){
	 
	   $("#pid").val(id);
	   
		   
		   
	  
   }
    
    /* ==================================================================================== */
    
    /* 修改一级 */
    function update(id,title,rank,pid,updateSort,sort,addTime,addUid,editTime,editUid,isDel,delTime,delUid,remark){
    	
       $("#targetid").val(id);
       $("#targettitle").val(title);
  	   $("#targetrank").val(rank);
  	   $("#targetpid").val(pid);
  	   $("#targetupdateSort").val(updateSort);
  	   $("#targetsort").val(sort);
  	   $("#targetaddTime").val(addTime);
  	   $("#targetaddUid").val(addUid);
  	   $("#targeteditTime").val(editTime);
  	   $("#targeteditUid").val(editUid);
  	   $("#targetisDel").val(isDel);
  	   $("#targetdelTime").val(delTime);
  	   $("#targetdelUid").val(delUid);
  	   $("#targetremark").val(remark);
    	
    }
    
    
    /* 修改二级 */
    function updatey(id,title,rank,pid,updateSort,sort,addTime,addUid,editTime,editUid,isDel,delTime,delUid,remark){
    	
        $("#targetid").val(id);
        $("#targettitle").val(title);
   	   $("#targetrank").val(rank);
   	   $("#targetpid").val(pid);
   	   $("#targetupdateSort").val(updateSort);
   	   $("#targetsort").val(sort);
   	   $("#targetaddTime").val(addTime);
   	   $("#targetaddUid").val(addUid);
   	   $("#targeteditTime").val(editTime);
   	   $("#targeteditUid").val(editUid);
   	   $("#targetisDel").val(isDel);
   	   $("#targetdelTime").val(delTime);
   	   $("#targetdelUid").val(delUid);
   	   $("#targetremark").val(remark);
     	
     }
    
  

   function ok(id){
	   
	   var msg = "您真的确定要删除吗？"; 
	   if (confirm(msg)==true){ 
		   window.location.href="${path}/YzTargetSort/delete.do?id="+id;
	   }else{ 
	    return false; 
	   } 
   }
   
function ok1(id){
	   
	   var msg = "您真的确定要删除吗？"; 
	   if (confirm(msg)==true){ 
		   window.location.href="${path}/YzTargetSort/delete.do?id="+id;
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
        <!-- <include file="Public/top" /> -->
        <%@ include file="../Public/top.jsp" %>
        <!-- /top navigation -->
        <!-- page content -->
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->

          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2>指标管理</h2>

                <div class="clearfix"></div>
              </div>
     
              <div class="x_content">

               <!-- 对后台传过来的表数据作遍历 得到每一个对应的数据 这里采用降序排列 tg代表单个对象 -->
             <c:forEach items="${alist }" var="tg">
                <div class="table-responsive">
                  <table class="table table-striped jambo_table bulk_action">
                    <!-- <volist name="a_list" id="vo"> -->
                      <thead>
                      <tr class="headings">
                        <th>
                          <i class="fa fa-plus " style="width:5%;"></i>
                        </th>
                      <th style="width: 900" class="column-title">${tg.title }   </th> 
                        
                        <th style="width: 200" class="column-title"><span class="nobr">排序（${tg.rank }）</span></th>
                        <th style="width: 500" class="column-title no-link last">

													<input type="hidden" name="id" value="${tg.id }"> <input
													type="hidden" name="pid" value="${tg.pid }"> <input
													type="hidden" name="updateSort" value="${tg.updateSort }">
													<input type="hidden" name="sort" value="${tg.sort }">
													<input type="hidden" name="addTime" value="${tg.addTime }">
													<input type="hidden" name="addUid" value="${tg.addUid}">
													<input type="hidden" name="editTime}"
													value="${tg.editTime}"> <input type="hidden"
													name="editUid" value="${tg.editUid}"> <input
													type="hidden" name="isDel" value="${tg.isDel}"> <input
													type="hidden" name="delTime" value="${tg.delTime}">
													<input type="hidden" name="delUid" value="${tg.delUid}">
													<input type="hidden" name="remark" value="${tg.remark}">

													
												    <a href="javascript:void(0);" onclick="selectByID(${tg.id})"
													style="color:white;" data-toggle="modal"
													data-target="#add_two_box" class="s_add"><i class="fa fa-plus">添加二级指标</i></a> 
													
													
													<a href="javascript:void(0);" onclick="update('${tg.id}','${tg.title }','${tg.rank }','${tg.pid }','${tg.updateSort }','${tg.sort }','${tg.addTime }','${tg.addUid}','${tg.editTime}','${tg.editUid}','${tg.isDel}','${tg.delTime}','${tg.delUid}','${tg.remark}')"  style="color:white;" data-toggle="modal" data-target="#add_two_boxt" class="s_edit"><i class="fa fa-pencil">修改</i></a>
													
													 <a href="javascript:void(0);"	onclick="ok(${tg.id})" style="color:white;"><i class="fa fa-trash">删除</i></a>
												</th>
                      </tr>
                      </thead>
                      <tbody>
                     <!--  <volist name="vo.child" id="co"> -->
                      <c:forEach items="${tg.list }" var="yzTargetSort">
                        <tr class="even pointer">
                          <td class="a-center ">
                          </td>
                          <td class="column-title ">${yzTargetSort.title}</td>
                          <td class="column-title ">${yzTargetSort.rank}</td>
                          <td class=" last">
                           <!-- '${yzTargetSort.id}','${yzTargetSort.title }','${yzTargetSort.rank }','${yzTargetSort.pid }','${yzTargetSort.updateSort }',${yzTargetSort.sort }','${yzTargetSort.addTime }','${yzTargetSort.addUid}','${yzTargetSort.editTime}','${yzTargetSort.editUid}','${yzTargetSort.isDel}','${yzTargetSort.delTime}','${yzTargetSort.delUid}','${yzTargetSort.remark} -->
                            <a href="javascript:;" id="update" onclick="updatey('${yzTargetSort.id}','${yzTargetSort.title }','${yzTargetSort.rank }','${yzTargetSort.pid }','${yzTargetSort.updateSort }','${yzTargetSort.sort }','${yzTargetSort.addTime }','${yzTargetSort.addUid}','${yzTargetSort.editTime}','${yzTargetSort.editUid}','${yzTargetSort.isDel}','${yzTargetSort.delTime}','${yzTargetSort.delUid}','${yzTargetSort.remark}')"  data-toggle="modal" data-target="#add_two_boxt" style="color: #3F5367;" ><i class="fa fa-pencil">修改</i></a>
                            
                            <a href="javascript:;" onclick="ok1(${yzTargetSort.id})" style="color: #3F5367"  ><i class="fa fa-trash">删除</i></a>
                          </td>
                        </tr>
                        </c:forEach>
                      <!-- </volist> -->
                      </tbody>
                    <!-- </volist> -->
                  </table>
                </div>
                
                </c:forEach> 
            <%--     <%@ include file="../tools/paging.jsp" %> --%>
                
                <div class="x_content">
                  <button type="button" class="btn btn-success add" data-toggle="modal" data-target="#add_two_box2">添加指标</button>
                
                </div>
              </div>
            </div>
          </div>




          <!-- /top tiles  添加二级的表单lllllllllllllllllllllllllllllllllllllllllllllllllllll -->

      <div id="add_two_box" class="modal fade" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog" >
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">指标添加</h4>
							</div>
							<div class="modal-body">
								<!--表单  -->
								<!-- enctype="multipart/form-data" -->
								<form id="demo-form1" data-parsley-validate=""
									class="form-horizontal form-label-left " novalidate=""
									method="post"
									action="${path}/YzTargetSort/savaYzTargetSort.do?sort=${sort}">

									<input id="pid" type="hidden" name="pid">
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12">指标名称</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" name="title" id="title"
												class="form-control"><br>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12">更新周期</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<select class="form-control" name="updateSort"
												id="updateSort" required="required">
												<option>请选择</option>
												<option value="1">一天</option>
												<option value="2">一周</option>
												<option value="3">一月</option>
												<option value="4">一年</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12">排序</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" name="rank" id="rank" required="required"
												class="form-control" placeholder="请输入..">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" name="remark" id="remark"
												class="form-control" placeholder="请输入..">
										</div>
									</div>
									<!-- <input type="hidden" name="twoLevelTargetId" id="twoLevelTargetId" >
                <input type="hidden" name="updateDate" id="updateDate" >
                <input type="hidden" name="targetId" id="targetId" > -->
									<div class="ln_solid"></div>
									<div class="form-group">
										<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
											<button type="button" class="btn btn-default antoclose"
												data-dismiss="modal">关闭</button>
											<button type="submit" id="id1" class="btn btn-success">提交</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
      
      
    <!--  添加 一级的表单lllllllllllllllllllllllllllllllllllllllllllllllllllll -->  
    
    <div id="add_two_box2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title" id="myModalLabel">指标添加</h4>
            </div>
            <div class="modal-body">
            <!--表单  -->
            <!-- enctype="multipart/form-data" -->
              <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left "  novalidate="" method="post"  action="${path}/YzTargetSort/sava.do?sort=${sort}">
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">指标名称</label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" name="title" id="title"  class="form-control" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">更新周期</label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <select class="form-control" name="updateSort" id="updateSort" required="required">
                     <!--  <option>请选择</option> -->
                      <option value="1" >一天</option>
                      <option value="2" >一周</option>
                      <option value="3" >一月</option>
                      <option value="4" >一年</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">排序</label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" name="rank" id="rank" required="required" class="form-control" placeholder="请输入..">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" name="remark" id="remark" class="form-control" placeholder="请输入..">
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
 <!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->  
 
 
     
    
    <!-- ================================================================================================================== -->
    <!-- 修改指标 --> 
 
  <div id="add_two_boxt" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title" id="myModalLabel">指标修改</h4>
            </div>
            <div class="modal-body">
            <!--表单  -->
            <!-- enctype="multipart/form-data" -->
              <form id="demo-form3" data-parsley-validate="" class="form-horizontal form-label-left "  novalidate="" method="post"  action="${path}/YzTargetSort/update.do">
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">指标名称</label>
                  
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" name="title" id="targettitle"  class="form-control" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">更新周期</label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <select class="form-control" name="updateSort"  id="targetupdateSort" required="required">
                      <option>请选择</option>
                      <option value="1" >一天</option>
                      <option value="2"  >一周</option>
                      <option value="3"  >一月</option>
                      <option value="4"  >一年</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">排序</label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" name="rank"  id="targetrank"  required="required" class="form-control" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="text" name="remark" id="targetremark"  class="form-control" >
                  </div>
                </div>
                            <input type="hidden" name="id" id="targetid" > 
                            <input type="hidden" name="pid" id="targetpid"> 
							<input type="hidden" name="sort"  id="targetsort">
							<input type="hidden" name="addTime"  id="targetaddTime" >
							<input type="hidden" name="addUid"  id="targetaddUid" >
							<input type="hidden" name="editTime"   id="targeteditTime" >
							<input type="hidden" name="editUid"  id="targeteditUid" >
							<input type="hidden" name="isDel"  id="targetisDel" > 
							<input type="hidden" name="delTime"  id="targetdelTime" >
							<input type="hidden" name="delUid"  id="targetdelUid" >
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
      </div>
      </div>
    <!-- ================================================================================================================== -->

 
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Custom Theme Scripts -->
  <%--   <script src="${pageContext.request.contextPath }/js/custom.js"></script> --%>
    <script src="${pageContext.request.contextPath }/css/build/js/target_s.js"></script>
  <!-- Bootstrap -->
  <script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>

  </body>
</html>
