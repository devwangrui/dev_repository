// window.onresize = function() {
// 	chartsList.resize();
// };

$(function() {
	var loadL = layer.load(2);
	chartsSetting(); //加载空echarts图表
	echartsCreate();
	chartsData(); //加载echarts图表数据
	layer.close(loadL);
});

function chartsSetting() {
	$.ajax({
		type: 'get',
		url: 'js/echarts_setting.json',
		success: function(data) {
			settingArr = data;
		},
		error: function(e) {
			console.log(e);
		},
		async: false, //true 异步
		dataType: 'json'
	});
}

function echartsCreate() {
	//echartsTheme = 'walden'; //亮色
	echartsTheme = 'westeros'; //暗色
	chartsList = [];//已生成图表数组
	$(".echarts").each(function(i, val) {
		var type = $(this).attr('data_chartsType');
		let id = $(this).attr('id').split("_")[1];
		chartsList[i] = echarts.init($("#" + 'echarts_' + id)[0], echartsTheme);
		option = settingArr[type];
		chartsList[i].setOption(option, true);
		chartsList[i].on('click', function(params) { //图标柱状点击事件
			let data = params.data;
			layer.msg(data.name + data.value + data.fid);
			if (params.seriesType == 'pie') {
				console.log(data.name, data.value, data.fid);
			} else if (params.seriesType == 'bar') {
				console.log(data.name, data.value, data.fid);
			} else if (params.seriesType == 'line') {
				console.log(params.name,params.value);
			}
		});
	});

}

function chartsData() {
	$.ajax({
		type: 'get',
		url: 'js/echarts_data_classList.json',
		success: function(data) {
			$.each(data, function(i, val) {
				//console.log(chartsList[data[i].id])
				//console.log(data[i].title, data[i].xname, data[i].chartsType)
				switch (data[i].chartsType) {
					case 'bar':
						chartsList[data[i].id].setOption({
							title: {
								text: data[i].title
							},
							xAxis: {
								data: data[i].xname
							},
							series: [{
								type: data[i].chartsType,
								data: data[i].data
							}]
						});
						break;
					case 'pie':
						chartsList[data[i].id].setOption({
							title: {
								text: data[i].title
							},
							legend: {
								data: data[i].xname
							},
							series: [{
								type: 'pie',
								radius: '65%',
								center: ['50%', '60%'],
								data: data[i].piedata
							}]
						});
						break;
					default:
						chartsList[data[i].id].setOption({
							title: {
								text: data[i].title
							},
							xAxis: {
								data: data[i].xname
							},
							yAxis: {
								type: 'value'
							},
							legend: {
								orient: 'vertical',
								left: 'left',
								data: data[i].xname
							},
							series: [{
								type: data[i].chartsType,
								data: data[i].data
							}]
						});
				}
			});
		},
		error: function(e) {
			console.log(e);
		},
		async: false, //true 异步
		dataType: 'json'
	});
}
