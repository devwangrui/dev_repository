<%@ page import="com.example.zhengai.model.YzUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
		<meta name="viewport" content="width=device-width, initial-scale=1" user-scalable="no">
		<title>智慧诊改-诊改报告</title>
		<link rel="stylesheet/less" type="text/less" href="${path}/css/myStyle.less" />
		<link rel="stylesheet/less" type="text/less" href="${path}/css/changeReport.less" />
		<script type="text/javascript" src="${path}/js/less.min.js?v=2.6.0"></script>
		<script type="text/javascript" src="${path}/js/jquery.min.js?v=2.2.4"></script>
		<script type="text/javascript" src="${path}/js/vue.js?v=2.5.16"></script>
		<!--layer-->
		<script type="text/javascript" src="${path}/js/layer/layer.js?v=3.1.1"></script>
		<!-- icon -->
		<script type="text/javascript" src="//at.alicdn.com/t/font_1025383_7wb2wgxbico.js"></script>
	</head>
	<body>
		<div class="topbar">
			<p class="tb_title">王小明</p>
			<p class="tb_subtitle">欢迎使用诊改系统！</p>
		</div>
		<div class="navbar">
			<ul>
				<li>
					<a href=""><span id="index_logo"></span>信远智慧诊改系统</a>
				</li>
				<li>
					<a href="index.html">首页</a>
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
							<li class="er_ji-item"><a href="myChange.html">我的诊改</a></li>
							<li class="er_ji-item"><a href="">提高标准</a></li>
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
			<div class="body-div">

				<div class="ft1 floatLeft bodyTitle">
					<p class="inline-block">诊改报告</p>
				</div>

				<div class="clear"></div>
			</div>
			<div class="bdcolor">
				<div class="changehead classNum floatLeft">
					<p class="title">补考课程数</p>
					<div class="bubble bubble-green">
						<p>当前值</p>
						<p>{{bzz}}</p>
					</div>
					<div class="bubble bubble-red">
						<p>标准值</p>
						<p>{{dqz}}</p>
					</div>
				</div>

				<div class="changehead charts floatLeft">

					<div class="chartsDemoB floatLeft">
						<div id="echarts-1" style="width: 100%;height: 250px;"></div>
						<p>当前诊改趋势</p>
					</div>
					<div class="chartsDemoB floatLeft">
						<div id="echarts-2" style="width: 100%;height: 250px;"></div>
						<p>纵向对比图</p>
					</div>
					<div class="chartsDemoB floatLeft">
						<div id="echarts-3" style="width: 100%;height: 250px;"></div>
						<p>横向对比图</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<div class="body-div">
				<svg class="icon floatLeft" aria-hidden="true" style="margin:0 5px;font-size: 30px;color: #e9a550;">
					<use xlink:href="#icon-lingdang"></use>
				</svg>
				<p class="inline-block floatLeft fontColor">提醒节点：每学期</p>
				<svg class="icon floatLeft" aria-hidden="true" style="margin:1px 5px 0 30px;font-size: 26px;color: #508b9a;">
					<use xlink:href="#icon-rili"></use>
				</svg>
				<p class="inline-block floatLeft fontColor">诊改时间节点：2018/01/0-2018/12/12</p>
				<div class="btn btn-iron floatRight" id="btnShowUserView" @click="userViewLayer()" style="margin-right: 10px;">诊改人员查看
					<svg class="icon" aria-hidden="true">
						<use xlink:href="#icon-tubiao"></use>
					</svg>
				</div>
				<div class="clear"></div>
			</div>

			<div class="body-div ">
				<div id="content">

					<div class="myChangeList myChangeListL floatLeft">
						<table border="0" cellspacing="0" cellpadding="0" class="fixTh">
							<thead>
								<tr>
									<th max-width="23.33%" width="23.33%">姓名</th>
									<th max-width="23.33%" width="23.33%">提交时间</th>
									<th max-width="40%" width="40%">原因分析</th>
								</tr>
							</thead>
						</table>
						<div class="fixTb" id="myscroll1">
							<table border="0" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
										<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
										<th max-width="40%" width="40%" height="0" style="padding: 0;"></th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(item,index) in myChangeListL">
										<td>{{item.name}}</td>
										<td>{{item.postTime}}</td>
										<td >{{item.yyfx}}</td>
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
									<th max-width="40%" width="40%">改善措施</th>
								</tr>
							</thead>
						</table>
						<div class="fixTb" id="myscroll3">
							<table border="0" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
										<th max-width="23.33%" width="23.33%" height="0" style="padding: 0;"></th>
										<th max-width="40%" width="40%" height="0" style="padding: 0;"></th>
									</tr>
								</thead>

								<tbody>
									<tr v-for="(item,index) in myChangeListR">
										<td>{{item.name}}</td>
										<td>{{item.postTime}}</td>
										<td >{{item.yyfx}}</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<div class="clear"></div>
					<div class="btn btn-iron floatRight" id="btnBack" @click="btnBack()" style="margin-right: 10px;margin-bottom: 50px;">返回</div>
				</div>


				<div class="clear"></div>
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
					<div class="fixTb" id="myscroll4">
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
			</div>
			<!-- //layer_userView -->

		</div><!-- //Vueapp -->
	</body>

	<script type="text/javascript" src="${path}/js/style.js"></script>
	<script type="text/javascript" src="${path}/js/scrollbar/zUI.js"></script>
	<!-- echarts -->
	<!-- <script type="text/javascript" src="js/echarts/echarts.common.min.js"></script> -->
	<script type="text/javascript" src="${path}/js/echarts/echarts.min.js"></script>
	<!-- echarts主题 -->
	<script type="text/javascript" src="${path}/js/echarts/theme/walden.js"></script>
	<script type="text/javascript" src="${path}/js/echarts/theme/westeros.js"></script>
	
	<%--<script type="text/javascript" src="${path}/js/changeReport.js"></script>--%>

