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
    <title>模板配置</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/vendors/zTree/css/demo.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/vendors/zTree/css/zTreeStyle/zTreeStyle.css">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
    <!--mystyle-->
    <style>
        .button{
            padding: 0;
        }
    </style>


<body class="nav-md">
<div class="container body">
   <!--  <include file="Public/left" /> -->
   <jsp:include page="/Index/left.do"></jsp:include>
    <!-- top navigation -->
   <!--  <include file="Public/top" /> -->
   <%@ include file="../Public/top.jsp" %>

        <!--中间内容-->
        <div class="right_col" role="main">
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>指标分配<small>当前位置/指标匹配/选择课程/指标分配</small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content"> <br />
                            <div class="row form-inline form-group col-md-12 col-sm-12 col-xs-12">
                                <div class="btn btn-default" style="width: 150px;">${yzTargetView.title}</div>
                            </div>
                            <div class="row form-inline form-group col-md-12 col-sm-12 col-xs-12">
                                <div style="float:left;">
                                    <ul id="target" class="ztree" style="width: 360px;"></ul>
                                </div>
                                <div style="float:left;margin-left: 20px;">
                                    <ul id="target_selected" class="ztree" style="width: 360px;"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="x_content">
                            <button type="button" class="btn btn-primary" onclick="window.location='${pageContext.request.contextPath }/YzTargetView/listYzTargetView.do'">返回</button>
                            <button type="button" class="btn btn-success" id="save">保存</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </div>
    <!-- /page content -->
<div>
<input type="hidden" id="id" value="${yzTargetView.id}">
</div>


<!-- jQuery -->
<script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.core.min.js"></script>
<script src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.excheck.js"></script>
<script src="${pageContext.request.contextPath }/css/vendors/zTree/js/jquery.ztree.exedit.js"></script>
<!-- {$t_data}{$check_t_data}{$check_node_data} -->

<script type="text/javascript">


window.onload = function(){
   
	
	var setting = {
            edit: {
                enable: true,
                showRemoveBtn: false,
                showRenameBtn: false,
                drag : {
                    isCopy : true,
                    isMove : false,
                }
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                beforeDrag: beforeDrag,
                beforeDrop: beforeDrop
            }
        };

        var check_setting = {
            edit: {
                enable: true,
                showRemoveBtn: true,
                showRenameBtn: false,
                drag : {
                    isCopy : false,
                    isMove : false,
                }
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                beforeDrag: beforeDrag,
                beforeDrop: beforeDrop,
                beforeRemove: beforeRemove
            }
        }

        var zNodes = ${ja};
        
        var checkNodes = ${ja2};
        
        var check_node_data= [];
       
        if(check_node_data != null){
            var sNodes = check_node_data;
        }else{
            var sNodes = [];
        }

        var before_id = '';
        
        function beforeDrag(treeId, treeNodes) {
            for (var i=0,l=treeNodes.length; i<l; i++) {
                if (treeNodes[i].drag === false) {
                    return false;
                }
            }
            return true;
        }
        
      
        
        function beforeDrop(treeId, treeNodes, targetNode, moveType) {
        	
            return targetNode ? targetNode.drop !== false : true;
        }

        var del_arr = [];
        function beforeRemove(treeId, treeNodes){
            console.log(sNodes);
            
           /*  var del_arr = []; */
            if(treeNodes['rlevel'] == 1){
                for(var i = 0; i < treeNodes['children'].length; i++){
                    if(treeNodes['children'][i]['children'] != undefined){
                        for(var y = 0; y < treeNodes['children'][i]['children'].length; y++){
                            var del_id = treeNodes['children'][i]['children'][y]['id'];
                            del_arr.push(del_id);
                        }
                    }
                }
            }else if(treeNodes['rlevel'] == 2){
            	
                for(var i = 0; i < treeNodes['children'].length; i++){
                    var del_id = treeNodes['children'][i]['id'];
                    del_arr.push(del_id);
                }
            }else{
            	
                var del_id = treeNodes['id'];
                del_arr.push(del_id);
            }
            for(var i = 0; i < del_arr.length; i++){
                var index = sNodes.indexOf(del_arr[i]);
                sNodes.splice(index, 1);
            }
            console.log(sNodes);
        }
    
    
    /* ********************************************* */

        
    $(document).ready(function(){
    	
        $.fn.zTree.init($("#target"), setting, zNodes);
        $.fn.zTree.init($("#target_selected"), check_setting, checkNodes);
       
     

        $("#save").click(function(){
        	
        	
            var id = $("#id").val();
            
            var zTree = $.fn.zTree.getZTreeObj("target_selected");
            
            var TreeNodes = zTree.getNodes();
          
            var li= [];
            for(var i=0;i<TreeNodes.length;i++){	
        		var jId = TreeNodes[i].level;
        		var idStr = JSON.stringify(jId);
        		alert(idStr)
        		li.push(idStr);
        		
            	} 
            
           
            	
            		//window.location.href = "${path}/YzTargetView/configTarget.do?id="+id+"&ids1="+ids1+"&ids2="+ids2+"&ids3="+ids3;
            	
            
        });
    }); 
 };




</script>
<!--必要-->
<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>
</body>

</html>