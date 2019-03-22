var myChangeListL = [
	{"name": "licc1","postTime": "2018-1-1","yyfx": "原因分析1","id": 1,"yyValue":"1"},
	{"name": "licc2","postTime": "2018-1-2","yyfx": "原因分析2","id": 2,"yyValue":"2"},
	{"name": "licc3","postTime": "2018-1-3","yyfx": "原因分析3","id": 3,"yyValue":"3"},
	{"name": "licc4","postTime": "2018-1-4","yyfx": "原因分析4","id": 4,"yyValue":"4"}
]; //左侧诊改

var myChangeListR = [
	{"name": "licc1","postTime": "2018-1-1","gscs": "改善措施1","id": 1,"csValue":"hh1"},
	{"name": "licc2","postTime": "2018-1-2","gscs": "改善措施2","id": 2,"csValue":"hh2"},
	{"name": "licc3","postTime": "2018-1-3","gscs": "改善措施3","id": 3,"csValue":"hh3"},
	{"name": "licc4","postTime": "2018-1-4","gscs": "改善措施4","id": 4,"csValue":"hh4"}
]; //右侧诊改

var userView = [
	{"name": "licc1","zt": 0},
	{"name": "licc2","zt": 1},
	{"name": "licc3","zt": 2},
]; //诊改人员查看



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
		tfhelpUser:true,
		helpUser: [
			{"name": "licc1","select": true,"position": "家里蹲大学主任","id": 1},
			{"name": "licc2","select": true,"position": "家里蹲大学校长","id": 2},
			{"name": "licc3","select": false,"position": "家里蹲大学组长","id": 3},
		] //协助人员查看
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
					console.log("协助人员:" , vue.helpUser);
					layer.close(huv);
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
					vue.myChangeListL[inx].yyValue = $('#layer_yyfx #yyfxArea').val();
					console.log("原因分析:" , vue.myChangeListL);
					layer.close(yyfxv);
				}
			});
			$('#layer_yyfx #yyfxArea').val(vue.myChangeListL[inx].yyValue).focus();
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
					vue.myChangeListR[inx].csValue = $('#layer_gscs #gscsArea').val();
					console.log("改善措施:" , vue.myChangeListR);
					layer.close(gscsv);
				}
			});
			$('#layer_gscs #gscsArea').val(vue.myChangeListR[inx].csValue).focus();
		},
		btnPost:function(){//提交
			console.log(vue.myChangeListL);//原因
			console.log(vue.myChangeListR);//措施
			console.log(vue.userView);//诊改人员
			console.log(vue.helpUser);//协助人员
			layer.msg("提交全部");
		},
		btnSaveCs:function(){//提交措施
			console.log(vue.myChangeListR);
			layer.msg("提交措施");
		},
		btnSaveYy:function(){//提交原因
			console.log(vue.myChangeListL);
			layer.msg("提交原因");
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
