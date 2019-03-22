var textList = [{"t": "内部治理","id": 0}, {"t": "国际交流与合作","id": 1}, {"t": "专业建设","id": 2}, {"t": "师资团队","id": 3}, {"t": "学生成长","id": 4}, {"t": "产教融合","id": 5}, {"t": "招生就业","id": 6}, {"t": "招生就业招生","id": 7}, {"t": "招生就业招生11","id": 8}, {"t": "招生就业招生231","id": 9}] //菜单列表

var vue = new Vue({
	el: '#app',
	data() {
		return {
			listArr: textList, //菜单列表
			selectIndex: 999, //菜单列表默认选中第几条
			// table: '', //课程列表
			layout: [], //诊改列表
			layoutStyle: 0, // 0 [4,4,4,4,4,4] 1 [8,4,8,4] 2 [4,8,8,4] 3 [8,4,4,4,4]
			draggable: false, //拖拽开关
			resizable: false, //大小开关
			setColorArr: ['#12a6a9', '#b6a2de', '#5ab1ef', '#ffb980', '#d87a80', '#95706d'], //设置图标颜色库
			classPageNum: 6, //定义每页多少个课程
			classPageNumNow: 1, //当前在第几页
			echartsTheme: ['walden', 'westeros'], //echarts主题
			defaultEchartsTheme: 1, //默认的echarts主题
			searchTxt: '', //搜索初始值
			echartsData: [], //图表数据
			echartsArr: [], //图表数组
		}
	},
	watch: {
		echartsData: function(val, oldval) {
			$(".echarts").each(function(i, item) {
				var charts = echarts.init($(this)[0], vue.echartsTheme[vue.defaultEchartsTheme]);
				vue.echartsArr.push(charts);
				charts.setOption(vue.echartsData[i], true);
			});
		},
		draggable: function() {
			layer.msg('拖拽被pass了')
			this.draggable = false;
		},
		resizable: function() {
			layer.msg('调大小被pass了')
			this.resizable = false;
		},
		selectIndex: function(val, oldval) { //监控分页选择
			console.log(val, oldval);
			this.echartsCreate(val);
		}
	},
	methods: {
		upWH: function(x, y, w, h, i, inx) {
			console.log(x, y, w, h, i);
			this.echartsArr[inx].resize();
			//h == 5 ? (layer.msg('到达最小高度')) : '' 
		},
		searchTxticon: function() { //搜索框事件
			layer.msg(this.searchTxt);
		},
		progressWidth: function(bzz, dqz) {
			return (Math.round(bzz / dqz * 10000) / 100.00 + "%");
		},
		pageNum: function(num) { //分页器计算
			return Math.ceil(num / this.classPageNum)
		},
		pageNumlayout: function(n) {
			layer.msg('n ' + n)
		},
		echartsCreate: function(inx) {
			let url = '/js/subPage.js';
			let echartsData = [{"legend": {},"tooltip": {},"dataset": {"dimensions": ["product", "2015", "2016", "2017"],"source": [{"2015": 43.3,"2016": 85.8,"2017": 93.7,"product": "Matcha Latte"}, {"2015": 83.1,"2016": 73.4,"2017": 55.1,"product": "Milk Tea"}, {"2015": 86.4,"2016": 65.2,"2017": 82.5,"product": "Cheese Cocoa"}, {"2015": 72.4,"2016": 53.9,"2017": 39.1,"product": "Walnut Brownie"}]},"xAxis": {"type": "category"},"yAxis": {},"series": [{"type": "bar"}, {"type": "bar"}, {"type": "bar"}]}, {"title": {},"tooltip": {"trigger": "item","formatter": "{a} <br/>{b} : {c} ({d}%)"},"legend": {"orient": "vertical","left": "left","data": ["直接访问", "邮件营销", "联盟广告", "视频广告", "搜索引擎"]},"series": [{"name": "访问来源","type": "pie","radius": "55%","center": ["50%", "60%"],"data": [{"value": 335,"name": "直接访问"}, {"value": 310,"name": "邮件营销"}, {"value": 234,"name": "联盟广告"}, {"value": 135,"name": "视频广告"}, {"value": 1548,"name": "搜索引擎"}],"itemStyle": {"emphasis": {"shadowBlur": 10,"shadowOffsetX": 0,"shadowColor": "rgba(0, 0, 0, 0.5)"}}}]}, {"tooltip": {"trigger": "item","formatter": "{a} <br/>{b}: {c} ({d}%)"},"legend": {"orient": "vertical","x": "left","data": ["直接访问", "邮件营销", "联盟广告", "视频广告", "搜索引擎"]},"series": [{"name": "访问来源","type": "pie","radius": ["50%", "70%"],"avoidLabelOverlap": false,"label": {"normal": {"show": false,"position": "center"},"emphasis": {"show": true,"textStyle": {"fontSize": "30","fontWeight": "bold"}}},"labelLine": {"normal": {"show": false}},"data": [{"value": 335,"name": "直接访问"}, {"value": 310,"name": "邮件营销"}, {"value": 234,"name": "联盟广告"}, {"value": 135,"name": "视频广告"}, {"value": 1548,"name": "搜索引擎"}]}]}, {"xAxis": {"type": "category","data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]},"yAxis": {"type": "value"},"series": [{"data": [120, 200, 150, 80, 70, 110, 130],"type": "line","symbol": "triangle","symbolSize": 20,"lineStyle": {"normal": {"color": "green","width": 4,"type": "dashed"}},"itemStyle": {"normal": {"borderWidth": 3,"borderColor": "yellow","color": "blue"}}}]}, {"xAxis": {"type": "category","boundaryGap": false,"data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]},"yAxis": {"type": "value"},"series": [{"data": [820, 932, 901, 934, 1290, 1330, 1320],"type": "line","areaStyle": {}}]}, {"xAxis": {"type": "category","data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]},"yAxis": {"type": "value"},"series": [{"data": [120, 200, 150, 80, 70, 110, 130],"type": "bar"}]}];
			let layout = [{"x": 0,"y": 0,"w": 4,"h": 20,"i": 999,"title": "demo999","name": "demo999","random": 0,"bzz": 770,"dqz": 990}, {"x": 4,"y": 0,"w": 4,"h": 20,"i": 888,"title": "demo888","name": "demo888","random": 0,"bzz": 770,"dqz": 1000}, {"x": 8,"y": 0,"w": 4,"h": 20,"i": 777,"title": "demo777","name": "demo888","random": 0,"bzz": 770,"dqz": 1000}, {"x": 0,"y": 20,"w": 4,"h": 20,"i": 666,"title": "demo666","name": "demo888","random": 0,"bzz": 770,"dqz": 1000}, {"x": 4,"y": 20,"w": 4,"h": 20,"i": 555,"title": "demo555","name": "demo888","random": 0,"bzz": 770,"dqz": 1000}, {"x": 8,"y": 20,"w": 4,"h": 20,"i": 444,"title": "demo444","name": "demo888","random": 0,"bzz": 770,"dqz": 1000}];//布局
			this.$http.get(url, {params: {inx: inx}}).then((res) => {
				res.status == 200 ? (this.layout = layout, this.echartsArr = [], this.echartsData = echartsData) : '';
			}, (err) => {
				console.log(err.status)
			});
		},
		layoutSetting: function() {
			$('#layoutSetting .check').iCheck({
				labelHover: true,
				cursor: true,
				checkboxClass: 'icheckbox_polaris',
				radioClass: 'iradio_polaris'
			});
			ls = layer.open({
				type: 1,
				title: false,
				closeBtn: 0,
				skin: 'layer_Bg', //窗体样式类名
				shade: 0.6, //遮罩透明度
				shadeClose: true, //遮罩层开启
				scrollbar: false, //关闭浏览器滚动
				area: ['595px', '400px'], //宽高
				content: $('#layoutSetting'),
				btn: ['保存'],
				yes: function() {
					vue.layoutStyle = $('input[name="lradio"]:checked').val();
					console.log("布局保存为:", vue.layoutStyle);
					layer.close(ls);
					$.each(vue.echartsArr, function(i) {
						vue.echartsArr[i].resize();
					});
					console.log("重置布局");
				}
			});
		},
		btnJoin: function(id) {//发起诊改按钮
			layer.msg("id " + id)
		},
		listWidth:function(){//水平菜单长度初始化
			let lw = 200;
			let fw = $(".listBar").innerWidth();
			$(".list-select").each(function(i,item){lw += $(".list-select").eq(i).innerWidth()});
			lw < fw ? $(".listBar ul").innerWidth(fw) : $(".listBar ul").innerWidth(lw)
			let scroll = new BScroll('.listBar', {scrollX: true});
		}
	},
	mounted: function() {
		window.onresize = function() {
			$.each(vue.echartsArr, function(i) {
				vue.echartsArr[i].resize();
			});
			console.log("页面大小改变重置布局");
		};
		console.clear();
		this.selectIndex = 0; //默认选择第一个分页
		this.echartsCreate(0); //图表创建 参数为默认分页
		this.listWidth();//初始化菜单滚动
	}
});
