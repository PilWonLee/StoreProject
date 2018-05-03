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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>




<!-- 다음 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0b6e3ccf43ded1cf750365cdf521d0&libraries=services,clusterer,drawing"></script>
<script>
	$(document).ready(function(){
	
		var lat = 0;
		var lng = 0;

		function getLocation() {
			  if (navigator.geolocation) { // GPS를 지원하면
			    navigator.geolocation.getCurrentPosition(function(position) {
			      lat = position.coords.latitude;
			      lng = position.coords.longitude;
			      //지도 시작
			      var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			  	mapOption = {
			  		center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
			  		level : 5
			  	// 지도의 확대 레벨  
			  	};

			  	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			  	var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
			  	var centerPosition; // 원의 중심좌표 입니다
			  	var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
			  	var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
			  	var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
			  	var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

			  	var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다

			  	//지도에 클릭 이벤트를 등록합니다
			  	daum.maps.event.addListener(map, 'click', function(mouseEvent) {

			  		// 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
			  		if (!drawingFlag) {

			  			// 상태를 그리고있는 상태로 변경합니다
			  			drawingFlag = true;

			  			// 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
			  			centerPosition = mouseEvent.latLng;

			  			// 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
			  			if (!drawingLine) {
			  				drawingLine = new daum.maps.Polyline({
			  					strokeWeight : 3, // 선의 두께입니다
			  					strokeColor : '#00a0e9', // 선의 색깔입니다
			  					strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			  					strokeStyle : 'solid' // 선의 스타일입니다
			  				});
			  			}

			  			// 그려지고 있는 원을 표시할 원 객체를 생성합니다
			  			if (!drawingCircle) {
			  				drawingCircle = new daum.maps.Circle({
			  					strokeWeight : 1, // 선의 두께입니다
			  					strokeColor : '#00a0e9', // 선의 색깔입니다
			  					strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			  					strokeStyle : 'solid', // 선의 스타일입니다
			  					fillColor : '#00a0e9', // 채우기 색깔입니다
			  					fillOpacity : 0.2
			  				// 채우기 불투명도입니다 
			  				});
			  			}

			  			// 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
			  			if (!drawingOverlay) {
			  				drawingOverlay = new daum.maps.CustomOverlay({
			  					xAnchor : 0,
			  					yAnchor : 0,
			  					zIndex : 1
			  				});
			  			}
			  		}
			  	});

			  	//지도에 마우스무브 이벤트를 등록합니다
			  	//원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
			  	daum.maps.event
			  			.addListener(
			  					map,
			  					'mousemove',
			  					function(mouseEvent) {

			  						// 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
			  						if (drawingFlag) {

			  							// 마우스 커서의 현재 위치를 얻어옵니다 
			  							var mousePosition = mouseEvent.latLng;

			  							// 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
			  							var linePath = [ centerPosition, mousePosition ];

			  							// 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
			  							drawingLine.setPath(linePath);

			  							// 원의 반지름을 선 객체를 이용해서 얻어옵니다 
			  							var length = drawingLine.getLength();

			  							if (length > 0) {

			  								// 그려지고 있는 원의 중심좌표와 반지름입니다
			  								var circleOptions = {
			  									center : centerPosition,
			  									radius : length,
			  								};

			  								// 그려지고 있는 원의 옵션을 설정합니다
			  								drawingCircle.setOptions(circleOptions);

			  								// 반경 정보를 표시할 커스텀오버레이의 내용입니다
			  								var radius = Math.round(drawingCircle
			  										.getRadius()), content = '<div class="info">반경 <span class="number">'
			  										+ radius + '</span>m</div>';

			  								// 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
			  								drawingOverlay.setPosition(mousePosition);

			  								// 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
			  								drawingOverlay.setContent(content);

			  								// 그려지고 있는 원을 지도에 표시합니다
			  								drawingCircle.setMap(map);

			  								// 그려지고 있는 선을 지도에 표시합니다
			  								drawingLine.setMap(map);

			  								// 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
			  								drawingOverlay.setMap(map);

			  							} else {

			  								drawingCircle.setMap(null);
			  								drawingLine.setMap(null);
			  								drawingOverlay.setMap(null);

			  							}
			  						}
			  					});

			  	//지도에 마우스 오른쪽 클릭이벤트를 등록합니다
			  	//원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
			  	//마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
			  	daum.maps.event.addListener(map, 'rightclick', function(mouseEvent) {

			  		if (drawingFlag) {

			  			// 마우스로 오른쪽 클릭한 위치입니다 
			  			var rClickPosition = mouseEvent.latLng;

			  			// 원의 반경을 표시할 선 객체를 생성합니다
			  			var polyline = new daum.maps.Polyline({
			  				path : [ centerPosition, rClickPosition ], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
			  				strokeWeight : 3, // 선의 두께 입니다
			  				strokeColor : '#00a0e9', // 선의 색깔입니다
			  				strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			  				strokeStyle : 'solid' // 선의 스타일입니다
			  			});

			  			// 원 객체를 생성합니다
			  			var circle = new daum.maps.Circle({
			  				center : centerPosition, // 원의 중심좌표입니다
			  				radius : polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
			  				strokeWeight : 1, // 선의 두께입니다
			  				strokeColor : '#00a0e9', // 선의 색깔입니다
			  				strokeOpacity : 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			  				strokeStyle : 'solid', // 선의 스타일입니다
			  				fillColor : '#00a0e9', // 채우기 색깔입니다
			  				fillOpacity : 0.2
			  			// 채우기 불투명도입니다 
			  			});

			  			var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
			  			content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다

			  			// 반경정보를 표시할 커스텀 오버레이를 생성합니다
			  			var radiusOverlay = new daum.maps.CustomOverlay({
			  				content : content, // 표시할 내용입니다
			  				position : rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
			  				xAnchor : 0,
			  				yAnchor : 0,
			  				zIndex : 1
			  			});

			  			// 원을 지도에 표시합니다
			  			circle.setMap(map);

			  			// 선을 지도에 표시합니다
			  			polyline.setMap(map);

			  			// 반경 정보 커스텀 오버레이를 지도에 표시합니다
			  			radiusOverlay.setMap(map);

			  			// 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
			  			var radiusObj = {
			  				'polyline' : polyline,
			  				'circle' : circle,
			  				'overlay' : radiusOverlay
			  			};

			  			// 배열에 추가합니다
			  			// 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
			  			circles.push(radiusObj);

			  			// 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
			  			drawingFlag = false;

			  			// 중심 좌표를 초기화 합니다  
			  			centerPosition = null;

			  			// 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
			  			drawingCircle.setMap(null);
			  			drawingLine.setMap(null);
			  			drawingOverlay.setMap(null);
			  		}
			  	});

			  	//지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
			  	function removeCircles() {
			  		for (var i = 0; i < circles.length; i++) {
			  			circles[i].circle.setMap(null);
			  			circles[i].polyline.setMap(null);
			  			circles[i].overlay.setMap(null);
			  		}
			  		circles = [];
			  	}

			  	//마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
			  	//그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
			  	//HTML Content를 만들어 리턴하는 함수입니다
			  	function getTimeHTML(distance) {

			  		// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			  		var walkkTime = distance / 67 | 0;
			  		var walkHour = '', walkMin = '';

			  		// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			  		if (walkkTime > 60) {
			  			walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
			  					+ '</span>시간 '
			  		}
			  		walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

			  		// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
			  		var bycicleTime = distance / 227 | 0;
			  		var bycicleHour = '', bycicleMin = '';

			  		// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
			  		if (bycicleTime > 60) {
			  			bycicleHour = '<span class="number">'
			  					+ Math.floor(bycicleTime / 60) + '</span>시간 '
			  		}
			  		bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

			  		// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			  		var content = '<ul class="info">';
			  		content += '    <li>';
			  		content += '        <span class="label">총거리</span><span class="number">'
			  				+ distance + '</span>m';
			  		content += '    </li>';
			  		content += '    <li>';
			  		content += '        <span class="label">도보</span>' + walkHour + walkMin;
			  		content += '    </li>';
			  		content += '    <li>';
			  		content += '        <span class="label">자전거</span>' + bycicleHour
			  				+ bycicleMin;
			  		content += '    </li>';
			  		content += '</ul>'

			  		return content;
			  	}
			  	
			  	$('#test').click(function() {
					console.log("test");
					var geocoder = new daum.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('경기도 수원시 권선구', function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {

				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
						
				        marker.setMap(null);
				 
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				     }
					});
				});
			  	
			  	
			    }, function(error) {
			      console.error(error);
			    }, {
			      enableHighAccuracy: false,
			      maximumAge: 0,
			      timeout: Infinity
			    });
			  } else {
			    alert('GPS를 지원하지 않습니다');
			  }
			}

		getLocation();	
		
		
		
	});
	
	
	
