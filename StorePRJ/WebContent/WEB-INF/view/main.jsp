<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<html>
<head>
<title>Home</title>

<style>
	/* p:first-letter{color:yellow;background-color:green; border-radius:5px} */
canvas { 
  height: 100vh; 
  width: 98vw; 
  display: block;
}
</style>
<script src="/common/js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
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
<script>

$(function(){
	$('#start').click(function(){
		location.href='analysisMain.do';
	});
});
var img = new Image();

//User Variables - customize these to change the image being scrolled, its
//direction, and the speed.

img.src = '/bootstrap/img/mainPic.jpg';
var CanvasXSize = 1900;
var CanvasYSize = 600;
var speed = 10; // lower is faster
var scale = 1.05;
var y = -4.5; // vertical offset

//Main program

var dx = 0.75;
var imgW;
var imgH;
var x = 0;
var clearX;
var clearY;
var ctx;

img.onload = function() {
 imgW = img.width * scale;
 imgH = img.height * scale;
 
 if (imgW > CanvasXSize) {
     // image larger than canvas
     x = CanvasXSize - imgW;
 }
 if (imgW > CanvasXSize) {
     // image width larger than canvas
     clearX = imgW;
 } else {
     clearX = CanvasXSize;
 }
 if (imgH > CanvasYSize) {
     // image height larger than canvas
     clearY = imgH;
 } else {
     clearY = CanvasYSize;
 }
 
 // get canvas context
 ctx = document.getElementById('canvas').getContext('2d');

 // set refresh rate
 return setInterval(draw, speed);
}

function draw() {
 ctx.clearRect(0, 0, clearX, clearY); // clear the canvas
 
 // if image is <= Canvas Size
 if (imgW <= CanvasXSize) {
     // reset, start from beginning
     if (x > CanvasXSize) {
         x = -imgW + x;
     }
     // draw additional image1
     if (x > 0) {
         ctx.drawImage(img, -imgW + x, y, imgW, imgH);
     }
     // draw additional image2
     if (x - imgW > 0) {
         ctx.drawImage(img, -imgW * 2 + x, y, imgW, imgH);
     }
 }

 // image is > Canvas Size
 else {
     // reset, start from beginning
     if (x > (CanvasXSize)) {
         x = CanvasXSize - imgW;
     }
     // draw aditional image
     if (x > (CanvasXSize-imgW)) {
         ctx.drawImage(img, x - imgW + 1, y, imgW, imgH);
     }
 }
 // draw image
 ctx.drawImage(img, x, y,imgW, imgH);
 // amount to move
 x += dx;
}
</script>
</head>
<script src="/common/js/main.js"></script>
<body>
<%@include file="/common/top.jsp"%>

<div style="text-align:center">
		<button class="bttn-unite bttn-md bttn-primary" id="start" style="font-size:40px">시작하기</button>
		<canvas id="canvas" width="1900" height="600"></canvas>
		<span>made by PilWon</span>
</div>



	<!-- Bootstrap core JavaScript -->
	<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>






</body>
</html>
