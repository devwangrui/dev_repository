<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>组织构架管理 </title>

    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/js/jquery.autocompleter/jquery.autocompleter.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/build/css/custom.css" rel="stylesheet">
  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/baiduedit.css" />
    
    
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/custom.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/css/nprogress.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/green.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath }/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" type="text/css">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" type="text/css"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">
 
	<!-- zTree -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/css/vendors/zTree/css/demo.css" type="text/css">  --%>
    <link href="${pageContext.request.contextPath }/css/build/css/demo.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/vendors/zTree/css/metroStyle/metroStyle.css" type="text/css">

  
  
   

   
    
    
	
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
  <!--   <include file="Public/left" /> -->
  <jsp:include page="/Index/left.do"></jsp:include>
        <!-- top navigation -->
        <!-- <include file="Public/top" /> -->
        <%@ include file="../Public/top.jsp" %>
        <!-- /top navigation -->
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3> 组织架构管理 </h3>
                    </div>
                </div>
                <div class="clearfix"></div>
                 <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2> 部门院系分类 </h2>
                            <!-- <ul class="nav navbar-right panel_toolbox">
                                <button type="button" class="btn btn-success" onclick="window.location='__URL__/sys/'">同步部门信息</button>

                            </ul> -->
                              <button  data-toggle="modal" data-target="#add_two_box" STYLE="float: right;border-style:none;background-color: #fff">
                              <a class="btn btn-success" href="javascript:;" onclick="sava(${co.id})" ><i class="fa fa-plus-square-o"></i> 添加部门</a></button>
                            <div class="clearfix"></div>
                        </div>
     <div class="x_content">
                            <!--中间内容-->
      
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel" style="border-style:none">
                        <div class="x_content"> <br />
                             <div class="row form-inline form-group col-md-12 col-sm-12 col-xs-12" style="padding: 0">
                              <div class="content_wrap" style="width:100%;padding: 0">
   	 								<div class="zTreeDemoBackground left" style="width:100%;padding: 0;height: 70%;margin-left: 0.8%">
        							<ul id="treeDemo" class="ztree" style="width:100%;height: 100%;font-weight: 900 ;background-color: 	#FFFFF9"></ul>
    								</div>
    						</div>
                        </div>
                        </div>
                        
                        <div class="x_content" ></div>
                       <%--  <div class="x_content" >
                        
                        <button  class="btn btn-default sort_div add_sort_button" data-toggle="modal" data-target="#add_two_box">
                              <a class="btn btn-success" href="javascript:;" onclick="sava(${co.id})" ><i class="fa fa-plus-square-o"></i> 添加院系</a></button>
                      <!--   <button type="button" class="btn btn-success" id="addLeaf" onclick="return false;">添加院系子节点</button> -->
                        <!-- <button  class="btn btn-default sort_div add_sort_button" data-toggle="modal" data-target="#add_two_box2">
					      <a class="btn btn-success" href="javascript:;" id="addLeaf" onclick="return false;" ><i class="fa fa-plus-square-o"></i> 添加院系子节点</a></button>  
					       -->
					     <!--  <button  class="btn btn-default sort_div add_sort_button" >
					      <a class="btn btn-success" href="javascript:;" id="delLeaf" onclick="return false;" >删除节点</a></button>   -->
                        </div>
                          
                        </div> --%>
                    </div>
                </div>
            </div>
        
    </div>
  <!--  -->
                    </div>
                </div>
               
        </div>
    </div>
    <!-- ******************************************************************************************************************************************************************************************** -->
    <!-- 弹出 添加一级的弹窗-->
    <div id="add_two_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">部门/岗位添加</h4>
                </div>
                <form  id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left "   method="post"  action="${path}/YzElement/savaLevelOne.do">
                <div class="modal-body">
                    <div id="testmodal" style="padding: 5px 20px;">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">标题</label>
                            <div class="col-sm-9">
                                <input type="text" required="required"  class="form-control" id="title" name="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性质</label>
                            <div class="col-sm-9">
                                <select name="sort" id="sort" required="required" class="form-control">
                                    <option value="0">请选择</option>
                                    <option value="1">二级单位</option>
                                    <option value="2">分院</option>
                                    <option value="9">职位</option>
                                    <option value="3">专业</option>
                                    <option value="4">班级</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">排序</label>
                            <div class="col-sm-9">
                                <input type="text" required="required"  class="form-control" id="rank" name="rank">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary antosubmit" >提交</button>
                </div>
                
                </form>
            </div>
        </div>
    </div>
    
    <!-- ******************************************************************************************************************************************************************************************** -->
    <!-- 弹出 二级的弹窗-->
    <div id="add_two_box2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">部门/岗位添加</h4>
                </div>
                <form  id="demo-form2" onsubmit="return osb()" class="form-horizontal form-label-left "   method="post"  action="${path}/YzElement/savaLevelTwo.do">
                <div class="modal-body">
                    <div id="testmodal" style="padding: 5px 20px;">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">标题</label>
                            <div class="col-sm-9">
                                <input type="text" required="required"  class="form-control" id="title" name="title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性质</label>
                            <div class="col-sm-9">
                                <select name="sort" id="sort" required="required" class="form-control">
                                    <option value="0">请选择</option>
                                    <option value="1">二级单位</option>
                                    <option value="2">分院</option>
                                    <option value="9">职位</option>
                                    <option value="3">专业</option>
                                    <option value="4">班级</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">排序</label>
                            <div class="col-sm-9">
                                <input type="text" required="required"  class="form-control" id="rank" name="rank">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                	<input type="hidden" name="elementId" id="elementId" value="" > 
                    <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary antosubmit" >提交</button>
                </div>
                <!-- <input type="hidden" name="level" id='level' value='1'>
                <input type="hidden" name="pid" id='pid' value='0'> -->
                 
                 <!--    <input type="hidden" name="pid_sort" id="pid_sort" value="0"> -->
                </form>
            </div>
        </div>
    </div>
    </div>
    </div>
       <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
  <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
  <script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  
