<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@taglib prefix="s" uri="/struts-tags"%> --%>
<script type="text/javascript">
$(function() {
	

	//获得总页数和当前页码
	var totalPage = parseInt($("#totalPage").val());
	var pageNo = parseInt($("#cpageNo").val());
	/* var pageNo = parseInt($("#pageNo").val()); */
	if(pageNo == 1 && totalPage == 1){
		$("#fir").hide();
		$("#pre").hide();
		$("#next").hide();
		$("#last").hide();
	}else if(pageNo == 1 && totalPage > pageNo){
		$("#fir").hide();
		$("#pre").hide();
		$("#next").show();
		$("#last").show();
	}else if(pageNo > 1 && totalPage > pageNo){
		$("#fir").show();
		$("#pre").show();
		$("#next").show();
		$("#last").show();
	}else if(pageNo > 1 && totalPage == pageNo){
		$("#fir").show();
		$("#pre").show();
		$("#next").hide();
		$("#last").hide();
	}
	
	$("#next").click(function(){
		pageNo = pageNo+1;
		/* $("form:first").submit(); */
		window.location.href = "${path}/YzElement/listYzElement.do?sort=${sort}&pageNo="+pageNo;
	})
	
	$("#pre").click(function(){
		pageNo = pageNo-1;
		/* $("form:first").submit(); */
		window.location.href = "${path}/YzElement/listYzElement.do?sort=${sort}&pageNo="+pageNo;
	})
	
	
	$("#fir").click(function(){
		 /* $("form:first").submit();  */
		window.location.href = "${path}/YzElement/listYzElement.do?sort=${sort}&pageNo="+1;
	});
	
	$("#last").click(function(){
		
		/* $("form:first").submit(); */
		window.location.href = "${path}/YzElement/listYzElement.do?sort=${sort}&pageNo="+totalPage;	
	})
	
	
	$("#jump").click(function(){
		var selectPageNo = $("#selectPage").val();
		
		var reg = /^\d{0,}$/;
		if(!reg.test(selectPageNo)){
			alert("请输入1到"+totalPage+"数字");
		}else{
			var selectPageNoNum = parseInt(selectPageNo);
			if(selectPageNoNum < 1 || selectPageNoNum > totalPage){
				alert("请输入1到"+totalPage+"数字");
			}else{
				$("#cpageNo").val(selectPageNo);
				/* $("form:first").submit(); */
				window.location.href = "${path}/YzElement/listYzElement.do?sort=${sort}&pageNo="+selectPageNo;
			};
			
		};
		
	});
	
});

  function jumpFif(pageNo){
	  
	  window.location.href = "${path}/YzElement/listYzElement.do?sort=${sort}&pageNo="+pageNo;
  }
  
function jumpNext(pageNo){
	  
	  window.location.href = "${path}/YzElement/listYzElement.do?sort=${sort}&pageNo="+pageNo;
  }

 

</script>
<br/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
					
	<tr>
		<td width="51%">&nbsp;
			<!-- 
				用两个隐藏去来计算是否展示哪些按钮
			 -->
			<input type="hidden" id="totalPage" value="${page.totalPage}">
			<input type="hidden" id="cpageNo" value="${page.pageNo}">
			<!-- <input type="hidden" id="pageNo" name="pageNo" > -->
		</td>
		<td width="13%">共 ${page.totalCount}条记录
		<td width="6%">
			<input type="button"   id="fir" value="首页">
		</td>
		<td width="6%">
			<input type="button"   id="pre" value="上一页">
		</td>
		<td width="6%">
			<input type="button"   id="next" value="下一页">
		</td>
		<td width="6%">
			
			<input type="button"   id="last" value="尾页">
		</td>
		<td>
			
			<input type="text"  name="pageNo"  id="selectPage" >
		</td>
		<td >
			
			<input type="button" name="pageNo"  id="jump" value="跳转">
		</td>
		<td width="12%">当前第<span style="color:red;"> ${page.pageNo}</span>/  ${page.totalPage} 页</td>
	</tr>
</table>
