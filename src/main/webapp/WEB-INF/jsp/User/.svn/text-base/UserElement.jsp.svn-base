<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../js/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> </title>
    
   
   
   <link href="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath }/css/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath }/css/jquery.autocompleter.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath }/css/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath }/css/build/css/custom.min.css" rel="stylesheet">
   <script src="${pageContext.request.contextPath }/css/vendors/jquery/dist/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath }/js/user_element.js"></script>
    
    <script type="text/javascript">
    $(function(){
      var isSuccess = $("#isSuccess").val();
      if(isSuccess=="Success"){
    	  alert("分配成功~！")
      }
    	
      var opt = $("#result").val();
     
       if(opt=="no"){
    	 var dom = '<div class="form-group" id ="fir">'+
             '<label class="control-label col-md-1 col-sm-3 col-xs-12">部门</label>'+
             '<div class="col-md-2 col-sm-3 col-xs-12">'+
                 '<select class="form-control one_select" name="levelOne" onchange="onelChangeS()"  id="onel">'+
                   '<option value="-1">请选择</option>'+
                    '<c:forEach items="${allJoinList }" var="yzElement">'+
                      '<option value="${yzElement.id }" >${yzElement.title } </option>'+
                    '</c:forEach>'+
                     '<option value="${vs.index }" id="index"  style="display:none;"></option>'+
                 '</select>'+
             '</div>'+
             '<div class="col-md-2 col-sm-3 col-xs-12">'+                                                          
                 '<select class="form-control one_select" name="levelTwo" onchange="onelChangeS1()"  id="twol${vs.index }">'+
                   '<option value="-1">请选择</option>'+
                     '<c:forEach items="${element.list }" var="levelTwo">'+
                     '<option  value="${levelTwo.id}" >${levelTwo.title }</option>'+
                      '</c:forEach>'+
                 '</select>'+
             '</div>'+
             '<div class="col-md-2 col-sm-3 col-xs-12">'+
                 '<select class="form-control one_select" name="levelThree"  id="threel${vs.index }">'+
                       '<option value="-1">请选择</option>'+
                         '<c:forEach items="${element.list }" var="levelTwo">'+
                          '<c:forEach items="${levelTwo.list }" var="levelthree">'+
                       '<option id="threeTwo" value="${levelthree.id }" >${levelthree.title }</option>'+
                          '</c:forEach>'+
                         '</c:forEach>'+
                '</select>'+
             '</div>'+
              '<button type="button" onclick="copy()" class="btn btn-success add">新增</button>'+
               '<button type="button" onclick="deleteDom($(this))" class="btn btn-danger del"> 删除</button>'+
            '</div>';
            $("#mydiv").html(dom);
       };
      
    });
    
    /* function sbm(){
    	$("select[name='levelOne'] option:selected").each(function(){
    		var re = $(this).val();
    		
    	})
    	
    } */
    
    
    function onelChange(index){
    	var f = '<option value="-1">请选择</option>';
    	
    	var id = $("#onel"+index).val();
    	
    	$("#twol"+index).empty();
    	$("#twol"+index).html(f);
    	$("#threel"+index).empty();
    	$("#threel"+index).html(f);
    	$.ajax({
    		url:"${path}/Teacher/getLevelData.do?id="+id,
    		type:"get",
    		dataType:"json",
    		success: function(result){
    			var doc  = "<option value='-1'>请选择</option>";
    			/* str(string).replace("'",singlequote) */
    			for(var i = 0;i<result.length;i++){
    				
    				 var re1 = JSON.stringify((result[i]).title);
    				
    			var a =	re1.replace("\"","");
    			var b =	a.replace("\"","");
    			      
    				var d = "<option value="+"'"+ JSON.stringify((result[i]).id) +"'"+ ">"+b+"</option>";  
    				
    				doc = doc + d ;
    				$("#twol"+index).html(doc);
    				
    			}
    	    }
    	});
    }
    
    
