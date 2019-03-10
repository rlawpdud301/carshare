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
	
<style>
table {
	border: solid 1px black;
	border-collapse: collapse;
}
th,td{
	border: solid 1px black;
}
</style>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    Witing <b>Driver</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
	<div id="map" style="width: 100%; height: 400px;"></div>
	<p>출발지에서 대기해주세요</p>
	<p>운전자와 출발지의 거리 : <span id="distence"></span> </p>
	<table>
		<tr>
			<th>차종</th>
			<th>번호</th>
		</tr>
		<tr>
			<td>${map.carInfoVO.carName}</td>
			<td>${map.carInfoVO.carNumber}</td>
		</tr>
	</table>
	<%-- <form action="${pageContext.request.contextPath}/driving/staryDrive" method="get" id="f1">
		<input type="hidden" value="user" name="driver">
		
	</form>
	<button type="button" id="startDrive">동승완료 주행시작</button> --%>
  	<!-- <button id="test">moveTest</button> -->
	

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96466e1526b35b59aaba41206905a93d&libraries=services"></script>

<script type='text/javascript'>
var myMarker =new daum.maps.Marker();
var startMarker =new daum.maps.Marker();
var driverMarker =new daum.maps.Marker();

var driverNo = ${map.useInfoVO.dMemberNo.memberNo}

var startPosition = new daum.maps.LatLng(${map.useInfoVO.startLatitude},${map.useInfoVO.startHardness});
var driverPosition = new daum.maps.LatLng(${map.driverLatitude},${map.driverHardness});

var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
var mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
}; 
//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);


var myIwContent = '<div style="padding:5px;">내위치</div>', 
iwRemoveable = true;

var myInfowindow = new daum.maps.InfoWindow({
	content : myIwContent,
	removable : iwRemoveable
});

var driverIwContent = '<div style="padding:5px;">운전자 위치</div>'

var driverInfowindow = new daum.maps.InfoWindow({
	content : driverIwContent,
	removable : iwRemoveable
});

var startIwContent = '<div style="padding:5px;">출발 위치</div>'

var startInfowindow = new daum.maps.InfoWindow({
	content : startIwContent,
	removable : iwRemoveable
});

var lat;
var lon;




$(function() {
	getMyLocation();
	
	startMarker.setPosition(startPosition);
	startMarker.setMap(map);
	
	driverMarker.setPosition(driverPosition);
	driverMarker.setMap(map);
	
	startInfowindow.open(map, startMarker); 
	
	ckeck =	setInterval(getDriverLocation,1000);
	
	daum.maps.event.addListener(myMarker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      myInfowindow.open(map, myMarker);  
	});
	daum.maps.event.addListener(startMarker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      startInfowindow.open(map, startMarker);  
	});
	daum.maps.event.addListener(driverMarker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      driverInfowindow.open(map, driverMarker);  
	});
	
	/* $(document).on("click", "#startDrive", function() {
		if (confirm("주행을 시작하시겠습니까?")) {
			$("#f1").submit();
		}
	}); */
	
})


function getMyLocation() {
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude; // 위도
			lon = position.coords.longitude; // 경도

			map.setCenter(new daum.maps.LatLng(lat,lon));
			myMarker.setPosition(new daum.maps.LatLng(lat,lon));
			myMarker.setMap(map);
			
			
						
			
		});
		

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
	}
	
}
function getDriverLocation() {
	$.ajax({
		url : "${pageContext.request.contextPath}/nowuse/getDriverLocation",
		type : "get",
		data : {driverNo: driverNo},
		dataType : "json",
		success : function(data) {
			driverPosition = new daum.maps.LatLng(data.memberVO.driverLatitude,data.memberVO.driverHardness);
			driverMarker.setPosition(driverPosition);
			$("#distence").text(getDistance(data.memberVO.driverLatitude,data.memberVO.driverHardness));
			if (data.drivingNow) {
				
				clearInterval(ckeck);
				alert("주행시작");
				window.location.href="${pageContext.request.contextPath}/nowuse/nowRouteUpload";
			}
			
		}
	})	
}
function getDistance(driverLat,driverLon) {
	var distance = calculateDistance(${map.useInfoVO.startLatitude},${map.useInfoVO.startHardness},driverLat,driverLon);
	var makeString = distance + "";
	var splitString = makeString.split('.');				
	var sumSting = splitString[0] + "." + splitString[1].substring( 0, 3 );
	return sumSting+"km";
}


function calculateDistance(lat1, lon1, lat2, lon2) {
    var R = 6371; // km
    var dLat = (lat2-lat1).toRad();
    var dLon = (lon2-lon1).toRad(); 
    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
            Math.sin(dLon/2) * Math.sin(dLon/2); 
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
    var d = R * c;
    return d;
  }
Number.prototype.toRad = function() {
    return this * Math.PI / 180;
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