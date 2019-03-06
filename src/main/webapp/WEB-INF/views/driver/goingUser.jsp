<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="include/header.jsp"%> --%>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iCheck/square/blue.css">
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    Going <b>user</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
	<div id="map" style="width: 100%; height: 400px;"></div>
  	<button id="test">moveTest</button>
	

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96466e1526b35b59aaba41206905a93d&libraries=services"></script>

<script type='text/javascript'>
var points = new Array();
var startLat = ${useInfoVO.startLatitude};
var startLon = ${useInfoVO.startHardness};
var startAddress = "${useInfoVO.startAddress}";

var bounds = new daum.maps.LatLngBounds();

var marker = new daum.maps.Marker();
var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
var mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
}; 
//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);
var marker =new daum.maps.Marker();

$(function() {
	
	points[0]= new daum.maps.LatLng(startLat,startLon);
	getMyLocation();
	setStartMarker();
	
	/* ckeck =	setInterval(getMyLocation,1000); */
	
	ckeck =	setInterval(getMyLocationforTest,1000);
	
	/* clearInterval(ckeck); */
	
	$(document).on("click", "#test", function() {
		lat = lat + 0.0001;
		lon = lon + 0.0001;
		map.setCenter(new daum.maps.LatLng(lat,lon));
		marker.setPosition(new daum.maps.LatLng(lat,lon));
		marker.setMap(map);		
	})
	
	
})

function getMyLocation() {
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude; // 위도
			lon = position.coords.longitude; // 경도

			points[1]= new daum.maps.LatLng(lat,lon);
			map.setCenter(new daum.maps.LatLng(lat,lon));
			marker.setPosition(new daum.maps.LatLng(lat,lon));
			marker.setMap(map);
			/* map.setLevel(5); */
			for (var i = 0; i < points.length; i++) {
		 		bounds.extend(points[i]);
			}
			
		});
		

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
	}
	
}
function getMyLocationforTest() {
	lat = lat + 0.0001;
	lon = lon + 0.0001;
	
	points[1]= new daum.maps.LatLng(lat,lon);
	map.setCenter(new daum.maps.LatLng(lat,lon));
	marker.setPosition(new daum.maps.LatLng(lat,lon));
	marker.setMap(map);
	
	for (var i = 0; i < points.length; i++) {
		 bounds.extend(points[i]);
	}
}
function setStartMarker() {
	
}
</script>
<!-- jQuery 3 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/dist/jquery.min.js"></script> --%>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath }/resources/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath }/resources/plugins/iCheck/icheck.min.js"></script>

</body>


