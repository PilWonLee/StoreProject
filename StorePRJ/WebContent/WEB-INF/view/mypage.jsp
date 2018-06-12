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
.liStyle{
	margin-top:30px;
}
</style>
<script src="/common/js/jquery-3.3.1.min.js" charset="utf-8"></script>
<script src="/common/js/Chart.bundle.js"></script>
<script src="/common/js/utils.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ff495b96a0548bc815a587a9e4fd80&libraries=services,clusterer,drawing"></script>

<link rel="stylesheet" href="/bootstrap/css/jqcloud.css">
<script>
$(function(){
	var mypage = document
	.getElementById("mypage");
	mypage.className = "nav-item px-lg-4 active"; //카테고리 활성화
	
	var userNo = '<%=(String)session.getAttribute("userNo")%>'
	var labelData = new Array;
	var setData = new Array;
	var colorArr = ["#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
	                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
	                ,"#ff6384","#ff9f40","#ffcd56","#4bc0c0","#36a2eb","#9966ff","#c9cbcf"
	                ];
	 $.ajax({
		url:"getMyAnalysis.do",
		type:"POST",
		data:{userNo:userNo},
		dataType:"json",
		error:function(error){console.log(error)},
		success: function(data){
			$.each(data,function(key, value){
				labelData.push(value.indsName);
				setData.push(value.indsCount);
			})
			var fitColorArr = new Array;
			for(var i = 0; i < setData.length ; i++){
				fitColorArr.push(colorArr[i]);
			}
			
			if(setData.length == 0){
				$('#rateChart').html("<span><h3>기록이 없습니다.</h3></span>");
				$('#rateChart').css("color","blue");
				$('#rateChart').css("margin-top","5rem")
			}else{
		//차트 그리기
		new Chart(document.getElementById("myChart").getContext("2d"), {
			type : 'doughnut',
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
		}
	});
	 
	var wrapArr = new Array();
	
	//분석 기록 가져오기 
	$.ajax({
		url:"getMyHistory.do",
		type:"POST",
		data:{userNo:userNo},
		dataType:"json",
		error:function(error){console.log(error)},
		success: function(data){
			var content = '';
			var i =0;
			$.each(data,function(key,value){
				var arr = new Array();
				arr.push(value.cx);
				arr.push(value.cy);
				arr.push(value.locName);
				arr.push(value.indsCd);
				arr.push(value.indsName);
				arr.push(value.radius);
				arr.push(value.date);
				
				wrapArr.push(arr);
				
				content +="<li class='liStyle'><b>지역</b> :"+ value.locName +" / ";
				content +="<b>업종</b> :"+value.indsName+" / <b>일시</b> : "+ value.date;
				content +="<input type='button' class='gogo' id='"+i+"' value='바로가기' style='width:70px;margin-left:10%''>";
				content +="</li>";
				i++;
			})
			console.log(wrapArr)
			$('.analysisHistory').html(content);
		}
	})
	
	$(document).on('click','.gogo',function(){
		var index = $(this).attr('id');
		$("#radiusId").attr("value" , wrapArr[index][5]);
        $("#locNameId").attr("value" , wrapArr[index][2]);
        $("#cxId").attr("value" , wrapArr[index][0]);
    	$("#cyId").attr("value" , wrapArr[index][1]);
    	$("#midCd").attr("value" , wrapArr[index][3]);
    	$("#midName").attr("value" , wrapArr[index][4]); 
    	$("#transPage").attr({action:"analysisDetail.do", method:'post'}).submit();
	})
})
</script>
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
		<input type="hidden" name="midName" id="midName" value="">
	</form>
	<section class="page-section clearfix" style="height:700px" >
	<div class="container">
		<div class="intro">
			
			<div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="height: 500px; width: 86%;">
				<h3>분석 지역 기록</h3>
				<ul style="margin-top:50px" class="analysisHistory" >
					
				</ul>
			</div>
			 <div
				class="intro-text left-0 text-center bg-faded p-5 rounded disp cust"
				style="height: 500px; width: 70%;">
				<h3>분석 업종 기록</h3>
				<div id="rateChart">
				<canvas id="myChart"  height="270"></canvas>
				</div>
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