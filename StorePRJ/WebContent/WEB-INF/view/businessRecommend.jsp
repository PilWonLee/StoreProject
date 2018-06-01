<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap core CSS -->
<link href="/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Button css -->
<link href="/bootstrap/css/bttn.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/bootstrap/css/business-casual.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/bootstrap/css/myStyle.css" rel="stylesheet">
<!-- 리스트스타일 -->
<link rel="icon" type="image/png" href="tableStyle/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css" href="tableStyle/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="tableStyle/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="tableStyle/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="tableStyle/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="tableStyle/vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="tableStyle/css/util.css">
<link rel="stylesheet" type="text/css" href="tableStyle/css/main.css">

<!-- form스타일시트 -->
<link rel="icon" type="image/png" href="form/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css" href="form/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="form/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="form/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="form/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="form/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="form/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="form/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="form/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="form/css/util.css">
<link rel="stylesheet" type="text/css" href="form/css/main.css">

<title>우리 동네 상권 분석</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		var recommendCategory = document
		.getElementById("recommendCategory");
		recommendCategory.className = "nav-item px-lg-4 active"; // 카테고리
		var selectNation = $('#selectNation');// 버튼 만들기
		selectNation.text("시,도 선택");
		var selectCity = $("#selectCity");
		selectCity.text("시,군,구 선택");
		var selectBusiness1 = $('#selectBigInds');
		selectBusiness1.text("업종 대분류");
		var MidCd = '';
		var MidNameArr = new Array;
		
		// 시,도 불러오기
		$
				.ajax({
					url : "searchSido.do",
					dataType : "json",
					success : function(data) {
						var contents = ""
						$
								.each(
										data,
										function(key, value) {
											contents += "<a class='dropdown-item' href='#' id='N"
													+ value.ctprvnCd
													+ "'>"
													+ value.ctprvnNm
													+ "</a> ";
										});
						$('#selectNationDrop').html(contents);
						addClickEventNation();
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n"
								+ "message:" + request.responseText
								+ "\n" + "error:" + error);
					}
				});

		// 시,도 드랍다운에 이벤트 추가 함수
		function addClickEventNation() {
			$('#selectNationDrop')
					.children('.dropdown-item')
					.click(
							function(event) {
								event.preventDefault();// a태그 href
								// 막음
								var ctprvnCd = $(this).attr('id')
										.substring(1, 3);
								$('#selectNation').text(
										$(this).text());

								$
										.ajax({
											data : {
												'ctprvnCd' : ctprvnCd
											},
											url : "searchSigungu.do",
											dataType : "json",
											success : function(data) {
												var contents = ""
												$
														.each(
																data,
																function(
																		key,
																		value) {
																	contents += "<a class='dropdown-item' href='#' id='S"
																			+ value.signguCd
																			+ "'>"
																			+ value.signguNm
																			+ "</a> ";
																});
												$('#selectCityDrop')
														.html(
																contents);
												$("#selectCity")
														.text(
																"시,군,구 선택");
												addClickEventCity();

											},
											error : function(
													request,
													status, error) {
												alert("code:"
														+ request.status
														+ "\n"
														+ "message:"
														+ request.responseText
														+ "\n"
														+ "error:"
														+ error);
											}
										});
							});
		}

		// 시,군,구 드랍다운 이벤트 추가 함수
		function addClickEventCity() {
			$('#selectCityDrop').children('.dropdown-item').click(
					function(event) {
						event.preventDefault();// a태그 href 막음
						$('#selectCity').text($(this).text());


					});
		}
		
		//업종 대분류 불러오기
		$.ajax({
					url:"searchBigInds.do",
					dataType:"json",
					success:function(data){
						var contents = "";
						$.each(data,function(key,value){
							contents += "<a class='dropdown-item' href='#' id='"+value.indsLclsCd+"'>"+value.indsLclsNm+"</a> ";
							var MidNameObj = new Object();
							MidNameObj.key = value.indsLclsCd;
							MidNameObj.value = value.indsLclsNm;
							MidNameArr.push(MidNameObj);
						});
						$('#selectBigIndsDrop').html(contents);
						addClickEventBigInds();
					},	
					error: function(request,status,error){
			        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       	}
			}); 
			
			
		
		//업종 대분류 드랍다운에 이벤트 추가 함수
		function addClickEventBigInds(){
			$('#selectBigIndsDrop').children('.dropdown-item').click(function(event){
				event.preventDefault();//a태그 href 막음
				var indsLclsCd = $(this).attr('id');
				console.log(indsLclsCd);
				$('#selectBigInds').text($(this).text());
				MidCd = $(this).attr("id");
			});
		}
		// 활성화
		$('#btn')
				.click(
						function() {
							var content = "<tr class='row100 body'><td class='cell100 column1'>Like a butterfly</td><td class='cell100 column2'>Boxing</td><td class='cell100 column3'>9:00 AM - 11:00 AM</td><td class='cell100 column4'>Aaron Chapman</td><td class='cell100 column4'>10</td></tr>";
							content += "<tr class='row100 body'><td class='cell100 column1'>Like a butterfly</td><td class='cell100 column2'>Boxing</td><td class='cell100 column3'>9:00 AM - 11:00 AM</td><td class='cell100 column4'>Aaron Chapman</td><td class='cell100 column4'>10</td></tr>";
							content += "<tr class='row100 body'><td class='cell100 column1'>Like a butterfly</td><td class='cell100 column2'>Boxing</td><td class='cell100 column3'>9:00 AM - 11:00 AM</td><td class='cell100 column4'>Aaron Chapman</td><td class='cell100 column4'>10</td></tr>";
							$('table > tbody').append(content);
							$('.js-pscroll').each(function() {
								var ps = new PerfectScrollbar(this);

								$(window).on('resize', function() {
									ps.update();
								})
							});
						});
		$('#continue').click(function(event) {
			location.href = "#add";
		})
	});
