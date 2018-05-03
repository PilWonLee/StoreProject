<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<html>
<head>
<title>Home</title>

<style>
	/* p:first-letter{color:yellow;background-color:green; border-radius:5px} */
</style>
<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>

</head>

<body>
	<h1 class="one" >Hello world!</h1>
	<h1 >Hello top!</h1>
	<c:forEach var="item" items="${ rList }">
 id: ${item.name} <br />
 pw: ${item.age}<br />
	</c:forEach>


<a href="http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius=446&cx=127.00178131368251&cy=37.26775546665884&ServiceKey=bfw1QwdYKkozjInhO3oOO2EYjnnQ0NuD2kGSGNoMbde0thgnqlF9R0rARkMmhe6yWNC5hsF5MebZGhSV1Io67w%3D%3D">test</a>


</body>
</html>
