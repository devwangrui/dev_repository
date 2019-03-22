var textList = [{"t": "学校","icon": "icon-xuexiao"},{"t": "分院","icon": "icon-fenyuan"},{"t": "专业","icon": "icon-zhuanye"},{"t": "班级","icon": "icon-banji"},{"t": "教师","icon": "icon-jiaoshi"},{"t": "学生","icon": "icon-xuesheng1"},{"t": "课程","icon": "icon-kecheng1"}] //菜单列表


var vue = new Vue({
	el: '#app',
	data: {
		table: '', //课程列表
		classPageNum: 8, //定义每页多少个课程
		classPageNumNow: 1, //当前在第几页
		echartsTheme: ['walden', 'westeros'], //echarts主题
		defaultEchartsTheme: 1, //默认的echarts主题
		searchTxt: '', //搜索初始值
		listArr: textList,//左侧菜单列表
		selectIndex: 0, //左侧菜单列表默认选中第一条
		echartsData: [],//图表数据
		echartsArr: [],//图表数组
		tccbzz:100,//弹出层标准值
		tccdqz:200,//弹出层当前值
		tccRecentUp:'',//弹出层近期提升
		tccUpnotes:[{'timeStar':'2018','timeEnd':'2019','level':0,'recent':[{'user':'licc','old':65,'new':75},{'user':'licc1','old':75,'new':85}]}],//弹出层提升记录
		tccRecentlevelImg:['images/mark_y_07.png','images/mark_y_03.png'],//0 良好 1优秀
	},
	watch: {
		echartsData: function(val, oldval) {
			this.echartsBox(this.classPageNumNow);
		}
	},
	methods: {
		searchTxticon: function() { //搜索框事件
			layer.msg(this.searchTxt);
		},
		pageNum: function(num) { //分页器计算
			return Math.ceil(num / this.classPageNum)
		},
		pageNumlayout: function(n) {
			let url = '/js/echarts_data_classList.json';
			this.$http.get(url, {page: n}).then((res) => {
				let data = [{"i": 999,"firstNorm": "一级指标999","secondNorm": "二级指标666","normName": "指标名称666","starPeople": "王小明"},{"i": 444,"firstNorm": "一级指标444","secondNorm": "二级指标666","normName": "指标名称666","starPeople": "王小明"},{"i": 333,"firstNorm": "一级指标333","secondNorm": "二级指标666","normName": "指标名称666","starPeople": "王小明"}];//模拟变更课程列表数据
				let echartsdata = [{"title": {"text": "666","subtext": "纯属虚构","x": "center","show": false},"tooltip": {"trigger": "item","formatter": "{a} <br/>{b} : {c} ({d}%)"},"legend": {"orient": "vertical","left": "left","data": ["直接访问", "邮件营销", "联盟广告", "视频广告", "搜索引擎"]},"series": [{"name": "访问来源","type": "pie","radius": "55%","center": ["50%", "60%"],"data": [{"value": 444,"name": "直接访问"}, {"value": 310,"name": "邮件营销"}, {"value": 234,"name": "联盟广告"}, {"value": 135,"name": "视频广告"}, {"value": 1548,"name": "搜索引擎"}],"itemStyle": {"emphasis": {"shadowBlur": 10,"shadowOffsetX": 0,"shadowColor": "rgba(0, 0, 0, 0.5)"}}}]},
				 {"xAxis": {"type": "category","data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},"yAxis": {"type": "value"},"series": [{"data": [820,932,901,934,1290,1330,1320],"type": "line","smooth": true}]},{"xAxis": {"type": "category","data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},"yAxis": {"type": "value"},"series": [{"data": [120,200,150,80,70,110,130],"type": "bar"}]}];//模拟变更课程列表图表数据
				res.status == 200 ? (this.table = data,this.echartsData = echartsdata,this.echartsArr = []) : '';
				n < 1 ? this.classPageNumNow = 1 : n < Math.ceil(this.table.length / this.classPageNum) ? this.classPageNumNow =
					n : this.classPageNumNow = Math.ceil(this.table.length / this.classPageNum);
			}, (err) => {
				console.log(err.status)
			});
		},
		selectLi: function(inx) {
			this.selectIndex = inx;
			layer.msg("index: " + inx);
			let url = '/js/upNorm.js';
			let data = [{"i": 666,"firstNorm": "一级指标666","secondNorm": "二级指标666","normName": "指标名称666","starPeople": "王小明"}];//模拟变更课程列表数据
			let echartsdata = [{"title": {"text": "666","subtext": "纯属虚构","x": "center","show": false},"tooltip": {"trigger": "item","formatter": "{a} <br/>{b} : {c} ({d}%)"},"legend": {"orient": "vertical","left": "left","data": ["直接访问", "邮件营销", "联盟广告", "视频广告", "搜索引擎"]},"series": [{"name": "访问来源","type": "pie","radius": "55%","center": ["50%", "60%"],"data": [{"value": 335,"name": "直接访问"}, {"value": 310,"name": "邮件营销"}, {"value": 234,"name": "联盟广告"}, {"value": 135,"name": "视频广告"}, {"value": 1548,"name": "搜索引擎"}],"itemStyle": {"emphasis": {"shadowBlur": 10,"shadowOffsetX": 0,"shadowColor": "rgba(0, 0, 0, 0.5)"}}}]}];//模拟变更课程列表图表数据
			this.$http.get(url, {page: inx}).then((res) => {
				res.status == 200 ? (this.table = data,this.echartsData = echartsdata): '';
			}, (err) => {
				console.log(err.status)
			});
		},
		echartsBox: function(inx) {
			let url = '/js/upNorm.js';
			this.$http.get(url, {index: inx}).then((res) => {
				//res.status == 200 ? this.echartsData = res.body : '';
				$(".item-charts .echarts").each(function(i, item) {
					var charts = echarts.init($(this)[0], vue.echartsTheme[vue.defaultEchartsTheme]);
					vue.echartsArr.push(charts);
					charts.setOption(vue.echartsData[i], true);
				});
			}, (err) => {
				console.log(err.status)
			});
		},
		btnUp: function(id) {
			layer.msg("提升记录查看 " + id);
			
			let data = [{'timeStar':'2019','timeEnd':'2029','level':1,'recent':[{'user':'licc','old':65,'new':75},{'user':'licc1','old':75,'new':85}]},{'timeStar':'2019','timeEnd':'2029','level':0,'recent':[{'user':'licc','old':65,'new':75},{'user':'licc1','old':75,'new':85}]},{'timeStar':'2019','timeEnd':'2029','level':1,'recent':[{'user':'licc','old':65,'new':75},{'user':'licc1','old':75,'new':85}]}];//模拟变更提升记录
			vue.tccUpnotes = data;
			
			up = layer.open({
				type: 1,
				title: false,
				closeBtn: 0,
				skin: 'layer_Bg', //窗体样式类名
				shade: 0.6, //遮罩透明度
				shadeClose: true, //遮罩层开启
				scrollbar: false, //关闭浏览器滚动
				area: ['595px', '600px'], //宽高
				content: $('#up-tcc'),
				btn: ['返回'],
				yes: function() {
					
					layer.close(up);
				}
			});
		},
		btnEdit: function(id) {
			layer.msg("修改记录查看 " + id);
			up = layer.open({
				type: 1,
				title: false,
				closeBtn: 0,
				skin: 'layer_Bg', //窗体样式类名
				shade: 0.6, //遮罩透明度
				shadeClose: true, //遮罩层开启
				scrollbar: false, //关闭浏览器滚动
				area: ['595px', '600px'], //宽高
				content: $('#edit-tcc'),
				btn: ['修改','返回'],
				yes: function() {
					layer.msg('保存');
					console.log('课程id: ' + id + ' 提升当前值: ' + vue.tccdqz+ ' 近期提升: ' +vue.tccRecentUp);
					layer.close(up);
				},btn2: function() {
					return true
				}
			});
		}
	},
	mounted: function() {
		window.onresize = function() {
			$.each(vue.echartsArr, function(i) {
				vue.echartsArr[i].resize();
			});
		};
		this.selectLi(0);
		$("#myscroll1").panel({
			iWheelStep: 15
		}); //初始化滚动
	},
	created: function() {

	}
});
