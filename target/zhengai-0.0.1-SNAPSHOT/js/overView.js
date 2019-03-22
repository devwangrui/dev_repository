var testTable = [
	{"i": 0,"firstNorm": "一级指标一级指标一级指标","secondNorm": "二级指标二级指标二级指标","normName": "指标名称指标名称指标名称","end": true,"starPeople": "王小明"},
	{"i": 1,"firstNorm": "一级指标","secondNorm": "二级指标","normName": "指标名称","end": false,"starPeople": "王小明"},
	{"i": 2,"firstNorm": "一级指标","secondNorm": "二级指标","normName": "指标名称","end": false,"starPeople": "王小明"},
	{"i": 3,"firstNorm": "一级指标","secondNorm": "二级指标","normName": "指标名称","end": false,"starPeople": "王小明"},
	{"i": 4,"firstNorm": "一级指标","secondNorm": "二级指标","normName": "指标名称","end": false,"starPeople": "王小明"},
	{"i": 5,"firstNorm": "一级指标","secondNorm": "二级指标","normName": "指标名称","end": false,"starPeople": "王小明"},
	{"i": 6,"firstNorm": "一级指标","secondNorm": "二级指标","normName": "指标名称","end": false,"starPeople": "王小明"},
	{"i": 7,"firstNorm": "一级指标","secondNorm": "二级指标","normName": "指标名称","end": false,"starPeople": "王小明"}]; //列表
var testEchartsData = [{"title": {"text": "挂科数量诊改频次","textStyle": {"fontSize": "16","fontWeight": "normal"}},"grid": {"left": "5%","right": "3%","top": "15%"},"xAxis": {"type": "category","data": ["浙江", "江西", "新疆", "安徽", "河南", "湖北", "四川", "青海", "浙江", "江西", "新疆", "安徽", "河南", "湖北", "四川"]},"tooltip": {"trigger": "axis","axisPointer": {"type": "shadow"}},"yAxis": {"type": "value"},"series": [{"data": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 90],"markLine": {"symbolSize": 0,"lineStyle": {"color": "#c05c6d"},"label": {"formatter": "{b}: {c}","position": "middle"},"data": [{"name": "标准值","yAxis": 100}]},"type": "bar"}]},
{"title": {"text": "挂科数量诊改预警峰值","textStyle": {"fontSize": "16","fontWeight": "normal"}},"grid": {"left": "5%","right": "3%","top": "15%"},"xAxis": {"type": "category","data": ["浙江", "江西", "新疆", "安徽", "河南", "湖北", "四川", "青海", "浙江", "江西", "新疆", "安徽", "河南", "湖北", "四川"]},"tooltip": {"trigger": "axis","axisPointer": {"type": "shadow"}},"yAxis": {"type": "value"},"series": [{"data": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],"type": "line"}]}]//图表模拟数据

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
		echartsData: testEchartsData,
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
			let url = 'js/echarts_data_classList.json';
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
			let url = 'js/echarts_data_classList.json';
			this.$http.get(url, {
				page: n
			}).then((res) => {
				let data = [{
					"i": 6,
					"firstNorm": "一级指标",
					"secondNorm": "二级指标",
					"normName": "指标名称",
					"end": false,
					"starPeople": "王小明"
				}]
				// res.status == 200 ? this.tccEcharts = res.body : '';
				res.status == 200 ? this.layout = data : '';
				n < 1 ? this.classPageNumNow = 1 : n < Math.ceil(this.layout.length / this.classPageNum) ? this.classPageNumNow =
					n : this.classPageNumNow = Math.ceil(this.layout.length / this.classPageNum);

			}, (err) => {
				console.log(err.status)
			});
		},
		btnShow: function(id) {
			layer.msg("查看诊改报告 " + id);
		},
		selectLi: function(inx, id) {
			this.selectIndex = inx;
			layer.msg("id: " + id);
			this.echartsBox(id);
		},
		viewReport: function(id) {
			layer.msg("我要去查看诊改报告了");
		},
		echartsBox: function(id) {
			let url = 'js/overView.js';
			this.$http.get(url, {id: id}).then((res) => {
				//res.status == 200 ? this.echartsData = res.body : '';
				//res.status == 200 ? this.timeBarData = res.body : '';
				var charts1 = echarts.init($("#echarts-1")[0], this.echartsTheme[this.defaultEchartsTheme]);
				this.echartsArr[0] = charts1;
				charts1.setOption(this.echartsData[0], true);
				var charts2 = echarts.init($("#echarts-2")[0], this.echartsTheme[this.defaultEchartsTheme]);
				this.echartsArr[1] = charts2;
				charts2.setOption(this.echartsData[1], true);
			}, (err) => {
				console.log(err.status)
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
