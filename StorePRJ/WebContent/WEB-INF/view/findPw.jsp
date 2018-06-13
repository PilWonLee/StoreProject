<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
<title>우리 동네 상권 분석</title>

<style>
body{
    background: url("/bootstrap/img/mainPic.jpg");
}

.vertical-offset-100{
    padding-top:100px;
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
<link href="/bootstrap/css/myStyle2.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


</head>
<script>
$(function(){
	$('#submit').click(function(){
		var email =$('#email').val();
		if(email !='' ){
			
			$("#hiddenEmail").attr("value",email);
			$('#frm').attr({
						action : "findPwProc.do",
						method : 'post'
							}).submit();
			return true;
		}else{
			alert("이메일을 입력해 주세요.");
			return false;
		}
		
	});
	
})

</script>
<body>
<%@include file="/common/top.jsp"%>
<form id="frm">
<input type="hidden" id="hiddenEmail" name="email" value="">
<input type="hidden" id="hiddenPassword" name="password" value="">
</form>
<div style="text-align:center">
		<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h2 class="panel-title"><b>비밀번호 찾기</b></h2>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="E-mail" name="email" id="email" type="text">
			    		</div>
			    		
			    		<input class="btn btn-lg btn-success btn-block" type="button" id="submit" value="Find Password">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
		
</div>


	<!-- Bootstrap core JavaScript -->
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="/common/js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/common/js/login.js"></script>
	<script src="/common/js/top.js"></script>



</body>
</html>
