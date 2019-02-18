<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96466e1526b35b59aaba41206905a93d&libraries=services"></script>
<style type="text/css">
#startSpot, #endSpot {
	width: 300px;
}

#condition {
	width: 100%;
	background: black;
	color: white;
}
.item{
	
}
</style>

<!-- class="hidden-xs" -->
<div id="map" style="width: 100%; height: 400px;"></div>
<label id="condition">출발지 선택중 . . .</label>
<button id="myloc" type="button">내위치</button>
<p>
	<button id="selectStart" type="button">출발지선택</button>
	<label>출발지</label> <input type="text" id="startSpot" name="startSpot">
	<button id="startSearch" type="button">검색</button>
</p>
<p>
	<button id="selectEnd" type="button">도착지선택</button>
	<label>도착지</label> <input type="text" id="endSpot" name="endSpot"
		readonly="">
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

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	

	var locPosition = new daum.maps.LatLng();

	var myMarker = new daum.maps.Marker({
		map : map,
		position : locPosition
	});

	
	
	
	var marker = new daum.maps.Marker({
		map : map,
		position : locPosition
	});
	marker.setDraggable(true);

	var infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	var lat, lon;

	function getMyLocation() {
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude; // 위도
				var lon = position.coords.longitude; // 경도

				locPosition = new daum.maps.LatLng(lat, lon);// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

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
		marker.setPosition(locPosition);
		marker.setMap(map);
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

		marker.setPosition(latlng);
		marker.setMap(map);

		searchDetailAddrFromCoords(latlng,
				function(result, status) {
					if (status === daum.maps.services.Status.OK) {
						if (marker.getDraggable()) {
							$("#startSpot").val(
									result[0].road_address.address_name + "");
						} else {
							$("#endSpot").val(
									result[0].road_address.address_name + "");
						}

					}
				});
	});

	var simageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png'; // 마커이미지의 주소입니다    
	var simageSize = new daum.maps.Size(50, 64);// 마커이미지의 크기입니다
	var simageOption = {
		offset : new daum.maps.Point(15, 54)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var smarkerImage = new daum.maps.MarkerImage(simageSrc, simageSize,simageOption);

	// 마커를 생성합니다
	/* var marker = new daum.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	}); */

	// 마커가 지도 위에 표시되도록 설정합니다
	/* marker.setMap(map); */

	var startMarker = new daum.maps.Marker();
	$("#selectEnd").click(
			function() {
				if (endMarker.getMap()) {
					endMarker.setMap(null);
				}
				if (marker.getDraggable()) {
					latlng = map.getCenter();
					var markerPosition = new daum.maps.LatLng(latlng.getLat(),
							latlng.getLng());
					startMarker = new daum.maps.Marker({
						position : markerPosition,
						image : smarkerImage
					});
					startMarker.setMap(map);
					marker.setDraggable(false);
				}
				$("#startSpot").attr("readonly", "readonly");
				$("#endSpot").attr("readonly", false);
				$("#condition").text("도착지 선택중 . . .");

			})

			
	var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png'; // 마커이미지의 주소입니다    
	var imageSize = new daum.maps.Size(50, 64);// 마커이미지의 크기입니다
	var imageOption = {
		offset : new daum.maps.Point(15, 54)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,imageOption);		
			
	var endMarker = new daum.maps.Marker();
	$("#selectStart").click(
			function() {
				if (startMarker.getMap()) {
					startMarker.setMap(null);
				}
				if (!marker.getDraggable()) {
					latlng = map.getCenter();
					var markerPosition = new daum.maps.LatLng(latlng.getLat(),
							latlng.getLng());
					endMarker = new daum.maps.Marker({
						position : markerPosition,
						image : markerImage
					});
					endMarker.setMap(map);
					marker.setDraggable(true);
				}
				$("#endSpot").attr("readonly", "readonly");
				$("#startSpot").attr("readonly", false);
				$("#condition").text("출발지 선택중 . . .");

			})

	getMyLocation();

	$("#myloc").click(function() {
		getMyLocation();
	})

	$("#startSearch").click(function() {

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();

		// 키워드로 장소를 검색합니다
		var startSpot = $("#startSpot").val();
		ps.keywordSearch(startSpot, placesSearchCB);

	})
	
	
	var searchResult;
	$("#endSearch").click(function() {

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();

		// 키워드로 장소를 검색합니다
		var startSpot = $("#endSpot").val();
		ps.keywordSearch(startSpot, placesSearchCB);

	})
	function placesSearchCB(data, status, pagination) {
		if (status === daum.maps.services.Status.OK) {

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			var bounds = new daum.maps.LatLngBounds();

			for (var i = 0; i < data.length; i++) {
				displayMarker(data[i]);
				bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
				searchResult=i;
			}

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {

		// 마커를 생성하고 지도에 표시합니다
		var markerFind = new daum.maps.Marker({
			map : map,
			position : new daum.maps.LatLng(place.y, place.x)
		});

		// 마커에 클릭이벤트를 등록합니다
		daum.maps.event.addListener(markerFind, 'click', function() {
			// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			var cont;
			if (marker.getDraggable()) {
				cont = '<div style="padding:5px;font-size:12px;">' + place.place_name + '<button class="start" type="button">출발지로 지정</button></div>';
			}else{
				cont = '<div style="padding:5px;font-size:12px;">' + place.place_name + '<button class="end" type="button">도착지로 지정</button></div>';
			}
			infowindow.setContent(cont);
			infowindow.open(map, markerFind);
		});
	}
	$(document).on("click",".start",function(){
		alert($(this).parent().text());
		var position = new daum.maps.LatLng(place.y, place.x);
		
		
	})
	$(function() {
		var lat; // 위도
		var lon; // 경도

		var locPosition;
		getMyLocation();

		searchDetailAddrFromCoords(locPosition, function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				$("#startSpot").val(result[0].road_address.address_name + "");

			}
		});
		
		
	})
</script>


<%@ include file="include/footer.jsp"%>
