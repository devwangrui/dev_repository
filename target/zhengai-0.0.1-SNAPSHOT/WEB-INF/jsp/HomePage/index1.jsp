<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>智慧诊改</title>
        <link rel="stylesheet/less" type="text/less" href="${path}/css/myStyle.less" />
        <!--grid_layout-->
        <link rel="stylesheet/less" type="text/less" href="${path}/css/grid_layout/grid_layout.less" />
        <script type="text/javascript" src="${path}/js/less.min.js"></script>
        <script type="text/javascript" src="${path}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${path}/js/jquery.resize.min.js"></script>
        <script type="text/javascript" src="${path}/js/vue.js"></script>
        <!--layer-->
        <script type="text/javascript" src="${path}/js/layer/layer.js"></script>
		<!-- icon -->
		<script type="text/javascript" src="//at.alicdn.com/t/font_1025383_e40ke5f6nbj.js"></script>
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
					<!-- <div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="">111</a></li>
							<li class="er_ji-item"><a href="">222</a></li>
							<li class="er_ji-item"><a href="">333</a></li>
							<li class="er_ji-item"><a href="">444</a></li>
						</ul>
					</div> -->
                </li>
                <li>
                    <a href="">报表中心</a>
					<div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="">学生成长</a></li>
							<li class="er_ji-item"><a href="">招生就业</a></li>
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
							<li class="er_ji-item"><a href="">课程质检</a></li>
							<li class="er_ji-item"><a href="">教师质检</a></li>
						</ul>
					</div>
                </li>
                <li>
                    <a href="">诊改系统</a>
					<div class="er_ji">
						<ul class="er_ji-list">
							<li class="er_ji-item"><a href="/PageHome/myChange">我的诊改</a></li>
							<li class="er_ji-item"><a href="/PageHome/classList">提高标准</a></li>
							<li class="er_ji-item"><a href="">运行效果</a></li>
						</ul>
					</div>
                </li>
				<li class="rightIcon">
				    <a id="iconTip" style="cursor: pointer;">
					<svg class="icon iconTip" aria-hidden="true" >
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

            <div class="fixBox fixBox1">
                <div class="ft1">
                    <p>精准画像</p>
                </div>
                <div class="kjBox">
                    <a href="">
                        <div class="kjBox_t kjBox_t1">
                            <p>学校发展</p>
                        </div>
                    </a>
                    <a href="">
                        <div class="kjBox_t kjBox_t2">
                            <p>专业建设</p>
                        </div>
                    </a>
                    <a href="">
                        <div class="kjBox_t kjBox_t3">
                            <p>学生成长</p>
                        </div>
                    </a>
                    <a href="">
                        <div class="kjBox_t kjBox_t4">
                            <p>教师发展</p>
                        </div>
                    </a>
                    <a href="">
                        <div class="kjBox_t kjBox_t5">
                            <p>课程建设</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="fixBox fixBox2">
                <div class="ft1">
                    <p>读书讲座</p>
                </div>
                <hr class="bottom-line" />
                <div class="fixBox2_ulBox">
                    <ul>
                        <li>
                            <a href="">xxx指标完成度第一，荣获xxx；院校添加o0x指标</a>
                        </li>
                        <li>
                            <a href="">xxx指标完成度第一，荣获xxx；院校添加o0x指标</a>
                        </li>
                        <li>
                            <a href="">xxx指标完成度第一，荣获xxx；院校添加o0x指标</a>
                        </li>
                        <li>
                            <a href="">xxx指标完成度第一，荣获xxx；院校添加o0x指标</a>
                        </li>
                        <li>
                            <a href="">xxx指标完成度第一，荣获xxx；院校添加o0x指标</a>
                        </li>
                        <li>
                            <a href="">xxx指标完成度第一，荣获xxx；院校添加o0x指标</a>
                        </li>
                    </ul>
                </div>
                <p class="more " align="right">
                    <a href="" class="blackGreen">more&nbsp;&gt;&gt;</a>
                </p>
            </div>
            <div class="fixBox fixBox3">
                <div class="ft1">
                    <p>年度排行榜</p>
                    <div class="dropDown">
                        <p class="p1">商学院</p>
                        <span class="icon" data_rtt="90">&gt;</span>
                        <div class="droplist">
                            <ul>
								<li class="droplSb"><input type="text" name="" id="droplistSearch" value="" /></li>
                                <li>经济学院</li>
                                <li>统计学院</li>
                                <li>法学院</li>
                                <li>环境学院</li>
                                <li>信息学院</li>
                                <li>信息学院</li>
                                <li>信息学院</li>
                                <li>信息学院</li>
                                <li>信息学院</li>
                                <li>信息学院</li>
                                <li>信息学院</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="fixBox3_ulBox">
                    <ul>
                        <li>
                            <a href="">
                                <p class="p1">16软件工程</p>
                                <p class="p2" align="right">80.00%</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <p class="p1">16软件工程</p>
                                <p class="p2" align="right">80.00%</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <p class="p1">16软件工程</p>
                                <p class="p2" align="right">80.00%</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <p class="p1">16软件工程</p>
                                <p class="p2" align="right">80.00%</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <p class="p1">16软件工程</p>
                                <p class="p2" align="right">80.00%</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <p class="p1">16软件工程</p>
                                <p class="p2" align="right">80.00%</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <p class="p1">16软件工程</p>
                                <p class="p2" align="right">80.00%</p>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <p class="p1">16软件工程</p>
                                <p class="p2" align="right">80.00%</p>
                            </a>
                        </li>
                    </ul>
                </div>
                <p class="more " align="right">
                    <a href="" class="blackRed">more&nbsp;&gt;&gt;</a>
                </p>
            </div>
            <div class="clear"></div>
        </div>
        <div id="app">
            <!-- <div>
				<div class="layoutJSON">
					Displayed as <code>[x, y, w, h]</code>:
					<div class="columns">
						<div class="layoutItem" v-for="item in layout">
							<b>{{item.i}}</b>: [{{item.x}}, {{item.y}}, {{item.w}}, {{item.h}}]
						</div>
					</div>
				</div>
			</div> -->
            <!--<input type="checkbox" v-model="draggable" id="draggable" />
				<label for="draggable">拖拽开关</label>
				<input type="checkbox" v-model="resizable" id="resizable" />
				<label for="resizable">大小开关</label>-->
            <div id="content">

                <grid-layout :layout="layout" :col-num="12" :row-height="10" :is-draggable="draggable" :is-resizable="resizable"
                    :vertical-compact="true" :use-css-transforms="true" :margin="[10, 10, 20, 10]">
                    <grid-item v-for="item in layout" :x="item.x" :y="item.y" :w="item.w" :h="item.h" :i="item.i"
                        v-on:resize="upWH(item.x,item.y,item.w,item.h,item.i)" :id=" 'item'+ item.i">
                        <div class="ft2">
                            <p>{{item.title}}</p>
                            <div class="settingBox" v-on:click="layer(item.i,item.echartsType)"></div>
                        </div>
                        <div class="clear"></div>
                        <hr class="bottom-line2" />
                        <div :id=" 'echarts'+ item.i" class="echarts" style="width: 100%;height: calc(100% - 50px);" :data_chartsType="item.echartsType"></div>

                    </grid-item>
                </grid-layout>

            </div>

            <!-- 遮罩层 -->
            <div class="shadeBox"></div>
            <div class="btn btn-saveLayout" v-on:click="resaveTcc()">保存</div>
            <!-- 弹出层 -->
            <div id="tcc">
                <div class="ft1">
                    <p>指标选择</p>
                    <div class="dropDown dropDownGroup">
                        <p class="p1">一级指标</p>
                        <span class="icon" data_rtt="90">&gt;</span>
                        <div class="droplist">
                            <ul>
                                <li>一级指标1</li>
                                <li>一级指标2</li>
                                <li>一级指标3</li>
                                <li>一级指标4</li>
                                <li>一级指标5</li>
                            </ul>
                        </div>
                    </div>
                    <div class="dropDown dropDownGroup">
                        <p class="p1">二级指标</p>
                        <span class="icon" data_rtt="90">&gt;</span>
                        <div class="droplist">
                            <ul>
                                <li>二级指标1</li>
                                <li>二级指标2</li>
                                <li>二级指标3</li>
                                <li>二级指标4</li>
                                <li>二级指标5</li>
                            </ul>
                        </div>
                    </div>
                    <div class="dropDown dropDownGroup">
                        <p class="p1">指控点</p>
                        <span class="icon" data_rtt="90">&gt;</span>
                        <div class="droplist">
                            <ul>
                                <li>指控点1</li>
                                <li>指控点2</li>
                                <li>指控点3</li>
                                <li>指控点4</li>
                                <li>指控点5</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="chartsTable">
                    <div class="chartsTable_title">
                        <span class="xh">#</span>
                        <div class="textbox">图标名称</div>
                        <div class="textbox">图表类型</div>
                        <div class="clear"></div>
                    </div>
                    <ul>
                       <%-- <li v-for="item in chartsTable" @click="chartsChange(item.i,item.typeEn)">
                            <span class="xh">{{item.i}}</span>
                            <div class="textbox">{{item.name}}</div>
                            <div class="textbox">{{item.type}}</div>
                        </li>--%>
                        <li><span class="xh">1</span>
                            <div class="textbox">图标名称</div>
                            <div class="textbox">饼图</div>
                        </li> <li><span class="xh">1</span>
                            <div class="textbox">图标名称</div>
                            <div class="textbox">饼图</div>
                        </li> <li><span class="xh">1</span>
                            <div class="textbox">图标名称</div>
                            <div class="textbox">饼图</div>
                        </li> <li><span class="xh">1</span>
                            <div class="textbox">图标名称</div>
                            <div class="textbox">饼图</div>
                        </li> <li><span class="xh">1</span>
                            <div class="textbox">图标名称</div>
                            <div class="textbox">饼图</div>
                        </li>
                    </ul>
                </div>
                <div class="chartsTable_settingBox">
                    <div class="btn btn-green" @click="closeTcc(1)">位置移动</div>
                    <div class="btn btn-green" @click="closeTcc(0)">尺寸调节</div>
                    <div class="dropDown dropDownGroup2">
                        <p class="p1">比例调节</p>
                        <span class="icon" data_rtt="90">&gt;</span>
                        <div class="droplist">
                            <ul>
                                <li>比例调节</li>
                                <li>比例调节</li>
                                <li>比例调节比例调节比例调节</li>
                                <li>比例调节</li>
                                <li>比例调节</li>
                            </ul>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div id="echartsDemoBox" style="width: 100%;height: calc(100% - 67px);padding-top: 10px;">
                        <div id="echartsDemo" style="width: 100%;height: 100%;">

                        </div>
					</div>
                    <div class="btn-save" @click="btnSave">保存</div>
                    <div class="clear"></div>
                </div>
            </div>

            <!-- 弹出层2 -->
            <div id="tcc2">
                
                <div class="clear"></div>
                
            </div>
        </div>


    </body>



    <script type="text/javascript" src="${path}/js/grid_layout/vue-grid-layout.umd.min.js"></script>
    <%--<script type="text/javascript" src="${path}/js/grid_layout/01-basic.js"></script>--%>
    <script type="text/javascript" src="${path}/js/style.js"></script>
    <!-- <script type="text/javascript" src="js/style.min.js"></script> -->
    <script type="text/javascript" src="${path}/js/echarts/echarts.common.min.js"></script>
    <!-- echarts主题 -->
    <script type="text/javascript" src="${path}/js/echarts/theme/walden.js"></script>
    <script type="text/javascript" src="${path}/js/echarts/theme/westeros.js"></script>
    <!-- echarts配置 -->
   <%-- <script type="text/javascript" src="${path}/js/echarts_create.js"></script>--%>

    <script>

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
                url: '${path}/js/echarts_setting.json',
                success: function(data) {
                    settingArr = data;
                },
                error: function(e) {

                },
                async: false, //true 异步
                dataType: 'json'
            });
        }

        function echartsCreate() {
            echartsTheme = 'walden'; //亮色
            // echartsTheme = 'westeros';//暗色
            chartsList = [];
            $(".echarts").each(function(i, val) {
                chartsList[i] = echarts.init($("#" + 'echarts' + i)[0], echartsTheme);

                chartsList[i].on('click',function (params) {    //图标的点击事件

                    /*var value = params.value;
                    var data = params.data;
                    alert(value);*/
                    window.location.href='http://localhost:8080/PageHome/myChange';

                })
                var type = $(this).attr('data_chartsType');
                option = settingArr[type];
                chartsList[i].setOption(option, true);
            });
        }

        function chartsData() {
            var  data = ${optionList};
            chartsList[0].setOption(data);

           /* $.each(data, function(i, val) {
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
                                data: data[i].data,
                                label: {               /!*让数据在顶上在柱状图显示*!/
                                    normal: {
                                        show: true,
                                        position: 'top'}}
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
                                data: data[i].piedata,
                                itemStyle:{               //让数字显示在饼状图
                                    normal:{
                                        label:{
                                            show: true,
                                            formatter: '{b} : {c} ({d}%)'
                                        },
                                        labelLine :{show:true}
                                    }
                                }
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
                                data: data[i].data,
                                itemStyle : { normal: {label : {show: true}}}

                            }]
                        });
                }
            });*/


        }
        /*--------------------*/

       //* var testLayout =${style};
        var testLayout = [
            { "x": 0, "y": 0, "w": 4, "h": 20, "i": 0, "title": "鏂扮敓鍒嗛櫌浜烘暟鍙戝竷", "echartsType": "pie" },
            { "x": 4, "y": 0, "w": 4, "h": 20, "i": 1, "title": "杩戝崄鍛ㄥ鐢熻€冨嫟鎯呭喌", "echartsType": "bar" },
            { "x": 8, "y": 0, "w": 4, "h": 20, "i": 2, "title": "鐢熸簮鍒嗗竷1", "echartsType": "bar" },
            { "x": 0, "y": 20, "w": 4, "h": 20, "i": 3, "title": "demo1", "echartsType": "line" },
            { "x": 4, "y": 20, "w": 4, "h": 20, "i": 4, "title": "demo3", "echartsType": "line" }];

        var chartsTableList =
            [{"i": 0,"name": "图标名称1","type": "饼图","typeEn": "pie"},
                {"i": 1,"name": "图标名称2","type": "柱状图","typeEn": "bar"},
                {"i": 2,"name": "图标名称3","type": "折线图","typeEn": "line"}] ;

        var vue = new Vue({
            el: '#app',
            data: {
                layout: testLayout,
                draggable: false,
                resizable: false,
                index: 0,
                chartsTable: chartsTableList
            },
            methods: {
                upWH: function(x, y, w, h, i) {
                    console.log(x, y, w, h, i);
                    chartsList[i].resize();
                },
                layer: function(i,rId,title,chart) {
                    tcc = layer.open({
                        type: 1,
                        title: false,
                        closeBtn: 0,
                        skin: 'myStyle', //窗体样式类名
                        shade: 0.6, //遮罩透明度
                        shadeClose: true, //遮罩层开启
                        scrollbar: false, //关闭浏览器滚动
                        area: ['960px', '580px'], //宽高
                        content: $('#tcc')

                    });
                    // layer.msg(i)
                    this.chartsChange(rId,title, chart);
                    this.showData(rId);
                    $("#myHidden").val(rId);
                    $("#myHidden1").val(title);
                },
                /*showData:function(eId){
                    var homePageDates = ${homePageDatesJSON};
                    for (var i=0;i<homePageDates.length;i++){
                        var datas2 = homePageDates[i].list;
                        for (var j = 0; j<datas2.length;j++){
                            var datas3 = datas2[j].list;
                            for(var k =0;k<datas3.length;k++){
                                if (parseInt(datas3[k].id)==parseInt(eId)){
                                    $("#levelOne").text(homePageDates[i].title);
                                    $("#levelTwoP").text(datas2[j].title);
                                    $("#targetP").text(datas3[k].title);
                                }
                            }
                        }
                    }
                },*/
                chartsChange1:function(chart){
                    var rId =$("#myHidden").val();
                    var title =$("#myHidden1").val();
                    this.chartsChange(rId,title,chart);
                },
                /*chartsChange: function(rId,title, type) { //点击改变echartsdemo
                    var  datas = ${chartDatasList1};
                    var data=[];
                    var piedata=[];
                    var xname=[];
                    for (var i=0;i<datas.length;i++){
                        if (parseInt(datas[i].rId)==parseInt(rId)){
                            data= datas[i].data;
                            piedata=datas[i].piedata;
                            xname =datas[i].xname;
                        }
                    }
                    //layer.msg(i,type);
                    let demoStr = '<div id="echartsDemo"  style="width: 100%;height: 100%;"></div>';
                    $("#tcc").find("#echartsDemoBox").empty().append(demoStr);

                    chartsDemo = echarts.init($("#echartsDemo")[0], echartsTheme);


                    if (type == 'pie') {
                        chartsDemo.setOption({
                            title: {
                                text:title,
                                x: "center"
                            },
                            legend: {
                                show: false
                            },
                            xAxis: {
                                show: false
                            },
                            yAxis: {
                                show: false
                            },
                            series: [{
                                type: type,
                                radius: '65%',
                                data: piedata,
                                itemStyle:{               //让数字显示在饼状图
                                    normal:{
                                        label:{
                                            show: true,
                                            formatter: '{b} : {c} ({d}%)'
                                        },
                                        labelLine :{show:true}
                                    }
                                }
                            }]
                        });
                    } else {
                        chartsDemo.setOption({
                            title: {
                                text: title,
                                x: "center"
                            },
                            legend: {
                                data: xname
                            },
                            xAxis: {
                                data: xname
                            },
                            yAxis: {},
                            series: [{
                                type: type,
                                data: data,
                                label: {               /!*让数据在顶上在柱状图显示*!/
                                    normal: {
                                        show: true,
                                        position: 'top'}}
                            }]
                        });
                    }
                },*/
                selectLevelTwo:function (levelOneId){
                    $("#levelTwoP").text("二级指标");
                    $("#targetP").text("质控点");

                    $("#levelTwo").empty();
                    $("#target").empty();
                    $.ajax({
                        url:"${path}/PageHome/getTwoLevel",
                        data:{
                            "id":levelOneId
                        },
                        type:"post",
                        dataType:"json",
                        success:function(result){
                            var doc ="";
                            if(result!=null && result.length>0){
                                for (var i=0;i<result.length;i++) {
                                    doc = doc +"<li onclick='getTarget("+result[i].id+")'>"+result[i].title+"</li>";
                                }
                            }
                            $("#levelTwo").html(doc);
                        }
                    })
                },
                getTarget:function (targetId) {
                    $("#targetP").text("质控点");
                    $("#target").empty();
                    $.ajax({
                        url:"${path}/PageHome/getTarget",
                        data:{
                            "id":targetId
                        },
                        type:"post",
                        dataType:"json",
                        success:function(result){
                            var doc ="";
                            if(result!=null && result.length>0){
                                for (var i=0;i<result.length;i++) {
                                    doc = doc +"<li >"+result[i].title+"</li>";
                                }
                            }
                            $("#target").html(doc);
                        }
                    })
                },

                closeTcc: function(v) {
                    if (v == 0) {
                        vue.resizable = true
                    } else {
                        vue.draggable = true
                    };
                    $('.shadeBox,.btn-saveLayout').show();
                    layer.close(tcc);
                },
                resaveTcc: function() {
                    vue.resizable = false;
                    vue.draggable = false;
                    $('.shadeBox,.btn-saveLayout').hide();
                    vue.layer();
                    chartsList.forEach(function(val, i) {
                        chartsList[i].resize();
                    });
                },
                btnSave: function() {
                    var saveLayer = layer.load(2);
                    $.ajax({ //ajax提交布局
                        type: 'post',

                        url:'${path}/PageHome/submitStyle',
                        data:{
                            "datas":JSON.stringify(vue.layout)
                        },
                        success: function(result) {
                            /*console.log(vue.layout);*/
                            //提交的数据 vue.layout
                            if(result=="yes"){
                                window.location.href="/PageHome/toPageHome";
                                layer.close(saveLayer);
                            }

                        },
                        error: function(e) {
                            console.log(e);
                            layer.msg('数据提交失败');
                        },
                        async: true //true 异步
                    });
                }
            }})

    </script>

</html>
