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
#floatingCirclesG{
	position:relative;
	width:125px;
	height:125px;
	margin:auto;
	transform:scale(0.6);
		-o-transform:scale(0.6);
		-ms-transform:scale(0.6);
		-webkit-transform:scale(0.6);
		-moz-transform:scale(0.6);
}

.f_circleG{
	position:absolute;
	background-color:rgb(255,255,255);
	height:22px;
	width:22px;
	border-radius:12px;
		-o-border-radius:12px;
		-ms-border-radius:12px;
		-webkit-border-radius:12px;
		-moz-border-radius:12px;
	animation-name:f_fadeG;
		-o-animation-name:f_fadeG;
		-ms-animation-name:f_fadeG;
		-webkit-animation-name:f_fadeG;
		-moz-animation-name:f_fadeG;
	animation-duration:1.2s;
		-o-animation-duration:1.2s;
		-ms-animation-duration:1.2s;
		-webkit-animation-duration:1.2s;
		-moz-animation-duration:1.2s;
	animation-iteration-count:infinite;
		-o-animation-iteration-count:infinite;
		-ms-animation-iteration-count:infinite;
		-webkit-animation-iteration-count:infinite;
		-moz-animation-iteration-count:infinite;
	animation-direction:normal;
		-o-animation-direction:normal;
		-ms-animation-direction:normal;
		-webkit-animation-direction:normal;
		-moz-animation-direction:normal;
}

#frotateG_01{
	left:0;
	top:51px;
	animation-delay:0.45s;
		-o-animation-delay:0.45s;
		-ms-animation-delay:0.45s;
		-webkit-animation-delay:0.45s;
		-moz-animation-delay:0.45s;
}

#frotateG_02{
	left:15px;
	top:15px;
	animation-delay:0.6s;
		-o-animation-delay:0.6s;
		-ms-animation-delay:0.6s;
		-webkit-animation-delay:0.6s;
		-moz-animation-delay:0.6s;
}

#frotateG_03{
	left:51px;
	top:0;
	animation-delay:0.75s;
		-o-animation-delay:0.75s;
		-ms-animation-delay:0.75s;
		-webkit-animation-delay:0.75s;
		-moz-animation-delay:0.75s;
}

#frotateG_04{
	right:15px;
	top:15px;
	animation-delay:0.9s;
		-o-animation-delay:0.9s;
		-ms-animation-delay:0.9s;
		-webkit-animation-delay:0.9s;
		-moz-animation-delay:0.9s;
}

#frotateG_05{
	right:0;
	top:51px;
	animation-delay:1.05s;
		-o-animation-delay:1.05s;
		-ms-animation-delay:1.05s;
		-webkit-animation-delay:1.05s;
		-moz-animation-delay:1.05s;
}

#frotateG_06{
	right:15px;
	bottom:15px;
	animation-delay:1.2s;
		-o-animation-delay:1.2s;
		-ms-animation-delay:1.2s;
		-webkit-animation-delay:1.2s;
		-moz-animation-delay:1.2s;
}

#frotateG_07{
	left:51px;
	bottom:0;
	animation-delay:1.35s;
		-o-animation-delay:1.35s;
		-ms-animation-delay:1.35s;
		-webkit-animation-delay:1.35s;
		-moz-animation-delay:1.35s;
}

#frotateG_08{
	left:15px;
	bottom:15px;
	animation-delay:1.5s;
		-o-animation-delay:1.5s;
		-ms-animation-delay:1.5s;
		-webkit-animation-delay:1.5s;
		-moz-animation-delay:1.5s;
}



@keyframes f_fadeG{
	0%{
		background-color:rgba(22,56,224,0.98);
	}

	100%{
		background-color:rgb(255,255,255);
	}
}

@-o-keyframes f_fadeG{
	0%{
		background-color:rgba(22,56,224,0.98);
	}

	100%{
		background-color:rgb(255,255,255);
	}
}

@-ms-keyframes f_fadeG{
	0%{
		background-color:rgba(22,56,224,0.98);
	}

	100%{
		background-color:rgb(255,255,255);
	}
}

@-webkit-keyframes f_fadeG{
	0%{
		background-color:rgba(22,56,224,0.98);
	}

	100%{
		background-color:rgb(255,255,255);
	}
}

@-moz-keyframes f_fadeG{
	0%{
		background-color:rgba(22,56,224,0.98);
	}

	100%{
		background-color:rgb(255,255,255);
	}
}
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

