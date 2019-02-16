<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96466e1526b35b59aaba41206905a93d&libraries=services"></script>
<style type="text/css">
#startSpot,#endSpot{
	width: 300px;
}

</style>
<!-- class="hidden-xs" -->
<div id="map" style="width: 100%; height: 400px;"></div>

<button id="myloc" type="button">내위치</button>
<p>
<button id="selectStart" type="button">출발지선택</button>
<label>출발지</label>
<input type="text" id="startSpot" name="startSpot">
<button id="startSearch" type="button">검색</button>
</p>
<p>
<button id="selectEnd" type="button">도착지선택</button>
<label>도착지</label>
<input type="text" id="endSpot" name="endSpot">
<button id="endSearch" type="button">검색</button>
</p>
<p id="result"></p>



<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨 
	};

	// 마커를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	
	
	var locPosition;
	
	var myMarker = new daum.maps.Marker({
		map : map,
		position : locPosition
	});
	
	
	var startMarker = new daum.maps.Marker({
		map : map,
		position : locPosition
	});
	startMarker.setDraggable(true);

	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	var lat,lon;
	
	function getMyLocation() {
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				lat = position.coords.latitude; // 위도
				lon = position.coords.longitude; // 경도

				locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

				// 마커를 표시합니다
				
				myMarker.setPosition(locPosition);
				map.setLevel(2);
				// 지도 중심좌표를 접속위치로 변경합니다
				map.setCenter(locPosition);
				
				displayMarker(locPosition); 
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
			displayMarker(locPosition);
		}
	}

	
	// 지도에 마커와 를 표시하는 함수입니다
	function displayMarker(locPosition) {

		

		// 마커의 위치를 지도중심으로 설정합니다 
		startMarker.setPosition(locPosition);
		startMarker.setMap(map);
	}
	
	var latlng;
	daum.maps.event.addListener(map, 'center_changed', function() {

		// 지도의  레벨을 얻어옵니다
		var level = map.getLevel();

		// 지도의 중심좌표를 얻어옵니다 
		latlng = map.getCenter();

		var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
		message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 '
				+ latlng.getLng() + '입니다</p>';

		var resultDiv = document.getElementById('result');
		resultDiv.innerHTML = message;

		startMarker.setPosition(latlng);
		startMarker.setMap(map);
		
		
		searchDetailAddrFromCoords(latlng,function(result, status){
			if (status === daum.maps.services.Status.OK) {
	           if (startMarker.getDraggable()) {
	        	  /*  $("#startSpot").val(result[0].road_address.address_name+""); */
				}else{
					/* $("#endSpot").val(result[0].road_address.address_name+""); */
				}
	            

	        }   
		});
	});

	$("#selectEnd").click(function() {
		startMarker.setDraggable(false);
		var myMarkers = new daum.maps.LatLng(latlng.getLat(),latlng.getLng());
		/* myMarkers.setPosition(locPosition); */
		
		
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: myMarkers
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	})
	$("#selectStart").click(function() {
		startMarker.setDraggable(true);
	})
	$(function() {
		getMyLocation();

		$("#myloc").click(function() {
			getMyLocation();
		})
		
		
	})
</script>


<%@ include file="include/footer.jsp"%>
