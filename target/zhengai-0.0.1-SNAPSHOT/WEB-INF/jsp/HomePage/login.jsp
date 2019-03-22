<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../../../js/taglibs.jsp" %>


<!DOCTYPE html>

<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>用户登录</title>

	<link rel="stylesheet" type="text/css" href="/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="/css/default.css">
	<script src='js/prefixfree.min.js'></script>
	<link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<body>
<div id="logo">
	<h1 class="hogo"><i> 信远智慧诊改系统</i></h1>
</div>
<section class="stark-login">
	<form action="${path}/PageHome/toLogin" method="post">
		<div id="fade-box">
			<input type="text" name="username" id="用户名" placeholder="用户名" required>
			<%--<input type="password" name ="password" placeholder="密码" required>--%>

			<button>登录</button>
		</div>
	</form>
	<div class="hexagons">
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<br>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<br>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>

		<br>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<br>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
		<span>&#x2B22;</span>
	</div>
</section>

<div id="circle1">
	<div id="inner-cirlce1">
		<h2> </h2>
	</div>
</div>
<ul>
	<li></li>
	<li></li>
	<li></li>
	<li></li>
	<li></li>
</ul>

</body>
</html>



