<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>智慧诊改</title>
        <link rel="stylesheet/less" type="text/less" href="${path}/css/myStyle.less" />
        <!--grid_layout-->
        <link rel="stylesheet/less" type="text/less" href="${path}/css/grid_layout/grid_layout.less" />
        <script type="text/javascript" src="${path}/js/less.min.js">
            <!--2.6.0-->
        </script>
        <script type="text/javascript" src="${path}/js/jquery.resize.min.js"></script>
        <script type="text/javascript" src="${path}/js/vue.js"></script>
        <!--layer-->
        <script type="text/javascript" src="${path}/js/layer/layer.js"></script>
        <!-- icon -->
        <script type="text/javascript" src="//at.alicdn.com/t/font_1025383_e40ke5f6nbj.js"></script>


        <script>
           /* document.oncontextmenu = function(){return false;}

            document.onkeydown = function(){

                if(window.event && window.event.keyCode == 123) {
                    alert("F12被禁用");
                    event.keyCode=0;
                    event.returnValue=false;
                }*/
               /* if(window.event && window.event.keyCode == 13) {
                    window.event.keyCode = 505;
                }
                if(window.event && window.event.keyCode == 8) {
                    alert(str+"\n请使用Del键进行字符的删除操作！");
                    window.event.returnValue=false;
                }*/

              /* if (window.event && window.event.keyCode==85) {
                   alert("无效的操作");
                   event.keyCode=0;
                   event.returnValue=false;

               }

            }*/



           function getTarget(targetId) {
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
                                doc = doc +"<li onclick='selectTargetView("+result[i].id+")'>"+result[i].title+"</li>";
                            }
                        }
                        $("#target").html(doc+"<li></li>");
                    }
                })
            }

           function selectTargetView(targetId) {

               var type ="";
               var data=[];
               var piedata=[];
               var xname=[];
               var title ="";

                   $.ajax({
                       url:"${path}/PageHome/getConditionDatas1",
                       data:{
                           "targetId":targetId
                       },
                       type:"post",
                       dataType:"json",
                       success:function(result) {
                           type =result.chartsType;
                           data=result.data;
                           piedata=result.piedata;
                           xname=result.xname;
                           title=result.title;
                           let demoStr = '<div id="echartsDemo"  style="width: 100%;height: 100%;"></div>';
                           $("#tcc").find("#echartsDemoBox").empty().append(demoStr);

                           chartsDemo = echarts.init($("#echartsDemo")[0], echartsTheme);

                           if (type == 'pie') {
                               chartsDemo.setOption(
                                   {
                                       title : {
                                           text: title,
                                           x:'center'
                                       },
                                       tooltip : {
                                           trigger: 'item',
                                           formatter: "{a} <br/>{b} : {c} ({d}%)"
                                       },
                                       legend: {
                                           orient: 'vertical',
                                           left: 'left',

                                       },
                                       series: [{
                                           type: 'pie',
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
                                   tooltip: {},
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
                                       label: {               //让数据在顶上在柱状图显示
                                           normal: {
                                               show: true,
                                               position: 'top'}}
                                   }]
                               });
                           }

                       }
                   })
            }

        </script>
    </head>
    <body>

        <div class="topbar">
            <c:if test="${empty user}"><p class="tb_title">游客</p></c:if>
            <c:if test="${not empty user}"><p class="tb_title">${user.name}</p></c:if>
            <p class="tb_title"></p>
            <p class="tb_subtitle">欢迎使用诊改系统！</p>
        </div>
        <div class="navbar">
            <ul>
                <li>
                    <a href=""><span id="index_logo"></span>信远智慧诊改系统</a>
                </li>
                <li>
                    <a href="/PageHome/toPageHomeR">首页</a>
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
                            <li class="er_ji-item"><a href="/PageHome/overView">我的诊改</a></li>
                            <li class="er_ji-item"><a href="/PageHome/classList">提高标准</a></li>
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
                       <c:forEach items="${newsList}" var="news">
                        <li>
                            <a href="">${news.newsTitle}</a>
                        </li>
                       </c:forEach>

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
        <input type="hidden" id="options">
        <div id="app" >

            <div id="content">

                <grid-layout :layout="layout" :col-num="12" :row-height="10" :is-draggable="draggable" :is-resizable="resizable"
                             :vertical-compact="true" :use-css-transforms="true" :margin="[10, 10]">
                    <grid-item v-for="item in layout" :x="item.x" :y="item.y" :w="item.w" :h="item.h" :i="item.i" v-on:resize="upWH(item.x,item.y,item.w,item.h,item.i)"
                               :id=" 'item'+ item.i">
                        <div class="ft2">
                            <p>{{item.title}}</p>
                            <div class="settingBox" v-on:click="layer(item.i,item.optKey,item.echartsType,item.rId)"></div>
                        </div>
                        <div class="clear"></div>
                        <hr class="bottom-line2" />
                        <div :id="'echarts'+item.i" class="echarts" style="width: 100%;height: calc(100% - 50px);" :data_chartsType="item.echartsType"></div>
                    </grid-item>
                </grid-layout>

            </div>

            <!-- 遮罩层 -->
            <div class="shadeBox"></div>
            <div class="btn btn-saveLayout" v-on:click="resaveTcc()">保存</div>

            <!-- 弹出层 -->
            <div id="tcc">
                <span class="ft1">
                    <p>指标选择</p>
                    <div class="dropDown dropDownGroup" >
                          <p class="p1" id="levelOne">一级指标</p>
                        <span class="icon" data_rtt='90'>&gt;</span>
                        <div class="droplist">
                            <ul v-on:load="levatOneLoad()">
                                 <c:forEach items="${homePageDates}" var="target" varStatus="status">
                                <li v-on:click="selectLevelTwo(${target.id})">${target.title}</li>
                                </c:forEach>

                            </ul>
                        </div>
                    </div>
                    <div class="dropDown dropDownGroup">
                        <p class="p1" id="levelTwoP" tip="">二级指标</p>
                        <span class="icon" data_rtt='90'>&gt;</span>
                        <div class="droplist">
                            <ul id="levelTwo">

                            </ul>
                        </div>
                    </div>
                    <div class="dropDown dropDownGroup">
                    <p class="p1" id="targetP">质控点</p>
                    <span class="icon" data_rtt='90'>&gt;</span>
                    <div class="droplist">
                        <ul id="target">

                        </ul>
                    </div>
                     </div>

                    <input type="hidden" id="myHidden">
                    <input type="hidden" id="myHidden1">
                <div class="clear"></div>
                <div class="chartsTable">

                    <div class="chartsTable_title">
                        <div class="xh">#</div>
                        <div class="textbox">图标名称</div>
                        <div class="textbox">图表类型</div>
                        <div class="clear"></div>
                    </div>
                    <ul>
                        <%--<li v-for="item in chartsTable" v-on:click="chartsChange1(item.i,item.typeEn)">
                            <div class="xh">{{item.i}}</div>
                            <div class="textbox">{{item.name}}</div>
                            <div class="textbox">{{item.type}}</div>--%>
                           <li  v-on:click="chartsChange1('pie')">
                               <div class="xh">0</div>
                               <div class="textbox">饼状图</div>
                               <div class="textbox">饼状图</div>
                        </li>
                        <li  v-on:click="chartsChange1('bar')">
                               <div class="xh">1</div>
                               <div class="textbox">柱状图</div>
                               <div class="textbox">柱状图</div>
                        </li>
                        <li  v-on:click="chartsChange1('line')">
                               <div class="xh">2</div>
                               <div class="textbox">折线图</div>
                               <div class="textbox">折现图</div>
                        </li>

                    </ul>
                </div>
                <div class="chartsTable_settingBox">
                    <div class="btn btn-green" v-on:click="closeTcc(1)">位置移动</div>
                    <div class="btn btn-green" v-on:click="closeTcc(0)">尺寸调节</div>
                    <div class="dropDown dropDownGroup2">
                        <p class="p1">比例调节</p>
                        <span class="icon" data_rtt='90'>&gt;</span>
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
                        <div id="echartsDemo"  style="width: 100%;height: 100%;"></div>
                    </div>
                    <div class="btn-save" v-on:click="btnSave">保存</div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </body>

    <script type="text/javascript" src="${path}/js/grid_layout/vue-grid-layout.umd.min.js"></script>
    <%--<script type="text/javascript" src="${path}/js/grid_layout/01-basic.js"></script>--%>
    <!-- <script type="text/javascript" src="js/style.js"></script> -->
    <script type="text/javascript" src="${path}/js/style.min.js"></script>
    <script type="text/javascript" src="${path}/js/echarts/echarts.common.min.js"></script>
    <!-- echarts主题 -->
    <script type="text/javascript" src="${path}/js/echarts/theme/walden.js"></script>
    <script type="text/javascript" src="${path}/js/echarts/theme/westeros.js"></script>
    <!-- echarts配置 -->
    <%--<script type="text/javascript" src="${path}/js/echarts_create.js"></script>--%>
    <script>





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
                chartsList[i] = echarts.init(document.getElementById('echarts'+i), echartsTheme);

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
            var  data = ${chartDatasList};
            $.each(data, function(i, val) {
                switch (data[i].chartsType) {
                    case 'bar':
                      var option=
                        {
                            title: {
                                text: data[i].title
                            },
                            legend: {
                                orient: 'vertical',
                                left: 'left',

                            },
                            xAxis: {
                                data: data[i].xname
                            },
                            series: [{
                                type: data[i].chartsType,
                                data: data[i].data,
                                label: {               /*让数据在顶上在柱状图显示*/
                                    normal: {
                                        show: true,
                                        position: 'top'}}
                            }]


                        };

                        chartsList[i].setOption(option);

                        break;
                    case 'pie':
                        var option=
                            {
                                title : {
                                    text: data[i].title,
                                    x:'center'
                                },
                                tooltip : {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                                },
                                legend: {
                                    orient: 'vertical',
                                    left: 'left',
                                    data: data[i].xname
                                },
                                series: [{
                                    type: 'pie',
                                    radius: '65%',
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
                            }

                        chartsList[i].setOption(option);


                        break;
                    default:
                        var option={
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
                        };
                        chartsList[i].setOption(option);

                }
            });

        }
/*--------------------*/

         var testLayout =${style};
         var allData =${chartDatasList};

        var chartsTableList =
            [{"i": 0,"name": "图标名称1","type": "饼图","typeEn": "pie"},
            {"i": 1,"name": "图标名称2","type": "柱状图","typeEn": "bar"},
            {"i": 2,"name": "图标名称3","type": "折线图","typeEn": "line"}] ;

        var vue = new Vue({
            el: '#app',
            data: {
                allData:allData,
                layout: testLayout,
                draggable: false,
                resizable: false,
                index: 0,
                chartsTable: chartsTableList
            },
            methods: {
                upWH: function(x, y, w, h, i) {

                    chartsList[i].resize();
                },
                layer: function(i,optKey,chart,targetId) {

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


                    this.showData(i,targetId);
                    $("#myHidden").val(targetId);
                    $("#myHidden1").val(optKey);
                },
                selectLevelTwo:function(levelOneId){

                    $("#levelTwo").empty();
                    $("#levelTwoP").text("二级指标");
                    $("#target").empty();
                    $("#targetP").text("质控点");
                    $("#datas").empty();
                    $("#datasP").text("部门数据");

                    var data=${homePageDatesJSON};
                    var doc="";
                    var levelT
                        for(var i=0;i<data.length;i++){
                         if (data[i].id==levelOneId){
                             var levelTwo = data[i].list;
                            for(var j=0;j<levelTwo.length;j++){
                                doc=doc+"<li onclick='getTarget("+levelTwo[j].id+")'>"+levelTwo[j].title+"</li>";
                                levelT =levelTwo[0].list;
                            }
                         }
                     }
                        var targetId;
                        var doc1="";
                        for (var i=0;i<levelT.length;i++){
                            doc1=doc1+"<li onclick='selectTargetView("+levelT[i].id+")'>"+levelT[i].title+"</li>";
                            targetId = levelT[0].id;
                        }
                    $("#levelTwo").html(doc+"<li></li>");
                    $("#target").html(doc1+"<li></li>");

                    $.ajax({
                        type: "get",
                        url: "${path}/PageHome/getDatas",
                        data:{
                            targetId:targetId
                        },
                        success: function(result) {
                            var re =JSON.parse(result);
                            var doc2="";
                            if (re.length>0) {
                                for (var i=0;i<re.length;i++){
                                    doc2=doc2+"<li  onclick=\"selectDatas('" + re[i].optKey+"','"+re[i].targetId+"')\">" + re[i].dataTitle+ "</li>";
                                }
                            }
                            $("#datas").html(doc2+"<li></li>");

                        },
                        error: function(e) {

                        },
                        async: true, //true 异步
                        dataType: 'text'
                    });
                },
                showData:function(i,targetId){ //回显数据
                    var  datas = ${chartDatasList};
                    var homePageDates = ${homePageDatesJSON};
                    var type = datas[i].chartsType;
                    var title = datas[i].title;

                    var piedata =JSON.stringify(datas[i].piedata);
                    var xname =JSON.stringify(datas[i].xname);
                    var chartsType =JSON.stringify(datas[i].chartsType);
                    var data =JSON.stringify(datas[i].data);

                    for (var i=0;i<homePageDates.length;i++){
                        var datas2 = homePageDates[i].list;
                        for (var j = 0; j<datas2.length;j++){
                            var datas3 = datas2[j].list;
                            for(var k =0;k<datas3.length;k++){
                                if (parseInt(datas3[k].id)==parseInt(targetId)){
                                    $("#levelOne").text(homePageDates[i].title);
                                    $("#levelTwoP").text(datas2[j].title);
                                    $("#targetP").text(datas3[k].title);
                                    $("#levelTwo").empty();
                                    var doc="";
                                    var doc1="";
                                    for (var x = 0; x<datas2.length;x++){
                                        doc = doc +"<li onclick='getTarget("+datas2[x].id+")'>"+datas2[x].title+"</li>";
                                    }
                                    $("#levelTwo").html(doc+"<li></li>");

                                    $("#target").empty();
                                    for (var y=0;y<datas3.length;y++) {
                                        doc1=doc1 +"<li onclick='selectTargetView("+datas3[y].id+")'>"+datas3[y].title+"</li>";
                                    }
                                    $("#target").html(doc1+"<li></li>");
                                }
                            }
                        }
                    }

                    let demoStr = '<div id="echartsDemo"  style="width: 100%;height: 100%;"></div>';
                    $("#tcc").find("#echartsDemoBox").empty().append(demoStr);
                    chartsDemo = echarts.init($("#echartsDemo")[0], echartsTheme);

                    if (type == 'pie') {

                        chartsDemo.setOption(
                            {
                                title : {
                                    text: title,
                                    x:'center'
                                },
                                tooltip : {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                                },
                                legend: {
                                    orient: 'vertical',
                                    left: 'left',

                                },
                                series: [{
                                    type: 'pie',
                                    radius: '65%',
                                    data: JSON.parse(piedata),
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
                            tooltip: {},
                            legend: {

                            },
                            xAxis: {
                                data: JSON.parse(xname)
                            },
                            yAxis: {},
                            series: [{
                                type: JSON.parse(chartsType),
                                data: JSON.parse(data),
                                label: {normal: {show: true, position: 'top'}}
                            }]
                        });
                    }

                },
                chartsChange1:function(chart){
                    var targetId =$("#myHidden").val();
                    this.chartsChange(targetId,chart);
                },

                chartsChange: function(targetId, type) { //点击改变echartsdemo

                    var data=[];
                    var piedata=[];
                    var xname=[];
                    $.ajax({
                        url:"${path}/PageHome/getConditionDatas1",
                        data:{
                            "targetId":targetId
                        },
                        type:"post",
                        dataType:"json",
                        success:function(result) {

                            data=result.data;
                            piedata=result.piedata;
                            xname=result.xname;
                            var title =result.title;

                            let demoStr = '<div id="echartsDemo"  style="width: 100%;height: 100%;"></div>';
                            $("#tcc").find("#echartsDemoBox").empty().append(demoStr);

                            chartsDemo = echarts.init($("#echartsDemo")[0], echartsTheme);

                            if (type == 'pie') {
                                chartsDemo.setOption(
                                    {
                                        title : {
                                            text: title,
                                            x:'center'
                                        },
                                        tooltip : {
                                            trigger: 'item',
                                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                                        },
                                        legend: {
                                            orient: 'vertical',
                                            left: 'left',

                                        },
                                        series: [{
                                            type: 'pie',
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
                                    tooltip: {},
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
                                        label: {               //让数据在顶上在柱状图显示
                                            normal: {
                                                show: true,
                                                position: 'top'}}
                                    }]
                                });
                            }

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
                               window.location.href="/PageHome/toPageHomeR";
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