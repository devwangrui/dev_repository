<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">

	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>智慧诊改-诊改概况</title>
		<link rel="stylesheet/less" type="text/less" href="${path}/css/myStyle.less" />
		<link rel="stylesheet/less" type="text/less" href="${path}/css/overView.less" />
		<script type="text/javascript" src="${path}/js/less.min.js?v=2.6.0"></script>
		<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/js/vue.js?v=v2.5.16"></script>
		<script type="text/javascript" src="${path}/js/vue-resource.min.js?v=1.5.1"></script>
		<!--layer-->
		<script type="text/javascript" src="${path}/js/layer/layer.js"></script>
		<!-- icon -->
		<script type="text/javascript" src="//at.alicdn.com/t/font_1025383_r9m3x9wk5y8.js"></script>
		<!-- animate -->
		<link rel="stylesheet" type="text/css" href="${path}/css/animate/animate.min.css" />


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
					<a href="">首页</a>
				</li>
				<li>
					<a href="">报表中心</a>
					<div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="changeReport.jsp">学生成长</a></li>
							<li class="er_ji-item"><a href="changeReport.jsp">招生就业</a></li>
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
							<li class="er_ji-item"><a href="classList.html">课程质检</a></li>
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
		<div class="body-div">

			<div class="ft1 floatLeft bodyTitle">
				<p class="inline-block">诊改概况</p>
			</div>
			<div class="clear"></div>
		</div>


		<div id="app">
			<div id="content">

				<div id="table_l" class="floatLeft">
					<div class="search_ipt floatRight search_ipt-small">
						<input type="text" v-model="searchTxt" class="form-control" placeholder="请输入指标名称" @keyup.enter="searchTxticon"/>
						<svg class="icon" aria-hidden="true" style="font-size: 25px;color: #fff;position: relative;top: 4px;" @click="searchTxticon">
							<use xlink:href="#icon-sousuo"></use>
						</svg>
					</div>
					<div class="chartsTable">

						<div class="myChangeList floatLeft">
							<ul class="myChangeListUl_f">
								<li>
									<ul class="myChangeListUl_c title">
										<li>序号</li>
										<li>一级指标</li>
										<li>二级指标</li>
										<li>指标名称</li>
										<li>是否完结</li>
										<li>发起人</li>
										<li>操作</li>
									</ul>
								</li>
								<li class="myChangeListli_f" v-show="table.length==0">暂无数据</li>
								<li class="myChangeListli_f" @click.stop="selectLi(index,item.i,item.end)" v-for="(item,index) in table" :class="{select:index==selectIndex}">
									<ul class="myChangeListUl_c bd">
										<li>{{index+1}}</li>
										<li class="slh">{{item.firstNorm}}</li>
										<li class="slh">{{item.secondNorm}}</li>
										<li class="slh orange">{{item.normName}}</li>
										<li>{{item.end ? '是' : '否'}}</li>
										<li>{{item.starPeople}}</li>
										<li>
											<div class="btn btn-show" @click.stop="btnShow(item.i)">查看</div>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
					<div id="pageBox" v-show="table.length>0">

						<div class="btn btn-prev" @click="pageNumlayout(classPageNumNow-1)">&lt; 上一页</div>
						<div class="btn btn-num" @click="pageNumlayout(n)" v-for="n in pageNum(table.length)">{{n}}</div>
						<div class="btn btn-next" @click="pageNumlayout(classPageNumNow+1)">下一页 &gt;</div>

					</div>
				</div>
				<div id="table_line" class="floatLeft">
					<ul>
						<li v-for="linepoint in 6">•</li>
					</ul>
				</div>
				<div id="table_r" class="floatLeft">
					<div class="timeBar">
						<hr class="centerLine" />
						<ul>
							<transition name="slide-fade">
								<li v-if="timeBarData[0]">
									<div class="tbbg" :style="{backgroundImage:'url(${path}/images/'+timeBarbgimg[0]+')'}"></div>
									<div class="tbt">
										<p class="p1">{{timeBarData[0]}}</p>
										<p class="p2">诊改起始</p>
									</div>
								</li>
							</transition>
							<transition name="slide-fade">
								<li v-if="timeBarData[1]">
									<div class="tbbg" :style="{backgroundImage:'url(/images/'+timeBarbgimg[1]+')'}"></div>
									<div class="tbt">
										<p class="p1">{{timeBarData[1]}}</p>
										<p class="p2">第一次诊改结束</p>
									</div>
								</li>
							</transition>
							<transition name="slide-fade">
								<li v-if="timeBarData[2]">
									<div class="tbbg" :style="{backgroundImage:'url(${path}/images/'+timeBarbgimg[2]+')'}"></div>
									<div class="tbt">
										<p class="p1">{{timeBarData[2]}}</p>
										<p class="p2">第二次诊改结束</p>
									</div>
								</li>
							</transition>
							<transition name="slide-fade">
								<li v-if="timeBarData[3]">
									<div class="tbbg" :style="{backgroundImage:'url(${path}/images/'+timeBarbgimg[3]+')'}"></div>
									<div class="tbt">
										<p class="p1">{{timeBarData[3]}}</p>
										<p class="p2">诊改完结</p>
									</div>
								</li>
							</transition>
						</ul>
					</div>
					<div class="clear"></div>
					<div class="echartsBox">
						<div id="echarts-1" style="width: 100%;height: 300px;"></div>
						<div id="echarts-2" style="width: 100%;height: 300px;"></div>
					</div>
					<div class="btn btn-report floatRight" @click="viewReport">
						报告
					</div>
				</div>

			</div>




		</div>
	</body>

	<!-- <script type="text/javascript" src="js/style.js"></script> -->
	<script type="text/javascript" src="${path}/js/style.min.js"></script>
	<!-- scrollbar -->
	<script type="text/javascript" src="${path}/js/scrollbar/zUI.js"></script>
	<script type="text/javascript" src="${path}/js/echarts/echarts.min.js"></script>
	<!-- echarts主题 -->
	<script type="text/javascript" src="${path}/js/echarts/theme/walden.js"></script>
	<script type="text/javascript" src="${path}/js/echarts/theme/westeros.js"></script>
	<!-- echarts数据配置 -->
