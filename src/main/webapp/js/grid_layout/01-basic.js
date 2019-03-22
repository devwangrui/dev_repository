var testLayout = [
	{ "x": 0, "y": 0, "w": 4, "h": 20, "i": 0, "title": "新生分院人数发布", "echartsType": "pie" },
	{ "x": 4, "y": 0, "w": 4, "h": 20, "i": 1, "title": "近十周学生考勤情况", "echartsType": "bar" },
	{ "x": 8, "y": 0, "w": 4, "h": 20, "i": 2, "title": "生源分布1", "echartsType": "bar" },
	{ "x": 0, "y": 20, "w": 4, "h": 20, "i": 3, "title": "demo1", "echartsType": "line" },
	{ "x": 4, "y": 20, "w": 4, "h": 20, "i": 4, "title": "demo3", "echartsType": "line" }
]; //布局
var chartsTableList = [
	{ "i": 0, "name": "图标名称1", "type": "饼图", "typeEn": "pie" },
	{ "i": 1, "name": "图标名称2", "type": "柱状图", "typeEn": "bar" },
	{ "i": 2, "name": "图标名称3", "type": "折线图", "typeEn": "line" }
] //图表列表

var vue = new Vue({
	el: '#app',
	data: {
		layout: testLayout,
		draggable: false,
		resizable: false,
		index: 0,
		chartsTable: chartsTableList,
		echartsDemoType: ""
	},
	watch: {
		echartsDemoType: function (val, oldval) {
			let chartsDemo = echarts.init(document.getElementById("echartsDemo"), echartsTheme);
			chartsDemo.setOption({
				title: {
					text: val,
					x: "center"
				}
			});
			switch (val) {
				case 'pie':
					chartsDemo.setOption({
						xAxis: {
							show: false
						},
						yAxis: {
							show: false
						},
						tooltip: {},
						series: [{
							type: val,
							radius: '65%',
							data: [{
								"value": 1,
								"name": "demo1"
							},
							{
								"value": 2,
								"name": "demo2"
							}
							]
						}]
					})
					break;
				case 'bar':
				case 'line':
					chartsDemo.setOption({
						tooltip: {},
						xAxis: {
							show: true,
							data: ["demo1", "demo2"]
						},
						yAxis: { show: true },
						series: [{
							type: val,
							data: [5, 20]
						}]
					});
					break
			}
		}
	},
	methods: {
		upWH: function (x, y, w, h, i) {
			console.log(x, y, w, h, i);
			chartsList[i].resize();
		},
		layer: function (i,chartsType) {
			tcc = layer.open({
				type: 1,
				title: false,
				closeBtn: 0,
				skin: 'layer_Bg', //窗体样式类名
				shade: 0.6, //遮罩透明度
				shadeClose: true, //遮罩层开启
				scrollbar: false, //关闭浏览器滚动
				area: ['960px', '580px'], //宽高
				content: $('#tcc')
			});
			// layer.msg(i)
			this.chartsChange("demo", chartsType);
		},
		chartsChange: function (i, type) { //点击改变echartsdemo
			this.echartsDemoType = type;
		},
		closeTcc: function (v) {
			if (v == 0) {
				vue.resizable = true
			} else {
				vue.draggable = true
			};
			$('.shadeBox,.btn-saveLayout').show();
			layer.close(tcc);
		},
		resaveTcc: function () {
			vue.resizable = false;
			vue.draggable = false;
			$('.shadeBox,.btn-saveLayout').hide();
			vue.layer();
			chartsList.forEach(function (val, i) {
				chartsList[i].resize();
			});
		},
		btnSave: function () {
			var saveLayer = layer.load(2);
			$.ajax({ //ajax提交布局
				type: 'get',
				url: 'js/echarts_setting.json',
				success: function () {
					console.log(vue.layout);

					//提交的数据 vue.layout
					
					

					layer.close(saveLayer);
				},
				error: function (e) {
					console.log(e);
					layer.msg('数据提交失败');
				},
				async: true, //true 异步
				dataType: 'json'
			});
			layer.close(tcc);
		}
	},
	mounted:function(){
		window.onresize = function () {
			chartsList.forEach(function (val, i) {
				chartsList[i].resize();
			});
		};
	}
});
