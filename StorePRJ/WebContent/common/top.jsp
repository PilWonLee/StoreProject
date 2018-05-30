<%@page import="com.store.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/bootstrap/css/bttn.css"
	rel="stylesheet">	
<div style="text-align: right">
	<%String email = CmmUtil.nvl((String)session.getAttribute("email"));
		if(email.equals("")){%>
		<button class="bttn-stretch bttn-md bttn-primary" style="margin-right:5px;margin-top:5px" onclick="location.href='/login.do'">Login</button>
		<button class="bttn-stretch bttn-md bttn-primary" style="margin-right:5px;margin-top:5px" onclick="location.href='/signUp.do'">Sign up</button>
		<%}else{ %>
		<button class="bttn-stretch bttn-md bttn-primary" style="margin-right:5px;margin-top:5px" onclick="location.href='/logout.do'">Logout</button>
		<%} %>
	</div>

	<div style="display: inline">
		<div id="umbrella"></div>

		<h1 class="site-heading text-center text-white d-none d-lg-block"  
			style="z-index: 20; position: relative;">
			<span class="site-heading-upper text-primary mb-3" >우리동네 상권 분석</span>
			<span class="site-heading-lower" >Business Analysis</span>
		</h1>
	</div>