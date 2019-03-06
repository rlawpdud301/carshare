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

</style>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <b>Driving</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
	<div id="map" style="width: 100%; height: 400px;"></div>
	<p>도착지와의 거리 : <span id="distence"></span> </p>
	<button id="done">도착</button>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96466e1526b35b59aaba41206905a93d&libraries=services"></script>

<script type='text/javascript'>
var myMarker =new daum.maps.Marker();
var startMarker =new daum.maps.Marker();
var endMarker =new daum.maps.Marker();

var myPosition = new daum.maps.LatLng();
var startPosition = new daum.maps.LatLng(${useInfoVO.startLatitude},${useInfoVO.startHardness});
var endPosition = new daum.maps.LatLng(${useInfoVO.endLatitude},${useInfoVO.endHardness}); 

var startLat = ${useInfoVO.endLatitude};
var startLon = ${useInfoVO.endHardness}; 

var driverPosition = new daum.maps.LatLng();

var lat;
var lon;


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

var endIwContent = '<div style="padding:5px;">도착 위치</div>'

var endInfowindow = new daum.maps.InfoWindow({
	content : endIwContent,
	removable : iwRemoveable
});

var startIwContent = '<div style="padding:5px;">출발 위치</div>'

var startInfowindow = new daum.maps.InfoWindow({
	content : startIwContent,
	removable : iwRemoveable
});

var drawingFlag = true; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var moveLine;
var clickLine;
var distanceOverlay;
var dots = {};


$(function() {
	getMyLocation();
	setOtherMarker(); 
	
	ckeck =	setInterval(getDriverLocationTset,1000);
	
	daum.maps.event.addListener(myMarker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      myInfowindow.open(map, myMarker);  
	});
	daum.maps.event.addListener(startMarker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      startInfowindow.open(map, startMarker);  
	});
	daum.maps.event.addListener(endMarker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      endInfowindow.open(map, endMarker);  
	});
	
	$(document).on("click", "#done", function() {
		
	})
	
})

function getDriverLocationTset() {
	lat = lat - 0.0001;
	lon = lon - 0.0001;
	
	map.setCenter(new daum.maps.LatLng(lat,lon));
	myMarker.setPosition(new daum.maps.LatLng(lat,lon));
	myMarker.setMap(map);
	/* setDriverLocation(); */
	
	myPosition = new daum.maps.LatLng(lat,lon);
	
	$("#distence").text(getDistance());
	
	var mousePosition = myPosition;
	
	// 그려지고 있는 선의 좌표 배열을 얻어옵니다
    var path = clickLine.getPath();

    var movepath = [path[path.length-1], mousePosition];
    moveLine.setPath(movepath);    
    moveLine.setMap(map);
    
    var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
    content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

	// 거리정보를 지도에 표시합니다
	
    // 좌표 배열에 클릭한 위치를 추가합니다
    path.push(myPosition);
    
    // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
    clickLine.setPath(path);

    var distance = Math.round(clickLine.getLength());
    displayCircleDot(myPosition, distance);
	
}
function setOtherMarker() {
	startMarker.setPosition(startPosition);
	startMarker.setMap(map);
	endMarker.setPosition(endPosition);
	endMarker.setMap(map);			
}


function drawingLine() {	
 	// 그려지고 있는 선의 좌표 배열을 얻어옵니다
    path = clickLine.getPath();

    // 좌표 배열에 클릭한 위치를 추가합니다
    path.push(drawingPosition);
    
    // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
    clickLine.setPath(path);

    var distance = Math.round(clickLine.getLength());
    displayCircleDot(clickPosition, distance);
 	
	
}


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
			
			myPosition = new daum.maps.LatLng(lat,lon);
			
			$("#distence").text(getDistance());
			
			var drawingPosition = myPosition;
			
			clickLine = new daum.maps.Polyline({
			    map: map, // 선을 표시할 지도입니다 
			    path: [drawingPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			    strokeWeight: 3, // 선의 두께입니다 
			    strokeColor: '#db4040', // 선의 색깔입니다
			    strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'solid' // 선의 스타일입니다
			});
			 
				// 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
			moveLine = new daum.maps.Polyline({
			    strokeWeight: 3, // 선의 두께입니다 
			    strokeColor: '#db4040', // 선의 색깔입니다
			    strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'solid' // 선의 스타일입니다    
			});
			
			
		});
		

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
	}
	
}


function getDistance() {
	var distance = calculateDistance(lat, lon, startLat, startLon);
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