<%@ page import="com.example.zhengai.model.YzUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>智慧诊改-子页</title>
		<link rel="stylesheet/less" type="text/less" href="${path}/css/myStyle.less" />
		<link rel="stylesheet/less" type="text/less" href="${path}/css/subPage.less" />
		<script type="text/javascript" src="${path}/js/less.min.js?v=2.6.0"></script>
		<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/js/vue.min.js?v=v2.5.16"></script>
		<script type="text/javascript" src="${path}/js/vue-resource.min.js?v=1.5.1"></script>
		<!--layer-->
		<script type="text/javascript" src="${path}/js/layer/layer.js"></script>
		<!-- icon -->
		<script type="text/javascript" src="//at.alicdn.com/t/font_1025383_hbxtbqs4n8i.js"></script>
		<!-- icheck -->
		<link rel="stylesheet" type="text/css" href="${path}/js/iCheck/icheck.min.js" />
		<script type="text/javascript" src="${path}/js/iCheck/icheck.min.js?v=1.0.2"></script>
		

	</head>
	<body>
		<div class="topbar">
			<p class="tb_title">王小明</p>
			<p class="tb_subtitle">欢迎使用诊改系统！</p>
		</div>
		<div class="navbar">
			<ul>
				<li style="padding: 0 50px 0 5px;">
					<a href=""><span id="index_logo"></span>信远智慧诊改系统</a>
				</li>
				<li>
					<a href="index.html">首页</a>
				</li>
				<li>
					<a href="">报表中心</a>
					<div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="changeReport.html">学生成长</a></li>
							<li class="er_ji-item"><a href="changeReport.html">招生就业</a></li>
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

		<div id="app">
			<div class="search_ipt floatRight search_ipt-small">
				<input type="text" v-model.trim="searchTxt" class="form-control" placeholder="请输入指标名称" @keyup.enter="searchTxticon" />
				<svg class="icon" aria-hidden="true" style="font-size: 25px;color: #fff;position: relative;top: 4px;" @click="searchTxticon">
					<use xlink:href="#icon-sousuo"></use>
				</svg>
			</div>
			<div class="clear"></div>
			<div id="content">

				<div class="listBar">
					<transition-group name="list-select" tag="ul">
						<li class="list-select setting" @click="layoutSetting" :key="666">
							<svg class="icon" aria-hidden="true" style="font-size: 25px;color: #fff;position: relative;top: 4px;"><use xlink:href="#icon-shezhi"></use>
							</svg>
						</li>

						<li v-for="(item,index) in listArr" :class="{select:selectIndex==index,'list-select':true}" :id="'list-'+item.id"
							@click.stop="selectIndex=index,sortId=item.id" :key="index">{{item.t}}</li>
					</transition-group>
				</div>

				<div class="layoutBox">

					<grid-layout :layout="layout" :col-num="12" :row-height="10" :is-draggable="draggable" :is-resizable="resizable"
					 :vertical-compact="true" :use-css-transforms="true" :margin="[10, 10]">
						<grid-item v-for="(item,index) in layout" :x="item.x" :y="item.y" :w="item.w" :h="item.h" :i="item.i" v-on:resize="upWH(item.x,item.y,item.w,item.h,item.i,index)"
						 :id=" 'item-'+ item.i">
							<div class="ft2">
								<p>{{item.title}}</p>

							</div>
							<div class="clear"></div>
							<hr class="bottom-line2" :style="{backgroundColor:setColorArr[item.random]}" />
							<div class="info-box">
								<div class="info-l floatLeft">
									<div class="info-name " :style="{borderColor:setColorArr[item.random]}">
										<div class="namet1" :style="{backgroundColor:setColorArr[item.random]}">
											指控点
										</div>
										<div class="namet2">
											{{item.name}}
										</div>
									</div>
									<div class="progress-bar floatLeft">
										<div class="progress-item" :style="{width:progressWidth(item.bzz,item.dqz),backgroundColor:setColorArr[item.random]}"></div>
									</div>
									<p class="progressinfo floatLeft">指标达成率:{{progressWidth(item.bzz,item.dqz)}}</p>
									<div class="clear"></div>
								</div>
								<div class="info-r floatLeft">
									<div class="num num1">
										<p class="title_txt">标准值</p>
										{{item.bzz}}
									</div>
									<div class="num num2">
										<p class="title_txt">当前值</p>
										{{item.dqz}}
									</div>
								</div>
								<div class="clear"></div>
								<div class="btn btn-iron floatRight" @click="btnJoin(item.id)">发起诊改
									<svg class="icon" aria-hidden="true">
										<use xlink:href="#icon-emizhifeiji"></use>
									</svg>
								</div>
							</div>
							<div :id=" 'echarts-'+ item.i" v-on:load="myload()" class="echarts" style="width: 100%;height: calc(100% - 170px);"></div>
						</grid-item>
					</grid-layout>


					<div id="pageBox" v-show="count>0">

						<div class="btn btn-prev" @click="pageNumlayout(classPageNumNow-1)">&lt; 上一页</div>
						<div class="btn btn-num"  @click="pageNumlayouts(n,$event)" v-for="n in pageNum(count)" >{{n}}</div>
						<div class="btn btn-next" @click="pageNumlayout(classPageNumNow+1)">下一页 &gt;</div>



					</div>

				</div>

			</div><!-- content -->

			<div id="layoutSetting" style="display: none;">
				<div class="ft1">
					<p>布局选择</p>
				</div>
				<div class="clear"></div>
				<label>
					<img src="/images/44484.png" width="auto" height="100">
					<input type="radio" name="lradio" value="0" v-model="layoutStyle" class="check">
				</label>
				<label>
					<img src="/images/44484.png" width="auto" height="100">
					<input type="radio" name="lradio" value="1" v-model="layoutStyle" class="check">
				</label>
				<label>
					<img src="/images/44484.png" width="auto" height="100">
					<input type="radio" name="lradio" value="2" v-model="layoutStyle" class="check">
				</label>
				 <label>
					<img src="/images/44484.png" width="auto" height="100">
					<input type="radio" name="lradio" value="3" v-model="layoutStyle" class="check">
				</label>
			</div>

		</div><!-- app -->
	</body>

	<!-- <script type="text/javascript" src="js/style.js"></script> -->
	<script type="text/javascript" src="${path}/js/style.min.js"></script>
	<!-- scrollbar -->
	<script type="text/javascript" src="${path}/js/scrollbar/zUI.js"></script>
	<script type="text/javascript" src="${path}/js/scrollbar/bscroll.min.js?v=1.14"></script>
	<script type="text/javascript" src="${path}/js/echarts/echarts.licc.min.js"></script>
	<!-- echarts主题 -->
	<script type="text/javascript" src="${path}/js/echarts/theme/walden.js"></script>
	<script type="text/javascript" src="${path}/js/echarts/theme/westeros.js"></script>
	<!-- echarts配置 -->
	<script type="text/javascript" src="${path}/js/grid_layout/vue-grid-layout.umd.min.js"></script>
	<%--<script type="text/javascript" src="${path}/js/subPage.js"></script>--%>