</html>
<script>
	var myChangeListL = ${listData};
	/*[{"name": "licc1","postTime": "2018-1-1","yyfx": "原因分析1","id": 1,"yyValue": "1"},{"name": "licc2","postTime": "2018-1-2","yyfx": "原因分析2","id": 2,"yyValue": "2"},{"name": "licc3","postTime": "2018-1-3","yyfx": "原因分析3","id": 3,"yyValue": "3"},{"name": "licc4","postTime": "2018-1-4","yyfx": "原因分析4","id": 4,"yyValue": "4"},
	];*/ //左侧诊改

	var myChangeListR =${listData1}
			/*[{"name": "licc1","postTime": "2018-1-1","gscs": "改善措施1","id": 1,"csValue": "hh1"},{"name": "licc2","postTime": "2018-1-2","gscs": "改善措施2","id": 2,"csValue": "hh2"},{"name": "licc3","postTime": "2018-1-3","gscs": "改善措施3","id": 3,"csValue": "hh3"},{"name": "licc4","postTime": "2018-1-4","gscs": "改善措施4","id": 4,"csValue": "hh4"}
	]*/; //右侧诊改

	var userView = ${userView};
			/*[{"name": "licc1","zt": 0},{"name": "licc2","zt": 1},{"name": "licc3","zt": 2}*/
	; //诊改人员查看

	var vue = new Vue({
		el: '#app',
		data() {
			return {
				myChangeListL: myChangeListL,
				myChangeListR: myChangeListR,
				bzz: ${stand},
				dqz: 100,
				userView: userView,
				echartsTheme: ['walden', 'westeros'],
				defaultEchartsTheme: 1, //默认的
				chartsDemo: [],
				userViewZt: {
					0: ['userIng', '进行中'],
					1: ['finish', '已完成'],
					2: ['notStart', '未开始'],
				}
			}
		},
		methods: {
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
			chartsDemoCreate: function() {
				var dataNow =${dataNow};
				var charts = echarts.init($("#echarts-1")[0], this.echartsTheme[this.defaultEchartsTheme]);
				this.chartsDemo.push(charts);
				option = {
					xAxis: {
						type: 'category',
						data: dataNow.xdatas,
						axisLabel: {interval: 0, rotate: "30"}
					},
					yAxis: {
						type: 'value'
					},
					series: [{
						data: dataNow.vdatas,
						type: 'line',
						itemStyle:{               //让数字显示在饼状图
							normal:{
								label:{
									show: true,
									formatter: '{b} : {c}'
								},
								labelLine :{show:true}
							}
						}
					}]
				};

				charts.setOption(option, true);

				var charts = echarts.init($("#echarts-2")[0], this.echartsTheme[this.defaultEchartsTheme]);
				this.chartsDemo.push(charts);
				option = {
					tooltip: {
						trigger: 'item',
						formatter: "{a} <br/>{b}: {c} ({d}%)"
					},
					legend: {
						show:false
					},
					series: [
						{
							type:'pie',
							selectedMode: 'single',
							radius: [0, '55%'],

							label: {
								normal: {
									position: 'inner'
								}
							},
							labelLine: {
								normal: {
									show: false
								}
							},
							data:${pieData}

						},
						{
							type:'pie',
							radius: ['60%', '80%'],
							label: {

							},
							data:${roundData}

						}
					]
				};

				charts.setOption(option, true);

				var charts = echarts.init($("#echarts-3")[0], this.echartsTheme[this.defaultEchartsTheme]);
				this.chartsDemo.push(charts);
				option = {
					title: {
						show: false
					},
					tooltip: {},
					legend: {
						show:false
						},
					radar: {
						// shape: 'circle',
						name: {
							textStyle: {
								color: '#fff',
								backgroundColor: '#999',
								borderRadius: 3,
								padding: [3, 5]
							}
						},
						indicator:${listRadar}
					},
					series: [{
						type: 'radar',
						data: [
							{
								value:${listRadar1}
								/*[5000, 14000, 28000, 31000, 42000, 21000]*/
							}
						]
					}]
				};
				charts.setOption(option, true);
			},
			btnBack: function() {
				layer.msg('我要返回了')
			}
		},
		created: function() {

		},
		mounted: function() {


			this.chartsDemoCreate();
			$("#myscroll1,#myscroll2,#myscroll3,#myscroll4").panel({
				iWheelStep: 15
			}); //初始化滚动
			window.onresize = function() {
				$.each(this.chartsDemo, function(i, item) {
					this.chartsDemo[i].resize();
				});
			};
		}
	});

</script>
