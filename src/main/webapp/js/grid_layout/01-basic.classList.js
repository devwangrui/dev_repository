var testLayout = [
	{ "i": 0,"code":20001,"fy":"外语院1","zy":"应用英语1","zrr":"王小明1", "title": "大学生生涯1", "firstZk": 2 ,"radomNum":0},
	{ "i": 1,"code":20002,"fy":"外语院2","zy":"应用英语2","zrr":"王小明2", "title": "大学生生涯2", "firstZk": 6 ,"radomNum":1},
	{ "i": 2,"code":20003,"fy":"外语院3","zy":"应用英语3","zrr":"王小明3", "title": "大学生生涯3", "firstZk": 3 ,"radomNum":2},
	{ "i": 3,"code":20004,"fy":"外语院4","zy":"应用英语4","zrr":"王小明4", "title": "大学生生涯4", "firstZk": 4 ,"radomNum":3},
	{ "i": 4,"code":20005,"fy":"外语院5","zy":"应用英语5","zrr":"王小明5", "title": "大学生生涯5", "firstZk": 5 ,"radomNum":4}
]; //布局
var chartsTableList = [
	{ "i": 2, "name": "指控点1", "bzz": "10000", "dqz": "100001" ,"yj":0},
	{ "i": 33, "name": "指控点2", "bzz": "10001", "dqz": "100011" ,"yj":1},
	{ "i": 5, "name": "指控点3", "bzz": "10002", "dqz": "100021" ,"yj":0}
] //指标列表