<script>


    var vue = new Vue({
        el: '#app',
        data() {
            return {
                listArr: ${textList}, //菜单列表
                selectIndex: 0, //菜单列表默认选中第几条
                // table: '', //课程列表
                layout: [], //诊改列表
				count:1,
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
				sortId:'',
				datas:[],
				layouts:[],
				classA:"btn btn-num"
            }
        },
        watch: {

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
				this.echartsCreate(this.sortId);
            },
			echartsData: function(val, oldval) {

				$(".echarts").each(function(i) {
					var charts = echarts.init($(this)[0], vue.echartsTheme[vue.defaultEchartsTheme]);
					vue.echartsArr.push(charts);
					charts.setOption(vue.echartsData[i], true);
				});
			}
        },
        methods: {
        	myload:function(){
				$(".echarts").each(function(i) {
					var charts = echarts.init($(this)[0], vue.echartsTheme[vue.defaultEchartsTheme]);
					vue.echartsArr.push(charts);
					charts.setOption(vue.echartsData[i], true);
				});
			},
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
			pageNumlayouts:function(n,e){

				e.target.style.backgroundColor="#05161A";
				this.pageNumlayout(n);
			},
            pageNumlayout: function(n) {
				if (n==0){
					n=1;
				}
				if(n==(Math.ceil(vue.count / this.classPageNum)+1)){
					n=Math.ceil(vue.count / this.classPageNum);
				}
            vue.classPageNumNow=n
				vue.echartsData=[];
				vue.layout=[];
            	var starNo=(n-1)*6;

            	for(var i=starNo;i<starNo+6&&i<vue.datas.length;i++){
					if(JSON.stringify(vue.datas[i])=='{}'){
						var option ={
							"title": {
								text:"暂无数据",
								x:'center',
								y: 'center',
								textStyle:{
									fontSize:15
								}
							},
							"tooltip": {"trigger": "item", "formatter": "{a} <br/>{b} : {c} ({d}%)"},

							series: [
								{
									"itemStyle": {
										"emphasis": {
											"shadowBlur": 10,
											"shadowOffsetX": 0,
											"shadowColor": "rgba(0, 0, 0, 0.5)"
										}
									},
									type:'pie',
									radius: ['50%', '70%'],
									avoidLabelOverlap: false,
									label: {
										normal: {
											show: false,
											position: 'center'
										},
										emphasis: {
											show: true,
											textStyle: {
												fontSize: '30',
												fontWeight: 'bold'
											}
										}
									},
									labelLine: {
										normal: {
											show: false
										}
									},
									data:[
										{value:1},
									]
								}
							]
						};
						vue.echartsData.push(option);
					}else {
						var type = vue.datas[i].type;
						if (type.toString() == "bar") {
							/* var option={"legend": {},"tooltip": {},"dataset": {"dimensions":datas[i].dimensions,"source": datas[i].source},"xAxis": {"type": "category"},"yAxis": {},"series": [{"type": "bar"}, {"type": "bar"}, {"type": "bar"}]}; */
							var option = {
								"xAxis": {"type": "category", "data": vue.datas[i].xdatas,axisLabel: {interval: 0, rotate: "10"}},
								"yAxis": {"type": "value"},
								"series": [{"data": vue.datas[i].lineDatas, "type": "bar",itemStyle:{ normal:{label:{show: true, formatter: '{b} : {c}'},labelLine :{show:true}}}}]};
							vue.echartsData.push(option);
						}
						if (type.toString() == "pie") {
							var option = {
								"title": {},
								"tooltip": {"trigger": "item", "formatter": "{a} <br/>{b} : {c} ({d}%)"},
								"legend": {"orient": "vertical", "left": "left", "data": vue.datas[i].xdatas},
								"series": [{
									itemStyle:{ normal:{label:{show: true, formatter: '{b} : {c}',position: 'top'},labelLine :{show:true}}},
									"type": "pie",
									"radius": "55%",
									"center": ["50%", "60%"],
									"data": vue.datas[i].pieDatas,
									"itemStyle": {
										"emphasis": {
											"shadowBlur": 10,
											"shadowOffsetX": 0,
											"shadowColor": "rgba(0, 0, 0, 0.5)"
										}
									}
								}]
							};
							vue.echartsData.push(option);
						}
						if (type.toString() == "line") {
							var option = {
								"xAxis": {"type": "category", "data": vue.datas[i].xdatas,axisLabel: {interval: 0, rotate: "10"}},
								"yAxis": {"type": "value"},
								"series": [{
									"data": vue.datas[i].lineDatas,
									"type": "line",
									"symbol": "triangle",
									"symbolSize": 20,
									"lineStyle": {"normal": {"color": "green", "width": 4, "type": "dashed"}},
									"itemStyle": {"normal": {"borderWidth": 3, "borderColor": "yellow", "color": "#11B8BC",label : {show: true,position: 'top'}}}
								}]
							};
							vue.echartsData.push(option);
						}
					}
				}

				for(var i=starNo;i<starNo+6&&i<vue.layouts.length;i++){
					vue.layout.push(this.layouts[i]);
				}

				var x=0;
				var y=0;
				for(var i =0;i<vue.layout.length;i++){
					if(x>8) {
						y = y + 20;
						x=0;
					}
					vue.layout[i].w=4;
					vue.layout[i].x=x;
					vue.layout[i].h=20;
					vue.layout[i].y=y;
					x=x+4;
				}
            },
            echartsCreate: function(inx) {
				if(inx==0){
					inx=this.listArr[0].id;
				}
                let url = '${path}/PageHome/getDatasBySort';
                    this.$http.get(url, {params: {sort:inx}}).then((res) => {
                        var conditionDatas=res.body;
                        let layout = conditionDatas.layout;
                        var ct = layout.length;
                        var layList=[];
                        var x=0;
                        var y=0;

                        var datas=conditionDatas.datas;
                        var echartsDatas=[];

                        for(var i=0;i<=5;i++) {
                            if(JSON.stringify(datas[i])=='{}'){
                                var option ={
                                    "title": {
                                        text:"暂无数据",
                                        x:'center',
                                        y: 'center',
                                        textStyle:{
                                            fontSize:15
                                        }
                                    },
                                    "tooltip": {"trigger": "item", "formatter": "{a} <br/>{b} : {c} ({d}%)"},

                                    series: [
                                        {
                                            "itemStyle": {
                                                "emphasis": {
                                                    "shadowBlur": 10,
                                                    "shadowOffsetX": 0,
                                                    "shadowColor": "rgba(0, 0, 0, 0.5)"
                                                }
                                            },
                                            type:'pie',
                                            radius: ['50%', '70%'],
                                            avoidLabelOverlap: false,
                                            label: {
                                                normal: {
                                                    show: false,
                                                    position: 'center'
                                                },
                                                emphasis: {
                                                    show: true,
                                                    textStyle: {
                                                        fontSize: '30',
                                                        fontWeight: 'bold'
                                                    }
                                                }
                                            },
                                            labelLine: {
                                                normal: {
                                                    show: false
                                                }
                                            },
                                            data:[
                                                {value:1},
                                            ]
                                        }
                                    ]
                                };
								echartsDatas.push(option);
                            }else {
                                var type = datas[i].type;
                                if (type.toString() == "bar") {
                                    /* var option={"legend": {},"tooltip": {},"dataset": {"dimensions":datas[i].dimensions,"source": datas[i].source},"xAxis": {"type": "category"},"yAxis": {},"series": [{"type": "bar"}, {"type": "bar"}, {"type": "bar"}]}; */
                                    var option = {
                                        "xAxis": {"type": "category", "data": datas[i].xdatas,axisLabel: {interval: 0, rotate: "10"}},
                                        "yAxis": {"type": "value"},
                                        "series": [{"data": datas[i].lineDatas, "type": "bar",itemStyle:{ normal:{label:{show: true, formatter: '{b} : {c}'},labelLine :{show:true}}}}]};
									echartsDatas.push(option);
                                }
                                if (type.toString() == "pie") {
                                    var option = {
                                        "title": {},
                                        "tooltip": {"trigger": "item", "formatter": "{a} <br/>{b} : {c} ({d}%)"},
                                        "legend": {"orient": "vertical", "left": "left", "data": datas[i].xdatas},
                                        "series": [{
                                            itemStyle:{ normal:{label:{show: true, formatter: '{b} : {c}',position: 'top'},labelLine :{show:true}}},
                                            "type": "pie",
                                            "radius": "55%",
                                            "center": ["50%", "60%"],
                                            "data": datas[i].pieDatas,
                                            "itemStyle": {
                                                "emphasis": {
                                                    "shadowBlur": 10,
                                                    "shadowOffsetX": 0,
                                                    "shadowColor": "rgba(0, 0, 0, 0.5)"
                                                }
                                            }
                                        }]
                                    };
									echartsDatas.push(option);
                                }
                                if (type.toString() == "line") {

                                    var option = {
                                        "xAxis": {"type": "category", "data": datas[i].xdatas,axisLabel: {interval: 0, rotate: "10"}},
                                        "yAxis": {"type": "value"},
                                        "series": [{
                                            "data": datas[i].lineDatas,
                                            "type": "line",
                                            "symbol": "triangle",
                                            "symbolSize": 20,
                                            "lineStyle": {"normal": {"color": "green", "width": 4, "type": "dashed"}},
                                            "itemStyle": {"normal": {"borderWidth": 3, "borderColor": "yellow", "color": "#11B8BC",label : {show: true,position: 'top'}}}
                                        }]
                                    };
									echartsDatas.push(option);
                                }
                            }
                        }

						for(var i =0;i<=5;i++){
							layList.push(layout[i])
							if(x>8) {
								y = y + 20;
								x=0;
							}
							layList[i].w=4;
							layList[i].x=x;
							layList[i].h=20;
							layList[i].y=y;
							x=x+4;
						}


                        /*res.status == 200 ? this.layout = data : '';*/
                    res.status == 200 ?(this.layout = layList,this.echartsData = echartsDatas,this.count =ct,this.layouts=layout,this.datas=datas):'';
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
				let url = '${path}/PageHome/toTransform';
				this.$http.get(url, {params: {targetId:id}}).then((res) => {
                   alert("已发起~！")
				})
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
			window.onload = (event) => {
				this.echartsCreate(0);
				console.log('page is fully loaded');
			};
        }
    });


</script>

</html>
