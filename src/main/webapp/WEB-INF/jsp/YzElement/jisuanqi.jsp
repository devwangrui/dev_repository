<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../js/taglibs.jsp"%>
<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Gentelella Alela! |</title>
		<!-- Bootstrap -->
		<link href="${path}/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Font Awesome -->
		<link href="${path}/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<!-- Custom Theme Style -->
		<link href="${path}/css/build/css/custom.css" rel="stylesheet">
		<!--mystyle-->
		<link rel="stylesheet" type="text/css" href="${path}/css/zhibiaoshangbao_page3.css"/>
	</head>

	<body class="nav-md">
		<div class="container body">
		<jsp:include page="/Index/left.do"></jsp:include>
		<%-- <%@ include file="../Public/top.jsp"%> --%>
			<div class="main_container">

				<!--中间内容-->
				<div class="right_col" role="main">
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>运算公式：</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li>
											<a class="collapse-link" title="缩小"><i class="fa fa-chevron-up"></i></a>
										</li>
										<li class="dropdown" title="更改配置">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li>
													<a href="#">配置 1</a>
												</li>
												<li>
													<a href="#">配置 2</a>
												</li>
											</ul>
										</li>
										<li title="关闭">
											<a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content"> <br />

									<form id="demo-form2" class="form-horizontal">

										<div class="form-group col-md-12 col-sm-12 col-xs-12">

											<div class="form-group col-md-12 col-sm-12 col-xs-12">
												<div class="red">*注意&nbsp; 例：1+2=3 <br />先点击指标再点击运算符，输入完毕后点击“确认公式”按钮才可存储</div>
												<!--<input type="text" class="form-control sfIn" name="" id="" value="" placeholder="请输入公式    例：1 + 2 = 3 " onkeyup="this.value=this.value.replace(/[^0-9\+\-\*\/\(\)\=]/g,'')" />-->
												<%-- <div class="gs_txt">${yzDatas.title }目标指标   =  </div> --%>
												<%-- <div class="gs_txt" fn="${yzDatas.id }" id ="gs_txt"><button  type="button" class="btn btn-info" style="margin-top: 10px"><font style="vertical-align: inherit;"><font class="gs_txt" style="vertical-align: inherit;color:#07181C ">${yzDatas.title }目标指标   = </font></font></button></div> --%>
												<div class="gs_txt" fn="${yzDatas.id }" id ="gs_txt"><a class="btn btn-info" style="margin-top: 10px"><font style="vertical-align: inherit;"><font class="gs_txt" style="vertical-align: inherit;color:#07181C ">${yzDatas.title }目标指标   = </font></font></a></div>
											</div>

											<div class="form-group col-md-12 col-sm-12 col-xs-12">
												<div class="btn btn-default sc">
													删除
												</div>
												<!-- <div class="btn btn-default cz">
													重置
												</div> -->
												<div class="btn btn-default qrgs" id = "qrgs">
													确认公式
												</div>
											</div>

										</div>

										<br>
									</form>

								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>操作面板：</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li>
											<a class="collapse-link" title="缩小"><i class="fa fa-chevron-up"></i></a>
										</li>
										<li class="dropdown" title="更改配置">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li>
													<a href="#">配置 1</a>
												</li>
												<li>
													<a href="#">配置 2</a>
												</li>
											</ul>
										</li>
										<li title="关闭">
											<a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content"> <br />

									<!-- <form id="demo-form2" class="form-horizontal"> -->

										<div  class="form-group col-md-12 col-sm-12 col-xs-12 " style="min-height: 500px;">

											<div class="fh_group">
												<div class="btn btn-default btn_fh" data_fh="➕">+</div>
												<div class="btn btn-default btn_fh" data_fh="-">-</div>
												<div class="btn btn-default btn_fh" data_fh="*">x</div>
												<div class="btn btn-default btn_fh" data_fh="/">/</div>
												<div class="btn btn-default btn_fh" data_fh="=">=</div>
												<div class="btn btn-default btn_fh" data_fh="(">(</div>
												<div class="btn btn-default btn_fh" data_fh=")">)</div>
											</div>
											<div class="sj_group">
												<div class="search_box">
													<!--<i class="fa fa-search" style="font-size: 20px;"></i>-->
													<input class="search_ipt" type="text"  id="search" placeholder="在此输入进行搜索" />
												</div>
												<ul class="data_ul">
												
												</ul>
											</div>

										</div>

										<br>
									<!-- </form> -->

								</div>
							</div>
						</div>
					</div>
					<br />
				</div>
				<!-- /page content    class="btn btn-info"-->
			</div>
		</div>
		<!-- jQuery -->
		<script src="${path}/css/vendors/jquery/dist/jquery.min.js "></script>
		<!-- Bootstrap -->
		<script src="${path}/css/vendors/bootstrap/dist/js/bootstrap.min.js "></script>
		<!--必要-->
		<script src="${path}/css/build/js/custom.min.js"></script>
		<script type="text/javascript ">

           var t = null;
            var tt = null;
            $("#search").bind("input propertychang",function(event){
                var keyword = $.trim(this.value);                //拿到文本框中输入的内容
                if(keyword==''){
                    clearTimeout(t);                     //判断是佛为空值
                    return;
                }
                clearTimeout(t);
                t=setTimeout(function(){    
                        $.ajax({
                            url:"${path}/YzTargetSort1/selectDatas.do",         //往后台发AJAX把文本框的内容发到后台做数据查询
                            type:'post',
                            data:{keyword:keyword},
                            success:function (res) {
                            	console.log(res);
                                if(res.code==0){         
                                    if(!res.data){
                                        $('#zblist').html('<p>无匹配指标</p>');
                                    }else {
                                        var html = '';
                                        $.each(res.data, function (index, item) {
                                            html += '<li class="data_li"><div class="data_idBox">' + item.title + '</div></li>';
                                        })
                                        $(".data_ul").append(html);
                                    }
                                }else{
                                    $(".data_ul").html(res.msg);
                                }
                            }
                        })
                    },500
                );
            });




			$(document).ready(function() {
              
             var re = ${ja};
             if(re[0]!=null && re.length>0){
			  var dom = "";
			  for(var i=0;i<re.length;i++){
				  var resultJ = JSON.stringify(re[i]);
				  var result = resultJ.replace(/\"/g, "");
				  var doc = '<button type="button" class="btn btn-info" style="margin-top: 10px" ><font class="gs_txt"  style="vertical-align: inherit;">'+ result + '</font></button>';
					dom+=doc;
			  }
              $("#gs_txt").append(dom);
		  }

				inputliBool = true;
				inputfhBool = false;

				$(".data_ul").on('click', 'li', function() {

					//对li操作
					var index = $(this).index(); //记录当前点击的li序号

					//对font操作
					var fid = 'li' + index + '';     
					var str = '<button type="button"  class="btn btn-info" style="margin-top: 10px" ><font class="gs_txt"  style="vertical-align: inherit;">'+ $(this).find('.data_idBox').text() + '</font></button>';
					//var str = '<font class=' + fid + '>' + $(this).find('.data_idBox').text() + '</font>';
					//var str = $(this).find('.data_idBox').text();
					if(inputliBool) {
						$("#gs_txt").append(str);
						$(this).hide();
						inputliBool = false;
						inputfhBool = true;
					} else {
						alert('请输入运算符');
					}

				});

				$('.fh_group').on('click', '.btn_fh', function() {

					var index = $(this).index(); //记录当前点击的fh序号
					var fid = 'fh' + index + ''; //生成符号的id
					var str = '<button type="button"  class="btn btn-info" style="margin-top: 10px"><font style="vertical-align: inherit;"><font class="gs_txt"  style="vertical-align: inherit;">' + $(this).attr('data_fh') + '</font></font></button>'; //为符号创建容器
					//var str = '<font class=' + fid + '>' + $(this).attr('data_fh') + '</font>'; //为符号创建容器
					if(inputfhBool) {
						$("#gs_txt").append(str);
						inputliBool = true;
						inputfhBool = false;
					} else if(str == '(' | str == ')') { //
						$("#gs_txt").append(str);
						inputliBool = true;
						inputfhBool = false;
					} else {
						alert('输入错误');
					}

				});
             
				$('.sc').click(function() {    //删除
					$("#gs_txt").find('button').eq(-1).remove();
					inputliBool = true;
					inputfhBool = false;
				});
				
				$('.cz').click(function() {
					$("#gs_txt").text('');
					$(".data_ul").find('li').show();
					inputliBool = true;
					inputfhBool = false;
				});

				$('#qrgs').click(function() {
                    var zb = $("#gs_txt").attr("fn");
                    var postString='';
					//var str = $("#gs_txt").text();      //获得所有输入的内容
					//var arr = str.match(/([a-zA-Z0-9]+|[+\-*/=()])/g); //符号文字拆分         获得符号
                    $("#gs_txt button").each(function (){
                            
                        var str= $(this).text();
                                  
                        postString =postString + str+ ",";
					})
                    
                     if(postString==''){
                           alert('请选择指标来设置公式')
                     }else{
                      postGs(zb,postString);
                     }
                     
				});

			});

            function postGs(zb,gs) {
            	
            	window.location.href = "${path}/YzTargetSort1/savaFormula.do?zb="+zb+"&gs="+encodeURI(encodeURI(gs));
               
                
            }
		</script>
	</body>

</html>