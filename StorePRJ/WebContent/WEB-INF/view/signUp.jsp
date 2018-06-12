<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>우리동네 상권분석</title>

<style>
body {
	background: url("/bootstrap/img/mainPic.jpg");
}

.vertical-offset-100 {
	padding-top: 100px;
}
</style>

<!-- Bootstrap core CSS -->
<link href="/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- button css -->
<link href="/bootstrap/css/bttn.css" rel="stylesheet">
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
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<script>
	$(function() {
		var emailCheck = false;
		var email = '';
		$('#email').keyup(function() {
			email = $('#email').val();
			$.ajax({
				url : "checkEmail.do",
				data : {
					email : email
				},
				dataType : "text",
				success : function(data) {
					if (data != "0") {
						$('#spanEmail').css('display', '');
						emailCheck = false;
					} else {
						$('#spanEmail').css('display', 'none');
						emailCheck = true;
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
		var passwordCheck = false;
		var passwordLengthCheck = false;
		var password = '';
		var passwordConfirm = '';
		$('#password').keyup(function() {
			password = $('#password').val();
			passwordConfirm = $('#passwordConfirm').val();
			console.log(password);
			console.log(passwordConfirm);
			if (password.length < 5) {
				$('#spanPassword').css('display', '');
				passwordLengthCheck = false;
			} else if (password.length > 4) {
				$('#spanPassword').css('display', 'none');
				passwordLengthCheck = true;
			} else if (password != passwordConfirm) {
				$('#spanConfirm').css('display', '');
				$('#spanConfirm2').css('display', 'none');
				passwordCheck = false;
			} else if (password == passwordConfirm) {
				$('#spanConfirm').css('display', 'none');
				$('#spanConfirm2').css('display', '');
				passwordCheck = true;
			} else {
				$('#spanConfirm').css('display', 'none');
				$('#spanConfirm2').css('display', 'none');
				passwordCheck = false;
			}
		});

		$('#passwordConfirm').keyup(function() {
			password = $('#password').val();
			passwordConfirm = $('#passwordConfirm').val();
			if (password != passwordConfirm) {
				$('#spanConfirm').css('display', '');
				$('#spanConfirm2').css('display', 'none');
				passwordCheck = false;
			} else if (password == passwordConfirm) {
				$('#spanConfirm').css('display', 'none');
				$('#spanConfirm2').css('display', '');
				passwordCheck = true;
			} else {
				$('#spanConfirm').css('display', 'none');
				$('#spanConfirm2').css('display', 'none');
				passwordCheck = false;
			}
		});

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		$('#email').keyup(function() {
			var email = $('#email').val()
			if (exptext.test(email) == false) {
				$('#spanEmail2').css('display', '');
				emailCheck = false;
			} else {
				$('#spanEmail2').css('display', 'none');
				emailCheck = true;
			}
		})

		$('#submit').click(function() {
			if (emailCheck && passwordCheck && passwordLengthCheck) {

				$("#hiddenEmail").attr("value", email);
				$("#hiddenPassword").attr("value", password);
				$('#frm').attr({
					action : "signUpProc.do",
					method : 'post'
				}).submit();
				return true;
			} else {
				alert("회원가입을 할 수 없습니다.");
				return false;
			}

		});

	})
</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
</head>

<body>
	<%@include file="/common/top.jsp"%>
	<form id="frm">
		<input type="hidden" id="hiddenEmail" name="email" value=""> <input
			type="hidden" id="hiddenPassword" name="password" value="">
	</form>
	<div style="text-align: center">
		<div class="container">
			<div class="row vertical-offset-100">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">
								<b>회원가입</b>
							</h2>
						</div>
						<div class="panel-body">
							<form accept-charset="UTF-8">
								<div class="form-group">
									<input class="form-control" placeholder="E-mail" name="email"
										id="email" type="email"> <span id="spanEmail"
										style="display: none; color: red">이미 가입된 이메일입니다.</span> <span
										id="spanEmail2" style="display: none; color: red">옳바르지
										않은 이메일 형식 입니다.</span>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" id="password" type="password" value="">
									<span id="spanPassword" style="display: none; color: red">비밀번호는
										최소 5자리 이상</span>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password Confirm"
										name="passwordConfirm" id="passwordConfirm" type="password"
										value=""> <span id="spanConfirm"
										style="display: none; color: red">비밀번호가 다릅니다.</span> <span
										id="spanConfirm2" style="display: none; color: green">비밀번호가
										같습니다.</span>
								</div>
								<div class="form-group">
									<input class="form-control" name="sample6_postcode"
										id="sample6_postcode" type="text" value="" placeholder="우편번호"
										style="width: 66%; display: inline-block;"> <input
										type="button" onclick="sample6_execDaumPostcode()"
										value="우편번호 찾기" style="display: inline-block">
								</div>
								<div class="form-group">
									<input class="form-control" name="sample6_address"
										id="sample6_address" type="text" value="" placeholder="주소"> <input
										class="form-control" name="sample6_address2"
										id="sample6_address2" type="text" value="" placeholder="상세주소">
								</div>
								<input class="btn btn-lg btn-success btn-block" style=""
									type="button" id="submit" value="Sign Up">
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
