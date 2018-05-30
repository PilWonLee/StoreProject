<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
	var emailCheck = false;
	var email = '';
	$('#email').keyup(function(){
		email =$('#email').val();
		$.ajax({
			url:"checkEmail.do",
			data:{email:email},
			dataType:"text",
			success:function(data){
				if(data != "0"){
					$('#spanEmail').css('display','');
					emailCheck = false;
				}else{
					$('#spanEmail').css('display','none');
					emailCheck = true;
				}
			},
			error:function(error){console.log(error);}
		});
	});
	var passwordCheck = false;
	var passwordLengthCheck = false;
	var password = '';
	var passwordConfirm ='';
	$('#password').keyup(function(){
		password =$('#password').val();
		passwordConfirm =$('#passwordConfirm').val();
		console.log(password);
		console.log(passwordConfirm);
		if(password.length < 5){
			$('#spanPassword').css('display','');
			passwordLengthCheck = false;
		}else if(password.length > 4){
			$('#spanPassword').css('display','none');
			passwordLengthCheck = true;
		}else if(password != passwordConfirm){
			$('#spanConfirm').css('display','');
			$('#spanConfirm2').css('display','none');
			passwordCheck = false;
		}else if(password == passwordConfirm){
			$('#spanConfirm').css('display','none');
			$('#spanConfirm2').css('display','');
			passwordCheck = true;
		}else{
			$('#spanConfirm').css('display','none');
			$('#spanConfirm2').css('display','none');
			passwordCheck = false;
		}
	});
	
	$('#passwordConfirm').keyup(function(){
		password =$('#password').val();
		passwordConfirm =$('#passwordConfirm').val();
		if(password != passwordConfirm){
			$('#spanConfirm').css('display','');
			$('#spanConfirm2').css('display','none');
			passwordCheck = false;
		}else if(password == passwordConfirm){
			$('#spanConfirm').css('display','none');
			$('#spanConfirm2').css('display','');
			passwordCheck = true;
		}else{
			$('#spanConfirm').css('display','none');
			$('#spanConfirm2').css('display','none');
			passwordCheck = false;
		}
	});
	
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	$('#email').keyup(function(){
		var email =$('#email').val()
		if(exptext.test(email)==false){
			$('#spanEmail2').css('display','');
			emailCheck = false;
		}else{
			$('#spanEmail2').css('display','none');
			emailCheck = true;
		}
	})
	
	$('#submit').click(function(){
		if(emailCheck && passwordCheck && passwordLengthCheck){
			
			$("#hiddenEmail")
			.attr(
					"value",
					email);
			$("#hiddenPassword")
			.attr(
					"value",
					password);
			$('#frm')
			.attr({
						action : "signUpProc.do",
						method : 'post'
					})
			.submit();
			return true;
		}else{
			alert("회원가입을 할 수 없습니다.");
			return false;
		}
		
	});
	
})



</script>

</head>

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
			    	<h2 class="panel-title"><b>회원가입</b></h2>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8"  >
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="E-mail" name="email" id="email" type="email">
			    		    <span id="spanEmail" style="display:none;color:red">이미 가입된 이메일입니다.</span>
			    		    <span id="spanEmail2" style="display:none;color:red">옳바르지 않은 이메일 형식 입니다.</span>
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name="password" id="password" type="password" value="">
			    			<span id="spanPassword" style="display:none;color:red">비밀번호는 최소 5자리 이상</span>
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password Confirm" name="passwordConfirm" id="passwordConfirm" type="password" value="">
			    			<span id="spanConfirm" style="display:none;color:red">비밀번호가 다릅니다.</span>
			    			<span id="spanConfirm2" style="display:none;color:green">비밀번호가 같습니다.</span>
			    		</div>
			    		<input class="btn btn-lg btn-success btn-block" style="" type="button" id="submit" value="Sign Up">
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
