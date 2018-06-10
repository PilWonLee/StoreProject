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
	
	var indsCd = '<%=(String)request.getAttribute("indsCd")%>';
	var sido = '<%=(String)request.getAttribute("sido")%>';
	var sigungu = '<%=(String)request.getAttribute("sigungu")%>';

	
	//글제목 글내용 활성화
	$('textarea').focus();
	$('input[name=title]').focus()
	
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
					$('#'+sido).attr("selected","selected");
					$.ajax({
						data : {
							'ctprvnCd' : sido
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
							$('#'+sigungu).attr("selected","selected");
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
											$('#'+sigungu).attr("selected","selected");
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
					$('#'+indsCd).attr("selected","selected");
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:"
							+ error);
				}
			});
	
	$('#doReg').click(function(){
		var resultArr = $('#frm').serializeArray();
		var Obj1 = new Object();
		var Obj2 = new Object();
		var Obj3 = new Object();
		var Obj4 = new Object();
		Obj1.name = 'indsName';
		Obj1.value = $('#selectBigIndsDrop option:selected').text();
		Obj2.name = 'sidoName';
		Obj2.value = $('#selectNationDrop option:selected').text();
		Obj3.name = 'sigunguName';
		Obj3.value = $('#selectCityDrop option:selected').text();
		Obj4.name = 'rcdNo';
		Obj4.value = '<%=request.getAttribute("rcdNo")%>';
		resultArr.push(Obj1);
		resultArr.push(Obj2);
		resultArr.push(Obj3);
		resultArr.push(Obj4);
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
			url:"ModifyProc.do",
			data:resultArr,
			method:"POST",
			success:function(){
				$("#frm")[0].reset();
				alert("수정완료!");
				location.href="recommendMain.do";
			},
			error:function(error){
				console.log(error);
			} 
		})
	})
	
});
	
</script>
</head>
<body>
	<%@include file="/common/top.jsp"%>
	<!-- Navigation -->
	<%@include file="/common/nav.jsp"%>
	<div id="pages" class="container" style="height:900px">
		

		<div class="wrap-login100" style="width: 800px; margin-top: 5%; margin-bottom: 6%; background-color: #f8f8f8; margin-left: auto; margin-right: auto;">
			<div style="text-align: right;">
				<!-- Flip, Spin, Slide, Slideup, Slidedown, Fade, Pop, Turn  -->
				<span data-transition="pop" onmouseover="this.style.cursor='pointer'" style="color: #858585" onclick="location.href='recommendMain.do'">뒤로가기</span>
			</div>
			<form class="login100-form validate-form" id="frm">

				<span class="login100-form-title p-b-26"> 추천 상권 수정 </span>

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
					<input class="input100" type="text" name="title" value="<%=request.getAttribute("title") %>"> <span class="focus-input100" data-placeholder="글 제목"></span>
				</div>

				<div class="wrap-input100 validate-input">
					<span class="btn-show-pass"> </span>
					<!-- <input class="input100" type="text" name="contents"> -->
					<textarea name="content" class="input100" style="height: 200px"><%=request.getAttribute("content") %></textarea>
					<span class="focus-input100" data-placeholder="글 내용"></span>
				</div>

				<div class="container-login100-form-btn">
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" type="button" id="doReg">
							<h5>
								<b>수정</b>
							</h5>
						</button>
					</div>
				</div>
			</form>
		</div>


		<div id="dropDownSelect1"></div>


	
		
		

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
</body>
</html>