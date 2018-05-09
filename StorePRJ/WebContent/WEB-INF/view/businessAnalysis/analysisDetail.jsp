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
	margin-top: 50px;
}

#good {
	color: green
}

#normal {
	margin-top: 20px;
	margin-bottom: 20px;
	color: gold;
}

#bad {
	color: red
}

.flh>span {
	display: block;
}

.flh
>
span
:not
 
(
.light
 
)
{
opacity
:
 
0;
animation
:
 
flashText
 
.5s
 
ease-out
 
alternate
 
infinite
;


}
.flh>span.light {
	position: relative;
	display: inline-block;
}

@
keyframes flash {to { opacity:1;
	
}

}
@
keyframes flashText {to { opacity:0.15;
	
}
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/common/js/Chart.bundle.js"></script>
<script src="/common/js/utils.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script>
	$(function() {
		//차트 그리기
		new Chart(document.getElementById("myChart").getContext("2d"), {
			type : 'pie',
			data : {
				labels : [ "한식", "중식", "유흥주점", "노래방" ],
				datasets : [ {
					label : "Population (millions)",
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#3cba9f",
							"#e8c3b9" ],
					data : [ 24, 20, 30, 50 ]
				} ]
			},
			options : {
				title : {
					display : true,
					fontSize : 20
				}
			}
		});
	
		
		var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		var color = Chart.helpers.color;
		var barChartData = {
			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			datasets: [{
				label: '여성',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					3,
					3,
					4
				]
			}, {
				label: '남성',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					3,
					5,
					6
				]
			}]

		};

		var ctx = document.getElementById('barChart').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartData,
			options: {
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
				},
				scales: {
			        yAxes: [{
			            ticks: {
			                beginAtZero:true
			            }
			        }]
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
	$(document).ready(function() {
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
			strokeWeight : 5, // 선의 두께입니다 
			strokeColor : '#75B8FA', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			strokeStyle : 'dashed', // 선의 스타일 입니다
			fillColor : '#CFE7FF', // 채우기 색깔입니다
			fillOpacity : 0.7
		// 채우기 불투명도 입니다   
		});

		// 지도에 원을 표시합니다 
		circle.setMap(map);
	});
</script>
<script src="/common/js/main.js"></script>

<title>우리 동네 상권 분석</title>
</head>
<body>
	<%@include file="/common/top.jsp"%>
	<!-- Navigation -->
	<%@include file="/common/nav.jsp"%>

	<section class="page-section clearfix">
	<div class="container">
		<div class="intro">
			<!-- <img class="intro-img img-fluid mb-3 mb-lg-0 rounded"
				src="" alt=""> -->
			<div class="intro-text left-0 text-center bg-faded p-5 rounded disp"
				style="height: 430px">
				<h2>선택한 상권</h2>

				<div id="map" style="width: 100%; height: 300px;"></div>


			</div>

			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="height: 430px">
				<h2>상권 비율</h2>

				<canvas id="myChart" width="600" height="400"></canvas>
			</div>
		</div>

		<div class="intro" style="margin-top:5%">
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust" 
				style="height: 430px; width: 70%; margin:auto;">
				<h2>인구 현황</h2>
				<canvas id="barChart" width="600" height="270"></canvas>
				
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


</body>
</html>