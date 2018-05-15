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
<style>
h2.flh {
  font-family: 'Arial';
  text-transform: uppercase;
  font-weight: bold;
  font-size: 3rem;
  line-height: 0.75;
  margin-top:50px;
}

#good {
  color : green
}

#normal{
  margin-top:20px;
  margin-bottom:20px;
  color : gold;
}

#bad{
  color : red
}

.flh>span {
  display: block;
}

.flh>span:not(.light) {
  opacity: 0;
  animation: flashText .5s ease-out alternate infinite;
}

.flh>span.light {
  position: relative;
  display: inline-block;
}
  

@keyframes flash{
  to {
    opacity: 1;
  }
}

@keyframes flashText {
  to {
    opacity: 0.15;
  }
}


.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

</style>
<script src="/common/js/jquery-3.3.1.min.js" charset="utf-8"></script>
<script src="/common/js/Chart.bundle.js"></script>
<script src="/common/js/utils.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script>
	$(function() {
		

		//상권활성도 나타내기
		document.getElementById("normal").className="light";
		
		var labelData = new Array;
		var setData = new Array;
		var colorArr = ["#FE2E2E","#FE9A2E","#FFFF00","#BFFF00","#00FFFF","#2E9AFE"
						,"#FE2EF7","#FF0040","#81DAF5","#9A2EFE","#BDBDBD","#D0FA58"
						];
		var locName = '<%=request.getParameter("locName")%>';
		var radius = <%=request.getParameter("radius")%>;
		var cx = <%=request.getParameter("cx")%>;
		var cy = <%=request.getParameter("cy")%>;
		 $.ajax({
			url:"getStoreInfo.do",
			type:"POST",
			data:{radius:radius, cx:cx, cy:cy},
			dataType:"json",
			error:function(error){console.log(error)},
			success: function(data){
				$.each(data,function(key, value){
					labelData.push(key);
					setData.push(value);
				})
				var fitColorArr = new Array;
				for(var i = 0; i < setData.length ; i++){
					fitColorArr.push(colorArr[i]);
				}
			//차트 그리기
			new Chart(document.getElementById("myChart").getContext("2d"), {
				type : 'pie',
				data : {
					labels : labelData,
					datasets : [ {
						backgroundColor : fitColorArr,
						data : setData
					} ]
				},
				options : {
					legend:{
						labels:{
							fontSize :12
						}
					},
					title : {
						display : true,
						fontSize : 12
					}
				}
			});
			}
		}); 
		
		 
		var MONTHS = [ '10대', '20대', '30대', '40대', '50대', '60대',
				'70대', '80대', '90대'];
		
		var color = Chart.helpers.color;
		
		var womanData = new Array();
		var manData = new Array();
		
		$.ajax({
		url:"getPopulation.do",
		type:"POST",
		data:{locName:locName},
		dataType:"json",
		error:function(error){console.log(error)},
		success: function(data){
			$.each(data,function(key, value){
				womanData.push(value.totalWoman);
				manData.push(value.totalMan);
				console.log(value.totalWoman);
				console.log(value.totalMan);
			})
		  }	
		});	
		
		var barChartData = {
			labels : [ '10대', '20대', '30대', '40대', '50대', '60대',
				'70대', '80대', '90대' ],
			datasets : [
					{
						label : '여성',
						backgroundColor : color(window.chartColors.red).alpha(
								0.5).rgbString(),
						borderColor : window.chartColors.red,
						borderWidth : 1,
						data : womanData
					},
					{
						label : '남성',
						backgroundColor : color(window.chartColors.blue).alpha(
								0.5).rgbString(),
						borderColor : window.chartColors.blue,
						borderWidth : 1,
						data :manData
					} ]

			};
		

		var ctx = document.getElementById('barChart').getContext('2d');
		window.myBar = new Chart(ctx, {
			type : 'bar',
			data : barChartData,
			options : {
				responsive : true,
				legend : {
					position : 'top',
				},
				title : {
					display : true,
				},
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	
	
		
	});
</script>
<!-- 다음 지도 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ff495b96a0548bc815a587a9e4fd80&libraries=services,clusterer,drawing"></script>
<script>
	var cx =
<%=request.getParameter("cx")%>
	var cy =
<%=request.getParameter("cy")%>
	var radius =
<%=request.getParameter("radius")%>
	var level;
	if (radius < 300) {
		level = 4;
	} else if (radius < 600) {
		level = 5;
	} else {
		level = 6;
	}
	$(document)
			.ready(
					function() {

						var analysisCategory = document
								.getElementById("analysisCategory");
						analysisCategory.className = "nav-item px-lg-4 active"; //카테고리 활성화 

						//선택한지역 ###################################
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new daum.maps.LatLng(cy, cx), // 지도의 중심좌표
							level : level
						// 지도의 확대 레벨
						};

						var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// 지도에 표시할 원을 생성합니다
						var circle = new daum.maps.Circle({
							center : new daum.maps.LatLng(cy, cx), // 원의 중심좌표 입니다 
							radius : radius, // 미터 단위의 원의 반지름입니다 
							strokeWeight : 1, // 선의 두께입니다 
							strokeColor : '#75B8FA', // 선의 색깔입니다
							strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
							strokeStyle : 'solid', // 선의 스타일 입니다
							fillColor : '#CFE7FF', // 채우기 색깔입니다
							fillOpacity : 0.7
						// 채우기 불투명도 입니다   
						});

						// 지도에 원을 표시합니다 
						circle.setMap(map);

						//주요 상권 표시하기 !!###################################
						// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
						var placeOverlay = new daum.maps.CustomOverlay({
							zIndex : 1
						}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
						markers = [], // 마커를 담을 배열입니다
						currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

						var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
						mapOption = {
							center : new daum.maps.LatLng(cy, cx), // 지도의 중심좌표
							level : level
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption);

						// 장소 검색 객체를 생성합니다
						var ps = new daum.maps.services.Places(map);

						// 지도에 idle 이벤트를 등록합니다
						daum.maps.event.addListener(map, 'idle', searchPlaces);

						// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
						contentNode.className = 'placeinfo_wrap';

						// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
						// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
						addEventHandle(contentNode, 'mousedown',
								daum.maps.event.preventMap);
						addEventHandle(contentNode, 'touchstart',
								daum.maps.event.preventMap);

						// 커스텀 오버레이 컨텐츠를 설정합니다
						placeOverlay.setContent(contentNode);

						// 각 카테고리에 클릭 이벤트를 등록합니다
						addCategoryClickEvent();

						// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
						function addEventHandle(target, type, callback) {
							if (target.addEventListener) {
								target.addEventListener(type, callback);
							} else {
								target.attachEvent('on' + type, callback);
							}
						}

						// 카테고리 검색을 요청하는 함수입니다
						function searchPlaces() {
							if (!currCategory) {
								return;
							}

							// 커스텀 오버레이를 숨깁니다 
							placeOverlay.setMap(null);

							// 지도에 표시되고 있는 마커를 제거합니다
							removeMarker();

							ps.categorySearch(currCategory, placesSearchCB, {
								useMapBounds : true
							});
						}

						// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
						function placesSearchCB(data, status, pagination) {
							if (status === daum.maps.services.Status.OK) {

								// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
								displayPlaces(data);
							} else if (status === daum.maps.services.Status.ZERO_RESULT) {
								// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

							} else if (status === daum.maps.services.Status.ERROR) {
								// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

							}
						}

						// 지도에 마커를 표출하는 함수입니다
						function displayPlaces(places) {

							// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
							// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
							var order = document.getElementById(currCategory)
									.getAttribute('data-order');

							for (var i = 0; i < places.length; i++) {

								// 마커를 생성하고 지도에 표시합니다
								var marker = addMarker(new daum.maps.LatLng(
										places[i].y, places[i].x), order);

								// 마커와 검색결과 항목을 클릭 했을 때
								// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
								(function(marker, place) {
									daum.maps.event.addListener(marker,
											'click', function() {
												displayPlaceInfo(place);
											});
								})(marker, places[i]);
							}
						}

						// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
						function addMarker(position, order) {
							var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
							imageSize = new daum.maps.Size(27, 28), // 마커 이미지의 크기
							imgOptions = {
								spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
								spriteOrigin : new daum.maps.Point(46,
										(order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
								offset : new daum.maps.Point(11, 28)
							// 마커 좌표에 일치시킬 이미지 내에서의 좌표
							}, markerImage = new daum.maps.MarkerImage(
									imageSrc, imageSize, imgOptions), marker = new daum.maps.Marker(
									{
										position : position, // 마커의 위치
										image : markerImage
									});

							marker.setMap(map); // 지도 위에 마커를 표출합니다
							markers.push(marker); // 배열에 생성된 마커를 추가합니다

							return marker;
						}

						// 지도 위에 표시되고 있는 마커를 모두 제거합니다
						function removeMarker() {
							for (var i = 0; i < markers.length; i++) {
								markers[i].setMap(null);
							}
							markers = [];
						}

						// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
						function displayPlaceInfo(place) {
							var content = '<div class="placeinfo">'
									+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
									+ place.place_name + '</a>';

							if (place.road_address_name) {
								content += '    <span title="' + place.road_address_name + '">'
										+ place.road_address_name
										+ '</span>'
										+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
										+ place.address_name + ')</span>';
							} else {
								content += '    <span title="' + place.address_name + '">'
										+ place.address_name + '</span>';
							}

							content += '    <span class="tel">' + place.phone
									+ '</span>' + '</div>'
									+ '<div class="after"></div>';

							contentNode.innerHTML = content;
							placeOverlay.setPosition(new daum.maps.LatLng(
									place.y, place.x));
							placeOverlay.setMap(map);
						}

						// 각 카테고리에 클릭 이벤트를 등록합니다
						function addCategoryClickEvent() {
							var category = document.getElementById('category'), children = category.children;

							for (var i = 0; i < children.length; i++) {
								children[i].onclick = onClickCategory;
							}
						}

						// 카테고리를 클릭했을 때 호출되는 함수입니다
						function onClickCategory() {
							var id = this.id, className = this.className;

							placeOverlay.setMap(null);

							if (className === 'on') {
								currCategory = '';
								changeCategoryClass();
								removeMarker();
							} else {
								currCategory = id;
								changeCategoryClass(this);
								searchPlaces();
							}
						}

						// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
						function changeCategoryClass(el) {
							var category = document.getElementById('category'), children = category.children, i;

							for (i = 0; i < children.length; i++) {
								children[i].className = '';
							}

							if (el) {
								el.className = 'on';
							}
						}
					});
</script>
<link rel="stylesheet" href="/bootstrap/css/jqcloud.css">
<script>

var words = new Array;
var locName = "<%=(String)request.getAttribute("locName")%>";

 $(function() {
	$.ajax({
		url:"getCrawling.do",
		data:{locName : locName},
		type:'POST',
		dataType:"json",
		success:function(data){
			$.each(data,function(key,value){
				var pushData = {text: key, weight: value};
				words.push(pushData);
			});
			
			console.log(words);
			
			$("#keywords").jQCloud(words, {
				width:600,
				height:300
			});
		}
	});
});   
 
 
</script>
<script src="/common/js/main.js"></script>

<title>우리 동네 상권 분석</title>
</head>
<body>
	<%@include file="/common/top.jsp"%>
	<!-- Navigation -->
	<%@include file="/common/nav.jsp"%>

	<section class="page-section clearfix" style="height:2500px">
	<div class="container">
		<div class="intro">
			<!-- <img class="intro-img img-fluid mb-3 mb-lg-0 rounded"
				src="" alt=""> -->
			<div class="intro-text left-0 text-center bg-faded p-5 rounded disp"
				style="height: 430px">
				<h2>선택한 지역</h2>

				<div id="map" style="width: 100%; height: 300px;"></div>


			</div>
			
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="height: 430px; width: 70%;">
				<h2>인구 현황</h2>
				<canvas id="barChart" width="600" height="270"></canvas>

			</div>
			
			
		</div>

		<div class="intro" style="margin-top: 5%">
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="height: 500px; width: 70%; margin: auto;">
				<h2>주요 상권</h2>
				<div class="map_wrap">
					<div id="map2"
						style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					<ul id="category">
						<li id="BK9" data-order="0"><span class="category_bg bank"></span>
							은행</li>
						<li id="MT1" data-order="1"><span class="category_bg mart"></span>
							마트</li>
						<li id="PM9" data-order="2"><span
							class="category_bg pharmacy"></span> 약국</li>
						<li id="OL7" data-order="3"><span class="category_bg oil"></span>
							주유소</li>
						<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
							카페</li>
						<li id="CS2" data-order="5"><span class="category_bg store"></span>
							편의점</li>
					</ul>
				</div>
			</div>
		</div>
		

		<div class="intro" style="margin-top: 5%;margin-left:0px">
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="width:600px;height: 600px;margin-left:0px">
				<h2>업종 비율</h2>
				
				<canvas id="myChart" width="100%" height="100%"></canvas>

			</div>
			
			
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="width: 65%; height: 600px">
				<h2 style="padding-bottom: 2em;">해당 지역 키워드</h2>
				<div id="keywords" style="width: 100%; height: 100%"></div>

			</div>
		</div>

		

		<div class="intro">
			<!-- <img class="intro-img img-fluid mb-3 mb-lg-0 rounded"
				src="" alt=""> -->
			<div class="intro-text left-0 text-center bg-faded p-5 rounded disp"
				style="width: 28%; height: 430px">
				<h2>상권 활성도</h2>

				<h2 class="flh">
					<span id="good">좋음</span> <span id="normal">보통</span> <span
						id="bad">나쁨</span>
				</h2>


			</div>

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
	<script src="/common/js/jqcloud.js" charset="utf-8"></script>

</body>
</html>