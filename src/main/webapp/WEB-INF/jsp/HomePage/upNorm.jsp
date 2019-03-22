<%@ page import="com.example.zhengai.model.YzUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>智慧诊改-标准提升</title>
		<link rel="stylesheet/less" type="text/less" href="${path}/css/myStyle.less" />
		<link rel="stylesheet/less" type="text/less" href="${path}/css/upNorm.less" />
		<script type="text/javascript" src="${path}/js/less.min.js?v=2.6.0"></script>
		<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/js/vue.js?v=v2.5.16"></script>
		<script type="text/javascript" src="${path}/js/vue-resource.min.js?v=1.5.1"></script>
		<!--layer-->
		<script type="text/javascript" src="${path}/js/layer/layer.js"></script>
		<!-- icon -->
		<script type="text/javascript" src="//at.alicdn.com/t/font_1025383_10zyhjrulce.js"></script>
		<!-- animate -->
		<link rel="stylesheet" type="text/css" href="${path}/css/animate/animate.min.css" />
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
					<a href="">首页</a>
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
			<div id="content">
				<div class="list floatLeft">
					<ul class="list-group">
						<li v-for="(item,index) in listArr" class="list-item" @click.stop="selectLi(index)" :class="{select:selectIndex==index}">
							<svg class="icon" aria-hidden="true">
								<use :xlink:href=" '#' + item.icon "></use>
							</svg>
							<p>{{item.t}}</p>
						</li>
					</ul>
				</div>
				<div class="list-r floatLeft">
					<div class="ft1 bodyTitle floatLeft">
						<p class="inline-block">标准提升</p>
					</div>
					<div class="clear"></div>
					<div class="searchBar">
						<div class="search_ipt floatLeft search_ipt-small">
							<input type="text" v-model.trim="searchTxt" class="form-control" placeholder="请输入指标名称" @keyup.enter="searchTxticon" />
							<svg class="icon" aria-hidden="true" style="font-size: 25px;color: #fff;position: relative;top: 4px;" @click="searchTxticon">
								<use xlink:href="#icon-sousuo"></use>
							</svg>
						</div>

						<p class="inline-block floatLeft" style="line-height: 60px;margin: 0px 15px 0 20px;">|</p>

						<transition name="slide-fade">
							<div v-show="selectIndex==0||selectIndex==1||selectIndex==2||selectIndex==3" class="dropDown floatLeft dropDown_small">
								<p class="p1">分院列表</p>
								<span class="icon" data_rtt="90">&gt;</span>
								<div class="droplist">
									<ul>
										<li>经济学院2</li>
										<li>经济学院2</li>
										<li>经济学院2</li>
									</ul>
								</div>
							</div>
						</transition>
						<transition name="slide-fade">
							<div v-show="selectIndex==0||selectIndex==1||selectIndex==2||selectIndex==3" class="dropDown floatLeft dropDown_small">
								<p class="p1">专业列表</p>
								<span class="icon" data_rtt="90">&gt;</span>
								<div class="droplist">
									<ul>
										<li>经济学院2</li>
										<li>经济学院2</li>
										<li>经济学院2</li>
									</ul>
								</div>
							</div>
						</transition>
						<transition name="slide-fade">
							<div v-show="selectIndex==0||selectIndex==1||selectIndex==2||selectIndex==3" class="dropDown floatLeft dropDown_small">
								<p class="p1">班级列表</p>
								<span class="icon" data_rtt="90">&gt;</span>
								<div class="droplist">
									<ul>
										<li>经济学院2</li>
										<li>经济学院2</li>
										<li>经济学院2</li>
									</ul>
								</div>
							</div>
						</transition>
						<transition name="slide-fade">
							<div v-show="selectIndex==0||selectIndex==1||selectIndex==2||selectIndex==3" class="dropDown floatLeft dropDown_small">
								<p class="p1">课程列表</p>
								<span class="icon" data_rtt="90">&gt;</span>
								<div class="droplist">
									<ul>
										<li>经济学院2</li>
										<li>经济学院2</li>
										<li>经济学院2</li>
									</ul>
								</div>
							</div>
						</transition>
						<p v-show="selectIndex==0||selectIndex==1||selectIndex==2||selectIndex==3" class="inline-block floatLeft" style="line-height: 60px;margin: 0px 20px 0 15px;">|</p>
						<transition name="slide-fade">
							<div v-show="true" class="dropDown floatLeft dropDown_small">
								<p class="p1">一级指标</p>
								<span class="icon" data_rtt="90">&gt;</span>
								<div class="droplist">
									<ul>
										<li>经济学院2</li>
										<li>经济学院2</li>
										<li>经济学院2</li>
									</ul>
								</div>
							</div>
						</transition>
						<transition name="slide-fade">
							<div v-show="true" class="dropDown floatLeft dropDown_small">
								<p class="p1">二级指标</p>
								<span class="icon" data_rtt="90">&gt;</span>
								<div class="droplist">
									<ul>
										<li>经济学院2</li>
										<li>经济学院2</li>
										<li>经济学院2</li>
									</ul>
								</div>
							</div>
						</transition>
						<div class="clear"></div>
					</div>
					<div id="viewbox">
						<div v-show="table.length==0" style="text-align: center;color: #fff;font-size: 20px;padding: 30px;">暂无数据...</div>
						<div class="viewbox-item" v-for="item in table">
							<div class="item-info">
								<div class="info-l floatLeft">
									<p class="p1">
										<svg class="icon" aria-hidden="true">
											<use xlink:href="#icon-No1"></use>
										</svg>
										<span>{{item.firstNorm}}</span>
									</p>
									<p class="p2">
										<svg class="icon" aria-hidden="true">
											<use xlink:href="#icon-No"></use>
										</svg>
										<span>{{item.secondNorm}}</span>
									</p>
								</div>
								<div class="info-r floatLeft">
									<p class="p1">{{item.normName}}</p>
									<p class="p2">指控点</p>
								</div>
								<div class="info-b floatLeft">
									<p class="btn btn-show" @click="btnUp(item.i)">提升记录
										<svg class="icon" aria-hidden="true">
											<use xlink:href="#icon-tubiao"></use>
										</svg>
									</p>
									<p class="btn btn-iron" @click="btnEdit(item.i)">修改记录
										<svg class="icon" aria-hidden="true">
											<use xlink:href="#icon-tubiao"></use>
										</svg>
									</p>
								</div>
								<div class="clear"></div>
							</div>
							<div class="item-charts">
								<div :id="'echarts-'+item.i" class="echarts" style="width: 100%;height: 200px;"></div>
							</div>
						</div>
						<div class="clear"></div>
						<div id="pageBox" v-show="table.length>classPageNum">

							<div class="btn btn-prev" @click="pageNumlayout(classPageNumNow-1)">&lt; 上一页</div>
							<div class="btn btn-num" @click="pageNumlayout(n)" v-for="n in pageNum(table.length)">{{n}}</div>
							<div class="btn btn-next" @click="pageNumlayout(classPageNumNow+1)">下一页 &gt;</div>

						</div>
					</div>

				</div>
			</div><!-- content -->
			
			<div id="edit-tcc" style="display: none;">
				<div class="ft1">
					<p class="inline-block">修改记录</p>
				</div>
				<div class="clear"></div>
				<div class="dbb">
					<div class="dbb-l">
						<div class="l l-t">
							<p class="p1">标准值</p>
							<p class="p2">{{tccbzz}}</p>
						</div>
						<div class="l l-d">
							<p class="p1">当前值</p>
							<p class="p2">{{tccdqz}}</p>
						</div>
					</div>
					<div class="dbb-r">
						<div class="r r-t">
							<p>对比: {{tccdqz == tccbzz ? '等于' : (tccdqz > tccbzz ? '大于' : '小于')}}</p>
						</div>
						<div class="r r-d">
							<p>提升标准:  <input type="number" v-model="tccdqz"></p>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="ft1">
					<p class="inline-block">近期提升</p>
				</div>
				<textarea class="recentUp" v-model="tccRecentUp"></textarea>
			</div>
			<div id="up-tcc" style="display: none;">
				<div class="ft1">
					<p class="inline-block">提升记录</p>
				</div>
				<div class="clear"></div>
				<div class="notes" id="myscroll1">
					<ul>
						<li v-for="item in tccUpnotes">
							<div class="notesInfo">
								<p class="p1">{{item.timeStar}}-{{item.timeEnd}}</p>
								<p class="p2"><span v-for="item1 in item.recent">{{item1.user}} {{item1.old}} 提升至 {{item1.new}} ; </span></p>
							</div>
							<div class="notesImg">
								<img :src="tccRecentlevelImg[item.level]" alt="">
							</div>
						</li>
					</ul>
				</div>
			</div>
			
			
		</div><!-- app -->
	</body>

	<!-- <script type="text/javascript" src="js/style.js"></script> -->
	<script type="text/javascript" src="${path}/js/style.min.js"></script>
	<!-- scrollbar -->
	<script type="text/javascript" src="${path}/js/scrollbar/zUI.js"></script>
	<script type="text/javascript" src="${path}/js/echarts/echarts.licc.min.js"></script>
	<!-- echarts主题 -->
	<script type="text/javascript" src="${path}/js/echarts/theme/walden.js"></script>
	<script type="text/javascript" src="${path}/js/echarts/theme/westeros.js"></script>
	<!-- echarts配置 -->
	<script type="text/javascript" src="${path}/js/upNorm.js"></script>

</html>