#good2 {
  color : green
}

#normal2{
  margin-top:20px;
  margin-bottom:20px;
  color : gold;
}

#bad2{
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ff495b96a0548bc815a587a9e4fd80&libraries=services,clusterer,drawing"></script>
<script>
	$(function() {
		//카테고리 활성솨
		var compareCategory = document
		.getElementById("compareCategory");
		compareCategory.className = "nav-item px-lg-4 active"; //카테고리 활성화
		
		 $.ajax({
			url:"getCompareActivityRate.do",
			dataType:'json',
			error:function(error){console.log(error)},
			success:function(data){
					var importantStoreCnt = data.importantStoreCnt;
					var importantStoreCnt2 = data.importantStoreCnt2;
				 if(importantStoreCnt > 3){
					document.getElementById("good").className="light";
				}else if(importantStoreCnt > 0){
					document.getElementById("normal").className="light";
				}else{
					document.getElementById("bad").className="light";
				}
				 
				 if(importantStoreCnt2 > 3){
						document.getElementById("good2").className="light";
					}else if(importantStoreCnt2 > 0){
						document.getElementById("normal2").className="light";
					}else{
						document.getElementById("bad2").className="light";
					} 
			}
		}); 
			var locName = '<%=request.getParameter("locName")%>';
			console.log("locName: "+locName);
			var radius = <%=request.getParameter("radius")%>;
			var cx = <%=request.getParameter("cx")%>;
			var cy = <%=request.getParameter("cy")%>;
			var locName2 = '<%=request.getParameter("locName2")%>';
			console.log("locName2: "+locName2);
			var radius2 = <%=request.getParameter("radius2")%>;
			var cx2 = <%=request.getParameter("cx2")%>;
			var cy2 = <%=request.getParameter("cy2")%>;
			 
			var MONTHS = [ '10대', '20대', '30대', '40대', '50대', '60대',
					'70대', '80대', '90대'];
			
			var color = Chart.helpers.color;
			
			var womanData = new Array();
			var manData = new Array();
		
		
		//업종 비교 그래프
		var color = Chart.helpers.color;
		var upJong = new Array();
		var locData1 = new Array();
		var locData2 = new Array();
		
		 $.ajax({
				url:"getStoreInfoCompare.do",
				type:"POST",
				dataType:"json",
				error:function(error){console.log(error)},
				success: function(data){
					$.each(data.label,function(index,data){
						upJong.push(data);
					}); 
					$.each(data.mapObj,function(key,value){
						locData1.push(value);
					});
					$.each(data.mapObj2,function(key,value){
						locData2.push(value);	
					});
					
				  
				
				var barChartData = {
					labels : upJong,
					datasets : [
							{
								label : locName,
								backgroundColor : color(window.chartColors.yellow).alpha(
										0.5).rgbString(),
								borderColor : window.chartColors.yellow,
								borderWidth : 1,
								data : locData1
							},
							{
								label : locName2,
								backgroundColor : color(window.chartColors.green).alpha(
										0.5).rgbString(),
								borderColor : window.chartColors.green,
								borderWidth : 1,
								data :locData2
							} ]

					};
				

				var ctx = document.getElementById('myChart').getContext('2d');
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
		      }	 
			});	
		
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
			})
		  
		
		
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
      }	
	});	
	
		var womanData2 = new Array();
		var manData2 = new Array();
		
		$.ajax({
			url:"getPopulation.do",
			type:"POST",
			data:{locName:locName2},
			dataType:"json",
			error:function(error){console.log(error)},
			success: function(data){
				$.each(data,function(key, value){
					womanData2.push(value.totalWoman);
					manData2.push(value.totalMan);
				})
			  
			
			
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
							data : womanData2
						},
						{
							label : '남성',
							backgroundColor : color(window.chartColors.blue).alpha(
									0.5).rgbString(),
							borderColor : window.chartColors.blue,
							borderWidth : 1,
							data :manData2
						} ]

				};
			

			var ctx = document.getElementById('barChart2').getContext('2d');
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
	      }	
		});	
		
		//지도에 표시될 지도 레벨 정하기
		var level;
		if (radius < 300) {
			level = 4;
		} else if (radius < 600) {
			level = 5;
		} else {
			level = 6;
		}
		
		var level2;
		if (radius2 < 300) {
			level2 = 4;
		} else if (radius2 < 600) {
			level2 = 5;
		} else {
			level2 = 6;
		}
	

						

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
						
						//=========================================다른 지역 표시=========================
						var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
						mapOption = {
							center : new daum.maps.LatLng(cy2, cx2), // 지도의 중심좌표
							level : level2
						// 지도의 확대 레벨
						};
						var map = new daum.maps.Map(mapContainer, mapOption); // 지도2를 생성합니다
						var circle = new daum.maps.Circle({
							center : new daum.maps.LatLng(cy2, cx2), // 원의 중심좌표 입니다 
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
						
					});

