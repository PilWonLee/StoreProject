<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<!-- Bootstrap core CSS -->
<link href="/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Button css -->
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

<title>우리 동네 상권 분석</title>
</head>
<body>
	<%@include file="/common/top.jsp"%>
	<!-- Navigation -->
	<%@include file="/common/nav.jsp"%>
	
	<form id="transPage" >
		<input type="hidden" name="cx" id="cxId" value="">
		<input type="hidden" name="cy" id="cyId" value="">
		<input type="hidden" name="radius" id="radiusId" value="">
		<input type="hidden" name="locName" id="locNameId" value="">
		<input type="hidden" name="midCd" id="midCd" value="">
	</form>

	<section class="page-section clearfix">
	<div class="container">
		<div class="intro">
			<!-- <img class="intro-img img-fluid mb-3 mb-lg-0 rounded"
				src="" alt=""> -->
		<!-- 지역선택 박스 -->				
		<div style="margin-top: 5%">	
			<div class="card border-primary mb-3" id="selectNationDiv"
				style="max-width: 20rem;max-height:170px;width:300px">
				<div class="card-header">지역 선택</div>
				<div class="card-body">
				
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
				</div>
			</div>
			<!-- 업정선택 박스 -->
			<div class="card border-primary mb-3" id=""
				style="max-width: 20rem;max-height:150px;width:300px">
				<div class="card-header">업종 선택</div>
				<div class="card-body">
				
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
					<br>
				</div>
			</div>
		</div>
		
			
		
		<div style="margin-top: 5%;">	
			<div class="card border-primary mb-3"
				style="margin-left: 10%; width: 800px; height: 500px">
				<div class="card-header">지도 선택</div>
				<div class="card-body" id="map">
				</div>
			</div>
		</div>
		
		</div>
		
		<div style="text-align:center;margin-top:3%">
			<button class="bttn-unite bttn-md bttn-primary" id="startAnalysis" style="font-size:40px">
			&nbsp;&nbsp;&nbsp;상권분석&nbsp;&nbsp;&nbsp;
			</button>
		</div>
	
	</div>


	</section>



	

	<!-- Bootstrap core JavaScript -->
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="common/js/analysisMain.js"></script>
	<script src="common/js/top.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 다음 지도 API -->
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ff495b96a0548bc815a587a9e4fd80&libraries=services,clusterer,drawing"></script>

</body>
</html>