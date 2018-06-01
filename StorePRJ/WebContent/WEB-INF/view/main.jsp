<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>우리동네 상권분석</title>

<style>
canvas { 
  height: 100vh; 
  width: 98vw; 
  display: block;
}
</style>

<!-- Bootstrap core CSS -->
<link href="/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- button css -->	
<link href="/bootstrap/css/bttn.css"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/bootstrap/css/business-casual.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/bootstrap/css/myStyle.css" rel="stylesheet">

</head>

<body>
<%@include file="/common/top.jsp"%>

<div style="text-align:center">
		<button class="bttn-unite bttn-md bttn-primary" id="start" style="font-size:40px">시작하기</button>
		<canvas id="canvas" width="1900" height="600"></canvas>
		<span>made by PilWon</span>
</div>


	<!-- Bootstrap core JavaScript -->
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="/common/js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/common/js/top.js"></script>
	<script src="/common/js/mainJs.js"></script>




</body>
</html>