</script>




<script>
	window.onload = function() {
		var analysisCategory = document.getElementById("analysisCategory");
		analysisCategory.className = "nav-item px-lg-4 active"; //카테고리 활성화

		var selectNation = $('#selectNation');//버튼 만들기
		selectNation.text("시,도 선택");
		var selectCity = $("#selectCity");
		selectCity.text("시,군,구 선택");

		$('#test').click(function() {
			/* console.log($('.card.border-primary.mb-3').attr('class'));
			$('#selectNationDiv').attr('class', 'card bg-light mb-3');
			$('#selectNation').attr("disabled", "disabled");
			$('#selectCity').attr("disabled", "disabled");
			$('#selectNationDrop').attr("disabled", "disabled");
			$('#selectCityDrop').attr("disabled", "disabled"); */
			
			
		});
		/* card text-white bg-secondary mb-3 */
	}
</script>

<title>우리 동네 상권 분석</title>
</head>
<body>
	<div style="text-align: right">
		<span>로그인</span> <span>회원가입</span>
	</div>
	<div style="display: inline">
		<div id="umbrella"></div>

		<h1 class="site-heading text-center text-white d-none d-lg-block"
			style="z-index: 20; position: relative;">
			<span class="site-heading-upper text-primary mb-3">우리동네 상권 분석</span>
			<span class="site-heading-lower">Business Analysis</span>
		</h1>
	</div>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
	<div class="container">
		<a
			class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
			href="#">Start Bootstrap</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item px-lg-4" id="analysisCategory"><a
					class="nav-link text-uppercase text-expanded" href="index.html">상권
						분석 <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item px-lg-4" id="compareCategory"><a
					class="nav-link text-uppercase text-expanded" href="about.html">상권
						비교</a></li>
				<li class="nav-item px-lg-4" id="recommendCategory"><a
					class="nav-link text-uppercase text-expanded" href="products.html">상권
						추천</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<section class="page-section clearfix">
	<div class="container">
		<div class="intro">
			<!-- <img class="intro-img img-fluid mb-3 mb-lg-0 rounded"
				src="" alt=""> -->
		<div style="margin-top: 5%">	
			<div class="card border-primary mb-3" id="selectNationDiv"
				style="max-width: 20rem;max-height:150px;width:300px">
				<div class="card-header">지역 선택</div>
				<div class="card-body">
					<div class="btn-group" role="group"
						aria-label="Button group with nested dropdown">
						<button type="button" class="btn btn-info" id="selectNation"></button>
						<div class="btn-group" role="group">
							<button id="selectNationDrop" type="button"
								class="btn btn-info dropdown-toggle" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"></button>
							<div class="dropdown-menu" aria-labelledby="btnGroupDrop3"
								x-placement="bottom-start"
								style="position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;">
								<a class="dropdown-item" href="#">Dropdown link</a> 
								<a class="dropdown-item" href="#">Dropdown link</a>
								<a class="dropdown-item" href="#">Dropdown link</a> 
								<a class="dropdown-item" href="#">Dropdown link</a>
								<a class="dropdown-item" href="#">Dropdown link</a> 
								<a class="dropdown-item" href="#">Dropdown link</a>
								<a class="dropdown-item" href="#">Dropdown link</a> 
								<a class="dropdown-item" href="#">Dropdown link</a>
								<a class="dropdown-item" href="#">Dropdown link</a> 
								<a class="dropdown-item" href="#">Dropdown link</a>
								
								
							</div>
						</div>
					</div>

					<div class="btn-group" role="group" id="selectCityDiv"
						aria-label="Button group with nested dropdown" style="padding-top:5px">
						<button type="button" class="btn btn-info" id="selectCity"></button>
						<div class="btn-group" role="group">
							<button id="selectCityDrop" type="button"
								class="btn btn-info dropdown-toggle" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"></button>
							<div class="dropdown-menu" aria-labelledby="btnGroupDrop3"
								x-placement="bottom-start"
								style="position: absolute; transform: translate3d(0px, 36px, 0px); top: 0px; left: 0px; will-change: transform;">
								<a class="dropdown-item" href="#">Dropdown link</a> <a
									class="dropdown-item" href="#">Dropdown link</a>
							</div>
						</div>
					</div>
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
		
		<button id="test"></button>
		
		</div>
	

	</div>


	</section>



	<footer class="footer text-faded text-center py-5">
	<div class="container">
		<p class="m-0 small">Copyright &copy; Your Website 2018</p>
	</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>