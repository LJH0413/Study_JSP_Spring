<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Upload</title>
<link rel="stylesheet" href="resources/css/upload.css" />
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 카카오 맵 검색 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f44c8030f5b0841e2ce36ae2e17ed845&libraries=services"></script>
</head>
<body>
	<ul id="nav">
		<li><a href="/">first map</a></li>
		<li style="float: right"><a class="active" href="/upload">upload</a></li>
	</ul>

	<div id="map" style="width: 100%; height: 100vh"></div>
	<div id="menu_wrap">
		<form onsubmit="searchPlaces(); return false;">
			키워드 : <input type="text" value="강남역" id="keyword" size="15" />
			<button type="submit">검색하기</button>
		</form>
		<hr />
		<div id="placesList"></div>
	</div>

	<!-- 지도 띄우는 자바스크립트 불러오기 -->
	<script type="text/javascript" src="resources/javascripts/upload.js"></script>
</body>
</html>
