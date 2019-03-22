<%@ page import="com.example.zhengai.model.YzUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<%
	YzUser user = (YzUser) request.getSession().getAttribute("user");
	String name=null;
	if(user!=null){
		name = user.getName();
	}
%>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1" user-scalable="no">
		<title>智慧诊改-我的诊改</title>
		<link rel="stylesheet/less" type="text/less" href="${path}/css/myStyle.less" />
		<link rel="stylesheet/less" type="text/less" href="${path}/css/myChange.less" />
		<script type="text/javascript" src="${path}/js/less.min.js?v=2.6.0"></script>
		<%--<script type="text/javascript" src="${path}/js/jquery.min.js?v=2.2.4"></script>--%>
		<script type="text/javascript" src="${path}/js/vue.js?v=2.5.16"></script>
		<!--layer-->
		<script type="text/javascript" src="${path}/js/layer/layer.js?v=3.1.1"></script>
		<!-- icon -->
		<script type="text/javascript" src="//at.alicdn.com/t/font_1025383_vsqz22g6pr.js"></script>
		<!-- icheck -->
		<link rel="stylesheet" type="text/css" href="${path}/js\iCheck\skins\polaris\polaris.css" />
		<script type="text/javascript" src="${path}/js/iCheck/icheck.min.js"></script>

		 <%--<script type="text/javascript" src="js/icheck/custom.min.js"></script>--%>

		<script>
			document.oncontextmenu = function(){return false;}

			/*document.onkeydown = function(){

				if(window.event && window.event.keyCode == 123) {
					alert("F12被禁用");
					event.keyCode=0;
					event.returnValue=false;
				}
				if(window.event && window.event.keyCode == 13) {
					window.event.keyCode = 505;
				}
				if(window.event && window.event.keyCode == 8) {
					alert(str+"\n请使用Del键进行字符的删除操作！");
					window.event.returnValue=false;
				}

			}
*/

			$(function(){
                var beginTime = null;
                var endTime = null;
                var warningTime = null;

				var yzWarning = ${yzWarning};
                if (yzWarning!=null){
                     beginTime = yzWarning.gotime;
                     endTime = yzWarning.endtime;
                     warningTime = yzWarning.warningTime;
                }
				if (yzWarning==null || beginTime==null) {
                    beginTime= new Date();
                }

                if (yzWarning==null || endTime==null) {
                    endTime= new Date();
                }
                if (yzWarning==null || warningTime==null) {
                    warningTime= new Date();
                }

				if ($("#goTime").text()=='开始诊改时间' && beginTime!=null ){
					$("#goTime").text(beginTime);
				}
				if ($("#endTime").text()=='结束诊改时间' && endTime!=null){
					$("#endTime").text(endTime);
				}
				if ($("#warning").text()=='提醒时段选择' && warningTime!=null){
					$("#warning").text(warningTime);
				}


				var render1 = laydate.render({
					elem: '#goTime', //指定元素
					format: 'yyyy-MM-dd',
					value: beginTime,
					done: function(value, date) {
						/*alert('你选择的开始诊改日期日期是：' + value + '\n获得的对象是' + JSON.stringify(date));*/
						/*yzWarning[0].goTime =JSON.stringify(date.year)+"-"+JSON.stringify(date.month)+"-"+JSON.stringify(date.date);*/
						$("#goTime").text(value);
					},
					calendar: true

				});


				laydate.render({
					elem: '#endTime', //指定元素
					format: 'yyyy-MM-dd',
					value: endTime,
					min:$("#goTime").text(),
					done: function(value, date){
						/*alert('你选择的结束诊改日期是：' + value);*/
						$("#endTime").text(value);
					},
					calendar: true

				});

				//限定可选时间
				laydate.render({
					elem: '#warning'
					,type: 'time',
					value:warningTime,
					/*min: '09:30:00',
					max: '17:30:00',*/
					btns: ['clear', 'confirm'],
				done: function(value, date){
					$("#warning").text(value);
				}
				});
			})


		</script>
	</head>
	<body>
		<div class="topbar">
			<p class="tb_title"><%=name%></p>
			<p class="tb_subtitle">欢迎使用诊改系统！</p>
		</div>
		<div class="navbar">
			<ul>
				<li>
					<a href=""><span id="index_logo"></span>信远智慧诊改系统</a>
				</li>
				<li>
					<a href="/PageHome/toPageHome">首页</a>
				</li>
				<li>
					<a href="">报表中心</a>
					<div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="">学生成长</a></li>
							<li class="er_ji-item"><a href="">招生就业</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="">质量检测</a>
					<div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="">学校质检</a></li>
							<li class="er_ji-item"><a href="">分院质检</a></li>
							<li class="er_ji-item"><a href="">专业质检</a></li>
							<li class="er_ji-item"><a href="">班级质检</a></li>
							<li class="er_ji-item"><a href="">课程质检</a></li>
							<li class="er_ji-item"><a href="">教师质检</a></li>
						</ul>
					</div>
				</li>
				<li>
					<a href="">诊改系统</a>
					<div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="/PageHome/myChange">我的诊改</a></li>
							<li class="er_ji-item"><a href="/PageHome/classList">提高标准</a></li>
							<li class="er_ji-item"><a href="">运行效果</a></li>
						</ul>
					</div>
				</li>
				<li class="rightIcon">
					<a id="iconTip" style="cursor: pointer;">
						<svg class="icon iconTip" aria-hidden="true">
							<use xlink:href="#icon-touxiang"></use>
						</svg><span>1</span>
					</a>
					<div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="">通知1</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>

		<div id="app">
			<div class="body-div ">

				<div class="ft1 floatLeft bodyTitle">
					<p class="inline-block">我的诊改</p>
				</div>

				<div class="floatRight">
					<div class="btn btn-iron floatLeft" style="margin-right: 20px;" @click="userViewLayer()">诊改人员查看
						<svg class="icon" aria-hidden="true">
							<use xlink:href="#icon-tubiao"></use>
						</svg>
					</div>
					<div class="btn btn-iron floatLeft" @click="helpUserLayer()">添加协助者
						<svg class="icon" aria-hidden="true">
							<use xlink:href="#icon-tianjiaren"></use>
						</svg>
					</div>
				</div><br><br><br>
				<span >
					<p  class="inline-block"><font color="#CEE3F6" size="2px">诊改时间选择</font></p>
				</span>

				<div class="clear"></div>
			</div>
			<div class="body-div ">

				<div class="dropDown floatLeft dropDown_small" style="margin-left: 0;">
					<p class="p1" id="goTime" >开始诊改时间</p>
					<input type="hidden" id="myHid">
						<%--<span class="icon" data_rtt="90">&gt;</span>--%>
				</div>

				<span class="floatLeft" style="margin-top: 15px;color: #1f2330;">-</span>

				<div class="dropDown floatLeft dropDown_small">
					<p class="p1" id="endTime">结束诊改时间</p>
					<%--<span class="icon" data_rtt="90">&gt;</span>
					<div class="droplist">
					</div>--%>
				</div>

				<svg class="icon floatLeft" aria-hidden="true" style="margin: 15px 0 0 55px;font-size: 30px;color: #e9a550;">
					<use xlink:href="#icon-lingdang"></use>
				</svg>

				<div class="dropDown floatLeft dropDown_small">
					<p class="p1" id="warning">提醒时段选择</p>
					<span class="icon" data_rtt="90">&gt;</span>
					<%--<div class="droplist">
						<ul>
							<li>经济学院2</li>
							<li>经济学院2</li>
							<li>经济学院2</li>
						</ul>
					</div>--%>
				</div>

				<span class="floatLeft" style="margin-top: 15px;color: #1f2330;">-</span>

				<div class="dropDown floatLeft dropDown_small">
					<c:if test="${updateSort==1}" var="sort">
					<p class="p1" id="sort" tip="${updateSort}">每日</p>
					</c:if>
					<c:if test="${updateSort==2}" var="sort">
						<p class="p1" id="sort" tip="${updateSort}">每周</p>
					</c:if>
					<c:if test="${updateSort==3}" var="sort">
						<p class="p1" id="sort" tip="${updateSort}">每月</p>
					</c:if>
					<c:if test="${updateSort==4}" var="sort">
						<p class="p1" id="sort" tip="${updateSort}">每学期</p>
					</c:if>
					<c:if test="${updateSort==5}" var="sort">
						<p class="p1" id="sort" tip="${updateSort}">每学年</p>
					</c:if>
					<span class="icon" data_rtt="90">&gt;</span>
					<div class="droplist">
						<ul>
							<li tip="1">每日</li>
							<li tip="2">每周 </li>
							<li tip="3">每月</li>
							<li tip="4">每学期</li>
							<li tip="5">每学年</li>
						</ul>
					</div>
				</div>

				<div class="clear"></div>
			</div>


			<div id="content">

				<div class="myChangeList myChangeListL floatLeft">
					<table border="0" cellspacing="0" cellpadding="0" class="fixTh">
						<thead>
							<tr>
								<th max-width="23.33%" width="23.33%">姓名</th>
								<th max-width="23.33%" width="23.33%">提交时间</th>
								<th max-width="30%" width="30%">原因分析</th>
								<th max-width="23.33%" width="23.33%">操作</th>
							</tr>
						</thead>
					</table>
					<div class="fixTb" id="myscroll1">
						<table border="0" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
									<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
									<th max-width="30%" width="30%" height="0" style="padding: 0;"></th>
									<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(item,index) in myChangeListL">
									<td>{{item.name}}</td>
									<td>{{item.postTime}}</td>
									<td>{{item.yyfx}}</td>
									<td>
										<div class="btn btn-green" @click="yyfxLayer(index,item.id)">修改{{item.id}}</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>

				<div class="myChangeList myChangeListR floatLeft">
					<table border="0" cellspacing="0" cellpadding="0" class="fixTh">
						<thead>
							<tr>
								<th max-width="23.33%" width="23.33%">姓名</th>
								<th max-width="23.33%" width="23.33%">提交时间</th>
								<th max-width="30%" width="30%">改善措施</th>
								<th max-width="23.33%" width="23.33%">操作</th>
							</tr>
						</thead>
					</table>
					<div class="fixTb" id="myscroll2">
						<table border="0" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
									<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
									<th max-width="30%" width="30%" height="0" style="padding: 0;"></th>
									<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
								</tr>
							</thead>

							<tbody>
								<tr v-for="(item,index) in myChangeListR">
									<td>{{item.name}}</td>
									<td>{{item.postTime}}</td>
									<td>{{item.yyfx}}</td>
									<td>
										<div class="btn btn-orange" @click="gscsLayer(index,item.id)">修改</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="clear"></div>
				<div class="btn btn-iron floatRight" id="btnPost" @click="btnPost()">提交</div>
				<div class="btn btn-iron floatRight" id="btnSaveCs" @click="btnSaveCs()">提交措施</div>
				<div class="btn btn-iron floatRight" id="btnSaveYy" @click="btnSaveYy()">提交原因</div>
			</div>
			<div id="layer_userView">

				<div class="ft1 bodyTitle">
					<p class="inline-block">参与诊改人员</p>
				</div>
				<div class="myChangeList">
					<table border="0" cellspacing="0" cellpadding="0" class="fixTh">
						<thead>
							<tr>
								<th max-width="20%" width="20%">#</th>
								<th max-width="40%" width="40%">状态</th>
								<th max-width="40%" width="40%">推送人</th>
							</tr>
						</thead>
					</table>
					<div class="fixTb" id="myscroll3">
						<table border="0" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th max-width="20%" width="20%" height="0" style="padding: 0;"></th>
									<th max-width="40%" width="40%" height="0" style="padding: 0;"></th>
									<th max-width="40%" width="40%" height="0" style="padding: 0;"></th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(item,index) in userView">
									<td>{{index+1}}</td>
									<td :class="userViewZt[item.zt][0]">{{userViewZt[item.zt][1]}}</td>
									<td>{{item.name}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div><!-- //layer_userView -->

			<div id="layer_userView-help">

				<div class="ft1 bodyTitle">
					<p class="inline-block">添加协助人员</p>
				</div>
				<div class="myChangeList">
					<table border="0" cellspacing="0" cellpadding="0" class="fixTh">
						<thead>
							<tr>
								<th max-width="20%" width="20%">勾选</th>
								<th max-width="20%" width="20%">#</th>
								<th max-width="30%" width="30%">部门/职位</th>
								<th max-width="30%" width="30%">推送人</th>
							</tr>
						</thead>
					</table>
					<div class="fixTb" id="myscroll4">
						<table border="0" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th max-width="20%" width="20%" height="0" style="padding: 0;"></th>
									<th max-width="20%" width="20%" height="0" style="padding: 0;"></th>
									<th max-width="30%" width="30%" height="0" style="padding: 0;"></th>
									<th max-width="30%" width="30%" height="0" style="padding: 0;"></th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(item,index) in helpUser">
									<td>
										<!-- {{item.select}},{{item.id}}class="helpUserCheck"-->
										<label><input  type="checkbox" v-model="item.select" ></label>
									</td>
									<td>{{index+1}}</td>
									<td>{{item.position}}</td>
									<td>{{item.name}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div><!-- //layer_userView-help -->
			
			<div id="layer_yyfx">
				
				<div class="ft1 bodyTitle">
					<p class="inline-block">原因分析</p>
				</div>
				<textarea id="yyfxArea" maxlength="1000">
					
				</textarea>
				
			</div><!-- //layer_yyfx -->
			<div id="layer_gscs">
				
				<div class="ft1 bodyTitle">
					<p class="inline-block">改善措施</p>
				</div>
				<textarea id="gscsArea" maxlength="1000">
					
				</textarea>
				
			</div><!-- //layer_yyfx -->

		</div><!-- //Vueapp -->
	</body>

	<script type="text/javascript" src="${path}/js/style.js"></script>
	<script type="text/javascript" src="${path}/js/scrollbar/zUI.js"></script>
	<script src="${path}/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${path}/js/laydate/laydate.js"></script>
	<script src="${path}/js/layer/layer.js"></script>
	<%--<script type="text/javascript" src="${path}/js/myChange.js"></script>--%>


<script>
	var myChangeListL = ${yzUserZhengai};
	var myChangeListR =${yzUserZhengai1};
	var userView = ${userView};
	var helpUser =${changUserList};
	var vue = new Vue({
		el: '#app',
		data: {
			myChangeListL: myChangeListL,
			myChangeListR: myChangeListR,
			userView: userView,
			userViewZt: {
				0: ['userIng', '进行中'],
				1: ['finish', '已完成'],
				2: ['notStart', '未开始'],
			},
			helpUser:helpUser

		},
		methods: {
			myChangeListLClick: function(id) {
				layer.msg("id:" + id);
			},
			userViewLayer: function() {
				uv = layer.open({
					type: 1,
					title: false,
					closeBtn: 0,
					skin: 'layer_Bg', //窗体样式类名
					shade: 0.6, //遮罩透明度
					shadeClose: true, //遮罩层开启
					scrollbar: false, //关闭浏览器滚动
					area: ['595px', '600px'], //宽高
					content: $('#layer_userView'),
					btn: ['返回'],
					yes: function() {
						layer.close(uv);
					}
				});
			},
			helpUserLayer: function() {
				huv = layer.open({
					type: 1,
					title: false,
					closeBtn: 0,
					skin: 'layer_Bg', //窗体样式类名
					shade: 0.6, //遮罩透明度
					shadeClose: true, //遮罩层开启
					scrollbar: false, //关闭浏览器滚动
					area: ['595px', '600px'], //宽高
					content: $('#layer_userView-help'),
					btn: ['保存'],
					yes: function() {
						/*console.log(helpUser);*/
						$.ajax({
							url:'${path}/PageHome/addZhangaiUser',
							data:{
								mydata:JSON.stringify(helpUser),
                                targetId:${targetId},
                                userId:${userId}
							},
							type:'post',
							dataType:'text',
							success:function(result){
								alert(result)
                             if (result=='yes') {
								 layer.close(huv);
                             	window.location.href ='${path}/PageHome/myChange?targetId=${targetId}&userId=${userId}';
							 }
							}

						})
						/*layer.close(huv);*/
					}
				});
			},
			yyfxLayer: function(inx,id) {
				yyfxv = layer.open({
					type: 1,
					title: false,
					closeBtn: 0,
					skin: 'layer_Bg', //窗体样式类名
					shade: 0.6, //遮罩透明度
					shadeClose: true, //遮罩层开启
					scrollbar: false, //关闭浏览器滚动
					area: ['700px', '425px'], //宽高
					content: $('#layer_yyfx'),
					btn: ['保存'],
					yes: function() {
						/*vue.myChangeListL[inx].yyValue = $('#layer_yyfx #yyfxArea').val();*/
						vue.myChangeListL[inx].yyfx= $('#layer_yyfx #yyfxArea').val();
						console.log("原因分析:" , vue.myChangeListL);
						layer.close(yyfxv);
					}
				});
				$('#layer_yyfx #yyfxArea').val(vue.myChangeListL[inx].yyfx).focus();
			},
			gscsLayer: function(inx,id) {
				gscsv = layer.open({
					type: 1,
					title: false,
					closeBtn: 0,
					skin: 'layer_Bg', //窗体样式类名
					shade: 0.6, //遮罩透明度
					shadeClose: true, //遮罩层开启
					scrollbar: false, //关闭浏览器滚动
					area: ['700px', '425px'], //宽高
					content: $('#layer_gscs'),
					btn: ['保存'],
					yes: function() {
						vue.myChangeListR[inx].yyfx = $('#layer_gscs #gscsArea').val();
						layer.close(gscsv);
					}
				});
				$('#layer_gscs #gscsArea').val(vue.myChangeListR[inx].yyfx).focus();
			},
			btnPost:function(){//提交
				console.log(vue.myChangeListL);//原因
				console.log(vue.myChangeListR);//措施
				console.log(vue.userView);//诊改人员
				console.log(vue.helpUser);//协助人员
				this.btnSaveYy();
				this.btnSaveCs();
				this.submitWarning();
				window.location.href ="${path}/PageHome/changeReport?targetId=${targetId}";
			},
			btnSaveCs:function(){     //提交措施

			$.ajax({
					url:'${path}/PageHome/submitCs',
					data:{
						myChangeListR:JSON.stringify(vue.myChangeListR),
                        targetId:${targetId}

					},
					type:'post',
					dataType:'text',
					success:function(result){
						if (result=='yes'){
							layer.msg("提交措施");
							window.location.href='${path}/PageHome/myChange?targetId=${targetId}';
						}
					}
				})

				/*console.log(vue.myChangeListR);*/

			},
			submitWarning:function(){
				var goTime = $("#goTime").text();
				var endTime = $("#endTime").text();
				var warningTime = $("#warning").text();
				var sortStr = $("#sort").text();
				var sort;
				if(sortStr=="每日"){
					sort=1;
				}
				if(sortStr=="每周"){
					sort=2;
				}
				if(sortStr=="每月"){
					sort=3;
				}
				if(sortStr=="每学期"){
					sort=4;
				}
				if(sortStr=="每学年"){
					sort=5;
				}

				$.ajax({
					url:'${path}/PageHome/submitWarning',
					data:{
						gotime:goTime,
						endtime:endTime,
						excTime:warningTime,
						sort:sort,
                        tId:${targetId}
					},
					type:'post',
					dataType:'text',
					success:function(result){
						if (result=='yes'){
							window.location.href='${path}/PageHome/myChange?targetId=${targetId}';
					    }
				    }
				})


			},
			btnSaveYy:function(){//提交原因
				$.ajax({
					url:'${path}/PageHome/submitYy',
					data:{
						'myChangeListL':JSON.stringify(vue.myChangeListL),
                        targetId:${targetId}
					},
					type:'post',
					dataType:'text',
					success:function(result){
						if (result=='yes'){
							layer.msg("提交原因");
							window.location.href='${path}/PageHome/myChange?targetId=${targetId}';
						}
					}
				})

				/*alert(JSON.stringify(vue.myChangeListL))*/
				console.log(vue.myChangeListL);

			}

		},
		mounted: function() {
			$("#myscroll1,#myscroll2,#myscroll3,#myscroll4").panel({
				iWheelStep: 15
			}); //初始化滚动
			$('.helpUserCheck').iCheck({
				labelHover: true,
				cursor: true,
				checkboxClass: 'icheckbox_polaris',
				radioClass: 'iradio_polaris'
			});
// 		$('.helpUserCheck').on('ifChanged', function(event) {
// 			// console.log($(this).attr('data-ucinx'));
// 			vue.helpUser[$(this).attr('data-ucinx')].select = !vue.helpUser[$(this).attr('data-ucinx')].select;
// 			// console.log(vue.helpUser);
// 		});
		}
	});


</script>

</html>