function onelChange1(index){
	    var f = '<option value="-1">请选择</option>';
	    
    	var id = $("#twol"+index).val();
    	
    	$("#threel"+index).empty();
    	$("#threel"+index).html(f);
    	
    	$.ajax({
    		url:"${path}/Teacher/getLevelData1.do?id="+id,
    		type:"get",
    		dataType:"json",
    		success: function(result){
    			var doc  = "<option value='-1'>请选择</option>";;
    			/* str(string).replace("'",singlequote) */
    			for(var i = 0;i<result.length;i++){
    				
    				 var re1 = JSON.stringify((result[i]).title);
    				
    			var a =	re1.replace("\"","");
    			var b =	a.replace("\"","");
    			
    				var d ="</option>"+ "<option value="+"'"+ JSON.stringify((result[i]).id) +"'"+ ">"+b+"</option>";       
    				doc = doc + d ;
    				$("#threel"+index).html(doc);
    			}
    	    }
    	});
    	
    }
    function onelChangeS(){
    	
    	var f = '<option value="-1">请选择</option>';
    	var id = $("#onel option:selected").val();
    	$("#twol").empty();
    	$("#twol").html(f);
    	$("#threel").empty();
    	$("#threel").html(f);
    	$.ajax({
    		url:"${path}/Teacher/getLevelData.do?id="+id,
    		type:"get",
    		dataType:"json",
    		success: function(result){
    			var doc  = "<option value='-1'>请选择</option>";
    			/* str(string).replace("'",singlequote) */
    			for(var i = 0;i<result.length;i++){
    				
    				 var re1 = JSON.stringify((result[i]).title);
    				
    			var a =	re1.replace("\"","");
    			var b =	a.replace("\"","");
    			      
    				var d = "<option value="+"'"+ JSON.stringify((result[i]).id) +"'"+ ">"+b+"</option>";  
    				
    				doc = doc + d ;
    				$("#twol").html(doc);
    				
    			}
    	    }
    	});
    }
    
    
function onelChangeS1(){
	    var f = '<option value="-1">请选择</option>';
	    
    	var id = $("#twol"+index).val();
    	
    	$("#threel"+index).empty();
    	$("#threel"+index).html(f);
    	
    	$.ajax({
    		url:"${path}/Teacher/getLevelData1.do?id="+id,
    		type:"get",
    		dataType:"json",
    		success: function(result){
    			var doc  = "<option value='-1'>请选择</option>";;
    			/* str(string).replace("'",singlequote) */
    			for(var i = 0;i<result.length;i++){
    				
    				 var re1 = JSON.stringify((result[i]).title);
    				
    			var a =	re1.replace("\"","");
    			var b =	a.replace("\"","");
    			
    				var d ="</option>"+ "<option value="+"'"+ JSON.stringify((result[i]).id) +"'"+ ">"+b+"</option>";       
    				doc = doc + d ;
    				$("#threel"+index).html(doc);
    			}
    	    }
    	});
    	
    }
    
    function copy(){
    	
    	var docum = $("#copy_div");
    	var docCopy = docum.clone(true);
    	//$("#mydiv").html(docCopy);
    	$("form div").each(function(){
    		$(this).attr("style","");
    	});
    	
    }
    
    function deleteDom(obj){
    	
    	obj.parent().remove();
    	
    } 
    
    </script>
    
</head>

