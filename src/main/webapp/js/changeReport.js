var myChangeListL = [{"name": "licc1","postTime": "2018-1-1","yyfx": "原因分析1","id": 1,"yyValue": "1"},{"name": "licc2","postTime": "2018-1-2","yyfx": "原因分析2","id": 2,"yyValue": "2"},{"name": "licc3","postTime": "2018-1-3","yyfx": "原因分析3","id": 3,"yyValue": "3"},{"name": "licc4","postTime": "2018-1-4","yyfx": "原因分析4","id": 4,"yyValue": "4"},
]; //左侧诊改

var myChangeListR = [{"name": "licc1","postTime": "2018-1-1","gscs": "改善措施1","id": 1,"csValue": "hh1"},{"name": "licc2","postTime": "2018-1-2","gscs": "改善措施2","id": 2,"csValue": "hh2"},{"name": "licc3","postTime": "2018-1-3","gscs": "改善措施3","id": 3,"csValue": "hh3"},{"name": "licc4","postTime": "2018-1-4","gscs": "改善措施4","id": 4,"csValue": "hh4"}
]; //右侧诊改

var userView = [{"name": "licc1","zt": 0},{"name": "licc2","zt": 1},{"name": "licc3","zt": 2}
]; //诊改人员查看

var vue = new Vue({
	el: '#app',
	data() {
		return {
			myChangeListL: myChangeListL,
			myChangeListR: myChangeListR,
			bzz: 100000,
			dqz: 102102,
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

			var charts = echarts.init($("#echarts-1")[0], this.echartsTheme[this.defaultEchartsTheme]);
			this.chartsDemo.push(charts);
			option = {
				xAxis: {
					type: 'category',
					data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
				},
				yAxis: {
					type: 'value'
				},
				series: [{
					data: [22, 22],
					type: 'line'
				}]
			};

			charts.setOption(option, true);

			var charts = echarts.init($("#echarts-2")[0], this.echartsTheme[this.defaultEchartsTheme]);
			this.chartsDemo.push(charts);
			option = {
				title: {
					text: '某站点用户访问来源',
					subtext: '纯属虚构',
					x: 'center',
					show: false
				},
				tooltip: {
					trigger: 'item',
					formatter: "{b} : {c} ({d}%)"
				},
				legend: {
					orient: 'horizontal',
					// right: 'right',
					top: '2%',
					itemGap: 5,
					itemWidth: 10,
					itemHeight: 10,
					textStyle: {
						fontSize: 10
					},
					data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
				},
				series: [{
					type: 'pie',
					radius: '55%',
					center: ['40%', '55%'],
					data: [{
						value: 335,
						name: '直接访问'
					}, {
						value: 310,
						name: '邮件营销'
					}, {
						value: 234,
						name: '联盟广告'
					}, {
						value: 135,
						name: '视频广告'
					}, {
						value: 1548,
						name: '搜索引擎'
					}]
				}]
			};
			charts.setOption(option, true);

			var charts = echarts.init($("#echarts-3")[0], this.echartsTheme[this.defaultEchartsTheme]);
			this.chartsDemo.push(charts);
			option = {
				title: {
					text: '基础雷达图',
					show: false
				},
				tooltip: {},
				legend: {
					itemGap: 5,
					itemWidth: 10,
					itemHeight: 10,
					textStyle: {
						fontSize: 10
					},
					data: ['预算分配（Allocated Budget）', '实际开销（Actual Spending）']
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
					indicator: [{
							name: '销售（sales）',
							max: 6500
						},
						{
							name: '管理（Administration）',
							max: 16000
						},
						{
							name: '信息技术（Information Techology）',
							max: 30000
						},
						{
							name: '客服（Customer Support）',
							max: 38000
						},
						{
							name: '研发（Development）',
							max: 52000
						},
						{
							name: '市场（Marketing）',
							max: 25000
						}
					]
				},
				series: [{
					name: '预算 vs 开销（Budget vs spending）',
					type: 'radar',
					// areaStyle: {normal: {}},
					data: [{
							value: [4300, 10000, 28000, 35000, 50000, 19000],
							name: '预算分配（Allocated Budget）'
						},
						{
							value: [5000, 14000, 28000, 31000, 42000, 21000],
							name: '实际开销（Actual Spending）'
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
