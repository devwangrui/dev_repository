<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>诊改系统</title>
<!-- Bootstrap -->
<link href="${path}/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="${path}/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="${path}/css/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="${path}/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- bootstrap-progressbar -->
<link href="${path}/css/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="${path}/css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="${path}/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="${path}/css/build/css/custom.min.css" rel="stylesheet">
<!-- Switchery -->
<link href="${path}/css/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="${path}/css/build/css/custom.min.css" rel="stylesheet">
<!-- Datatables -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
<!--mystyle-->
<link rel="stylesheet" type="text/css" href="${path}/css/select.css" />
<!--colpick-->
<link rel="stylesheet" type="text/css" href="${path}/css/spectrum.css">

</head>

<body class="nav-md">
	<div class="container body">
		<!-- <include file="Public/left" /> -->
		<jsp:include page="/Index/left.do"></jsp:include>
		<!-- top navigation -->
		<!--  <include file="Public/top" /> -->
		<%@ include file="../Public/top.jsp"%>



		<!-- 模态框1 -->
		<div class="modal fade " id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"
						style="margin-top:5px;font-size: 30px;">&times;</button>
					<!-- 头部 -->
					<div class="modal-header">
						<h4 class="modal-title">编辑组件标题</h4>
					</div>

					<!-- 主体 -->
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label class="control-label col-md-12 col-sm-12 col-xs-12" style="margin: 10px auto;">标题名称
									<span class="required">:</span>
								</label>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<input type="text" id="title-name_input" required="required"
										class="form-control col-md-12 col-sm-12 col-xs-12" value="">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-12 col-sm-12 col-xs-12" style="margin: 10px auto;">标题位置
									<span class="required">:</span>
								</label>
								<div class="btn-group col-md-12 col-sm-12 col-xs-12" data-toggle="buttons">
									<label class="btn btn-default"> <input type="radio" name="options" id="option1"
										value="1"> 居左
									</label> <label class="btn btn-default"> <input type="radio" name="options" id="option2"
										value="2"> 居中
									</label> <label class="btn btn-default"> <input type="radio" name="options" id="option3"
										value="3"> 居右
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-12 col-sm-12 col-xs-12"
									style="margin: 20px auto 10px auto;">标题描述 <span class="required">:</span>
								</label>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<textarea class="form-control col-md-12 col-sm-12 col-xs-12" id="title-name-alert_input"
										style="resize: vertical;" placeholder="标题描述"></textarea>
								</div>
							</div>
						</form>
						<div class="clearfix"></div>
					</div>

					<!-- 底部 -->
					<div class="modal-footer">
						<div class="footerbtn floatright">
							<button type="button" class="btn btn-info floatleft" data-dismiss="modal" id="title_btn_true">确认</button>
							<button type="button" class="btn btn-warning floatleft" data-dismiss="modal"
								id="title_btn_reset">取消</button>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- 模态框2 -->
		<div class="modal fade " id="myModal2">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"
						style="margin-top:5px;font-size: 30px;">&times;</button>
					<!-- 头部 -->
					<div class="modal-header">
						<h4 class="modal-title">编辑查询条件</h4>
					</div>

					<!-- 主体 -->
					<div class="modal-body">
						<div class="col-md-6 col-sm-6 col-xs-6 body-select1">
							<ul class="body-select1_ul">
								<c:forEach items="${search }" var="vo">
									<li class="body-select1_li">
										<div class="body-select1_li_checkbox">
											<input type="checkbox" class="body-select1_li_check" id="body-select1_li_check${vo.id}"
												name="select1check" value="${vo.id}" <c:if test="${vo.id==chart.select}">checked</c:if>><label for="body-select1_li_check${vo.id}">${vo.title}</label>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6 body-select2">
							<p>
								<font class="body-select2_selname"> <!--这里添加列表名字-->
								</font>子选项列表
							</p>
							<div class="body-select2_list">
								<font class="body-select2_selname"> <!--这里添加列表名字-->
								</font>
								<ul id="body-select2_selul">
									<!--在这里添加li数据-->
								</ul>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

					<!-- 底部 -->
					<div class="modal-footer">
						<div class="footerbtn floatright">
							<button type="button" class="btn btn-info floatleft" data-dismiss="modal"
								id="select_btn_true">确认</button>
							<button type="button" class="btn btn-warning floatleft" data-dismiss="modal"
								id="select_btn_reset">取消</button>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 模态框3 -->
		<div class="modal fade " id="myModal3">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="min-height: 668px;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"
						style="margin-top:5px;font-size: 30px;">&times;</button>
					<!-- 头部 -->
					<div class="modal-header">
						<h4 class="modal-title">编辑组件内容</h4>
					</div>

					<!-- 主体 -->
					<div class="modal-body" style="position: relative;">
						<div class="modal3_title modal3_title1 floatleft"
							style="border-radius: 4px; background-color: rgb(237,237,237); color: #fff">
							<p>1.选择数据源</p>
						</div>
						<div class="modal3_title modal3_title2 floatleft"
							style="margin-left:35px;border-radius: 4px; background-color: rgb(237,237,237);">
							<p>2.编辑样式</p>
						</div>
						<div class="modal3_title modal3_title3 floatleft"
							style="margin-left:35px;border-radius: 4px; background-color: rgb(237,237,237);">
							<p>3.高级配置</p>
						</div>
						<div class="clearfix"></div>
						<div class="modal3_body1 modal3_body1_1" id="modal3_body1_1"
							style="border-radius: 4px;border: 1px solid #C1CDCD;padding: 5px 5px;display: block;">
							<div class="row">
								<div class="col-md-9">
									<input type="text" class="form-control" id="datas_search" placeholder="Search">
								</div>
								<br /> <br />
							</div>
							<div class="table-responsive">
								<table class="table table-striped jambo_table" id="datatable2">
									<thead>
										<tr class="headings">
											<th></th>
											<th class="column-title">业务系统</th>
											<th class="column-title">数据名称</th>
										</tr>
									</thead>
									<tbody id="data_table">
										<c:forEach items="${dic }" var="vo">
											<c:forEach items='${vo.list }' var="co">
												<tr class="even pointer">
													<td class="a-center"><input type="radio" class="flat" name="data" value="${co.id }">
													</td>
													<td class=" ">${vo.title }</td>
													<td class=" ">${co.title}</td>
												</tr>
											</c:forEach>
										</c:forEach>

									</tbody>
								</table>
							</div>
							<div class="footerbtn">
								<button type="button" id="modal3_body1_page1btn" class="btn btn-info">下一步</button>
							</div>
						</div>
						<div class="modal3_body1 modal3_body1_2" id="modal3_body1_2"
							style="border-radius: 4px;border: 1px solid #C1CDCD;padding: 5px 5px;display: none;">
							<p>内容类型</p>
							<ul class="modal3_body1_2_ul1">
								<li class="modal3_body1_2_ul-select">常规图表</li>
								<li>预测图表</li>
								<!--<li>常规地图</li>
                                <li>常规列表</li>-->
							</ul>
							<div class="clearfix"></div>
							<p>编辑模式</p>
							<div class="chart_sort">
								<ul class="modal3_body1_2_ul2">
									<c:forEach items="${ch }" var="vo">
										<c:if test="${vo.sort==1 }">
											<li id="s_li_${vo.id}">${vo.title}</li>
										</c:if>
									</c:forEach>
								</ul>
								<div class="clearfix"></div>
								<script>
									
								</script>
								<c:forEach items="${ch }" var="vo">
									<c:if test="${vo.sort==1 }">
										<ul class="modal3_body1_2_imgul" style="display: none;">
											<c:forEach items="${vo.userList }" var="co">
												<li id="chart_1_${co.id}"><img src="${path }/images/chart/${co.img}"
													alt="${co.title }" /></li>
											</c:forEach>
										</ul>
									</c:if>
								</c:forEach>
							</div>
							<div class="chart_sort" style="display: none;">
								<ul class="modal3_body1_2_ul2">
									<c:forEach items="${ch }" var="vo">
										<c:if test="${vo.sort==2 }">
											<li>${vo.title}</li>
										</c:if>
									</c:forEach>
								</ul>
								<div class="clearfix"></div>
								<c:forEach items="${ch }" var="vo">
									<c:if test="${vo.sort==2 }">
										<ul class="modal3_body1_2_imgul" style="display: none;">
											<c:forEach items="${vo.userList }" var="co">
												<li id="chart_2_${co.id }"><img src="${path }/images/chart/${co.img}"
													alt="${co.title }" /></li>
											</c:forEach>
										</ul>
									</c:if>
								</c:forEach>
							</div>

							<div class="footerbtn">
								<button type="button" id="modal3_body1_page2btn" class="btn btn-info">下一步</button>
							</div>
						</div>
						<div class="modal3_body1 modal3_body1_3" id="modal3_body1_3"
							style="border-radius: 4px;border: 1px solid #C1CDCD;padding: 5px 5px;display: none;">
							<p>基本配置</p>
							<div class="form-group">
								选择颜色：<input type="" name="" id="full" value="" />
							</div>
							<p>高级配置</p>
							<div class="col-md-5 col-xs-5 col-sm-5 floatleft">
								<p style="color: #999999;">坐标轴组件</p>
								<div class="row">
									<div class="form-group floatleft zuobiaozhou">
										<label for="numbox" class="form-label-left">距离上边</label>
										<div class="numbox">
											<div id="" class="floatleft numup">&and;</div>
											<input id="id1" class="floatleft numNum" value="30"
												onkeyup="value=value.replace(/[^\d]/g,'')"></input>
											<div id="" class="floatleft numdown">&or;</div>
										</div>
									</div>
									<div class="form-group floatleft zuobiaozhou">
										<label for="numbox" class="form-label-left">距离下边</label>
										<div class="numbox">
											<div id="" class="floatleft numup">&and;</div>
											<input id="id2" class="floatleft numNum" value="30"
												onkeyup="value=value.replace(/[^\d]/g,'')"></input>
											<div id="" class="floatleft numdown">&or;</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group floatleft zuobiaozhou">
										<label for="numbox" class="form-label-left">距离左边</label>
										<div class="numbox">
											<div id="" class="floatleft numup">&and;</div>
											<input id="id3" class="floatleft numNum" value="30"
												onkeyup="value=value.replace(/[^\d]/g,'')"></input>
											<div id="" class="floatleft numdown">&or;</div>
										</div>
									</div>
									<div class="form-group floatleft zuobiaozhou">
										<label for="numbox" class="form-label-left">距离右边</label>
										<div class="numbox">
											<div id="" class="floatleft numup">&and;</div>
											<input id="id4" class="floatleft numNum" value="30"
												onkeyup="value=value.replace(/[^\d]/g,'')"></input>
											<div id="" class="floatleft numdown">&or;</div>
										</div>
									</div>
								</div>

							</div>
							<div class="col-md-7 col-xs-7 col-sm-7 floatleft">
								<p style="color: #999999;" class="floatleft">图例组件&nbsp;</p>
								<input type="checkbox" id="js-switch-1" class="js-switch-1 floatleft" checked />
								<div class="clearfix"></div>
								<div id="hidrow" style="display: none;">
									<!--style="display: none;"-->
									<!--在这判断开关-->
								</div>
								<div class="row hidrow">
									<div class="form-group floatleft zuobiaozhou">
										<label for="modal3_body1_3_selectbox" class="form-label-left">类型</label>
										<div class="clearfix"></div>
										<select name="modal3_body1_3_selectbox" class="modal3_body1_3_selectbox">
											<option value="">滚动</option>
											<option value="">滚动</option>
											<option value="">滚动</option>
											<option value="">滚动</option>
										</select>
									</div>
									<div class="form-group floatleft zuobiaozhou">
										<label for="modal3_body1_3_selectbox" class="form-label-left">横向</label>
										<div class="clearfix"></div>
										<select name="modal3_body1_3_selectbox" class="modal3_body1_3_selectbox">
											<option value="">居左</option>
											<option value="">居左</option>
											<option value="">居左</option>
											<option value="">居左</option>
										</select>
									</div>
									<div class="form-group floatleft zuobiaozhou">
										<label for="modal3_body1_3_selectbox" class="form-label-left">纵向</label>
										<div class="clearfix"></div>
										<select name="modal3_body1_3_selectbox" class="modal3_body1_3_selectbox">
											<option value="">居上</option>
											<option value="">居上</option>
											<option value="">居上</option>
											<option value="">居上</option>
										</select>
									</div>
								</div>

								<div class="row hidrow">
									<div class="form-group floatleft zuobiaozhou">
										<label for="modal3_body1_3_selectbox" class="form-label-left">排列方式</label>
										<div class="clearfix"></div>
										<select name="modal3_body1_3_selectbox" class="modal3_body1_3_selectbox">
											<option value="">横向</option>
											<option value="">横向</option>
											<option value="">横向</option>
											<option value="">横向</option>
										</select>
									</div>
									<div class="form-group floatleft zuobiaozhou">
										<label for="modal3_body1_3_selectbox" class="form-label-left">边框宽度</label>
										<div class="clearfix"></div>
										<input name="modal3_body1_3_selectbox" class="modal3_body1_3_selectbox" value="30" id="id5"
											onkeyup="value=value.replace(/[^\d]/g,'')"></input>
									</div>
									<div class="form-group floatleft zuobiaozhou">
										<label for="modal3_body1_3_selectbox" class="form-label-left">内间距</label>
										<div class="clearfix"></div>
										<select name="modal3_body1_3_selectbox" class="modal3_body1_3_selectbox">
											<option value="">滚动</option>
											<option value="">滚动</option>
											<option value="">滚动</option>
											<option value="">滚动</option>
										</select>
									</div>
									<!--<div class="form-group floatleft zuobiaozhou">
                                        <label for="modal3_body1_3_selectbox" class="form-label-left">ICON图形</label>
                                        <div class="clearfix"></div>
                                        <select name="modal3_body1_3_selectbox" class="modal3_body1_3_selectbox">
                                            <option value="">选择图形</option>
                                            <option value="">选择图形</option>
                                            <option value="">选择图形</option>
                                            <option value="">选择图形</option>
                                        </select>
                                    </div>-->
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="row floatleft"
								style="margin-left: 10px;margin-top: 20px;width: 180px;text-align: right;">
								<p style="color: #999999;" class="floatleft">提示框组件&nbsp;</p>
								<input type="checkbox" class="js-switch-2" checked />
							</div>
							<div class="row floatleft"
								style="margin-left: 100px;margin-top: 20px;width: 180px;text-align: right;">
								<p style="color: #999999;" class="floatleft">工具栏组件&nbsp;</p>
								<input type="checkbox" class="js-switch-3" checked />
							</div>
							<div class="clearfix"></div>
							<div class="row          " style="margin-left: 10px;width: 180px;text-align: right;">
								<p style="color: #999999;" class="floatleft">区域缩放组件&nbsp;</p>
								<input type="checkbox" class="js-switch-4" checked />
							</div>

							<div class="footerbtn">
								<button type="button" id="modal3_body1_page3btn" data-dismiss="modal" class="btn btn-info">完成</button>
							</div>
						</div>
					</div>

					<!-- 底部 -->
					<div class="modal-footer"></div>

				</div>
			</div>
		</div>

		<!--中间内容-->
		<div class="right_col" role="main">
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								图表配置 <small>当前位置/图表配置/ <c:choose>
										<c:when test="${id>=1 }">
								修改图表
								</c:when>
										<c:otherwise>添加图表</c:otherwise>
									</c:choose>
								</small>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<br />
							<form id="demo-form2" class="form-horizontal form-label-left " METHOD="POST" ACTION="${path}/YzTargetSort1/save.do">
								<div class="form-group">
									<label class="control-label col-md-2 col-sm-2 col-xs-12" for="zujian-name">填写组件名称 <span
										class="required">:</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input type="text" id="zujian-name" name="title" required="required"
											class="form-control col-md-7 col-xs-12" 
											<c:choose>
										<c:when test="${id>=1 }">
												value="${chart.title }"
										</c:when>
										<c:otherwise>value=""</c:otherwise>
									</c:choose> placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2 col-sm-2 col-xs-12" for="zujian-body">编辑组件内容 <span
										class="required">:</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<div class="container form-control col-md-7 col-xs-12" id="zujian-body">
											<div class="body-title1 col-md-4 col-sm-4 col-xs-12" data-toggle="modal"
												data-target="#myModal" title="点击设置此内容">
												<p style="margin-top: 5px;" id="title-name_output-no">--点击此区域编辑标题--</p>
												<p id="title-name_output"></p>
												<p id="title-name_output-small"></p>
											</div>
											<div class="body-title2 col-md-8 col-sm-8 col-xs-12" data-toggle="modal"
												data-target="#myModal2" title="点击设置此内容">
												<p style="margin-top: 5px;" id="select-name_output-no">--点击此区域编辑筛选条件--</p>
												<div class="" id="body-title2_select" onClick="event.cancelBubble = true"></div>
											</div>
											<div class="body-title3 col-md-12 col-sm-12 col-xs-12" style="display: none;">
												<p>--点击此区域查询条件--</p>
											</div>
											<div class="body-title4 col-md-3 col-sm-3 col-xs-12" style="display: none;">
												<p>--点击此区域编辑内容--</p>
											</div>
											<div class="body-title5 col-md-12 col-sm-12 col-xs-12" data-toggle="modal"
												data-target="#myModal3" title="点击设置此内容" >
												<p>--点击此区域编辑内容--</p>
												<input type="hidden" name="data" value=""> <input type="hidden" name="chart"
													value="">
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
								<input type="hidden" name="idone" id="idone" value="${id }"> 
									<input type="hidden" name="t_id" id="tid" value="${tid }"> <input type="hidden"
										name="sort" value="${sort }"> <input type="button" class="btn btn-danger col-md-offset-4"
										name="" id="resetBtn" value="重置" /> <input type="button" class="btn btn-primary"
										value="返回"
										onclick="window.location='${path}/YzTargetSort1/configChart.do?id=${tid }&sort=${sort}'" />
									<input type="submit" class="btn btn-success"  value="提交" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<br />
		</div>
		<!-- /page content -->
	</div>
