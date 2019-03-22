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
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/css/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath }/css/vendors/animate.css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/build/css/custom.css" rel="stylesheet" type="text/css">

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- iCheck -->
<link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet" type="text/css">

     <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet" type="text/css">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/css/nprogress.css" rel="stylesheet" type="text/css">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/green.css" rel="stylesheet" type="text/css">
	
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath }/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" type="text/css">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath }/css/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" type="text/css">
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/fonts/fontawesome-webfont.ttf?v=4.6.3" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/fonts/fontawesome-webfont.woff?v=4.6.3" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/fonts/fontawesome-webfont.woff2?v=4.6.3" rel="stylesheet" type="text/css">
    <link  href="${pageContext.request.contextPath }/css/baiduedit.css" rel="stylesheet" type="text/css" > 
    <!-- ztree -->
    <link href="${pageContext.request.contextPath }/css/vendors/zTree/css/demo.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/vendors/zTree/css/metroStyle/metroStyle.css">
   
 
   
    <!-- Custom Theme Style -->
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <style type="text/css">
</style>
  <SCRIPT type="text/javascript">
        
        var setting = {
            view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
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
                enable: true
            }
        };

        var zNodes = ${ja};

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });

        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
                return false;
            });
        };
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };
       
    </SCRIPT>

   <!--  <script type="text/javascript">
    
    function osb(){
    	
    	var id = $("#elementId").val();
    	
    	if(id==-1){
    		alert("添加子节点之前，请先在树状表里点击指定一个对应的父节点");
    		return false;
    	}else{
    		return true;
    	}
    }
    
    window.onload = function(){
        var setting = {
		view: {
			selectedMulti: false
		},
		edit: {
			enable: true,
			showRemoveBtn: false,
			showRenameBtn: false
		},
		data: {
			keep: {
				parent:true,
				leaf:true
			},
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeDrag: beforeDrag,
			beforeRemove: beforeRemove,
			beforeRename: beforeRename,
			onRemove: onRemove
		}
	};

	var zNodes = ${ja};
	var zNodes1 = "";
	var log, className = "dark";
	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	function beforeRemove(treeId, treeNode) {
		className = (className === "dark" ? "":"dark");
		showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
	}
	function onRemove(e, treeId, treeNode) {
		showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	}
	function beforeRename(treeId, treeNode, newName) {
		if (newName.length == 0) {
			alert("节点名称不能为空.");
			var zTree = $.fn.zTree.getZTreeObj("target");
			setTimeout(function(){zTree.editName(treeNode)}, 10);
			return false;
		}
		return true;
	}
	function showLog(str) {
		if (!log) log = $("#log");
		log.append("<li class='"+className+"'>"+str+"</li>");
		if(log.children("li").length > 8) {
			log.get(0).removeChild(log.children("li")[0]);
		}
	}
	function getTime() {
		var now= new Date(),
		h=now.getHours(),
		m=now.getMinutes(),
		s=now.getSeconds(),
		ms=now.getMilliseconds();
		return (h+":"+m+":"+s+ " " +ms);
	}

	var newCount = 1;
	
	function add(e) {
	
		var zTree = $.fn.zTree.getZTreeObj("target"),
		nodes = zTree.getSelectedNodes(),
		
		treeNode = nodes[0];
		
		$("#elementId").val(treeNode.id);
	};
	
	function del(e) {
		var zTree = $.fn.zTree.getZTreeObj("target"),
		nodes = zTree.getSelectedNodes(),
		
		treeNode = nodes[0];
		
		var id = treeNode.id;
		var msg = "确认要删除这个节点吗?";
		
		if(confirm(msg)==true){
			window.location.href="${path}/YzElement/delete.do?id="+id
		}else{ 
		    return false; 
		   } 
		
	};
	
	
	$(document).ready(function(){
		$.fn.zTree.init($("#target"), setting, zNodes);
		
		
		$("#addLeaf").bind("click", {isParent:false}, add);
		$("#delLeaf").bind("click", {isParent:false}, del);
		
		
		
	});
     }
    
   
    
    </script> -->
    
    
    
	
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
                            <ul class="nav navbar-right panel_toolbox">
                                <!--<button type="button" class="btn btn-success" onclick="window.location='__URL__/sys/'">同步部门信息</button>-->

                            </ul>
                            <div class="clearfix"></div>
                        </div>
     <div class="x_content">
                            <!--中间内容-->
      
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_content"> <br />
                            <div class="row form-inline form-group col-md-12 col-sm-12 col-xs-12">
                              <div class="content_wrap">
   	 								<div class="zTreeDemoBackground left">
        							<ul id="treeDemo" class="ztree"></ul>
    								</div>
    						</div>
                        </div>
                        
                        
                        <div class="x_content" >
                        
                        <button  class="btn btn-default sort_div add_sort_button" data-toggle="modal" data-target="#add_two_box">
                              <a class="btn btn-success" href="javascript:;" onclick="sava(${co.id})" ><i class="fa fa-plus-square-o"></i> 添加院系</a></button>
                      <!--   <button type="button" class="btn btn-success" id="addLeaf" onclick="return false;">添加院系子节点</button> -->
                        <button  class="btn btn-default sort_div add_sort_button" data-toggle="modal" data-target="#add_two_box2">
					      <a class="btn btn-success" href="javascript:;" id="addLeaf" onclick="return false;" ><i class="fa fa-plus-square-o"></i> 添加院系子节点</a></button>  
					      
					      <button  class="btn btn-default sort_div add_sort_button" >
					      <a class="btn btn-success" href="javascript:;" id="delLeaf" onclick="return false;" >删除节点</a></button>  
                        </div>
                          
                        </div>
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
                    <button type="button" class="btn btn-default antoclose" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary antosubmit" >提交</button>
                </div>
                <!-- <input type="hidden" name="level" id='level' value='1'>
                <input type="hidden" name="pid" id='pid' value='0'> -->
                 <input type="hidden" name="elementId" id="elementId" value="-1" > 
                 <!--    <input type="hidden" name="pid_sort" id="pid_sort" value="0"> -->
                </form>
            </div>
        </div>
    </div>
    </div>
    </div>
        <script>var _URL_ ;</script>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath }/css/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath }/js/custom.js"></script>
   <script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.core.js"></script>
<%--     <script type="text/javascript" src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.excheck.js"></script> --%>
    <script type="text/javascript" src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.exedit.js"></script>
    

</body>
</html>