<body class="nav-md">
<input type="hidden" id= "result" value="${opt }">
<div class="container body">
    <div class="main_container">
       <!--  <include file="Public/left" /> -->
       <jsp:include page="/Index/left.do"></jsp:include>
        <!-- top navigation -->
        <!-- <include file="Public/top" /> -->
        <%@ include file="../Public/top.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>部门配置 <small>提示信息</small></h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                    <input type="hidden" id="isSuccess" value="${Success }" >
                    <form id="demo-form2"  class="form-horizontal form-label-left " id="myForm" method="post"  action="${path}/Teacher/updateUserElement.do">
                    <div id = "mydiv"></div>
                      <c:forEach items="${yzUser.list }" var="element" varStatus="vs" >
                         
                            <div class="form-group" id = "fir" >
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">部门</label>
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">
                                    <select class="form-control one_select" name="levelOne" onchange="onelChange('${vs.index }')"  id="onel${vs.index }">
                                    
                                      <option value='-1'>请选择</option>
                                      
                                      <!-- <volist name="e_list.1" id="vo"> -->
                                       <c:forEach items="${allJoinList }" var="yzElement"> 
                                         <option  value="${yzElement.id }" <c:if test="${element.id == yzElement.id }">selected="selected"</c:if> >${yzElement.title } </option>
                                       </c:forEach>
                                        <option value="${vs.index }" id="index"  style="display:none;"></option>
                                    </select>
                                </div>
                                
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">                                                          
                                    <select class="form-control one_select" name="levelTwo" onchange="onelChange1('${vs.index }')"  id="twol${vs.index }">
                                      
                                       <%--  <option value='-1'>请选择</option> --%>
                                         <c:forEach items="${element.list }" var="levelTwo">
                                        <option  value="${levelTwo.id}" >${levelTwo.title }</option>
                                         </c:forEach>
                                        
                                        <!-- <option value="-1"  style="display:none;"></option> -->
                                    </select>
                                </div>
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">
                                    <select class="form-control one_select" name="levelThree"  id="threel${vs.index }">
                                        <!-- <option value='-1'>请选择</option> -->
                                            <c:forEach items="${element.list }" var="levelTwo">
                                             <c:forEach items="${levelTwo.list }" var="levelthree">
                                          <option  value="${levelthree.id }" >${levelthree.title }</option>
                                             </c:forEach>
                                            </c:forEach>
                                    </select>
                                </div>
                                
                                  <button type="button" onclick="copy()" class="btn btn-success add">新增</button>
                                 <button type="button" onclick="deleteDom($(this))" class="btn btn-danger del"> 删除</button> 
                                  
                            </div>
                            
                            </c:forEach>
   <!--                              -->
                              
                            <%-- <div class="form-group" id = "fir" >
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">部门</label>
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">
                                    <select class="form-control one_select" name="levelOne" onchange="onelChange('${vs.index }')"  id="onel${vs.index }">
                                    
                                      <option value='-1'>请选择</option>
                                      
                                      <!-- <volist name="e_list.1" id="vo"> -->
                                       <c:forEach items="${allJoinList }" var="yzElement"> 
                                         <option value="${yzElement.id }" >${yzElement.title } </option>
                                       </c:forEach>
                                        <option value="${vs.index }" id="index"  style="display:none;"></option>
                                    </select>
                                </div>
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">                                                          
                                    <select class="form-control one_select" name="levelTwo" onchange="onelChange1('${vs.index }')"  id="twol${vs.index }">
                                      <option value='-1'>请选择</option>
                                         <c:forEach items="${element.list }" var="levelTwo">
                                        <option  value="${levelTwo.id}" >${levelTwo.title }</option>
                                         </c:forEach>
                                        
                                        <!-- <option value="-1"  style="display:none;"></option> -->
                                    </select>
                                </div>
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">
                                    <select class="form-control one_select" name="levelThree"  id="threel${vs.index }">
                                          <option value='-1'>请选择</option>
                                            <c:forEach items="${element.list }" var="levelTwo">
                                             <c:forEach items="${levelTwo.list }" var="levelthree">
                                          <option id="threeTwo" value="${levelthree.id }" >${levelthree.title }</option>
                                             </c:forEach>
                                            </c:forEach>
                                        
                                    </select>
                                </div>
                                
                                  <button type="button" onclick="copy()" class="btn btn-success add">新增</button>
                                  <button type="button" onclick="deleteDom($(this))" class="btn btn-danger del"> 删除</button>
                               </div> --%>
                         
                         
                        <%--  </c:if> --%>
    
                            <input type="hidden" name="userId" value="${yzUser.id }">
                             <div class="x_content">
                                <button type="submit" class="btn btn-success">提交</button>
                               <%-- <button type="button" class="btn btn-success" onclick="${path}/Teacher/listTeacher.do">返回</button> --%>
                               <a class="btn btn-success" href="${path}/Teacher/listTeacher.do">返回</a>
                            </div>
                           
                      </form> 
                           
                    
          <!-- ******************************** -->          
                    
                          <div class="form-group" style="display:none;" id = "copy_div">
                                <label class="control-label col-md-1 col-sm-3 col-xs-12">部门</label>
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">
                                    <select class="form-control one_select" name="levelOne" onchange="onelChange('${vs.index }')"  id="onel${vs.index }">
                                    
                                      <option value='0'>请选择</option>
                                      
                                      <option value='-1'>请选择</option>
                                       <c:forEach items="${allJoinList }" var="yzElement"> 
                                         <option value="${yzElement.id }" <c:if test="${element.id == yzElement.id }">selected="selected"</c:if> >${yzElement.title } </option>
                                       </c:forEach>
                                        <option value="${vs.index }" id="index"  style="display:none;"></option>
                                    </select>
                                </div>
                                
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">                                                          
                                    <select class="form-control one_select" name="levelTwo" onchange="onelChange1('${vs.index }')"  id="twol${vs.index }">
                                       <option value='-1'>请选择</option>
                                         <c:forEach items="${element.list }" var="levelTwo">
                                        <option velTwo" value="${levelTwo.id}" >${levelTwo.title }</option>
                                         </c:forEach>
                                        
                                       <!--  <option value="-1"  style="display:none;"></option> -->
                                    </select>
                                </div>
                                
                                <div class="col-md-2 col-sm-3 col-xs-12">
                                    <select class="form-control one_select" name="levelThree"  id="threel${vs.index }">
                                          <option value='-1'>请选择</option>
                                            <c:forEach items="${element.list }" var="levelTwo">
                                             <c:forEach items="${levelTwo.list }" var="levelthree">
                                          <option id="threeTwo" value="${levelthree.id }" >${levelthree.title }</option>
                                             </c:forEach>
                                            </c:forEach>
                                       <!--  <option value="-1"  style="display:none;"></option> -->
                                    </select>
                                </div>
                                
                                        <button type="button" onclick="copy()" class="btn btn-success add">新增</button>
                                        <button type="button" onclick="deleteDom($(this)) " class="btn btn-danger del">删除</button>
                            </div>
                            
                    
                      
    </div>
</div>
</div>
</div>
</div>
</div>


<script src="${pageContext.request.contextPath }/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- <script src="/js/jquery.autocompleter/jquery.autocompleter.js"></script> -->

<script src="${pageContext.request.contextPath }/css/build/js/custom.js"></script>


</body>
</html>
