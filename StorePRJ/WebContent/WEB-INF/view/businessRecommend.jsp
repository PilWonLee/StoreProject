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
<!-- <link href="/bootstrap/css/myStyle.css" rel="stylesheet"> -->
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

<!--selectbox 스타일-->
<link rel="stylesheet" type="text/css" href="bootstrap/css/selectbox.css">
<style>
.content{
    vertical-align: middle;
    text-align: center;
    margin-left: auto;
    margin-right: auto;
    align: center;
    height:130px;
}

.content.top{
	vertical-align:top;
}	
.row100.body.content{
	display:none;	
}
	
.column1{
	width:13%;
}

.column2{
	padding-left:3%;
	width:25%;
}

.column3{
	width:13%;
}
.modify{
	margin:5px;
}
.delete{
	margin:5px;
}
span:hover{
	cursor:pointer;
}
</style>
<title>우리 동네 상권 분석</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		var recommendCategory = document.getElementById("recommendCategory");
		recommendCategory.className = "nav-item px-lg-4 active"; // 카테고리
		var selectNation = $('#selectNation');// 버튼 만들기
		selectNation.text("시,도 선택");
		var selectCity = $("#selectCity");
		selectCity.text("시,군,구 선택");
		var selectBusiness1 = $('#selectBigInds');
		selectBusiness1.text("업종 대분류");
		var MidCd = '';
		var MidNameArr = new Array;
		
		getList();
		resize();
		
		function resize(){
			$('.js-pscroll').each(function() {
				var ps = new PerfectScrollbar(this);
				$(window).on('resize', function() {
					ps.update();
				})
			}); 
		}
		
		// 시,도 불러오기
		$
				.ajax({
					url : "searchSido.do",
					dataType : "json",
					success : function(data) {
						var contents = "";
						contents +="<option value=''>시,도 선택</option>";
						$
								.each(
										data,
										function(key, value) {
											
											contents += "<option value='"
													+value.ctprvnCd
													+"' id='"+value.ctprvnCd+"'>"
													+ value.ctprvnNm
													+"</option>";
													
										});
						$('#selectNationDrop').html(contents);
						addClickEventNation(); 
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});

		 // 시,도 드랍다운에 이벤트 추가 함수
		function addClickEventNation() {
			$('#selectNationDrop').change(function(event) {
								var ctprvnCd = $(this).val();
								$.ajax({
											data : {
												'ctprvnCd' : ctprvnCd
											},
											url : "searchSigungu.do",
											dataType : "json",
											success : function(data) {
												var contents = "";
												contents += "<option value=''>시,군,구 선택</option>";
												$.each(data,function(key,value) {
																	contents += "<option value='"
																		+value.signguCd
																		+"' id='"+value.signguCd+"'>"
																		+value.signguNm
																		+"</option>";
																});
												$('#selectCityDrop').html(contents);
												
												/* addClickEventCity(); */

											},
											error : function(request, status,
													error) {
												alert("code:" + request.status
														+ "\n" + "message:"
														+ request.responseText
														+ "\n" + "error:"
														+ error);
											}
										});
							});
		}
		

		//업종 대분류 불러오기
		$.ajax({
					url : "searchBigInds.do",
					dataType : "json",
					success : function(data) {
						var contents = "";
						contents +="<option value=''>업종분류 선택</option>";
						$.each(data,function(key, value) {
											contents += "<option value='"
												+value.indsLclsCd
												+"' id='"+value.indsLclsCd+"'>"
												+value.indsLclsNm
												+"</option>";
											var MidNameObj = new Object();
											MidNameObj.key = value.indsLclsCd;
											MidNameObj.value = value.indsLclsNm;
											MidNameArr.push(MidNameObj);
										});
						$('#selectBigIndsDrop').html(contents);
						
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});

		// 클릭하면 내용 보여주기
		$(document).on("click", ".row100.body",function(event){
			var unpureId = $(this).attr("id");
			var pureId = unpureId.substring(1,unpureId.length);
			console.log(pureId);
			$("#"+pureId).toggle();
			$('.js-pscroll').each(function() {
				var ps = new PerfectScrollbar(this);
				$(window).on('resize', function() {
					ps.update();
				})
			}); 
		});
		var loginUser = <%=CmmUtil.nvl((String)session.getAttribute("userNo"))%>;
		// modify
		 $(document).on("click", ".modify",function(event){
			var rcdId = $(this).closest("td").attr("id");
			var reguser = $(this).attr("reguser");
			console.log('rcdId : '+rcdId);
			console.log('reguser : '+reguser);
			console.log('login : '+loginUser);
			if(loginUser == reguser || loginUser == '10001'){
				location.href="businessModify.do?rcdNo="+rcdId;	
			}else{
				alert("본인이 작성한 글만 수정할 수 있습니다.");
				return;
			}
			
		}); 
		
		// delete
		 $(document).on("click", ".delete",function(event){
			var rcdId = $(this).closest("td").attr("id");
			var reguser = $(this).attr("reguser");
			if(loginUser != reguser){
				alert("본인이 작성한 글만 삭제할 수 있습니다.");
				return;
			}
			$.ajax({
				url:"rcdDelete.do",
				data:{rcdId : rcdId},
				method:'POST',
				success:function(){
					alert("삭제완료");
					getList();
					start = 0;
				},
				error:function(error){
					console.log(error);
				}
			})
			
		}); 
		
		
		var start = 0;
		//더보기
		$(document).on("click","#add",function() {
			start += 7;
			console.log(start);
			
			$.ajax({
				url:"addList.do",
				data:{start: start},
				method: 'POST',
				dataType: 'json',
				success : function(data){
					var dataLength = data.length;
					var contents ='';
					$.each(data,function(key,value){
						contents +="<tr class='row100 body' id='A"+value.rcdNo+"' >";
						contents +="<td class='cell100 column1'>"+value.rcdNo+"</td>";
						contents +="<td class='cell100 column2'>"+value.title+"</td>";
						contents +="<td class='cell100 column3'>"+value.sigunguName+"</td>";
						contents +="<td class='cell100 column4'>"+value.indsName+"</td>";
						contents +="<td class='cell100 column5'>"+value.regDate+"</td>";
						contents +="</tr>";
						contents +="<tr class='row100 body content' id='"+value.rcdNo+"'>";
						contents +="<td class='content' colspan='3'><span>";
						contents += value.content+"</span></td><td class='content top' colspan='2' id='"+value.rcdNo+"'>";
						contents += "<span><b>작성자</b>  : "+value.email+"</span>";
						contents += "<span class='modify'  reguser='"+value.regUserNo+"'><b>수정</b></span>";
						contents += "<span class='delete' reguser='"+value.regUserNo+"'><b>삭제</b><span></span>";
						contents += "</td></tr>";
					})
					
					$('#add').before(contents);
					if(dataLength <= 7){
						$('#add').html('');
					}
					$('.js-pscroll').each(function() {
						console.log(this);
						var ps = new PerfectScrollbar(this);
						$(window).on('resize', function() {
							ps.update();
						})
					}); 
				},
				error:function(error){console.log(error)}
			})
		})
		
		//등록하기 버튼
		$('#continue').click(function(event) {
			location.href = "#add";
		})
		
		
		$('#doReg').click(function(){
		var resultArr = $('#frm').serializeArray();
		var Obj1 = new Object();
		var Obj2 = new Object();
		var Obj3 = new Object();
		Obj1.name = 'indsName';
		Obj1.value = $('#selectBigIndsDrop option:selected').text();
		Obj2.name = 'sidoName';
		Obj2.value = $('#selectNationDrop option:selected').text();
		Obj3.name = 'sigunguName';
		Obj3.value = $('#selectCityDrop option:selected').text();
		resultArr.push(Obj1)
		resultArr.push(Obj2)
		resultArr.push(Obj3)
		
		//유효성검사위해서 serializeArray으로 만든 배열을 object로 변환
		var dataObj = {};
		$(resultArr).each(function(i, field){
		  dataObj[field.name] = field.value;
		});
		
		if(dataObj['sidoName'] == "시,도 선택" ){
			alert("시,도 선택해 주세요");
			return;
		}else if(dataObj['sigunguName'] == "시,군,구 선택"){
			alert("시,군,구 선택해 주세요");
			return;
		}else if(dataObj['indsName'] == "업종분류 선택"){
			alert("업종을 선택해 주세요");
			return;
		}else if(dataObj['title'] == ""){
			alert("제목을 작성해 주세요");
			return;
		}else if(dataObj['content'] == ""){
			alert("내용을 작성해 주세요");
			return;
		}
		 $.ajax({
			url:"RegProc.do",
			data:resultArr,
			method:"POST",
			success:function(){
				$("#frm")[0].reset();
				getList();
			},
			error:function(error){
				console.log(error);
			} 
		})
	})
	
	});
	
	//게시판 리스트 불러오기
	 function getList(){
			var contents ="";
			$.ajax({
				url:"getRcdList.do",
				dataType:"json",
				success:function(data){
					var dataLength = data.length;
					$.each(data,function(key,value){
						contents +="<tr class='row100 body' id='A"+value.rcdNo+"' >";
						contents +="<td class='cell100 column1'>"+value.rcdNo+"</td>";
						contents +="<td class='cell100 column2'>"+value.title+"</td>";
						contents +="<td class='cell100 column3'>"+value.sigunguName+"</td>";
						contents +="<td class='cell100 column4'>"+value.indsName+"</td>";
						contents +="<td class='cell100 column5'>"+value.regDate+"</td>";
						contents +="</tr>";
						contents +="<tr class='row100 body content' id='"+value.rcdNo+"'>";
						contents +="<td class='content' colspan='3'><span>";
						contents += value.content+"</span></td><td class='content top' colspan='2' id='"+value.rcdNo+"'>";
						contents += "<span><b>작성자</b>  : "+value.email+"</span>";
						contents += "<span class='modify'  reguser='"+value.regUserNo+"'><b>수정</b></span>";
						contents += "<span class='delete' reguser='"+value.regUserNo+"'><b>삭제</b><span></span>";
						contents += "</td></tr>";
					})
					
					contents += "<tr class='row100 body' style='text-align:center' id='add'><td colspan='5'><span>더보기</span></td></tr>";
					
					$('.table100-body.js-pscroll tbody').html(contents);
					
					if(dataLength < 7){
						$('#add').html('');
					}
					
					location.href='#list';
				},
				error:function(error){
					console.log(error);
				}
			});
			
		} 
	
