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
<link
	href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- Switchery -->
<link href="${pageContext.request.contextPath }/css/vendors/switchery/dist/switchery.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
<!-- Datatables -->
<%-- <link href="${pageContext.request.contextPath }/css/dataTables.bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath }/css/datatables.min.css" rel="stylesheet"> --%>
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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-top:5px;font-size: 30px;">
                        &times;
                    </button>
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
                            <button type="button" class="btn btn-default floatleft" data-dismiss="modal" id="bl_btn_reset">取消</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- 模态框2 -->
        <div class="modal fade " id="myModal2">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="min-height: 668px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-top:5px;font-size: 30px;">
                        &times;
                    </button>
                    <!-- 头部 -->
                    <div class="modal-header">
                        <h4 class="modal-title">编辑查询条件</h4>
                    </div>

                    <!-- 主体 -->
                    <div class="modal-body">
                        <!-- <div class="row">
                            <div class="col-md-9"><input type="text" class="form-control" id="datas_search" placeholder="Search"></div>
                            <br/><br/>
                        </div> -->
                        <div class="table-responsive" >
                            <table class="table table-striped jambo_table" id="datatable1">
                                <thead>
                                <tr >
                                    <th>
                                    </th>
                                    <th class="column-title">标题 </th>
                                    <th class="column-title">图表</th>
                                    <th class="column-title">更新时间</th>
                                </tr>
                                </thead>
                                <tbody id="data_table">
                                <c:forEach items="${chart }" var="vo">
                                	<tr class="even pointer">
                                        <td class="a-center ">
                                            <input type="radio" value="${vo.id }" name="table_records">
                                        </td>
                                        <td class=" ">${vo.title }</td>
                                        <c:forEach items="${vo.userList }" var="fo">
                                        	<td class=" ">
                                        		<img src="${pageContext.request.contextPath }/images/chart/${fo.img}" alt="${fo.title }" height="40px" style="cursor: pointer;" title="${fo.title }">
                                        	</td>
                                        </c:forEach>
                                        <td class=" ">${vo.addTime }</td>
                                    </tr>
                                    </c:forEach>
								</tbody>
                            </table>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <!-- 底部 -->
                    <div class="modal-footer">
                        <div class="footerbtn floatright">
                            <button type="button" class="btn btn-default floatleft" data-dismiss="modal" id="select_btn_true">确认</button>
                            <button type="button" class="btn btn-default floatleft" data-dismiss="modal" id="select_btn_reset">取消</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- 模态框3 -->
        <div class="modal fade " id="myModal3">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-top:5px;font-size: 30px;">
                        &times;
                    </button>
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
                            <button type="button" class="btn btn-default floatleft" data-dismiss="modal" id="blSadd_btn_true">确认</button>
                            <button type="button" class="btn btn-default floatleft" data-dismiss="modal" id="blSadd_btn_reset">取消</button>
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
                            <h2>页面配置 <small>当前位置/页面配置/修改</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content"> <br />
                            <form action="" class="form-horizontal">
                                <div class="form-group">
                                    <label class="control-label col-md-2 col-sm-2 col-xs-12" for="title">填写页面名称 <span class="required">:</span> </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="title" required="required" class="form-control col-md-7 col-xs-12" value="${list.title}" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2 col-sm-2 col-xs-12" for="is_show">是否列表显示 <span class="required">:</span> </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <label>
                                            <input type="checkbox" id="is_show" class="js-switch" 
                                            <c:if test="${list.isShow != 0}">checked</c:if> />
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2 col-sm-2 col-xs-12" for="">编辑组件内容 <span class="required">:</span> </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12" style="">
                                        <div class="rowBox container form-control col-md-7 col-xs-12">

                                          <div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 " id='rowBox_1_1' data-index='00'>
                                                <div class="bl bl1" data-toggle="modal" data-target="#myModal2">
                                                    <div style="" class="blp" id="">
                                                        <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                                </div>
                                                <div class="closebtn" onClick="event.cancelBubble = true">-</div>
                                            </div>

                                            <div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 " id='rowBox_1_3-4' data-index='00'>
                                                <div class="bl bl3-4" data-toggle="modal" data-target="#myModal2">
                                                    <div style="" class="blp" id="">
                                                        <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                                    <div class="closebtnS" onClick="event.cancelBubble = true">-</div>
                                                </div>
                                                <div class="bl bl3-4" data-toggle="modal" data-target="#myModal2">
                                                    <div style="" class="blp" id="">
                                                        <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                                    <div class="closebtnS" onClick="event.cancelBubble = true">-</div>
                                                </div>
                                                <div class="bl bl3-4" data-toggle="modal" data-target="#myModal2">
                                                    <div style="" class="blp" id="">
                                                        <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                                    <div class="closebtnS" onClick="event.cancelBubble = true">-</div>
                                                </div>
                                                <div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
                                                <div class="closebtn">-</div>
                                            </div>
                                            <div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 " id='rowBox_1_2-3' data-index='00'>
                                                <div class="bl bl2-3" data-toggle="modal" data-target="#myModal2">
                                                    <div style="" class="blp" id="">
                                                        <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                                    <div class="closebtnS" onClick="event.cancelBubble = true">-</div>
                                                </div>
                                                <div class="bl bl2-3" data-toggle="modal" data-target="#myModal2">
                                                    <div style="" class="blp" id="">
                                                        <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                                    <div class="closebtnS" onClick="event.cancelBubble = true">-</div>
                                                </div>
                                                <div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
                                                <div class="closebtn">-</div>
                                            </div>
                                            <DIV CLASS="rowBox_1 col-md-12 col-sm-12 col-xs-12 " ID="rowBox_1_1-2" data-index="00">
                                                <DIV CLASS="bl bl1-2" data-toggle="modal" data-target="#myModal2">
                                                    <DIV STYLE="" CLASS="blp" ID="">
                                                        <P>十</P>--&nbsp;点击此区域添加横向分区&nbsp;--</DIV>
                                                    <DIV CLASS="closebtnS" onClick="event.cancelBubble = true">-</DIV>
                                                </DIV>
                                                <DIV CLASS="addbl" data-toggle="modal" data-target="#myModal3" TITLE="点击添加一个组件">+</DIV>
                                                <DIV CLASS="closebtn">-</DIV>
                                            </DIV>
                                            <div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 " id='rowBox_1_1-3' data-index='00'>
                                                <div class="bl bl1-3" data-toggle="modal" data-target="#myModal2">
                                                    <div style="" class="blp" id="">
                                                        <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                                    <div class="closebtnS" onClick="event.cancelBubble = true">-</div>
                                                </div>
                                                <div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
                                                <div class="closebtn">-</div>
                                            </div>
                                            <div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 " id='rowBox_1_1-4' data-index='00'>
                                                <div class="bl bl1-4" data-toggle="modal" data-target="#myModal2">
                                                    <div style="" class="blp" id="">
                                                        <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                                    <div class="closebtnS" onClick="event.cancelBubble = true">-</div>
                                                </div>
                                                <div class="addbl" data-toggle="modal" data-target="#myModal3" title="点击添加一个组件">+</div>
                                                <div class="closebtn">-</div>
                                            </div>

                                            <div class="rowBox_add col-md-12 col-sm-12 col-xs-12" id="addrow_box" style="margin-top: 0px;" data-toggle="modal" data-target="#myModal" title="点击设置此内容">
                                                <div style="" class="blp" id="">
                                                    <p>十</p>--&nbsp;点击此区域添加纵向分区&nbsp;--</div>
                                            </div>

                                        </div>
                                        <div class="clear"></div>

                                        <div class="rowBox_1 col-md-12 col-sm-12 col-xs-12 rowBox_null" id="copy_row">
                                            <!--被复制Row-->
                                            <div class="addbl" data-toggle="modal" data-target="#myModal3">+</div>
                                            <div class="closebtn" onClick="event.cancelBubble = true">-</div>
                                        </div>

                                        <div class="bl addblhtml" id='copy_add' style='display:none;' data-toggle="modal" data-target="#myModal2">
                                            <!--被复制Bl-->
                                            <div style="" class="blp">
                                                <p>十</p>--&nbsp;点击此区域添加横向分区&nbsp;--</div>
                                            <div class="closebtnS" onClick="event.cancelBubble = true">-</div>
                                        </div>

                                    </div>
                                </div>
                                <div class="form-group">
                  
                                    <input type="button" class="btn btn-primary col-md-offset-4" value="返回" onclick="window.location.href='${pageContext.request.contextPath }/PageIndex/pageEdit.do?id=${list.sort }'"/>
                                    <input type="button" class="btn btn-danger" name="" id="resetBtn" value="重置" />
                                    <input type="button" class="btn btn-success" name="" id="page_submit" value="提交" />

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
	<!-- <script src="https://cdn.bootcss.com/paper.js/0.22/paper.min.js"></script>  -->
    <script type="text/javascript">
    var page = ${charts.page};
    var chart_str_img = '${charts.chart}';
    var chart_img = eval('('+chart_str_img+')');
    var chart_str = '${charts.chartStr}';
    var chart = eval('('+chart_str+')');
    var id = '${charts.id}';
    var pid = '${charts.pid}'; 
    
    $(".rowBox_1").hide();
    $(".rowBox_add").show(); //添加行
    rbi = 0; /*整行选择li初始化*/
    rbId = 0; //第几个父级 rowBox_1
    bli = 0; //第几个bl
    var box_arr = [12, 9, 8, 6, 4, 3];
    window.onload = function () {
        //加格子
        for (var i = 0; i < page.length; i++) {
            let a = $('.rowBox .rowBox_1').last().attr('data-index') - 0 + 1;
            $('#copy_row').clone(true).prop('id', 'rowBox_null_' + a).attr('data-index', a).show().insertBefore($('.rowBox_add'));
            for (var j = 0; j < page[i].length; j++) {
                let width = page[i][j] / 12 * $('.rowBox .rowBox_null').last().width() - page[i].length * 1;
                $('#copy_add').clone(true).show().insertBefore($('.rowBox_null').eq(i).find('.addbl')).css('width', width);
            };
        }
        //加图片
        for (var i = 0; i < chart_img.length; i++) {
            var x = chart_img[i]['address'].split('-');
            var y = chart_img[i]['img'];

            $('.rowBox_null').eq(x[0]-1).find(".bl").eq(x[1]-1).append('<img src="${pageContext.request.contextPath }/images/chart/' + y + '" class="blimg">');
            $(".rowBox_null").eq(x[0]-1).find(".bl").eq(x[1]-1).find(".blp").hide();
        };
    }

    $(".pzbUl li").click(function () { //row_box 的占比添加
        $(this).addClass("pzbUl_li-Select").siblings("li").removeClass("pzbUl_li-Select");
        rbi = $(this).index();
    });
    $("#bl_btn_true").click(function () { //row_box 添加
        let a = $(".rowBox_1").length;
        let a1 = $('.rowBox .rowBox_1').last().attr('data-index') - 0 + 1;
        $(".rowBox_1").eq(rbi).clone(true).insertBefore($("#addrow_box"));
        $("#addrow_box").prev().attr('id', $(".rowBox_1").eq(rbi).attr('id') + '_' + a + 1);
        $("#addrow_box").prev().attr('data-index', a1).show();
        var page_temp = [];
        var chart_temp = [];
        page_temp.push(box_arr[rbi]);
        chart_temp.push(box_arr[rbi]);
        page.push(page_temp);
        chart.push(chart_temp);
    });

    $(".closebtn").click(function () {
        var y = $(this).parent().attr('data-index') - 1;
        page.splice(y, 1);
        chart.splice(y, 1);
        $(this).parent().remove();
        console.log(page);
    });

    $(".closebtnS").click(function () {
        var bll = $(this).parents('.rowBox_1').find(".bl").length;
        if (bll <= 1) {
            alert("不可删除全部组件");
        } else {
            //确定是什么位置的BOX
            var x = $(this).parent().index();
            var y = $(this).parent().parent().attr('data-index') - 1;
            console.log(x, y);
            page[y].splice(x, 1);
            chart[y].splice(x, 1);
            $(this).parent().remove();
            console.log(page);
        };
    });

    $(".addbl").click(function () {
        blFwidth = $(this).parent().width(); //bl按钮父级宽度
        blHwidth = 0; //已经占用宽度
        $(this).parent().find(".bl").each(function () {
            blHwidth = blHwidth + parseInt($(this).width() + 3);
        });
        rbId = $(this).parent().attr('id'); //父级 rowBox_1 的id
        rbIdi = $(this).parent().attr('data-index');
        console.log('rbId:', rbId);
        console.log('rbId:', rbIdi);
    });
    $(".pzbSUl li").click(function () {
        $(this).addClass("pzbUl_li-Select").siblings("li").removeClass("pzbUl_li-Select");
        bli = $(this).index(); //选择添加多大的bl
    });
    $("#blSadd_btn_true").click(function () {
        var u_h = (blFwidth - blHwidth) / blFwidth;
        //剩下的空间的占比
        var add_h = box_arr[bli] / 12;
        if (u_h > add_h) {
            //插入到第几个rowbox里面的倒数第二个位置
            $(".addblhtml").first().clone(true).insertBefore($('#' + rbId).find('.addbl'));
            //设置插入框的宽度
            var a_w = add_h * blFwidth - 2;
            $("#" + rbId).children(".addblhtml").last().css("width", a_w).removeClass('hide');
            var w = box_arr[bli];
            page[rbIdi - 1].push(w);
            chart[rbIdi - 1].push(w);
            console.log(page);
        } else {
            alert("宽度过大无法添加");
        };
    });

    //数据提交
    $('#page_submit').click(function () {
    	var controller= JSON.stringify(page);
    	var charts= JSON.stringify(chart);
        var title = $('#title').val();
        var is_show = 1;
        if ($('#is_show').prop('checked')) {
        	 is_show = 1;
        } else {
             is_show = 0;
        }
        $.post('${path }/PageIndex/addUpdate.do', {
            id: id,
            pid: pid,
            title: title,
            is_show: is_show,
            controller:controller,
            charts: charts,
        }, function(data){
        	if(data=="SUCCESS"){
        		 
        		 var r=confirm("数据提交成功!是否跳转到页面管理层......");
        		 if (r==true)
        		   {
        			 window.location.href="${pageContext.request.contextPath }/PageIndex/pageEdit.do?id="+pid;
        		   }else{
        			 window.location.href="${pageContext.request.contextPath }/PageIndex/updatePage.do?id="+id;
        		   }
        		 

        	};
        	
            },"text");
    })

  /* //数据源查询更新
    $('#datas_search').keyup(function(){
        var key = $(this).val();
        $('#data_table').find('tr').remove();
        $.post('${path }/PageIndex/selectBoxTitle.do', {key:key}, function(result){
            $.each(result, function(index, value){
                var con = '<tr class="even pointer"><td class="a-center "> <input type="radio" value="'+value.id+'" name="table_records"> </td> <td class=" ">'+value.title+'</td> <td class=" "><img src="${pageContext.request.contextPath }/images/chart/'+value.img+'" alt="+value.title1+" height="40px" title="+value.title1+" style="cursor: pointer;"></td> <td class=" ">'+value.editTime+'</td></tr>';
                $('#data_table').append(con);
            });
        },'json');
    })  */
</script>

<script type="text/javascript">
    $(".bl").click(function () {
        blpIndex = $(this).parent().index();
        blIndex = $(this).index();
    })
    $("#select_btn_true").click(function () {
        //确定选择项目
        var radio_checked = $("input[name='table_records']:checked");
        var id = radio_checked.val();
        var img = radio_checked.parent('td').siblings('td').eq(1).find('img').prop('src');
        var x = blIndex;
        var y = blpIndex - 6;
        chart[y][x] = id;
        $(".rowBox_1").eq(blpIndex).children(".bl").eq(blIndex).find('img').remove();
        $(".rowBox_1").eq(blpIndex).children(".bl").eq(blIndex).append('<img src="' + img + '" class="blimg">');
        $(".rowBox_1").eq(blpIndex).children(".bl").eq(blIndex).children(".blp").hide();

    })
</script>

<script type="text/javascript">
    $("#resetBtn").click(function () {
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
    <!-- Switchery -->
	<script src="${pageContext.request.contextPath }/css/vendors/switchery/dist/switchery.min.js"></script>
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>
	<!--必要-->
	<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>
  </body>
</html>
