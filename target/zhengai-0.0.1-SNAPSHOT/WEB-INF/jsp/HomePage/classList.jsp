<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>智慧诊改-课程列表</title>
		<link rel="stylesheet/less" type="text/less" href="${path}/css/myStyle.less" />
		<script type="text/javascript" src="${path}/js/less.min.js">
			<!--2.6.0-->
		</script>
		<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/js/vue.js"></script>
		<!--layer-->
		<script type="text/javascript" src="${path}/js/layer/layer.js"></script>
	</head>
	<body>
		<div class="topbar">
			<p class="tb_title">王小明</p>
			<p class="tb_subtitle">欢迎使用诊改系统！</p>
		</div>
		<div class="navbar">
			<ul>
				<li><a href=""><span id="index_logo"></span>信远智慧诊改系统</a></li>
				<li><a href="/PageHome/toHomePage">首页</a></li>
				<li><a href="">报表中心</a></li>
				<li><a href="">质量检测</a></li>
				<li><a href="">诊改系统</a></li>
			</ul>
		</div>
		<div class="body-div bottom_line">

			<div class="ft1 floatLeft bodyTitle">
				<p class="inline-block">课程列表</p>
			</div>
			
			<div class="search_ipt floatRight search_ipt-small">
				<input type="text" class="form-control" name="" id="" value="" placeholder="请输入课程名称/代码"/>
			</div>

			<div class="dropDown floatRight dropDown_small">
				<p class="p1">专业</p>
				<span class="icon" data_rtt='90'>&gt;</span>
				<div class="droplist">
					<ul>
						<li>经济学院1</li>
						<li>统计学院1</li>
						<li>法学院</li>
						<li>环境学院</li>
						<li>信息学院</li>
					</ul>
				</div>
			</div>
			
			<div class="dropDown floatRight dropDown_small">
				<p class="p1">分院</p>
				<span class="icon" data_rtt='90'>&gt;</span>
				<div class="droplist">
					<ul>
						<li>经济学院2</li>
						<li>统计学院</li>
						<li>法学院3</li>
						<li>环境学院</li>
						<li>信息学院</li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
			<hr class="bottom-line"/>
		</div>
		<div id="app">
			 <div id="content">
			
			    <grid-layout :layout="layout" :col-num="12" :row-height="10" :is-draggable="draggable" :is-resizable="resizable"
			        :vertical-compact="true" :use-css-transforms="true" :margin="[10, 10, 20, 10]">
			        <grid-item v-for="item in layout" :x="item.x" :y="item.y" :w="item.w" :h="item.h" :i="item.i"
			            v-on:resize="upWH(item.x,item.y,item.w,item.h,item.i)" :id=" 'item'+ item.i">
			            <div class="ft2">
			                <p>{{item.title}}</p>
			                <div class="settingBox" v-on:click="layer(item.i)"></div>
			            </div>
			            <div class="clear"></div>
			            <hr class="bottom-line2" />
			            <div :id=" 'echarts'+ item.i" class="echarts" style="width: 100%;height: calc(100% - 50px);" :data_chartsType="item.echartsType"></div>
			        </grid-item>
			    </grid-layout>
			
			</div>
		</div>
	</body>



	<script type="text/javascript" src="${path}/js/grid_layout/vue-grid-layout.umd.min.js"></script>
	<script type="text/javascript" src="${path}/js/grid_layout/01-basic.classList.js"></script>
	<!-- <script type="text/javascript" src="js/style.js"></script> -->
	<script type="text/javascript" src="${path}/js/style.min.js"></script>
	<script type="text/javascript" src="${path}/js/echarts/echarts.common.min.js"></script>
	<!-- echarts主题 -->
	<script type="text/javascript" src="${path}/js/echarts/theme/walden.js"></script>
	<script type="text/javascript" src="${path}/js/echarts/theme/westeros.js"></script>
	<!-- echarts配置 -->
	<script type="text/javascript" src="${path}/js/echarts_create.classList.js"></script>
</html>