<script src="${pageContext.request.contextPath }/js/jquery.autocompleter/jquery.autocompleter.js"></script> 
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath }/css/vendors/iCheck/icheck.min.js"></script>
  <!--  <script src="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.js"></script>-->
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath }/css/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/css/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Custom Theme Scripts -->
     <script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script> 
     <!--<script src="${pageContext.request.contextPath }/css/build/js/plan.js"></script>-->
     <script type="text/javascript" src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.core.js"></script>  
   <script type="text/javascript" src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.excheck.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.exedit.js"></script>
     <SCRIPT type="text/javascript">
     var setting = {
             view: {
                 addHoverDom: addHoverDom,
                 removeHoverDom: removeHoverDom,
                 dblClickExpand : false,
     			selectedMulti : false

             },
             check: {
                 enable: false
             },
             data: {
                 simpleData: {
                     enable: true
                 }
             },
             edit: {
                 enable: true,
                 removeTitle:"删除",		
     			renameTitle:"重命名"	
             },
             callback : {
     			beforeEditName: beforeEditName,	// 用于捕获节点编辑按钮的 click 事件，并且根据返回值确定是否允许进入名称编辑状态
     			beforeRemove: beforeRemove,		// 用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
     			beforeRename: beforeRename,		// 用于捕获节点编辑名称结束（Input 失去焦点 或 按下 Enter 键）之后，更新节点名称数据之前的事件回调函数，并且根据返回值确定是否允许更改名称的操作
     			
     		}

         };

         var zNodes = ${ja};

         var log, className = "dark";

         $(document).ready(function(){
             $.fn.zTree.init($("#treeDemo"), setting, zNodes);
         });
         // 在进行重命名之前，进行一下确认
         function beforeEditName(treeId, treeNode) {
         	className = (className === "dark" ? "":"dark");
         	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
         	zTree.selectNode(treeNode);
         	return confirm("确认要重命名 " + treeNode.name + " 吗？");
         }
         // 删除操作
         function beforeRemove(treeId, treeNode) {
         	className = (className === "dark" ? "":"dark");
         	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
         	zTree.selectNode(treeNode);
         	var isDel=confirm("确认删除 " + treeNode.name + " 吗？");
         	
         	var isDeled=false;
         	if (isDel) {
         		window.location.href="${path}/YzElement/delete.do?id="+treeNode.id;	
         	}else{
         		return false;
         	}
         }
          
         // 重命名操作
         function beforeRename(treeId, treeNode, newName, isCancel) {
         	className = (className === "dark" ? "":"dark");
         	
         	if (newName.length == 0 ) {
         		alert("节点名称不能为空.");
         		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
         		setTimeout(function(){zTree.editName(treeNode)}, 10);
         		return false;
         	}else{
         		var msg = "确认要修改这个节点吗?";
        		
        		if(confirm(msg)==true){
        			window.location.href="${path}/YzElement/update.do?id="+treeNode.id+"&name="+encodeURI(encodeURI(newName));
        		}else{ 
        		    return false; 
        		   } 		
         		
         	}
         }

    
         var newCount = 1;
         function addHoverDom(treeId, treeNode) {
             var sObj = $("#" + treeNode.tId + "_span");
             if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
             var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                 + "' title='add node' data-toggle='modal' data-target='#add_two_box2' onfocus='this.blur();'></span>";
             $("#elementId").val(treeNode.id);
             sObj.after(addStr);

         };
         
         function removeHoverDom(treeId, treeNode) {
             $("#addBtn_"+treeNode.tId).unbind().remove(); 
         };
         
		
	</SCRIPT>          
</body>
</html>
