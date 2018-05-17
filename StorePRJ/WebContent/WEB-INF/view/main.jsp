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
</style>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script>
	window.onload = function() {
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
		
		//상권활성도 나타내기
		document.getElementById("normal").className="light";
	}
</script>
<!-- The jQuery library is a prerequisite for all jqSuite products -->
<script src="bower_components/jquery/dist/jquery.js"></script>
<script src="bower_components/underscore/underscore.js"></script>
<script src="bower_components/backbone/backbone.js"></script>
<script src="bower_components/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="bower_components/tui-pagination/dist/tui-pagination.js"></script>
<script src="bower_components/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="bower_components/tui-grid/dist/tui-grid.js"></script>   
<link rel="stylesheet" type="text/css" href="/bower_components/tui-grid/dist/tui-grid.css" />
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42ff495b96a0548bc815a587a9e4fd80&libraries=services,clusterer,drawing"></script>
<script>
$(document).ready(function(){ 
	
	var selectNation = $('#selectNation');//버튼 만들기
	selectNation.text("시,도 선택");
	var selectCity = $("#selectCity");
	selectCity.text("시,군,구 선택");
	
	var selectBusiness1 = $('#selectBigInds');
	selectBusiness1.text("업종 대분류");
	
	var MidCd;
	
	getLocation();
	
	function getLocation() {
		  if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {
		      lat = position.coords.latitude;
		      lng = position.coords.longitude;
		      console.log("lat: "+lat);
		      console.log("lng: "+lng);
		  var geocoder = new daum.maps.services.Geocoder();
			geocoder.coord2Address(lng, lat, function(result, status) {
			          var detailAddr = result[0].address.address_name; 
			          var res = detailAddr.split(" ");
			          var locName = '';
			            
			           
					for(var i = 0; i < res.length; i ++){
						if(res[i].indexOf('구') == (res[i].length -1)){
								locName = res[i];
							}
						}
			            
					if(locName == ''){
						for(var i = 0; i < res.length; i ++){
							if(res[i].indexOf('시') == (res[i].length -1)){
								locName = res[i];
							}
						}
					}    
					
					console.log("locName: "+locName);
		      
		    });
		  });
		}
	};
	
	//업종 대분류 불러오기
	$.ajax({
				url:"searchBigInds.do",
				dataType:"json",
				success:function(data){
					var contents = "";
					$.each(data,function(key,value){
						contents += "<a class='dropdown-item' href='#' id='"+value.indsLclsCd+"'>"+value.indsLclsNm+"</a> ";
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
	





	var grid = new tui.Grid({
	    el: $('#grid'),
	    bodyHeight:200,
	    scrollX: false,
	    scrollY: true,
	    rowHeight: 35,
	    rowHeaders: ['rowNum'],
	    header: {
	        height: 40
	    },
	    columnOptions: {
	        width: 100
	    },
	    columns: [
	        {
	            title: 'ID',
	            name: 'c1',
	            align: 'center',
	            editOption: {
	                beforeContent: 'FE',
	                type: 'text'
	            }
	        },
	        {
	            title: 'Name',
	            defaultValue: 2,
	            name: 'c2',
	            align: 'center',
	            editOption: {
	                type: 'text',
	            }
	        },
	        {
	            title: 'Score',
	            name: 'c3',
	            align: 'center',
	            editOption: {
	                type: 'text',
	                afterContent: ' Point',
	            }
	        }
	    ]
	});
	
	var gridData = [
	    {
	        c1: '100013',
	        c2: 'Mustafa Cosme',
	        c3: 291232
	    },
	    {
	        c1: '201212',
	        c2: 'Gunnar Fausto',
	        c3: 32123
	    },
	    {

	        c1: '241221',
	        c2: 'Junior Morgan',
	        c3: 88823
	    },
	    {
	        c1: '991232',
	        c2: 'Tódor Ingo',
	        c3: 9981
	    },
	    {
	        c1: '299921',
	        c2: 'Zezé Obadiah',
	        c3: 140212
	    },
	    {
	        c1: '772193',
	        c2: 'Alfwin Damir',
	        c3: 30012
	    },
	    {
	        c1: '991232',
	        c2: 'Feroz Fredrik',
	        c3: 111023
	    },
	    {
	        c1: '572812',
	        c2: 'Archer Beniamino',
	        c3: 229123
	    },
	    {
	        c1: '310832',
	        c2: 'Dado Shaul',
	        c3: 123
	    },
	    {
	        c1: '321232',
	        c2: 'Svetoslav Eder',
	        c3: 81252
	    },
	    {
	        c1: '229123',
	        c2: 'Lauri Gligor',
	        c3: 230923
	    },
	    {
	        c1: '589282',
	        c2: 'Ruben Bèr',
	        c3: 11523
	    },
	    {
	        c1: '321234',
	        c2: 'Vicenç Hadrien',
	        c3: 29912
	    },
	    {
	        c1: '632123',
	        c2: 'Borna Rochus',
	        c3: 62842
	    },

	    {
	        c1: '122123',
	        c2: 'Kristijonas Tate',
	        c3: 199823
	    },
	    {
	        c1: '211232',
	        c2: 'Kumara Archimedes',
	        c3: 112522
	    },
	    {
	        c1: '487297',
	        c2: 'Hershel Radomil',
	        c3: 399123
	    },
	    {
	        c1: '232123',
	        c2: 'Toma Levan',
	        c3: 231253
	    },
	    {
	        c1: '828723',
	        c2: 'Njord Thoko',
	        c3: 89123
	    }
	];
	
	grid.setData(gridData);
	grid.disableRow(6);
	tui.Grid.applyTheme('striped');
	
	
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
			<div class="intro-text left-0 text-center bg-faded p-5 rounded disp" style="height:430px">
				<h1>상권 현황</h1>
				
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
				<canvas id="myChart" width="600" height="400"></canvas>
			
			</div>

			<div class="intro-text left-0 text-center bg-faded p-5 rounded disp cust" style="height:430px">
				<h1>상권 활성도</h1>
				
				
				<h2 class="flh">
					<span id="good">좋음</span>
					<span id="normal">보통</span>
					<span id="bad">나쁨</span> 
				</h2>
			</div>
			
			
			
		</div>
		
		<div class="intro-text left-0 text-center bg-faded p-5 rounded disp cust" style="height:430px; width:65%; margin-top:50px;">
				<div id="grid"></div>
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