</script>
</head>
<body>
	<%@include file="/common/top.jsp"%>
	<!-- Navigation -->
	<%@include file="/common/nav.jsp"%>
	<div id="pages" class="container">
		<section id="list" data-url="list" data-default-page="true">
		<div style="text-align: right; margin-top: 2%; width:150px;margin-left:  85%">
			<div class="container-login100-form-btn">
				<div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn"></div>
					<button  data-transition="pop" class="login100-form-btn" id="continue"><h5><b>등록</b></h5></button>
				</div>
			</div>
		</div>
		<div class="table100 ver1 m-b-110" style="margin-top: 1%">
			<div class="table100-head">
				<table>
					<thead>
						<tr class="row100 head">
							<th class="cell100 column1"><b>제목</b></th>
							<th class="cell100 column2"><b>지역</b></th>
							<th class="cell100 column3"><b>업종</b></th>
							<th class="cell100 column4"><b>등록일</b></th>
						</tr>
					</thead>
				</table>
			</div>

			<div class="table100-body js-pscroll">
				<table>
					<tbody>
						<tr class="row100 body">
							<td class="cell100 column1">Like a butterfly</td>
							<td class="cell100 column2">Boxing</td>
							<td class="cell100 column3">9:00 AM - 11:00 AM</td>
							<td class="cell100 column4">Aaron Chapman</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>



		<input type="button" id="btn" value="추가"> </section>

		<section id="add" data-url="add">

		<div class="wrap-login100" style="width: 800px; margin-top: 5%; margin-bottom: 6%; background-color: #f8f8f8; margin-left: auto; margin-right: auto;">
			<div style="text-align: right;">
			<!-- Flip, Spin, Slide, Slideup, Slidedown, Fade, Pop, Turn  -->
				<span data-transition="pop" onmouseover="this.style.cursor='pointer'" style="color:#858585"onclick="location.href='#list'">뒤로가기</span>
			</div>
			<form class="login100-form validate-form">

				<span class="login100-form-title p-b-26"> 추천 상권 등록 </span>
				
				<!-- 시,도 선택 셀렉트 박스 -->
					<div class="btn-group" role="group"
						aria-label="Button group with nested dropdown">
						<button type="button" class="btn btn-info" id="selectNation"></button>
						<div class="btn-group" role="group">
							<button  type="button" id="selectNationBtn"
								class="btn btn-info dropdown-toggle" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"></button>
							<!-- 드랍다운 부분 -->
							<div class="dropdown-menu" aria-labelledby="btnGroupDrop3"
								x-placement="bottom-start" id="selectNationDrop"
								style="position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;">
							</div>
						</div>
					</div>
					<br>
					<!-- 시,군,구 선택 셀렉트 박스 -->
					<div class="btn-group" role="group" id="selectCityDiv"
						aria-label="Button group with nested dropdown" style="padding-top:5px">
						<button type="button" class="btn btn-info" id="selectCity"></button>
						<div class="btn-group" role="group">
							<button  type="button"
								class="btn btn-info dropdown-toggle" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"></button>
							<!-- 드랍다운 부분 -->	
							<div class="dropdown-menu" aria-labelledby="btnGroupDrop3"
								x-placement="bottom-start"  id="selectCityDrop"
								style="position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;">
							</div>
						</div>
					</div>
					
					<!-- 업종 대분류 -->
					<div class="btn-group" role="group"
						aria-label="Button group with nested dropdown">
						<button type="button" class="btn btn-info" id="selectBigInds"></button>
						<div class="btn-group" role="group">
							<button  type="button"
								class="btn btn-info dropdown-toggle" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"></button>
							<!-- 드랍다운 부분 -->	
							<div class="dropdown-menu" aria-labelledby="btnGroupDrop3"
								x-placement="bottom-start" id="selectBigIndsDrop"
								style="position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;">
							</div>
						</div>
					</div>
					
				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="title"> <span class="focus-input100" data-placeholder="글 제목"></span>
				</div>

				<div class="wrap-input100 validate-input">
					<span class="btn-show-pass"> </span> <!-- <input class="input100" type="text" name="contents"> --><textarea class="input100" style="height:200px"></textarea> <span class="focus-input100" data-placeholder="글 내용"></span>
				</div>

				<div class="container-login100-form-btn">
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn"><h5><b>등록</b></h5></button>
					</div>
				</div>

			</form>
		</div>


		<div id="dropDownSelect1"></div>


		</section>

	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
	<script src="common/js/top.js"></script>
	<!-- 리스트폼 -->
	<script src="tableStyle/vendor/bootstrap/js/popper.js"></script>
	<script src="tableStyle/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="tableStyle/vendor/select2/select2.min.js"></script>
	<script src="tableStyle/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="form/js/main.js"></script>
	<!-- 글등록폼 -->
	<!--===============================================================================================-->
	<script src="form/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="form/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="form/vendor/bootstrap/js/popper.js"></script>
	<script src="form/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="form/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="form/vendor/daterangepicker/moment.min.js"></script>
	<script src="form/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="form/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="form/js/main.js"></script>
	<!-- START 화면전환 필요 라이브러리 -->
	<script src="cornerstone/jquery/jquery-1.10.2.min.js"></script>
	<script src="cornerstone/transition/transition.js"></script>
	<script src="cornerstone/underscore/underscore-min.js"></script>
	<script src="cornerstone/backbone/backbone-min.js"></script>
	<script src="cornerstone/multipage-router/multipage.js"></script>
	<script src="cornerstone/multipage-router/multipage-starter.js"></script>
</body>
</html>