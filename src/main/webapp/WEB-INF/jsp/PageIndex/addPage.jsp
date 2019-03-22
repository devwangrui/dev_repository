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
<title>页面管理</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="${pageContext.request.contextPath }/css/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath }/css/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- Switchery -->
<link href="${pageContext.request.contextPath }/css/vendors/switchery/dist/switchery.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
<!--   Datatables -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" /> 

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" /> 

<!--mystyle-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/zhengGai.css" />
</head>
<body class="nav-md">
	<div class="container body">
		<!-- <include file="Public/left" /> -->
		<jsp:include page="/Index/left.do"></jsp:include>
		<!-- top navigation -->
		<!-- <include file="Public/top" /> -->
		<%@ include file="../Public/top.jsp"%>

		<!-- 模态框1 -->
		<div class="modal fade " id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"
						style="margin-top:5px;font-size: 30px;">&times;</button>
					<!-- 头部 -->
					<div class="modal-header">
						<h4 class="modal-title">添加分区</h4>
					</div>

					<!-- 主体 -->
					<div class="modal-body">
						<p class="pzbTitle">选择分区占屏幕比例</p>
						<ul class="list-group pzbUl">
							<li class="pzbUl_li pzbUl_li-Select">1</li>
							<li class="pzbUl_li">3/4</li>
							<li class="pzbUl_li">2/3</li>
							<li class="pzbUl_li">1/2</li>
							<li class="pzbUl_li">1/3</li>
							<li class="pzbUl_li">1/4</li>
						</ul>
						<div class="clearfix"></div>
					</div>

					<!-- 底部 -->
					<div class="modal-footer" style="margin-top: 5%;">
						<div class="footerbtn">
							<button type="button" class="btn btn-default floatleft" data-dismiss="modal" id="bl_btn_true">确认</button>
							<button type="button" class="btn btn-default floatleft" data-dismiss="modal"
								id="bl_btn_reset">取消</button>
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
						<!-- <div class="row">
                            <div class="col-md-9"><input type="text" class="form-control" placeholder="Search"></div>
                            <br/><br/>
                        </div> -->
						<div class="table-responsive">
							<table class="table table-striped jambo_table" id="datatable1">
								<thead>
									<tr>
										<th></th>
										<th class="column-title">标题</th>
										<th class="column-title">图表</th>
										<th class="column-title">添加时间</th>
									</tr>
								</thead>
								<tbody>
									<!-- <volist name="d_list" id="vo"> -->
									<c:forEach items="${chart }" var="vo">
										<tr class="even pointer">
											<td class="a-center "><input type="radio" value="${vo.id }" class="flat"
												name="table_records"></td>
											<td class=" ">${vo.title }</td>
											<c:forEach items="${vo.userList }" var="fo">
												<td class=" "><img src="${pageContext.request.contextPath }/images/chart/${fo.img}"
													alt="${fo.title }" height="40px" style="cursor: pointer;" title="${fo.title }"></td>
											</c:forEach>
											<td class=" ">${vo.addTime}</td>
										</tr>
									</c:forEach>
									<!-- </volist> -->
								</tbody>
							</table>
						</div>
						<div class="clearfix"></div>
					</div>

					<!-- 底部 -->
					<div class="modal-footer">
						<div class="footerbtn floatright">
							<button type="button" class="btn btn-default floatleft" data-dismiss="modal"
								id="select_btn_true">确认</button>
							<button type="button" class="btn btn-default floatleft" data-dismiss="modal"
								id="select_btn_reset">取消</button>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- 模态框3 -->
		<div class="modal fade " id="myModal3">
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"
						style="margin-top:5px;font-size: 30px;">&times;</button>
					<!-- 头部 -->
					<div class="modal-header">
						<h4 class="modal-title">添加分区组件</h4>
					</div>

					<!-- 主体 -->
					<div class="modal-body">
						<p class="pzbTitle">选择分区占屏幕比例</p>
						<ul class="list-group pzbUl pzbSUl">
							<li class="pzbUl_li pzbUl_li-Select pzbSUl_li">1</li>
							<li class="pzbUl_li pzbSUl_li">3/4</li>
							<li class="pzbUl_li pzbSUl_li">2/3</li>
							<li class="pzbUl_li pzbSUl_li">1/2</li>
							<li class="pzbUl_li pzbSUl_li">1/3</li>
							<li class="pzbUl_li pzbSUl_li">1/4</li>
						</ul>
						<div class="clearfix"></div>
					</div>

					<!-- 底部 -->
					<div class="modal-footer" style="margin-top: 5%;">
						<div class="footerbtn">
							<button type="button" class="btn btn-default floatleft" data-dismiss="modal"
								id="blSadd_btn_true">确认</button>
							<button type="button" class="btn btn-default floatleft" data-dismiss="modal"
								id="blSadd_btn_reset">取消</button>
						</div>
					</div>

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
								页面配置 <small>当前位置/页面配置/页面添加</small>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<br />
							<form action="" class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-md-2 col-sm-2 col-xs-12" for="title">填写页面名称 <span
										class="required">:</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input type="text" id="title" required="required" class="form-control col-md-7 col-xs-12"
											value="" placeholder="">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2 col-sm-2 col-xs-12" for="is_show">是否列表显示 <span
										class="required">:</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<label> <input type="checkbox" id="is_show" class="js-switch" checked />
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2 col-sm-2 col-xs-12" for="">编辑组件内容 <span
										class="required">:</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12" style="">
										<div class="rowBox container form-control col-md-7 col-xs-12"
											style="padding: 5px 5px 0px 5px;min-height: 204px;" id="">
											<div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 rowBox_10" id="rowBox_10"
												title="点击设置此内容" style="display:none">
												<div class="bl bl1" data-toggle="modal" data-target="#myModal2">
													<div style="" class="blp" id="">
														<p>十</p>
														--&nbsp;点击此区域添加横向分区&nbsp;--
													</div>
												</div>
												<div class="closebtn" onClick="event.cancelBubble = true">-</div>
											</div>
											<div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 rowBox_11" id="rowBox_11"
												title="点击设置此内容" style="display:none">
												<div class="bl bl3-4" data-toggle="modal" data-target="#myModal2">
													<div style="" class="blp" id="">
														<p>十</p>
														--&nbsp;点击此区域添加横向分区&nbsp;--
													</div>
													<div class="closebtnS" onClick="event.cancelBubble = true">-</div>
												</div>
												<div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
												<div class="closebtn">-</div>
											</div>
											<div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 rowBox_12" id="rowBox_12"
												title="点击设置此内容" style="display:none">
												<div class="bl bl2-3" data-toggle="modal" data-target="#myModal2">
													<div style="" class="blp" id="">
														<p>十</p>
														--&nbsp;点击此区域添加横向分区&nbsp;--
													</div>
													<div class="closebtnS" onClick="event.cancelBubble = true">-</div>
												</div>
												<div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
												<div class="closebtn">-</div>
											</div>
											<div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 rowBox_13" id="rowBox_13"
												title="点击设置此内容" style="display:none">
												<div class="bl bl1-2" data-toggle="modal" data-target="#myModal2">
													<div style="" class="blp" id="">
														<p>十</p>
														--&nbsp;点击此区域添加横向分区&nbsp;--
													</div>
													<div class="closebtnS" onClick="event.cancelBubble = true">-</div>
												</div>
												<div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
												<div class="closebtn">-</div>
											</div>
											<div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 rowBox_14" id="rowBox_14"
												title="点击设置此内容" style="display:none">
												<div class="bl bl1-3" data-toggle="modal" data-target="#myModal2">
													<div style="" class="blp" id="">
														<p>十</p>
														--&nbsp;点击此区域添加横向分区&nbsp;--
													</div>
													<div class="closebtnS" onClick="event.cancelBubble = true">-</div>
												</div>
												<div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
												<div class="closebtn">-</div>
											</div>
											<div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 rowBox_15" id="rowBox_15"
												title="点击设置此内容" style="display:none">
												<div class="bl bl1-4" data-toggle="modal" data-target="#myModal2">
													<div style="" class="blp" id="">
														<p>十</p>
														--&nbsp;点击此区域添加横向分区&nbsp;--
													</div>
													<div class="closebtnS" onClick="event.cancelBubble = true">-</div>
												</div>
												<div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
												<div class="closebtn">-</div>
											</div>
											<div class="rowBox_add col-md-12 col-sm-12 col-xs-12" id="addrow_box"
												style="margin-top: 0px;" data-toggle="modal" data-target="#myModal" title="点击设置此内容"
												>
												<div style="" class="blp" id="">
													<p>十</p>
													--&nbsp;点击此区域添加横向分区&nbsp;--
												</div>
											</div>
											<!-- <div class="rowBox_add col-md-12 col-sm-12 col-xs-12" id="addrow_box"
												style="margin-top: 0px;" data-toggle="modal" data-target="#myModal" title="点击设置此内容"
												>
												<div style="" class="blp" id="">
													<p>十</p>
													--&nbsp;点击此区域添加横向分区&nbsp;--
												</div>
											</div> -->
										</div>
										<div class="clear"></div>
										<div class="bl addblhtml" data-toggle="modal" data-target="#myModal2"
											style="display: none;">
											<!--复制这个框添加到行内-->
											<div style="" class="blp" id="">
												<p>十</p>
												--&nbsp;点击此区域添加横向分区&nbsp;--
											</div>
											<div class="closebtnS" onClick="event.cancelBubble = true">-</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<input type="button" class="btn btn-primary col-md-offset-4" value="返回"
										onclick="window.location.href='${pageContext.request.contextPath }/PageIndex/pageEdit.do?id=${pid }'" />
									<input type="button" class="btn btn-danger" name="" id="resetBtn" value="重置" /> <input
										type="button" class="btn btn-success" name="" id="page_submit" value="提交" />

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
	<script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!--模态框1-->
	<script src="https://cdn.bootcss.com/popper.js/1.14.3/esm/popper.min.js"></script>
	<script type="text/javascript">
    var page = [];
    var chart = [];
    //var id = '{$id}';
    var pid = '${pid}';
    //$(".rowBox_1").hide();
      $(".rowBox_add").show(); //添加行
    //$(".rowBox_1").eq(0).show();
    //$(".rowBox_1").eq(1).show(); //添加列
    dji = 0; /*整行选择li初始化*/
    //djiS = 0; /*行内选择li初始化*/
    djiSbli = 0; //第几个父级 rowBox_1
    var box_arr = [12,9,8,6,4,3];
    $(".pzbUl li").click(function() {
        $(this).addClass("pzbUl_li-Select");
        $(this).siblings("li").removeClass("pzbUl_li-Select");
        dji = $(this).index();
    });
    $("#bl_btn_true").click(function() {
        //$(".rowBox_1").eq(dji).show();
        var aa = $(".rowBox_1").length + 1;
        $(".rowBox_1").eq(dji).clone(true).insertBefore($("#addrow_box"));
        $("#addrow_box").prev().show();
        $("#addrow_box").prev().addClass("rowBox_1" + aa);
        var page_temp = [];
        var chart_temp = [];
        page_temp.push(box_arr[dji]);
        chart_temp.push(box_arr[dji]);
        page.push(page_temp);
        chart.push(chart_temp);
        console.log(page);
    });
    $(".closebtn").click(function() {
        var y = $(this).parent().index() - 6;
        page.splice(y,1);
        chart.splice(y,1);
        $(this).parent().hide();
    });
    $(".closebtnS").click(function() {
        var bll = $(this).parent().parent().children(".bl").length;
        if(bll <= 1) {
            alert("不可删除全部组件");
        } else {
            //确定是什么位置的BOX
            var x = $(this).parent().index();
            var y = $(this).parent().parent().index()-6;
            page[y].splice(x,1);
            chart[y].splice(x,1);
            $(this).parent().remove();
        };
    });
    /*$(".addbl").click(function(){
        $(this).prev().clone(true).insertBefore($(this).prev());
    });*/
    $(".addbl").click(function() {
        djiSblw = $(this).parent().width(); //760  父级宽度
        djiSblbw = 0;
        $(this).parent().children(".bl").each(function() {
            djiSblbw = djiSblbw + parseInt($(this).width());
        });
        //alert(djiSblbw)
        djiSbli = $(this).parent().index(); //第几个父级 rowBox_1 .index
        djiSbli +=1;
        //alert("rowBox_1" + djiSbli)
    });
    $(".pzbSUl li").click(function() {
        $(this).addClass("pzbUl_li-Select");
        $(this).siblings("li").removeClass("pzbUl_li-Select");
        djiS = $(this).index(); //选择添加多大的bl
    });
    $("#blSadd_btn_true").click(function() {
        var u_h = (djiSblw - djiSblbw) / djiSblw;
        //剩下的空间的占比
        var add_h = box_arr[djiS]/12;
        if(u_h > add_h) {
            //插入到第几个rowbox里面的倒数第二个位置
            $(".addblhtml").first().clone(true).insertBefore($("." + 'rowBox_1' + djiSbli).children().last().prev());
            //设置插入框的宽度
            var a_w = add_h * djiSblw - 2;
            $("." + 'rowBox_1' + djiSbli).children(".addblhtml").last().css("width", a_w);
            //$("#" + 'rowBox_1' + djiSbli).children(".addblhtml").last().css("background-color", "red");
            $("." + 'rowBox_1' + djiSbli).children(".addblhtml").show();
            var w = box_arr[djiS];
            page[djiSbli-7].push(w);
            chart[djiSbli-7].push(w);
            console.log(page);
        } else {
            alert("宽度过大无法添加");
        }
    });
   
    //数据提交
    $('#page_submit').click(function(){
    	var controller= JSON.stringify(page);
    	var charts= JSON.stringify(chart);
        var title = $('#title').val();
        if(title == null || title == ""){
            alert("标题不能为空");
            return false;
        }
        var is_show = 1;
        if($('#is_show').prop('checked')){
          is_show = 1;
        }else{
          is_show = 0;
        }
        $.post('${path }/PageIndex/addSave.do ',{ pid:pid, title:title, is_show:is_show, controller:controller, charts:charts}, function(data){
        	if(data=="SUCCESS"){
       		 
       		 var r=confirm("数据提交成功!是否跳转到页面管理层......");
       		 if (r==true)
       		   {
       			 window.location.href="${pageContext.request.contextPath }/PageIndex/pageEdit.do?id="+pid;
       		   }
       	};
       	
           }
        ,'json');
    });
