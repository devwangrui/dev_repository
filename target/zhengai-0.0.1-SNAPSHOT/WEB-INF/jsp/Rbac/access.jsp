<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>

<!DOCTYPE html>
<html lang="en">
<c:set var="path" value="${pageCotext.request.contextPath }"></c:set>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>权限管理</title>

    <!-- Bootstrap -->
    <!--<link href="__ROOT__/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <!-- Font Awesome -->
    <!--<link href="__ROOT__/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="__ROOT__/js/jquery.autocompleter/jquery.autocompleter.css" rel="stylesheet">-->
    <!-- Custom Theme Style -->
    <!-- iCheck -->
    <!--<link href="__ROOT__/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="__ROOT__/build/css/custom.min.css" rel="stylesheet">
    <link href="__ROOT__/build/css/node.css" rel="stylesheet">-->
    
    
    
        
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/vendors/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
  

</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
         <jsp:include page="/Index/left.do"></jsp:include>
       <%@ include file="../Public/top.jsp" %>
  		<include ></include>
        <!-- page content -->
        <div class="right_col" >
            <!-- top tiles -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>配置节点 <small>提示信息</small></h2>

                        <div class="clearfix"></div>
                    </div>

                   <div class="x_content">
                   <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left "   novalidate="" method="post"  action="${pageContext.request.contextPath }/Rbac/insert.do">
                   
                   <div class="zTreeDemoBackground left" style="height:60%;width:50%;">
						<ul id="treeDemo" class="ztree" style="height:70%;width:40%;margin-left:20%;"></ul>
					</div>
					<div class="right" >
						<ul class="info" style="list-style-type: none;margin-top: 15%">
					
							<li style="list-style-type: none"><span style="font-size:18px">节点 改动变化：</span><br/>
								<ul id="log" class="log" style="height:24%;margin-top: 6%">
									<li>当前被勾选的节点共 <span id="checkCount" class="highlight_red"></span> 个</li>
									<li>当前未被勾选的节点共 <span id="nocheckCount" class="highlight_red"></span> 个</li>
									<li>勾选状态对比规则：<input type="radio" id="init" name="stateType" class="radio first"  checked /><span style="color:green">与 初始化时对比</span><br/>
							<input type="radio" id="last" name="stateType" class="radio first"  /><span style="color:green;">与上一次勾选后对比</span></li>
									<li>当前被修改勾选状态的节点共 <span id="changeCount" class="highlight_red"></span> 个</li>
								</ul>
							</li>
							<li style="margin-top:4%;list-style-type: none">
							<input type="hidden" name="userId" value="${role.id}">    	
                        	<input type="hidden" name="rids" id="rids">
         					<button type="submit" class="btn btn-success" style="margin-left:10%;" onclick="sava()">添加</button>
                            <button type="button" class="btn btn-success" style="margin-left:25%;" onclick="window.location.href='${pageContext.request.contextPath }/Rbac/role.do'">返回</button>
							</li>
							
						</ul>
						
                       		
					</div>
						
                   </form>
                   </div>
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
     <SCRIPT type="text/javascript">
     var setting = {
		view: {
			selectedMulti: false
		},
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: onCheck
		}
	};

		var zNodes =${ja};
		
		var clearFlag = false;
		function onCheck(e, treeId, treeNode) {
			count();
			if (clearFlag) {
				clearCheckedOldNodes();
			}
		}
		function clearCheckedOldNodes() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getChangeCheckedNodes();
			for (var i=0, l=nodes.length; i<l; i++) {
				nodes[i].checkedOld = nodes[i].checked;
			}
		}
		function count() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			checkCount = zTree.getCheckedNodes(true).length,
			nocheckCount = zTree.getCheckedNodes(false).length,
			changeCount = zTree.getChangeCheckedNodes().length;
			$("#checkCount").text(checkCount);
			$("#nocheckCount").text(nocheckCount);
			$("#changeCount").text(changeCount);

		}
		function createTree() {
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			count();
			clearFlag = $("#last").attr("checked");
		}

		$(document).ready(function(){
			createTree();			
			$("#init").bind("change", createTree);
			$("#last").bind("change", createTree);
		});
		function fun(){
            var value ="";
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            var nodes =zTree.getCheckedNodes(true);
              for(var i=0;i<nodes.length;i++){
            	  value+=nodes[i].id;
            	  value+=",";
              }
           	return value;
           }
       
       function sava(){
    	   var rid = fun();
       	
       		$("#rids").val(rid);
       		alert("要分配的角色对应的序号是："+$("#rids").val()+" "+"点击确定可以完成角色分配");
       	}
		
	</SCRIPT>          
  </body>
</html>