<!-- jQuery -->
	<script src="${path }/css/vendors/jquery/dist/jquery.min.js"></script>
	<!-- jQuery Tags Input -->
	<!-- iCheck -->
	<script src="${path }/css/vendors/iCheck/icheck.min.js"></script>
	<!-- Bootstrap -->
	<script src="${path }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!--模态框1-->
	<script src="https://cdn.bootcss.com/popper.js/1.14.3/esm/popper.min.js"></script>
<script type="text/javascript">
    $("#title_btn_true").click(function() {
        var optval = 0; /*初始化标题位置*/
        var optval = $("input[name='options']:checked").val();      /*获取用户选择标题位置数据是yz_target_chart表的select*/
        var inthtml = $("#title-name_input").val();                 /*获取用户输入标题的内容数据是yz_target_chart表的box_title*/
        //alert(inthtml);
        var inthtmlalert = $("#title-name-alert_input").val();      /*获取用户输入标题描述的内容*/
        if(optval == 1) { /*设置用户选择位置*/
            $(".body-title1").css("text-align", "left");
        } else if(optval == 2) {
            $(".body-title1").css("text-align", "center");
        } else {
            $(".body-title1").css("text-align", "right");
        }
        $("#title-name_output-no").hide();
        //增加input
        inthtml += '<input type="hidden" name="box_title" value="'+inthtml+'">';
        inthtmlalert += '<input type="hidden" name="box_con" value="'+inthtmlalert+'">';
        $("#title-name_output").html(inthtml);
        $("#title-name_output-small").html(inthtmlalert);
    });

    $("#title_btn_reset").click(function() {
        $(".body-title1").css("text-align", "center");
        $("#title-name_output-no").show();
        $("#title-name_output").hide();
        $("#title-name_output-small").hide();
    });