<%--	<script type="text/javascript" src="${path}/js/overView.js"></script>--%>

    <script>
		var testTable =${myTargetDatasList};
		var vue = new Vue({
			el: '#app',
			data: {
				table: testTable, //课程列表
				classPageNum: 8, //定义每页多少个课程
				classPageNumNow: 1, //当前在第几页
				echartsTheme: ['walden', 'westeros'], //echarts主题
				defaultEchartsTheme: 1, //默认的
				searchTxt: '', //搜索初始值
				selectIndex: 0, //指标列表默认选中第一条
				timeBarbgimg: ['tbbg_go.png', 'tbbg_1st.png', 'tbbg_2nd.png', 'tbbg_end.png'], //timebar背景
				timeBarData: ['2018.10.10', '2018.9.9', '2018.8.8', '2018.7.7'], //timebar时间 无 false
				echartsArr: [],
			},
			watch: {
				echartsData: function(val, oldval) {
					this.selectLi(0, this.table[0].i);
				}
			},
			methods: {
				searchTxticon: function() { //弹出层搜索框事件
					layer.msg(this.searchTxt);
				},
				chartsChange: function(i, inx) { //点击改变echartsdemo
					layer.msg('请求id为 ' + i + ' 下标 ' + inx + ' 的图表数据');
					let url = '${path}/js/echarts_data_classList.json';
					this.$http.get(url, {
						id: i
					}).then((res) => {
						res.status == 200 ? this.tccEcharts = res.body : ''
					}, (err) => {
						console.log(err.status)
					});
				},
				pageNum: function(num) { //分页器计算
					return Math.ceil(num / this.classPageNum)
				},
				pageNumlayout: function(n) {
					let url = '/js/echarts_data_classList.json';
					this.$http.get(url, {
						page: n
					}).then((res) => {
						let data = <%--${myTargetDatasList};--%>
								[{
							"i": 6,
							"firstNorm": "一级指标",
							"secondNorm": "二级指标",
							"normName": "指标名称",
							"end": false,
							"starPeople": "王小明"
						}]
						// res.status == 200 ? this.tccEcharts = res.body : ''--%>;
						res.status == 200 ? this.layout = data : '';
						n < 1 ? this.classPageNumNow = 1 : n < Math.ceil(this.layout.length / this.classPageNum) ? this.classPageNumNow =
								n : this.classPageNumNow = Math.ceil(this.layout.length / this.classPageNum);

					}, (err) => {
						/*console.log(err.status)*/
					});
				},
				btnShow: function(id) {
					/*layer.msg("查看诊改报告 " + id);*/
					window.location.href="${path}/PageHome/myChange?targetId="+id;
				},
				selectLi: function(inx, id) {
					this.selectIndex = inx;

					this.echartsBox(id);

				},
				viewReport: function(id) {
					layer.msg("我要去查看诊改报告了");
				},
				echartsBox: function(id) {

					var EchartsData=[];
					let url = '${path}/PageHome/getValues?targetId='+id;
					this.$http.get(url, {
						targetId: id
					}).then((res) => {
						var conditionDatas1=res.body;
						this.timeBarData=[conditionDatas1.gotime,conditionDatas1.firstAdd,conditionDatas1.secondAdd,conditionDatas1.endtime];
						if (JSON.stringify(conditionDatas1.vdatas)===undefined){

							EchartsData = [{"title": {"text": "暂无数据","textStyle": {"fontSize": "16","fontWeight": "normal"}},"grid": {"left": "5%","right": "3%","top": "15%"},"xAxis": {"type": "category","data":"" },"tooltip": {"trigger": "axis","axisPointer": {"type": "shadow"}},"yAxis": {"type": "value"},"series": [{"data": "","markLine": {"symbolSize": 0,"lineStyle": {"color": "#c05c6d"},"label": {"formatter": "{b}: {c}","position": "middle"},"data": [{"name": "","yAxis": ""}]},"type": "bar"}]},
								{"title": {"text": "暂无数据","textStyle": {"fontSize": "16","fontWeight": "normal"}},"grid": {"left": "5%","right": "3%","top": "15%"},"xAxis": {"type": "category","data":""},"tooltip": {"trigger": "axis","axisPointer": {"type": "shadow"}},"yAxis": {"type": "value"},"series": [{"data": "","type": "line"}]}]//图表模拟数据
						}else {

							EchartsData = [{
								"title": {
									"text": conditionDatas1.text,
									"textStyle": {"fontSize": "16", "fontWeight": "normal"}
								},
								"grid": {"left": "5%", "right": "3%", "top": "15%"},
								"xAxis": {
									"type": "category",
									"data": conditionDatas1.xdatas,
									axisLabel: {interval: 0, rotate: "10"}
								},
								"tooltip": {"trigger": "axis", "axisPointer": {"type": "shadow"}},
								"yAxis": {"type": "value"},
								"series": [{
									itemStyle: {
										normal: {
											label: {show: true, formatter: '{b} : {c}'},
											labelLine: {show: true}
										}
									},
									"data": conditionDatas1.vdatas,
									"markLine": {
										"symbolSize": 0,
										"lineStyle": {"color": "#c05c6d"},
										"label": {"formatter": "{b}: {c}", "position": "middle"},
										"data": [{"name": "标准值", "yAxis": conditionDatas1.yAxis}]
									},
									"type": "bar"
								}]
							},
								{
									"title": {
										"text": conditionDatas1.text,
										"textStyle": {"fontSize": "16", "fontWeight": "normal"}
									},
									"grid": {"left": "5%", "right": "3%", "top": "15%"},
									"xAxis": {
										"type": "category",
										"data": conditionDatas1.xdatas,
										axisLabel: {interval: 0, rotate: "10"}
									},
									"tooltip": {"trigger": "axis", "axisPointer": {"type": "shadow"}},
									"yAxis": {"type": "value"},
									"series": [{
										itemStyle: {
											normal: {
												label: {show: true, formatter: '{b} : {c}'},
												labelLine: {show: true}
											}
										}, "data": conditionDatas1.vdatas, "type": "line"
									}]
								}]//图表模拟数据
						}
						var charts1 = echarts.init($("#echarts-1")[0], this.echartsTheme[this.defaultEchartsTheme]);
						this.echartsArr[0] = charts1;
						charts1.setOption(EchartsData[0], true);
						var charts2 = echarts.init($("#echarts-2")[0], this.echartsTheme[this.defaultEchartsTheme]);
						this.echartsArr[1] = charts2;
						charts2.setOption(EchartsData[1], true);
					}, (err) => {
						/*console.log(err.status)*/
					});
				}
			},
			mounted: function() {
				window.onresize = function() {
					$.each(vue.echartsArr, function(i) {
						vue.echartsArr[i].resize();
					});
				};
				this.selectLi(0, this.table[0].i);
			},
			created: function() {

			}
		});


	</script>

</html>