</script>

	<script type="text/javascript">
    $(".bl").click(function(){
        blpIndex = $(this).parent().index();
        blIndex = $(this).index();
        //alert(blpIndex)
    });
    $("#select_btn_true").click(function(){
        //确定选择项目
        var radio_checked = $("input[name='table_records']:checked");
        var id = radio_checked.val();
        var img = radio_checked.parent('div').parent('td').siblings('td').eq(1).find('img').prop('src');
        var x = blIndex;
        var y = blpIndex-6;
        chart[y][x] = id;
        $(".rowBox_1").eq(blpIndex).children(".bl").eq(blIndex).find('img').remove();
        $(".rowBox_1").eq(blpIndex).children(".bl").eq(blIndex).append('<img src="'+img+'" class="blimg">');
        $(".rowBox_1").eq(blpIndex).children(".bl").eq(blIndex).children(".blp").hide();
    });
</script>

	<script type="text/javascript">
    $("#resetBtn").click(function(){
        $("#zujian-name").val("");
        $(".rowBox_1").hide();
        $(".addblhtml").hide();
    });
</script>


	<!-- Datatables -->
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
    $('#datatable1').DataTable({
    	//不显示左下角提示
        "info":false,
      	//开启分页器
        "paging":true, 
      	//改变每页显示数据数量
        "lengthChange": true, 
      	//设置一页8行，必须开启分页才生效
        "iDisplayLength": 8, 
        "ordering": false,
        "pagingType": "full_numbers",
    });
</script>
	<!-- iCheck -->

	<!-- Switchery -->
	<script src="${pageContext.request.contextPath }/css/vendors/switchery/dist/switchery.min.js"></script>
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>
	<!--必要-->
	<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>
</body>

</html>