</script>


	<!--模态框2-->
	<script type="text/javascript">
		//生成筛选数组
		/*     var s_json = '[{"id":"1","title":"\u5206\u9662","remark":"xy_id","child":["\u7535\u4fe1\u5b66\u9662","\u5de5\u5546\u5916\u8bed\u5b66\u9662"]},{"id":"2","title":"\u4e13\u4e1a","remark":"zy","child":null},{"id":"3","title":"\u5e74\u7ea7","remark":"nj","child":["2015","2016","2017"]},{"id":"4","title":"\u6708\u4efd","remark":"month","child":["\u4e00\u6708","\u4e8c\u6708","\u4e09\u6708","\u56db\u6708","\u4e94\u6708","\u516d\u6708","\u4e03\u6708","\u516b\u6708","\u4e5d\u6708","\u5341\u6708","\u5341\u4e00\u6708","\u5341\u4e8c\u6708"]},{"id":"5","title":"\u5730\u533a","remark":"address","child":null}]'; */
		var s_json = '${sea}';
		var s_arr = eval(s_json);
		var arrName = []; /*设置每个列表的名字*/
		var arrId = []; /*设置每个列表的ID*/
		var arr = [];
		for (var i = 0; i < s_arr.length; i++) {
			arrName[i] = s_arr[i]['title'];
			arrId[i] = s_arr[i]['id'];
			arr[i] = s_arr[i]['child'];
		}
		//图表类别
		$('.body-select1 ul li').click(
				function() {
					var index = $(this).index(); /*获取所点击的列表项*/
					$('#body-select2_selul li').remove(); /*先移除已有的li*/
					$('.body-select2_selname').text(arrName[index]); /*设置列表名字*/
					for (var i = 0; i < arr[index].length; i++) { /*遍历所选的列表并添加*/
						$('#body-select2_selul').append(
								"<li>" + arr[index][i] + "</li>");
					}
				});
		
		$('#select_btn_true').click(function() {
			$('#body-title2_select select').remove(); /*先删除原有的select*/
			$("#select-name_output-no").hide(); /*隐藏框内提示文字*/
			var id_array = new Array();
			$('input[name="select1check"]:checked').each(function() {
				id_array.push($(this).val()); //向数组中添加已选择的check的value值
			});
			//创建select
			create_select(id_array);

		});
		$('#select_btn_reset').click(function() {
			$('#body-title2_select select').remove(); /*先删除所有的select*/
			$("#select-name_output-no").show(); /*恢复框内提示文字*/
		});

		function create_select(id_array) {
			for (var i = 0; i < id_array.length; i++) { /*遍历所选的列表并添加*/
				var ss = id_array[i]; //定义arr为选中的那个数组
				var dd = arr[ss - 1];
				var search_id = arrId[ss - 1];
				// 创建select
				$('#body-title2_select')
						.append(
								'<select class="form-control" name="value"  id="newselect' + i + '"></select>');
				// 添加选项
				for (var j = 0; j < dd.length; j++) {
					var ff = 'newselect' + i;
					$("<option></option>").val(dd[j]).text(dd[j])
							.appendTo('#' + ff);
				}
				$("input[name='select']").remove();
				//创建input
				$('#body-title2_select')
						.append(
								'<input type="hidden" name="select" id="select" class="select" value="'+search_id+'">');
			}
		}
	</script>
	<!--重置按钮-->
	<script type="text/javascript">
		$("#resetBtn").click(function() {
			$('#zujian-name').val(""); /*组建名称重置*/
			$('#body-title2_select select').remove(); /*删除所有的select*/
			$("#select-name_output-no").show(); /*重置select1样式*/
			$(".body-title1").css("text-align", "center"); /*重置title1样式*/
			$("#title-name_output-no").show(); /*重置title1样式*/
			$("#title-name_output").hide(); /*重置title1样式*/
			$("#title-name_output-small").hide(); /*重置title1样式*/
		});
	</script>
	<!--模态框3-->

	<!--colpick-->

	<script type="text/javascript" src="${path }/js/spectrum.js"></script>

	<!--num-->
	<script type="text/javascript">
		$(".numup").click(function() {
			var thisnum = parseInt($(this).next().val());
			thisnum++;
			$(this).next().val(thisnum);
		}), $(".numdown").click(function() {
			var thisnum = parseInt($(this).prev().val());
			thisnum--;
			$(this).prev().val(thisnum);
		});
	</script>

	<!-- Switchery -->
	<script src="${path }/css/vendors/switchery/dist/switchery.min.js"></script>
	<script type="text/javascript">
		// Colored switches
		var switches1 = document.querySelector('.js-switch-1');
		var switchery = new Switchery(switches1, {
			color : 'rgb(52, 122, 184)',
			jackColor : '#ffffff'
		});

		var switches2 = document.querySelector('.js-switch-2');
		var switchery = new Switchery(switches2, {
			color : 'rgb(52, 122, 184)',
			jackColor : '#ffffff'
		});

		var switches3 = document.querySelector('.js-switch-3');
		var switchery = new Switchery(switches3, {
			color : 'rgb(52, 122, 184)',
			jackColor : '#ffffff'
		});

		var switches4 = document.querySelector('.js-switch-4');
		var switchery = new Switchery(switches4, {
			color : 'rgb(52, 122, 184)',
			jackColor : '#ffffff'
		});

		var changeCheckbox = document.querySelector('.js-switch-1'), changeField = document
				.querySelector('#hidrow');

		changeCheckbox.onchange = function() {
			changeField.innerHTML = changeCheckbox.checked;
		};

		//var pink = document.querySelector('.js-switch-pink');
		//var switchery = new Switchery(pink, { color: '#faab43', secondaryColor: '#fC73d0', jackColor: '#fcf45e', jackSecondaryColor: '#c8ff77' });
	</script>

	<script type="text/javascript">
		$("#hidrow").on('DOMNodeInserted', function(e) {
			$(".hidrow").toggle(0);
		});
	</script>



	<!--modal3_title1切换-->
	<script type="text/javascript">
		var djl1 = 1;
		var djl2 = 0;
		var djl3 = 0;
		$(".modal3_title1").css("background-color", "rgb(52, 122, 184)");
		$(".modal3_title").click(
				function() {
					$(this).css("background-color", "rgb(52, 122, 184)");
					$(this).css("color", '#fff');
					//$(this).siblings(".modal3_title").css("background-color", "rgba(52, 122, 184,.8)");
					var dh = $(this).index();
					switch (dh) {
					case 0:
						$("#modal3_body1_1").show();
						$("#modal3_body1_2").hide();
						$("#modal3_body1_3").hide();
						//djl1=1;
						break;
					case 1:
						$("#modal3_body1_1").hide();
						$("#modal3_body1_2").show();
						$("#modal3_body1_3").hide();
						djl2 = 1;
						break;
					case 2:
						$("#modal3_body1_1").hide();
						$("#modal3_body1_2").hide();
						$("#modal3_body1_3").show();
						djl3 = 1;
						break;
					default:
						break;
					}
					if (djl1 == 1 && dh != 0) {
						//alert(1);
						$('.modal3_title').eq(0).css("background-color",
								"rgba(52, 122, 184,.8)");
						$('.modal3_title').eq(0).css("color", '#fff');
					}
					if (djl2 == 1 && dh != 1) {
						$('.modal3_title').eq(1).css("background-color",
								"rgba(52, 122, 184,.8)");
						$('.modal3_title').eq(1).css("color", '#fff');
					}
					if (djl3 == 1 && dh != 2) {
						$('.modal3_title').eq(2).css("background-color",
								"rgba(52, 122, 184,.8)");
						$('.modal3_title').eq(2).css("color", '#fff');
					}
				});

		/* //数据源查询更新
		$('#datas_search').keyup(
						function() {
							var key = $(this).val();
							$('#data_table').find('tr').remove();
							$.post(
								'/Home/Adminchart/select_datas',
								{key : key},function(result) {
												$.each(result,function(index,value) {
																	var con = '<tr class="even pointer"><td class="a-center"><input type="radio" class="flat" name="data" value="'+value.id+'"></td><td class=" ">'+ value.title+ '</td><td class=" ">'+ value.d_title+ '</td></tr>';
																	$(
																			'#data_table')
																			.append(
																					con);
																});
											}, 'json');
						}); */
	</script>

	<!--下一步切换-->
	<script type="text/javascript">
	
		$("#modal3_body1_page1btn").click(
						function() {
							$("#modal3_body1_1").hide();
							$("#modal3_body1_2").show();
							$("#modal3_body1_3").hide();
							$(".modal3_title1").css("background-color",
									"rgba(52, 122, 184,.8)");
							$(".modal3_title2").css("background-color",
									"rgb(52, 122, 184)");
							$(".modal3_title2").css('color', '#fff');
						}),
				$("#modal3_body1_page2btn").click(
						function() {
							$("#modal3_body1_1").hide();
							$("#modal3_body1_2").hide();
							$("#modal3_body1_3").show();
							$(".modal3_title2").css("background-color",
									"rgba(52, 122, 184,.8)");
							$(".modal3_title3").css("background-color",
									"rgb(52, 122, 184)");
							$(".modal3_title3").css('color', '#fff');
						}),
				$("#modal3_body1_page3btn")
						.click(
								function() {
									var top=$('#id1').val();
									var bottom=$('#id2').val();
									var left=$('#id3').val();
									var right=$('#id4').val();
									var width=$('#id5').val();
									//获取值
									var data_id = 0;
									$("input[name='data']").each(function() {
										if ($(this).prop('checked')) {
											data_id = $(this).val();
										}
									});
									if (data_id == 0) {
										alert('请选择数据源');
										return false;
									}
									var data_input = '<input type="hidden" name="data" value="'+data_id+'">';
									var chart_id = 0;
									var chart_li_id = $(
											'.modal3_body1_2_imgul-select')
											.prop('id');
									if (chart_li_id == undefined) {
										alert('请选择图表');
										return false;
									}
									$('.body-title5').find('img').remove();
									var chart_li_arr = chart_li_id.split('_');
									chart_id = chart_li_arr[2];
									var chart_input = '<input type="hidden" name="chart" value="'+chart_id+'">';
									var img = $('.modal3_body1_2_imgul-select').find('img').prop('src');
									$(".body-title5").css("background-color", "#FFF");
									$(".body-title5").css("padding", "0");
									$(".body-title5").append('<img src="' + img + '" class="blimg" style="margin:'+top+'px '+right+'px '+bottom+'px '+left+'px;width:'+width+'%">');
									$(".body-title5").find('p').hide();

									$('.body-title5').find('input').remove();
									$('.body-title5').append(data_input);
									$('.body-title5').append(chart_input);
									alert('添加成功');
								});
	</script>
	<!--第二步骤选择-->
	<script type="text/javascript">
		$(".modal3_body1_2_ul1 li").click(function() {
			$(this).siblings('li').removeClass("modal3_body1_2_ul-select");
			$(this).addClass("modal3_body1_2_ul-select");
			var i = $(this).index();
			$('.chart_sort').hide();
			$('.chart_sort').eq(i).show();
		});
		$(".modal3_body1_2_ul2 li").click(
				function() {
					$(this).siblings('li').removeClass(
							"modal3_body1_2_ul-select");
					$(this).addClass("modal3_body1_2_ul-select");
					var sis = $(this).index();
					$(this).parent('ul').siblings('.modal3_body1_2_imgul')
							.hide();
					$(this).parent('ul').siblings('.modal3_body1_2_imgul').eq(
							sis).show();
				});
		$(".modal3_body1_2_imgul li").click(
				function() {
					$('.modal3_body1_2_imgul-select').removeClass(
							'modal3_body1_2_imgul-select');
					//$(this).siblings("li").removeClass("modal3_body1_2_imgul-select");
					$(this).addClass("modal3_body1_2_imgul-select");
				});
	</script>
	<script>
		//初始化内容
		var box_title = '${chart.boxTitle}';
		var box_con='${chart.boxCon}';
		if (box_title != '') {
			$('#title-name_output-no').hide();
			box_title += '<input type="hidden" name="box_title" value="'+box_title+'">';
			box_con += '<input type="hidden" name="box_con" value="'+box_con+'">';
		    $("#title-name_output").html(box_title);
		    $("#title-name_output-small").html(box_con);
		}
		var selcect='${chart.select}';
		var select_id_str = '["'+selcect+'"]';
		if (selcect != '') {
			var select_id_arr = eval('(' + select_id_str + ')');
			create_select(select_id_arr);
			$('#select-name_output-no').hide();
			 var checkValue='${sean.ti}';
			 var osel=document.getElementById("body-title2_select"); 
			 var opts=osel.getElementsByTagName("option");
			    for(var i=0; i<opts.length; i++){  
			        if(opts[i].innerHTML == checkValue){  
			        	opts[i].selected = true;  
			            break;  
			        }  
			    }  
		}
		var data_id = '${chart.data}';
		if (data_id != '') {
			$('#data_table').find("input[value='" + data_id + "']").prop(
					'checked', true);
		}
		//已选图表
		var chart = '${chart.chart}';
		var img='${img.img}';
		if (chart != '') {
			$('.modal3_body1_2_ul1').find('.modal3_body1_2_ul-select')
					.removeClass("modal3_body1_2_ul-select");
			var chart_s = parseInt('${chartS.sort}');
			var chart_s_index = chart_s - 1;
			$('.modal3_body1_2_ul1').find('li').eq(chart_s_index).addClass(
					"modal3_body1_2_ul-select");
			$('.chart_sort').hide();
			$('.chart_sort').eq(chart_s_index).show();
			var chart_s_s = parseInt('${chartS.id}');
			//$('.chart_sort').eq(chart_s).find('.modal3_body1_2_ul2').find('li').eq()
			$('#s_li_' + chart_s_s).addClass('modal3_body1_2_ul-select');
			var s_s_index = $('#s_li_' + chart_s_s).index();
			$('#s_li_' + chart_s_s).parent('ul').siblings(
					'.modal3_body1_2_imgul').eq(s_s_index).show();
			$('#chart_' + chart_s + '_' + chart).addClass(
					'modal3_body1_2_imgul-select');
			$(".body-title5").css("background-color", "#FFF");
			$(".body-title5").css("padding", "0");
			$(".body-title5").append('<img src="${path }/images/chart/' + img + '" class="blimg" style="width:30%;height:30%;margin-left:35%;margin-top:20%;">');
			$(".body-title5").find('p').hide();
		}
	</script>

	<!-- Datatables -->
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<SCRIPT TYPE="text/javascript">
	 $('#datatable2').DataTable({
    	//不显示左下角提示
        "info":false,
      	//开启分页器
        "paging":true, 
      	//改变每页显示数据数量
        "lengthChange": true, 
      	//设置一页8行，必须开启分页才生效
        "iDisplayLength": 8, 
        "ordering": false,
        "searching" : false,
        "pagingType": "simple_numbers",
    });
	 </SCRIPT>
	<!--必要-->
	<script src="${path}/css/build/js/custom.js"></script>

</body>

</html>