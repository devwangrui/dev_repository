<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.example.zhengai.model.YzUser" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<c:set var="user" value="${pageContext.request.getSession().getAttribute('user') }"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%--<%
    YzUser user =(YzUser) request.getSession().getAttribute("user");
    String name=null;
    if(user!=null){
        name = user.getName();
    }

%>--%>
  <head>
    
    
    <title>My JSP 'taglibs.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
	
    var path ="${path}";
    var user ="${user}";

   </script>
   
   <script type="text/javascript" src="${path }/js/jquery-1.9.1.js"></script>
   <script type="text/javascript" src="${path }/js/zdialog/zDialog.js"></script>
   <script type="text/javascript" src="${path }/js/zdialog/zDrag.js"></script>
   
  </head>
  <body>
  </body>
</html>