</script>
</head>
<body>
	<%@include file="/common/top.jsp"%>
	<!-- Navigation -->
	<%@include file="/common/nav.jsp"%>
	<div id="pages" class="container" style="height:900px">
		<section id="list" data-url="list" data-default-page="true">
		<div style="text-align: right; margin-top: 2%; width: 150px; margin-left: 85%">
			<div class="container-login100-form-btn">
				<div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn"></div>
					<button data-transition="pop" class="login100-form-btn" id="continue">
						<h5>
							<b>등록</b>
						</h5>
					</button>
				</div>
			</div>
		</div>
		<div class="table100 ver1 m-b-110" style="margin-top: 1%">
			<div class="table100-head">
				<table>
					<thead>
						<tr class="row100 head">
							<th class="cell100 column1"><b>글번호</b></th>
							<th class="cell100 column2"><b>제목</b></th>
							<th class="cell100 column3"><b>지역</b></th>
							<th class="cell100 column4"><b>업종</b></th>
							<th class="cell100 column5"><b>등록일</b></th>
						</tr>
					</thead>
				</table>
			</div>

			<div class="table100-body js-pscroll">
				<table>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>

		</section>
		<section id="add" data-url="add">

		<div class="wrap-login100" style="width: 800px; margin-top: 5%; margin-bottom: 6%; background-color: #f8f8f8; margin-left: auto; margin-right: auto;">
			<div style="text-align: right;">
				<!-- Flip, Spin, Slide, Slideup, Slidedown, Fade, Pop, Turn  -->
				<span data-transition="pop" onmouseover="this.style.cursor='pointer'" style="color: #858585" onclick="location.href='#list'">뒤로가기</span>
			</div>
			<form class="login100-form validate-form" id="frm">

				<span class="login100-form-title p-b-26"> 추천 상권 등록 </span>

				<div style="width: 300px;display: inline-block;">
					<!-- 도 선택 셀렉트박스 -->
					<select name="sido" id="selectNationDrop" class="custom-select sources" >
						<option value="">시,도 선택</option>
					</select> 
					<!-- 시군구 건택 셀렉트 박스 -->
					<select name="sigungu" id="selectCityDrop" class="custom-select sources" >
						<option value="">시,군,구 선택</option>
					</select>
					
				</div>
				<div style="width: 300px;display: inline-block;">
					<select name="indsCd" id="selectBigIndsDrop" class="custom-select sources" >
					</select>
				</div>
				
				<div class="wrap-input100 validate-input" style="margin-top:45px">
					<input class="input100" type="text" name="title"> <span class="focus-input100" data-placeholder="글 제목"></span>
				</div>

				<div class="wrap-input100 validate-input">
					<span class="btn-show-pass"> </span>
					<!-- <input class="input100" type="text" name="contents"> -->
					<textarea name="content" class="input100" style="height: 200px"></textarea>
					<span class="focus-input100" data-placeholder="글 내용"></span>
				</div>

				<div class="container-login100-form-btn">
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" type="button" id="doReg">
							<h5>
								<b>등록</b>
							</h5>
						</button>
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
	
	<!--===============================================================================================-->
	<script src="form/js/main.js"></script>
	<!-- selectbox스크립트 -->
	<!-- <script src="common/js/selectbox.js"></script> -->
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