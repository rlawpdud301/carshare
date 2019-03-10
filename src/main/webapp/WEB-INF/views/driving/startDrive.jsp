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
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  width: 50%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: white;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}
</style>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <b>Driving</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
	<div id="map" style="width: 100%; height: 400px;"></div>
	<p>
		도착지와의 거리 : <span id="distence"></span>km <br>
		요금 : <span id="fee"></span>원<br>
		주행거리 : <span id="nowDistence"></span>km
	</p>
	<button id="done">도착</button>
  </div>
  <!-- /.login-box-body -->
</div>


<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <h2>이용 정보</h2>
    </div>
    <div class="modal-body" id="modal-body">
    	<p>
      		요금 : <span id="last-fee"></span>원<br>
			주행거리 : <span id="last-nowDistence"></span>km<br>
			도착지 : <span id="address"></span>
    	</p>
    </div>
    <div class="modal-footer">
      <h3><button id="modalOk" type="button">확인</button>확인버튼을 누르지않으시면  <span id="s">10</span> 초 후 자동으로 확인됩니다.</h3>
    </div>
  </div>

</div>
<!-- /.login-box -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96466e1526b35b59aaba41206905a93d&libraries=services"></script>

<script type='text/javascript'>
var modal = document.getElementById('myModal');


var myMarker =new daum.maps.Marker();
var startMarker =new daum.maps.Marker();
var endMarker =new daum.maps.Marker();

var myPosition = new daum.maps.LatLng();
var startPosition;
var endPosition;
var startLat;
var startLon;

var driverPosition = new daum.maps.LatLng();

/* var myFee = ${memberVO.myFee}; */

var myFee = 100;
var fee; 
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

var clickLine;
/* var distanceOverlay;
var dots = {}; */
var path;

var allDistance;

var endAddress;

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

$(function() {
	
	startPosition = new daum.maps.LatLng(${useInfoVO.startLatitude},${useInfoVO.startHardness});
	endPosition = new daum.maps.LatLng(${useInfoVO.endLatitude},${useInfoVO.endHardness}); 

	
	startLon = ${useInfoVO.endHardness}; 
	startLat = ${useInfoVO.endLatitude};
	getMyLocation();
	setOtherMarker(); 
	
	//태스트용
	ckeck =	setInterval(getDriverLocationTest,1000);
	
	//실재
	/* ckeck =	setInterval(getDriverLocationDriving,1000); */
	
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
		arrive();
		
	})

	
	$(document).on("click", "#modalOk", function() {
		goHome(); 
	})
	
	
})
function goHome() {
	window.location.href="${pageContext.request.contextPath}/driving/goHome?lat="+lat+"&lon="+lon+"&fee="+fee+"&endAddress="+endAddress;
}



function getAddress() {
	searchDetailAddrFromCoords(new daum.maps.LatLng(lat,lon),function(result, status) {
		if (status === daum.maps.services.Status.OK) {
			endAddress = result[0].address.address_name+"";
			$("#address").text(endAddress);
		}
	})
}


function searchDetailAddrFromCoords(coords,callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);         
}


function arrive() {
	if(confirm("목적지에 도착하셨나요?")){
		
		clearInterval(ckeck);
		getAddress();
		
		
		$("#last-nowDistence").text($("#nowDistence").text());
	   	
	   	$("#last-fee").text($("#fee").text());
		
	    modal.style.display = "block";
	    ckeckTime =	setInterval(gotime,1000);
	}
	
}
function gotime() {
	if ($("#s").text()==0) {
		goHome();
	}else{
		$("#s").text($("#s").text()-1);
	}
}

function getDriverLocationTest() {
	lat = lat - 0.0001;
	lon = lon - 0.0001;	
	map.setCenter(new daum.maps.LatLng(lat,lon));
	myMarker.setPosition(new daum.maps.LatLng(lat,lon));	
	myPosition = new daum.maps.LatLng(lat,lon);	
	$("#distence").text(getDistance());		
    path = clickLine.getPath();
    path.push(myPosition);
    clickLine.setPath(path);
    
    
    $("#nowDistence").text(Math.round(clickLine.getLength())/1000);
    
   	fee = ((Math.ceil(Math.round(clickLine.getLength())/100)) * myFee);
   	$("#fee").text(fee);	
     
    if (getDistance() < 0.1) {
    	arrive();
		
	}
}

//월래 함수
function getDriverLocationDriving() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude; // 위도
			lon = position.coords.longitude; // 경도
			
			map.setCenter(new daum.maps.LatLng(lat,lon));
			myMarker.setPosition(new daum.maps.LatLng(lat,lon));	
			myPosition = new daum.maps.LatLng(lat,lon);	
			$("#distence").text(getDistance());		
	 	    path = clickLine.getPath();
		    path.push(myPosition);
		    clickLine.setPath(path);
		    
		    $("#nowDistence").text(Math.round(clickLine.getLength())/1000);
		    
		    fee = (Math.ceil(Math.round(clickLine.getLength())/100)) * myFee;
		   	$("#fee").text(fee);
		    
		    if (getDistance() < 0.01) {
				arrive();
			}
		})
	}
	
}



function setOtherMarker() {
	startMarker.setPosition(startPosition);
	startMarker.setMap(map);
	endMarker.setPosition(endPosition);
	endMarker.setMap(map);			
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
			
			clickLine = new daum.maps.Polyline({
			    map: map, // 선을 표시할 지도입니다 
			    path: [myPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			    strokeWeight: 4, // 선의 두께입니다 
			    strokeColor: '#db4040', // 선의 색깔입니다
			    strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'solid' // 선의 스타일입니다
			});			
		});
		

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
	}
	
}


function getDistance() {
	var distance = calculateDistance(lat, lon, startLat, startLon)+"";
	var makeString = distance + "";
	var splitString = makeString.split('.');
	var sumStings;
	if (splitString[1]==null) {
		sumStings = splitString[0]
	}else{
		sumStings = splitString[0] + "." + splitString[1].substring(0,3);
	}
	
	return sumStings;
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