var vue = new Vue({
	el: '#app',
	data: {
		layout: testLayout,//课程列表
		classPageNum:1,//定义每页多少个课程
		classPageNumNow:1,//当前在第几页
		chartsTable: chartsTableList,//指标列表
		//getEchartsSettingObj:'',//echarts配置文件
		echartsTheme: ['walden', 'westeros'],//echarts主题
		defaultEchartsTheme: 1, //默认的
		classEcharts:'',//课程图表
		classEchartsArr:[],//课程图表数组
		searchTxt:'',//弹出层搜索初始值
		tccEcharts:'',//弹出层图表
		codeColorArr:['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80','#8d98b3','#e5cf0d','#97b552','#95706d'],//code小图标颜色库
		yujinIcon:['icon-yujing','icon-test']//预警图标 0 预警 1 正常
	},
	watch: {
		tccEcharts: function (val, oldval) {
			let chartsDemo = echarts.init(document.getElementById("echartsDemo"), this.echartsTheme[this.defaultEchartsTheme]);
			chartsDemo.setOption(this.tccEcharts);
		}
	},
	methods: {
// 		getEchartsSetting:function(){//获取echarts配置
//             let url = 'js/echarts_setting.json';
//             this.$http.get(url).then((res)=>{
// 				if(res.status == 200) this.getEchartsSettingObj = res.body;
//             },(err)=>{console.log(err.status)});
// 			//layer.msg('getEchartsSetting');
// 		},
		searchTxticon:function(){//弹出层搜索框事件
			layer.msg(this.searchTxt);
		},
		loadingclassBox:function(){//加载首页课程列表
			let vlength = this.layout.length;
			let four = `<div class="col-3 classes"></div>`;
			let three = `<div class="col-4 classes"></div>`;
			let two = `<div class="col-6 classes"></div>`;
			if(vlength < 3){for (let i=0;i<2;i++) {$("#content").append(two);}}else if(vlength == 3){for (let i=0;i<3;i++) {$("#content").append(three);}}else{for (let i=0;i<4;i++) {$("#content").append(four);}}
			let cs = $(".classes").length;//有几列
			let xhcs = parseInt($(".classBox").length / cs);//总共几行
			let xcs = $(".classBox").length % cs;//取余个数
			for (let i = 0;i < xhcs; i ++) {
				for (let i = 0;i < cs; i ++) {$(".classes").eq(i).append($(".classBoxFather .classBox").eq(0));}
			};
			for (let i = 0;i < xcs; i ++) {$(".classes").eq(i).append($(".classBoxFather .classBox").eq(0));};
			$(".classBoxFather").remove();
			layer.msg(vlength+"条组合完毕");
		},
		slideToggle: function (index,i) {//课程列表点击展开收拢
		
			let id = $("#classBox_" + index).find('.chartsBox');
			let text = $("#classBox_" + index).find('.animateFadeText');
			let jt = $("#classBox_" + index).find('.animateFade');
			let icon = $("#classBox_" + index).find('.icon.animated');
			if(id.hasClass('close')){
				
				let url = 'js/echarts_data_classList.json';//请求当前课程列表的echarts配置
				let charts = echarts.init($("#echarts" + i)[0], this.echartsTheme[this.defaultEchartsTheme]);
				this.$http.get(url,{id:i}).then((res)=>{
					res.status == 200 ? this.classEcharts = res.body : '';
					!id.hasClass('offarr') ? this.classEchartsArr.push(charts) : '';
					id.stop(true).animate({height:"210px"},400,()=>{charts.setOption(this.classEcharts);charts.resize();}).removeClass('close').addClass('offarr').show();
					jt.removeClass('fadeOutDown').addClass('fadeOutUp');
					icon.removeClass('fadeOutDown').addClass('fadeOutUp').find('use').attr('xlink:href','#icon-shuangjiantou-shang');text.text('收起图表');
					
				},(err)=>{console.log(err.status)});
				
				}else{
				id.stop(true).animate({height:"0"},400,()=>{id.hide()}).addClass('close');
				jt.removeClass('fadeOutUp').addClass('fadeOutDown');
				icon.removeClass('fadeOutUp').addClass('fadeOutDown').find('use').attr('xlink:href','#icon-shuangjiantouxia');text.text('展开图表');}
		},
		slideToggleIconOpen:function(index){//课程列表上移动画
			let id = $("#classBox_" + index).find('.icon.animated');
			id.addClass('infinite').removeClass('hide');
		},
		slideToggleIconClose:function(index){//课程列表移开动画
			let id = $("#classBox_" + index).find('.icon.animated');
			id.removeClass('infinite').addClass('hide');
		},
		layer: function (i,fZk) {
			let url = 'js/echarts_data_classList.json';//请求课程指控值列表
			let body = [
				{ "i": 2, "name": "指控点1", "bzz": "10000", "dqz": "100001" ,"yj":0},
				{ "i": 33, "name": "指控点2", "bzz": "10001", "dqz": "100011" ,"yj":1}
				]
			this.$http.get(url,{id:i}).then((res)=>{
				// res.status == 200 ? this.chartsTable = res.body : ''
				res.status == 200 ? this.chartsTable = body : ''
			},(err)=>{console.log(err.status)});
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
 			this.chartsChange(i, fZk);//请求指控点第一条的数据
		},
		chartsChange: function (i,inx) { //点击改变echartsdemo
			layer.msg('请求id为 '+i+' 下标 '+inx+' 的图表数据');
			let url = 'js/echarts_data_classList.json';
			this.$http.get(url,{id:i}).then((res)=>{
				res.status == 200 ? this.tccEcharts = res.body : ''
			},(err)=>{console.log(err.status)});
		},
		pageNum:function(num){//分页器计算
			return Math.ceil(num/this.classPageNum)
		},
		pageNumlayout:function(n){
			let url = 'js/echarts_data_classList.json';
			this.$http.get(url,{page:n}).then((res)=>{
				let data = [
					{ "i": 6,"code":20001,"fy":"外语院6","zy":"应用英语6","zrr":"王小明6", "title": "大学生生涯6", "firstZk": 2 ,"radomNum":0},
					{ "i": 10,"code":20002,"fy":"外语院10","zy":"应用英语10","zrr":"王小明10", "title": "大学生生涯10", "firstZk": 6 ,"radomNum":1}
				]
				// res.status == 200 ? this.tccEcharts = res.body : '';
				res.status == 200 ? this.layout = data : '';
				n < 1 ? this.classPageNumNow = 1 : n < Math.ceil(this.layout.length/this.classPageNum) ? this.classPageNumNow = n : this.classPageNumNow = Math.ceil(this.layout.length/this.classPageNum);
				
			},(err)=>{console.log(err.status)});
		},
		btnBack: function () {
			layer.close(tcc)
		},
		viewReport:function(){
			layer.msg("我要去查看诊改报告了")
		}
	},
	mounted:function(){
		window.onresize = function () {
			$.each(vue.classEchartsArr,function (i) {
				vue.classEchartsArr[i].resize();
			});
		};
		this.loadingclassBox();//加载首页课程列表
		$("#myscroll1").panel({
			iWheelStep: 15
		}); //初始化滚动
	},
	created:function(){
		//this.getEchartsSetting();
	}
});
