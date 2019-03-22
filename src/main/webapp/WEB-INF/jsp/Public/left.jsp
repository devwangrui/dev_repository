<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

  <head>
   
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script type="text/javascript">
        function listYzTargetSort(sort){
        	$.ajax({
        		url:"${pageContext.request.contextPath }/Index/listYzTargerSort.do",
        		type:"post",
        		data:{
        			"sort":sort
        		},
        		dataType:"text",
        		success:function (re){
        			var result = JSON.parse(re);
        			
        			var dom ="";
        			
        			for(var i=0;i<result.length;i++){
        				
        				var ptitleS = JSON.stringify(result[i].title);
        				var ptitle = ptitleS.replace(/\"/g, "");
        				var cdom = "";
        				if(result[i]!=null){
        					for(var j=0;j<result[i].list.length;j++){
        						var ctitleJ = result[i].list[j].title;
        						var ctitleS = JSON.stringify(ctitleJ);
        						var ctitle= ctitleS.replace(/\"/g, "");
        						var cidJ = result[i].list[j].id;
        						var cidS = JSON.stringify(cidJ);
        						var cid = cidS.replace(/\"/g, "");
        						
            					cdom += "<li class='sub_menu'><a href='${pageContext.request.contextPath }/xxxx?id="+cid+"&sort="+sort+"'>"+ctitle+"</a></li>";
            				}
        				}
        				dom+="<li><a onclick='aaa()'>"+ptitle+"<span class='fa fa-chevron-down'></span></a><ul class='nav child_menu'>"+cdom+"</ul></li>";
        			}
        			$("#myDom"+sort).html(dom);
        		}
        	});
        	
        }
        
        function aaa(){
        	
        }
    
    </script>
   </head> 
<body>   
 <div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="__APP__/Home/index" class="site_title"><i class="fa fa-paw"></i> <span>整改系统</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="${pageContext.request.contextPath }/images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>hello！</span>
                <!-- {$Think.session.index_username} -->
                <h2>老师</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>报表</h3>
                <ul class="nav side-menu">
                    <!-- <volist name="show_list" id="vo"> -->
                    <c:forEach items="${show_list }" var="vo">
                        <li><a><i class="fa fa-${vo.icon}"></i> ${vo.title} <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                               <!--  <volist name="vo.child" id="co"> -->
                               	<c:forEach items="${vo.user }" var="co">
                                    <li><a href="${pageContext.request.contextPath }/Index/show.do?id=${co.id}">${co.title}</a></li>
                                </c:forEach>
                               <!--  </volist> -->
                            </ul>
                        </li>
                     </c:forEach>
                  <!--   </volist> -->
                </ul>
            </div>
            <div class="menu_section">
                <h3>质量监测</h3>
                <ul  class="nav side-menu">
						<li><a onclick="listYzTargetSort(1)"><i class="fa fa-building"></i> 学校质量监测 <span class="fa fa-chevron-down"></span></a>
							<ul id="myDom1" class="nav child_menu">
								<!--  -->

								<!--  -->
							</ul></li>
						
                    <li><a onclick="listYzTargetSort(2)"><i class="fa fa-university"></i> 分院质量监测 <span class="fa fa-chevron-down"></span></a>
                        <ul id="myDom2" class="nav child_menu">
                        </ul>
                    </li>

                    <li><a onclick="listYzTargetSort(3)"><i class="fa fa-graduation-cap"></i> 专业质量监测 <span class="fa fa-chevron-down"></span></a>
                        <ul id="myDom3" class="nav child_menu">
                        </ul>
                    </li>
                    
                   
                        <li><a onclick="listYzTargetSort(4)"><i class="fa fa-users"></i> 班级质量监测 <span class="fa fa-chevron-down"></span></a>
                            <ul id="myDom4" class="nav child_menu">
                              
                            </ul>
                        </li>
                   
                   
                    <li><a href="__APP__/Kc"><i class="fa fa-book"></i> 课程质量监测</a></li>
                 
                    <li><a><i class="fa fa-user"></i> 教师质量监测 </a>
                    <li><a><i class="fa fa-user"></i> 学生质量监测 </a>
                    <!--<if condition="$gr_list != ''">-->
                    <!--<li><a><i class="fa fa-user"></i> 教师质量监测 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <volist name="gr_list" id="vo">
                                <li><a>{$vo.title}<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <vo33list name="vo.child" id="co">
                                            <li class="sub_menu"><a href="__APP__/Home/Monitor/index/s_id/{$co.id}/s/5">{$co.title}</a>
                                            </li>
                                        </volist>
                                    </ul>
                                </li>
                            </volist>
                        </ul>
                    </li>-->
                    <!--</if>-->
                    <li><a href="__APP__/Count"><i class="fa fa-area-chart"></i> 平台运行监测</a></li>
                </ul>
            </div>

            <div class="menu_section">
                <h3>诊改</h3>
                <ul class="nav side-menu">
                    <li><a href="__APP__/Home/Mytransform"><i class="fa fa-stethoscope"></i> 我的诊改</a></li>
                   <!--  <if condition="$Think.session._ACCESS_LIST.TRANSFORM.CHANGESTAND != ''"> -->
                    <li><a href="__APP__/Home/Changestand"><i class="fa fa-line-chart"></i> 提升标准</a></li>
                   <!--  </if> -->

                    <li><a href="javascript:;"><i class="fa fa-file-pdf-o"></i> 运行效果<span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <!-- <if condition="$rbac_list[TRANSFORM][HX] != ''"> -->
                            <li><a>效果画像<span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="__APP__/Home/index/hx/s/1">学校画像</span></a></li>
                                    <li><a href="__APP__/Home/index/hx/s/2">分院画像</span></a></li>
                                    <li><a href="__APP__/Home/index/hx/s/3">专业画像</span></a></li>
                                    <li><a href="__APP__/Home/index/hx/s/4">班级画像</span></a></li>
                                    <li><a href="__APP__/Kc/hx">课程画像</a></li>
                                    <li><a href="javascript:;">教师画像</a></li>
                                    <li><a href="javascript:;">学生画像</a></li>
                                </ul>
                            </li>
                           <!--  </if> -->
                          <!--   <if condition="$rbac_list[TRANSFORM][TRANSFORM_COUNT] != ''"> -->
                            <li><a href="__APP__/Home/Transform">诊改报告</a></li>
                           <!--  </if> -->
                            <li><a>质量报告<span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <!-- <if condition="$rbac_list[TRANSFORM][REPORT][FY_INDEX] != ''"> -->
                                    <li><a href="__APP__/Report/index/s/2">分院</a></li>
                                    <!-- </if> -->
                                   <!--  <if condition="$rbac_list[TRANSFORM][REPORT][ZY_INDEX] != ''"> -->
                                    <li><a href="__APP__/Report/index/s/3">专业</a></li>
                                   <!--  </if> -->
                                    <li><a href="__APP__/Report/index/s/5">个人</a></li>
                                   <!--  <if condition="$rbac_list[TRANSFORM][REPORT][FY_COUNT] != ''"> -->
                                    <li><a href="__APP__/Report/count/s/2">分院汇总</a></li>
                                   <!--  </if> -->
                                    <!-- <if condition="$rbac_list[TRANSFORM][REPORT][ZY_COUNT] != ''"> -->
                                    <li><a href="__APP__/Report/count/s/3">专业汇总</a></li>
                                    <!-- </if> -->
                                    <!-- <if condition="$rbac_list[TRANSFORM][REPORT][P_INDEX] != ''"> -->
                                    <li><a href="__APP__/Report/count/s/5">个人汇总</a></li>
                                   <!--  </if> -->
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!--<li><a href="__APP__/Home/Transform"><i class="fa fa-paper-plane"></i> 发起诊改</a></li>-->
                </ul>
            </div>

            <if condition="$admin_judge == 1">
            <div class="menu_section">
                <h3>指标设置</h3>
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-building"></i> 学校 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li class="sub_menu"><a href="${pageContext.request.contextPath }/YzTargetSort/listYzTargetSort.do?sort=1">框架管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzTargetSort1/listYzTargetSort.do?sort=1">指标管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzElement/listYzElement.do?sort=1">指标匹配</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-university"></i> 分院 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li class="sub_menu"><a href="${pageContext.request.contextPath }/YzTargetSort/listYzTargetSort.do?sort=2">框架管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzTargetSort1/listYzTargetSort.do?sort=2">指标管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzElement/listYzElement.do?sort=2">指标匹配</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-graduation-cap"></i> 专业 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                           <li class="sub_menu"><a href="${pageContext.request.contextPath }/YzTargetSort/listYzTargetSort.do?sort=3">框架管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzTargetSort1/listYzTargetSort.do?sort=3">指标管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzElement/listYzElement.do?sort=3">指标匹配</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-users"></i> 班级 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li class="sub_menu"><a href="${pageContext.request.contextPath }/YzTargetSort/listYzTargetSort.do?sort=4">框架管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzTargetSort1/listYzTargetSort.do?sort=4">指标管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzElement/listYzElement.do?sort=4">指标匹配</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-book"></i> 课程 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                           <li class="sub_menu"><a href="${pageContext.request.contextPath }/YzTargetSort/listYzTargetSort.do?sort=7">框架管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzTargetSort1/listYzTargetSort.do?sort=7">指标管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzElement/listYzElement.do?sort=7">指标匹配</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-user"></i> 教师 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li class="sub_menu"><a href="${pageContext.request.contextPath }/YzTargetSort/listYzTargetSort.do?sort=5">框架管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzTargetSort1/listYzTargetSort.do?sort=5">指标管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzElement/listYzElement.do?sort=5">指标匹配</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-user"></i> 学生 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li class="sub_menu"><a href="${pageContext.request.contextPath }/YzTargetSort/listYzTargetSort.do?sort=6">框架管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzTargetSort1/listYzTargetSort.do?sort=6">指标管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/YzElement/listYzElement.do?sort=6">指标匹配</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/YzTargetView/listYzTargetView.do"><i class="fa fa-anchor"></i> 模板配置</a> </li>
                </ul>
            </div>
            
            
            <div class="menu_section">
                <h3>系统设置</h3>
                <ul class="nav side-menu">
                    <li><a href="${pageContext.request.contextPath }/excel/importExcel.do"><i class="fa fa-file-excel-o"></i> 指标导入 </a></li>
                    <li><a href="${pageContext.request.contextPath }/PageIndex/PageContr.do"><i class="fa fa-gears"></i> 页面管理 </a></li>
                    <li><a><i class="fa fa-gear"></i> 用户管理 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="${pageContext.request.contextPath }/Teacher/listTeacher.do">教师用户</a></li>
                            <li><a href="${pageContext.request.contextPath }/Teacher/listStudent.do">学生用户</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/YzElement/listElementIndex.do"><i class="fa fa-sitemap"></i> 组织架构管理 </a>
                    <li><a><i class="fa fa-power-off"></i> 权限管理 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="${pageContext.request.contextPath }/Rbac/role.do">角色管理</a></li>
                            <li><a href="${pageContext.request.contextPath }/Rbac/node.do">节点管理</a></li>
                        </ul>
                    </li>
                </li>
                </ul>
            </div>
            </if>
        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>
</body>
</html>