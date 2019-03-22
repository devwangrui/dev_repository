<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../../js/taglibs.jsp"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title></title>
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
	href="${pageContext.request.contextPath }/css/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/build/css/custom.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/setEdit.css"
	rel="stylesheet">

</head>

<body class="nav-md">
	<div class="container body">
		<jsp:include page="/Index/left.do"></jsp:include>
		<%@ include file="../Public/top.jsp"%>
		 <!-- page content -->
        <div class="right_col" role="main">
            <div class="row">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-bars"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> 数据选取</font></font><small><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></small></h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <ul id="ysful" class="title_right" style="border-bottom: 1px solid #E6E9ED;margin-bottom: 10px;padding: 0;">
                            <li style="list-style:none;" fn="➕" fh="➕"><button type="button" class="btn btn-dark"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">➕</font></font></button></li>
                            <li style="list-style:none;" fn="-" fh="-"><button type="button" class="btn btn-dark"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">-</font></font></button></li>
                            <li style="list-style:none;" fn="*" fh="*"><button type="button" class="btn btn-dark" ><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></button></li>
                            <li style="list-style:none;" fn="/" fh="/"><button type="button" class="btn btn-dark" ><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">/</font></font></button></li>
                            <li style="list-style:none;" fn="(" fh="("><button type="button" class="btn btn-dark" ><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">(</font></font></button></li>
                            <li style="list-style:none;" fn=")" fh=")"><button type="button" class="btn btn-dark" ><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">)</font></font></button></li>
                            <li><input type="text" disabled value="固定值" style="width: 55px;padding: 0 5px;"></li>
                            <div class="input-group  pull-right">
                                <input type="text" id="search" class="form-control" placeholder="指标关键字" style="border-radius: 15px;">
                            </div>
                        </ul>
                        <div class="clearfix"></div>
                        <ul id="zblist" style="max-height:280px;overflow-y: auto" class="list-group" >
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-bars"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> 公式描述</font></font><small><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></small></h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div style="display: flex;">
                            <ul id="zbul">
                                <li fn="${yzDatas.id }"><button type="button" class="btn btn-info"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${yzDatas.title }</font></font></button></li>
                            </ul>
                            <ul id="dengyu" style="width: 30px" class="list-group">
                                <li ><button type="button" class="btn btn-info" style="width: 100%;overflow: hidden;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> = </font></font></button></li>
                            </ul>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<ul id="gsul" style="flex:1;" class="list-group">
								<li draggable="false"></li>
								
							</ul>
						</div>
                    </div>
                    <button id="send" type="button" class="btn btn-success pull-right">提交</button>
                </div>
            </div>
        </div>
	</div>
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/Flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/Flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/Flot/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/Flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath }/css/vendors/moment/min/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath }/css/build/js/custom.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/css/build/js/Sortable.js"></script>

	<script type="text/javascript">
	
	$(function(){
		  var re = ${ja};
		  
		  if(re[0]!=null && re.length>0){
			  var dom = "";
			  for(var i=0;i<re.length;i++){
				  var resultJ = JSON.stringify(re[i]);
				  var result = resultJ.replace(/\"/g, "");
				  var doc = "<li data-type='zb' fn='"+result+"' fh='"+result+"'"+
					"ondblclick='this.remove();'><button type='button'"+
						"class='btn btn-info' style='width: 100%;overflow: hidden;'>"+
						"<font style='vertical-align: inherit;'><font"+
							"style='vertical-align: inherit;'>"+result+"</font></font>"+
					"</button></li>";
					dom+=doc;
			  }
			  $("#gsul").html(dom);  
		  }
	  });
	
	
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
                                            html += '<li class="col-md-4 col-sm-4 col-xs-12" data-type="zb" fn="【'+item.title+'】" fh="【'+item.table+'】"><button type="button" class="btn btn-info" style="width: 100%;overflow: hidden;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">'+item.title+'</font></font></button></li>';
                                        });
                                        $('#zblist').html(html);
                                    }
                                }else{
                                    $('#zblist').html(res.msg);
                                }
                            }
                           
                        });
                    },500
                );
            });
        </script>
	<script type="text/javascript">
            Sortable.create(document.getElementById('ysful'), {
                group: {
                    name:"ysful",
                    pull: 'clone',
                    put: false,
                },
                sort:false
            });

            Sortable.create(document.getElementById('zblist'), {
                group: {
                    name:"zblist",
                    pull: 'clone',
                    put: false
                },
                sort:false,
            });

            Sortable.create(document.getElementById('gsul'), {
                group: {
                    name:"gsul",
                    pull: false,
                    put: ['zblist','ysful']
                },
                onAdd: function (evt){ //拖拽时候添加有新的节点的时候发生该事件
                    if($(evt.clone).find('input[type="text"]').length==0) {
                        var zbul = evt.to;
                        var childs = zbul.childNodes;
                        for (var i = childs.length - 1; i >= 0; i--) {
                            var a = $(childs[i]);
                            a.removeClass('col-md-4');
                            a.removeClass('col-sm-4');
                            a.removeClass('col-xs-12');
                            a.attr("ondblclick", 'this.remove();');
                        }
                    }else{
                        $(evt.to).find('li:eq('+evt.newIndex+') input[type="text"]').attr('disabled',false);
                        $(evt.to).find('li:eq('+evt.newIndex+') input[type="text"]').val('');
                        $(evt.to).find('li:eq('+evt.newIndex+')').attr("ondblclick", 'this.remove();');
                    }
                }
            });
            

            $('#send').click(function () {
                var postString='';
                $('#gsul li').each(function (index,item){
                    if($(item).find('input[type="text"]').length==0) {
                        if($(item).attr('fn')) {
                            postString += $(item).attr('fn')+",";
                        }
                    }else{
                        var num=$(item).find('input[type="text"]').val();
                        postString += num+",";
                    }
                });
                postGs($('#zbul li').attr('fn'),postString);
            });

            function postGs(zb,gs) {
            	 window.location.href = "${path}/YzTargetSort1/savaFormula.do?zb="+zb+"&gs="+encodeURI(encodeURI(gs));
                
            }
        </script>
</body>
</html>
