<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<html>
<head>
<title>Home</title>

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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/bootstrap/css/myStyle2.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<script>
$(function(){
	$('#email').keyup(function(){
		var email =$('#email').val();
		$.ajax({
			url:"checkEmail.do",
			data:{email:email},
			dataType:"text",
			success:function(data){
				console.log(data);
			},
			error:function(error){console.log(error);}
		});
		if(email == "dd"){
			$('#spanEmail').css('display','');
		}else{
			$('#spanEmail').css('display','none');
		}
		
	});
})

</script>

</head>

<body>
<%@include file="/common/top.jsp"%>

<div style="text-align:center">
		<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h2 class="panel-title"><b>회원가입</b></h2>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="E-mail" name="email" id="email" type="email">
			    		    <span id="spanEmail" style="display:none;color:red">이미 가입된 이메일입니다.</span>
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name="password" id="password" type="password" value="">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password Confirm" name="passwordConfirm" id="passwordConfirm" type="password" value="">
			    		</div>
			    		<input class="btn btn-lg btn-success btn-block" style="" type="submit" value="Sign Up">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
		
</div>


	<!-- Bootstrap core JavaScript -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="/common/js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/common/js/login.js"></script>
	<script src="/common/js/top.js"></script>



</body>
</html>