</script>
<link rel="stylesheet" href="/bootstrap/css/jqcloud.css">
<script>

var words = new Array;
var locName = "<%=(String)request.getAttribute("locName")%>";
var midName = "<%=(String)request.getAttribute("midName")%>";
var contents = ''; 
 $(function() {
	 $('#couldStart').mouseover(function(event){
			$(this).css('cursor','pointer');
		})
		contents =  '<div id="floatingCirclesG">';
	 	contents +='<div class="f_circleG" id="frotateG_01"></div>';
	 	contents +='<div class="f_circleG" id="frotateG_02"></div>';
	 	contents +='<div class="f_circleG" id="frotateG_03"></div>';
	 	contents +='<div class="f_circleG" id="frotateG_04"></div>';
	 	contents +='<div class="f_circleG" id="frotateG_05"></div>';
	 	contents +='<div class="f_circleG" id="frotateG_06"></div>';
	 	contents +='<div class="f_circleG" id="frotateG_07"></div>';
	 	contents +='<div class="f_circleG" id="frotateG_08"></div>';
	 	contents +='</div>';
		
	 $('#couldStart').click(function(){
		 $("#keywords").html(contents);
		 $.ajax({
				url:"getCrawling.do",
				data:{locName : locName, midName: midName},
				type:'POST',
				dataType:"json",
				success:function(data){
					 $("#keywords").html('');
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
	 })
	
});       
   
 
</script>
<script src="/common/js/top.js"></script>

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
				<h3>선택한 기준 지역</h3>

				<div id="map" style="width: 100%; height: 300px;"></div>


			</div>
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="height: 430px; width: 70%;">
				<h2><%=request.getParameter("locName") %> 인구 현황</h2>
				<canvas id="barChart" width="600" height="270"></canvas>

			</div>
			
		</div>

		<div class="intro" style="margin-top: 5%">
			<div class="intro-text left-0 text-center bg-faded p-5 rounded disp"
				style="height: 430px">
				<h3>선택한 비교 지역</h3>

				<div id="map2" style="width: 100%; height: 300px;"></div>


			</div>
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="height: 430px; width: 70%;">
				<h2><%=request.getParameter("locName2") %> 인구 현황</h2>
				<canvas id="barChart2" width="600" height="270"></canvas>

			</div>
		</div>
		

		<div class="intro" style="margin-top: 5%;margin-left:0px">
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="width:1110px;height: 600px;margin-left:0px">
				<h3>업종 비교</h3>
				<div id="rateChart" >
				<canvas id="myChart" width="100%" ></canvas>
				</div>
			</div>
			
			
		</div>

		

		<div class="intro">
			<!-- <img class="intro-img img-fluid mb-3 mb-lg-0 rounded"
				src="" alt=""> -->
			<div class="intro-text left-0 text-center bg-faded p-5 rounded disp"
				style="width: 28%;height: 430px;margin-left: 10%;">
				<h2><%=request.getParameter("locName") %><br>상권 활성도</h2>

				<h2 class="flh">
					<span id="good">좋음</span> <span id="normal">보통</span> <span
						id="bad">나쁨</span>
				</h2>


			</div>
			<div class="intro-text left-0 text-center bg-faded p-5 rounded disp"
				style="width: 28%;height: 430px;margin-left: 21%;">
				<h2><%=request.getParameter("locName2") %><br>상권 활성도</h2>

				<h2 class="flh">
					<span id="good2">좋음</span> <span id="normal2">보통</span> <span
						id="bad2">나쁨</span>
				</h2>


			</div>

		</div>



	</div>
	</section>




	<!-- Bootstrap core JavaScript -->
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/common/js/jqcloud.js" charset="utf-8"></script>

</body>
</html>