<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../js/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>用户管理</title>
<link
	href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/jquery.autocompleter.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/build/css/custom.min.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/css/vendors/select/css/select2.css" rel="stylesheet" />

<script type="text/javascript">

    


   function showlevelTwo(){
	   
	   var id = $("#one_select1 option:selected").attr("tip");
	   var se = "<option >请选择</option>";
	   $("#one_select2").empty();
        $.ajax({
        	url:"${pageContext.request.contextPath }/YzTargetSort1/getLevelTwo.do",
        	data:{
        		"id":id
        	},
           type:"post", 
           dataType:"json",
           success:function(result){
        	   var re ="";
        	   if(result!=null && result.length>0){
        		   for(var i =0 ;i<result.length;i++){
        			   var JSONtitle = result[i].title;
        			   var Ptitle = JSON.stringify(JSONtitle);
        			   var title = Ptitle.replace(/\"/g, "");
             		var dom = "<option  value='"+title+"'"+">"+title+"</option>";   
             		re=re+dom;
             		
             	  }
        	   }
        	   re= se+re;
        	   $("#one_select2").html(re);
           }
        });
   }
   
   function showlevelTwo1(){
	   
	   var id = $("#one_select option:selected").attr("tip");
	   var se = "<option >请选择</option>";
	   $("#two_select").empty();
        $.ajax({
        	url:"${pageContext.request.contextPath }/YzTargetSort1/getLevelTwo.do",
        	data:{
        		"id":id
        	},
           type:"post", 
           dataType:"json",
           success:function(result){
        	   var re ="";
        	   if(result!=null && result.length>0){
        		   for(var i =0 ;i<result.length;i++){
        			   var JSONtitle = result[i].title;
        			   var Ptitle = JSON.stringify(JSONtitle);
        			   var title = Ptitle.replace(/\"/g, "");
             		var dom = "<option  value='"+title+"'"+">"+title+"</option>";   
             		re=re+dom;
             		
             	  }
        	   }
        	   re= se+re;
        	   $("#two_select").html(re);
           }
        });
   }
 
   function update(levelOneId,levelOneTitle,levelTweTitle,title,stand,standSort,standSortS,remark,id,dataTitle,updateSort,datasId,datasTitle,levelOneId,levelTwoId,levelOneTitle,levelTwoTetle){
   	
   	    var dom = "<option tip="+levelOneId+" selected='selected' value='"+levelOneTitle+"' >"+levelOneTitle+"</option>";
   	    var dom1 = "<option selected='selected' value='"+levelTweTitle+"' >"+levelTweTitle+"</option>";
   	
    	$("#one_select").append(dom);
    	$("#two_select").append(dom1);
	   
	   
	   $("#yzTargetTitle").val(title);
	   $("#yzTargetstand").val(stand);
	   $("#yzTargetstandSort").val(standSort);
	   $("#yzTargetstandSortS").val(standSortS);
	   $("#yzTargetremark").val(remark);
	   $("#yzTargetid").val(id);
	   $("#yzTargetdataTitle").val(dataTitle).select2({placeholder:"请搜索或选择数据源",
				tags: true,
	       	 	data: data,
	       	 	allowClear: true,}); 
	   
	  /* $("#yzTargetdataTitle").val(dataTitle).trigger('change'); */
	 
	   $("#datasId").val(datasId);
	   $("#datasTitle").val(datasTitle);
	   $("#levelOneId").val(levelOneId);
	   $("#levelTwoId").val(levelTwoId);
	   $("#yzTargetupdateSort").val(updateSort);
	   $("#ptitle").val(levelOneTitle);
	   $("#ctitle").val(levelTwoTetle);
	   
   }
 
    

function ok(id,sort){
	   
	   var msg = "您真的确定要删除吗？"; 
	   if (confirm(msg)==true){ 
		   window.location.href="${path}/YzTargetSort1/delete.do?id="+id+"&sort="+sort;
	   }else{ 
	    return false; 
	   } 
}


</script>

</head>

<body class="nav-md">
	<div class="container body">
		<jsp:include page="/Index/left.do"></jsp:include>
		<%@ include file="../Public/top.jsp"%>
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

						<div class="table-responsive">
							<table id="datatable-responsive"
								class="table table-striped table-bordered dt-responsive nowrap"
								cellspacing="0" width="100%">
								<thead>
									<tr class="headings">
										<!--<th>
                        <input type="checkbox" id="check-all" class="flat"   class="headings">
                      </th>-->
										<th style="width: 280" class="column-title">一级指标</th>
										<th style="width: 200" class="column-title">二级指标</th>
										<th style="width: 250" class="column-title">质控点</th>
										<th style="width: 200" class="column-title">排序</th>
										<th style="width: 200" class="column-title">备注</th>
										<th style="width: 300" class="column-title"><span
											class="nobr">编辑</span></th>
										<!-- 
                      <th class="bulk-actions" colspan="6">
                        <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                      </th> -->
									</tr>
								</thead>

								<tbody>

									<!-- <!--  -- !--    遍历传过来的数据                        -->
									<c:forEach items="${alist }" var="ys" >
										<c:forEach items="${ys.list}" var="yzTargetSort">
											<c:forEach items="${yzTargetSort.list }" var="yzTarget" varStatus="vs">

												<tr class="even pointer">
													<!--<td class="a-center ">
                        <input type="checkbox" class="flat" name="table_records">
                      </td>-->

													<td class=" ">${ys.title }</td>
													<!--targetSort.title } -->
													<td class="">${yzTargetSort.title }</td>


													<td class=" ">${yzTarget.title }</td>
													<td class=" ">${yzTarget.rank }</td>
													<td class="a-right a-right ">${yzTarget.remark}</td>
													<td class=" last"><a style="color: #3F5367"
														href="${path}/YzTargetSort1/configChart.do?id=${yzTarget.id}&sort=${yzTargetSort.sort}"><i
															class="fa fa-pencil">图表设置</i></a> <a style="color: #3F5367"
														href="${path}/YzTargetSort1/configNotice.do?id=${yzTarget.id}&sort=${yzTargetSort.sort}"><i
															class="fa fa-pencil">设置预警</i></a> <a
														href="${path }/YzTargetSort1/setEdit.do?id=${yzTarget.yzDatas.id}"><i
															class="fa fa-calculator">公式设置计算器版</i></a> 
															 <a href="${path }/YzTargetSort1/setEdit1.do?id=${yzTarget.yzDatas.id}"><i class="fa fa-calculator">公式设置原版</i></a>
															<!--              class="s_edit"  -->
													
														<a data-toggle="modal"   onclick="update('${ys.id }','${ys.title }','${yzTargetSort.title }','${yzTarget.title }','${yzTarget.stand }','${yzTarget.standSort }','${yzTarget.standSortS }','${yzTarget.remark}','${yzTarget.id}','${yzTarget.dataTitle}','${yzTarget.updateSort}','${yzTarget.yzDatas.id}','${yzTarget.yzDatas.title}','${ys.id }','${yzTargetSort.id }','${ys.title }','${yzTargetSort.title }')" data-target="#add_two_box"><i class="fa fa-pencil">修改</i></a>
														<a style="color: #3F5367" href="javascript:void(0);"
														onclick="ok('${yzTarget.id}','${sort }')"><i
															class="fa fa-trash">删除</i></a></td>

												</tr>
											</c:forEach>
										</c:forEach>

									</c:forEach>
									<!-- </volist> -->
								</tbody>

							</table>
						</div>


						<div class="x_content">
							<button type="button" class="btn btn-success add"
								data-toggle="modal" data-target="#add_two_box1">添加指标</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /top tiles -->



	<!-- 弹出层开始 -->
	<!-- 修改的弹框 -->
	<div id="add_two_box" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改指标</h4>
				</div>
				<div class="modal-body">
					<form id="demo-form2" data-parsley-validate=""
						class="form-horizontal form-label-left " novalidate=""
						method="post"
						action="${path}/YzTargetSort1/update.do?sort=${sort}">
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">一级指标</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select class="form-control" onchange="showlevelTwo1()" name="ptitle" required="required"
									id="one_select">
									<option>请选择</option>
									<!-- <volist name="s_list" id="vo"> -->
									<c:forEach items="${pTitel }" var="query">
										<option tip="${query.id }" value="${query.title }">${query.title}</option>
									</c:forEach>
									<!--  </volist> -->
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">二级指标</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select class="form-control" name="ctitle" id="two_select">
									<option >请选择</option>
									<%-- <!-- <volist name="s_list" id="vo"> -->
									<c:forEach items="${cTitel}" var="query">
										<!-- <volist name="vo.child" id="co"> -->
										<option class="one_{$vo.id}" value="${query}">${query}</option>
										<!-- </volist> -->
									</c:forEach> --%>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">指标名称</label>
							<input type="hidden" name="id" id="yzTargetid">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" required="required" name="title"
									id="yzTargetTitle" class="form-control" placeholder="请输入..">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">标准值</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" required="required" name="stand"
									id="yzTargetstand" class="form-control" placeholder="请输入..">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">标准值类型</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select class="form-control" name="standSortS"
									id="yzTargetstandSort" required="required">
									<option>请选择</option>
									<option value="1">数值</option>
									<option value="2">百分比</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">比较类型</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select class="form-control" name="standSort"
									id="yzTargetstandSortS" required="required">
									<option>请选择</option>
									<option value="1">大于</option>
									<option value="2">小于</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">数据源</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="yzTargetdataTitle" name="dataTitle"
									class="form-control" style="width:100%"> <input
									type="hidden" id="datasId" name="dataId" class="form-control"
									placeholder="请输入..">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">更新周期</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select class="form-control" name="updateSort"
									id="yzTargetupdateSort" required="required">
									<option>请选择</option>
									<option value="1">一天</option>
									<option value="2">一周</option>
									<option value="3">一月</option>
									<option value="4">一年</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" name="remark" id="yzTargetremark"
									class="form-control" placeholder="请输入..">
							</div>
						</div>
						<input type="hidden" name="levelOneId" id="levelOneId"> <input
							type="hidden" name="levelTwoId" id="levelTwoId">
						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
								<button type="button" class="btn btn-default antoclose"
									data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-success">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--         添加指标的弹窗            -->

	<div id="add_two_box1" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加指标</h4>
				</div>
				<div class="modal-body">
					<form id="demo-form2" data-parsley-validate=""
						class="form-horizontal form-label-left " novalidate=""
						method="post" action="${path}/YzTargetSort1/sava.do">
						<div class="form-group">
							<!--  ****要插入数据对应的一级指标ID -->
							<input type="hidden" id="yztargetSortUpdateid" name="id">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">一级指标</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<!--****一级指标要插入的指标title  -->
								<select class="form-control" name="levelOneQueryTitle"
									onchange="showlevelTwo()" required="required" id="one_select1">
									<option>请选择</option>
									<c:forEach items="${pTitel }" var="query">
										<option tip="${query.id }" value="${query.title}">${query.title}</option>
									</c:forEach>
									<!--  </volist> -->
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">二级指标</label>
							<!--****要插入的二级指标的ID  -->
							<div class="col-md-6 col-sm-6 col-xs-12">
								<!--****要插入的二级指标的title  -->
								<select class="form-control" name="levelTwoQueryTitle"
									id="one_select2">
									<option>请选择</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">指标名称</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<!--****要插入的yzTargetSort 对应的title  -->
								<input type="text" required="required" name="title"
									class="form-control" placeholder="请输入..">
							</div>
						</div>

						<!-- title ,stand ,standSort,standSortS,remark,id,dataTitle,rank,updateSort -->
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">标准值</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<!--****要插入的yzTargetSort 对应的stand值  -->
								<input type="text" required="required" name="stand"
									class="form-control" placeholder="请输入..">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">标准值类型</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<!--****要插入的yzTargetSort 对应的standSortS值  -->
								<select class="form-control" name="standSortS"
									required="required">
									<option>请选择</option>
									<option value="1">数值</option>
									<option value="2">百分比</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">比较类型</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<!--****要插入的yzTargetSort 对应的standSort值  -->
								<select class="form-control" name="standSort"
									required="required">
									<option>请选择</option>
									<option value="1">大于</option>
									<option value="2">小于</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">数据源</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<!--****要插入的datas的Title  -->
								 <input type="text" id="datasTitle" name="datasTitle"
									class="form-control"  style="width:100%">
									
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">更新周期</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<!-- 要插入的yzTarget的updateSort -->
								<select class="form-control" name="updateSort"
									required="required">
									<option>请选择</option>
									<option value="1">一天</option>
									<option value="2">一周</option>
									<option value="3">一月</option>
									<option value="4">一年</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" name="remark" id="remark"
									class="form-control" placeholder="请输入..">
							</div>
						</div>
						<!--  <input type="hidden" name="pid" id="pid" value="0">
                    <input type="hidden" name="id" id="id" value="0"> -->
						<input type="hidden" name="sort" value="${sort }">
						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
								<button type="button" class="btn btn-default antoclose"
									data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-success">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出层结束 -->

	<footer> </footer>




	
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>
	<!-- <script src="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.js"></script> -->
	<!-- Datatables -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- Parsley -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>
	<%--  <script src="${pageContext.request.contextPath }/css/build/js/target.js"></script> --%>
<script src="${pageContext.request.contextPath }/css/vendors/select/js/select2.full.js"></script>

	 <script>
     
		

		var data = ${datas};
		
		
		$("#yzTargetdataTitle").select2({});
		
		 $("#datasTitle").val("请搜索或选择数据源").trigger('change');
		$("#datasTitle").select2({
			placeholder:"请搜索或选择数据源",
			tags: true,
        	data: data,
        	allowClear: true ,
        
		});
		


		
	
	
    </script>
<script type="text/javascript">
$.fn.modal.Constructor.prototype.enforceFocus = function () { };
</script>
</body>
</html>
