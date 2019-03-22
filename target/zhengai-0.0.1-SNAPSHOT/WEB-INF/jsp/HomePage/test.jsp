<%@ page import="com.example.zhengai.model.YzUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%
    YzUser user =(YzUser) request.getSession().getAttribute("user");
    String name=null;
    if(user!=null){
        name = user.getName();
    }

%>

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

    </head>
<body>
<div id="echarts" style="height: 100%;"></div>
<input type='hidden' id='t_data' value='["a21","a22","a23","a24","a25","a26","a27","a28"]'>
<script>var t_data = null;var t_data_str = $('#t_data').val();t_data =  eval('(' + t_data_str + ')');
</script>
<input type='hidden' id='d_data' value='[{"name":"a21","value":2061},{"name":"a22","value":1299},{"name":"a23","value":1753},{"name":"a24","value":1276},{"name":"a25","value":2876},{"name":"a26","value":2313},{"name":"a27","value":122},{"name":"a28","value":899}]'>
<script>var d_data = null;var d_data_str = $('#d_data').val();d_data =  eval('(' + d_data_str + ')');
</script>
<input type='hidden' id='d_data2' value='[{"name":"v21","value":477},{"name":"v22","value":529},{"name":"v23","value":549},{"name":"v24","value":506},{"name":"v25","value":332},{"name":"v26","value":317},{"name":"v27","value":311},{"name":"v31","value":339},{"name":"v32","value":439},{"name":"v33","value":432},{"name":"v34","value":408},{"name":"v35","value":474},{"name":"v36","value":279},{"name":"v37","value":296},{"name":"v38","value":342},{"name":"v39","value":359},{"name":"v3","value":699},{"name":"v30","value":725},{"name":"v300","value":697},{"name":"v3001","value":755},{"name":"v3222","value":576},{"name":"v3333","value":588},{"name":"v3444","value":587},{"name":"v3","value":562},{"name":"v3","value":72},{"name":"v3","value":50},{"name":"v3","value":176},{"name":"v343","value":251},{"name":"v356","value":243},{"name":"v312","value":229}]'>
<script>var d_data2 = null;var d_data2_str = $('#d_data2').val();d_data2 =  eval('(' + d_data2_str + ')');
</script>
<script type="text/javascript">
    window.onload=function(){
        var dom = document.getElementById("echarts");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        app.title = '';

        option = {
            tooltip: {
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data: t_data
            },
            title:{
                text: '学生人数分院分布',
                left:'center'
            },
            series: [{
                name: '',
                type: 'pie',
                selectedMode: 'single',
                radius: [0, '45%'],
                label: {
                    normal: {
                        position: 'inner'
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: d_data
            },
                {
                    name: '',
                    type: 'pie',
                    radius: ['60%', '50%'],
                    data: d_data2
                }
            ]
        };

        if(option && typeof option === "object") {
            myChart.setOption(option, true);
        };
    }
</script>
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

</html>