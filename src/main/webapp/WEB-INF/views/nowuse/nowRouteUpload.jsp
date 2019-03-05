<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

#condition ,#condition2{
	width: 100%;
	background: black;
	color: white;
	
}
.div-info{
	
	position: relative;
}
.btn-close{
	position: absolute;
	top: 0px;
	right: 1px; 
} 

#condition{
	display: none;
}

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
/* #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}  */
#alert{
	margin: 0;
	display: none;
}
</style>

<!-- class="hidden-xs" -->
<div class="alert alert-danger alert-dismissible" id="alert">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
</div>
<div id="map" style="width: 100%; height: 400px;"></div>
<label id="condition">지도에서 직접 선택중 . . .<span>(드레그후 클릭 하시면 상새정보를확인하실수있습니다.)</span></label>
<form action="nowRouteUpload" method="post" id="f1">
<div id="menu_wrap" class="bg_white">
	<div class="option">
		<div>		
			키워드 : <input type="text" id="keyword" size="15" placeholder="키워드 입력">
			<button type="button" id="keywordsrch">검색</button>
			<button id="selectMap" type="button">지도에서 직접 선택</button>
			<button id="myloc" type="button">내위치</button>	
			<input type="checkbox" name="favorites" value="favorites">즐겨찾기등록
		</div>
	</div>
	
</div>


	<p>
		<!-- <button id="selectStart" type="button">출발지 지도에서 선택</button> -->
		<label>출발지</label> <input type="text" id="startAddress" name="startAddress" readonly="readonly">
		<input type="hidden" name="startLatitude" id="startLatitude">
		<input type="hidden" name="startHardness" id="startHardness">
	</p>
	<p>
		<!-- <button id="selectEnd" type="button">도착지 지도에서 선택</button> -->
		<label>도착지</label> <input type="text" id="endAddress" name="endAddress" readonly="readonly">
		<input type="hidden" name="endLatitude" id="endLatitude">
		<input type="hidden" name="endHardness" id="endHardness">
	</p>
</form>	

<button id="selectDone" type="button">선택 완료</button>
<hr>
	<ul id="placesList"></ul>
	<div id="pagination"></div>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <h2>이용하실 정보가 맞습니까?</h2>
    </div>
    <div class="modal-body" id="modal-body">
      <p>Some text in the Modal Body</p>
      <p>Some other text...</p>
    </div>
    <div class="modal-footer">
      <h3><button id="modalOk" type="button">확인</button><button id="modalCancel" type="button">취소</button></h3>
    </div>
  </div>

</div>

<script>
getMyLocation();

$(document).on("click","#keywordsrch",function(){
	
	searchPlaces();
})
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});


// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);
        $("#map").css("height","200px");
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

var listEl = document.getElementById('placesList');
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

   /*  var listEl = document.getElementById('placesList')  */
    var menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        
		$("#selectMap").text("지도에서 직접 선택");
		
		moveMarker.setMap(null);
            

        (function(marker, title) {
            daum.maps.event.addListener(marker, 'click', function() {
                displayInfowindow(marker, title);
               
                /* map.setCenter(locPosition); */
            });

            /* daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            }); */
            

            itemEl.onclick =  function () {
            	$("#map").css("height","200px");
            	displayInfowindow(marker, title);
            	map.setCenter(placePosition);
            };
            /* $(document).on("click",".info",function(){
            	$("#map").css("height","200px");
            	displayInfowindow(marker, title);
            	map.setCenter(placePosition);
            	
            }) */

            /* itemEl.onmouseout =  function () {
                infowindow.close();
            }; */
        })(marker, places[i]);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

$(document).on("click",".btn-close",function(){
	infowindow.close();
})

// 검색결과 항목을 Element로 반환하는 함수입니다
var places1;
function getListItem(index, places) {
	places1=places;
	/* alert(" : " +places.y + " : " + places.x); */
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div><button type="button" class="forStrat" data-address="'+ places.address_name +'" data-latitude="'+ places.y +'" data-hardness="' + places.x + '">출발지로</button><button type="button" data-address="'+ places.address_name +'" data-latitude="'+ places.y +'" data-hardness="' + places.x + '" class="forEnd">도착지로</button>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;" class="div-info">' + title.place_name + '<br><button type="button" class="btn btn-link btn-close">X</button><p><button type="button" data-address="'+ title.address_name +'" data-latitude="'+ title.y +'" data-hardness="' + title.x + '" class="forStrat">출발지로</button><button type="button" data-address="'+ title.address_name +'" data-latitude="'+ title.y +'" data-hardness="' + title.x + '" class="forEnd">도착지로</button></p></div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
    
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
$("#myloc").click(function() {
	$("#map").css("height","400px");
	// 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
	getMyLocation();
	$("#pagination").empty();
	infowindow.close();
})

	


	var myMarker = new daum.maps.Marker({
		map : map,
		clickable: true
	});

var geocoder = new daum.maps.services.Geocoder();
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

var myInfowindow = new daum.maps.InfoWindow({
	removable : true
});

function getMyLocation() {
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude; // 위도
				var lon = position.coords.longitude; // 경도

				var locPosition = new daum.maps.LatLng(lat, lon);// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

				
				
				var address;
				searchDetailAddrFromCoords(locPosition,
						function(result, status) {
							if (status === daum.maps.services.Status.OK) {
								address = result[0].address.address_name;
								var iwContent = '<div style="padding:5px;"><b>내위치</b> : '+ address +'<p><button type="button" data-address="'+address+'" data-latitude="'+ lat +'" data-hardness="' + lon + '" class="forStrat">출발지로</button><button type="button" data-address="'+address+'" data-latitude="'+ lat +'" data-hardness="' + lon + '" class="forEnd">도착지로</button></p></div>';
								myInfowindow.close();
								myInfowindow.setContent(iwContent); 
						
								myMarker.setPosition(locPosition);
								myMarker.setMap(map);
								map.setLevel(2);
								// 지도 중심좌표를 접속위치로 변경합니다
								map.setCenter(locPosition);
								myInfowindow.open(map, myMarker); 
								/* displayMarker(locPosition); */
								daum.maps.event.addListener(myMarker, 'click', function() {
								    // 마커 위에 인포윈도우를 표시합니다
								    myInfowindow.open(map, myMarker);  
								});
							}
						});

				
				
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
			displayMarker(locPosition);
			alert("geolocation을 사용할수 없어요..");
		}
}

$(document).on("click","#map",function(){
	$("#map").css("height","400px");
	
	/* displayInfowindow(marker, title);
	map.setCenter(placePosition); */
	
})

var startDragSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
    startDragSize = new daum.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
    startDragOption = { 
        offset: new daum.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };

// 출발 마커의 드래그 이미지를 생성합니다
var startDragImage = new daum.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);


var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
    startSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
    startOption = { 
        offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };

// 출발 마커 이미지를 생성합니다
var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);			


var startMarker = new daum.maps.Marker();

$(document).on("click",".forStrat",function(){
	startMarker.setMap(null);
	var address = $(this).attr("data-address");
	var latitude = $(this).attr("data-latitude");
	var hardness = $(this).attr("data-hardness");
	/* $("#startAddress").val(address);
	$("#startLatitude").val(latitude);
	$("#startHardness").val(hardness); */
	
	var markerPosition = new daum.maps.LatLng(latitude,hardness);
	startMarker = new daum.maps.Marker({
		position : markerPosition,
		image : startImage
	});
	
	
	if (confirm(address+"(을)를 출발지로선택하시겠습니까")) {
		
		startMarker.setMap(map);
		$("#startAddress").val(address);
		$("#startLatitude").val(latitude);
		$("#startHardness").val(hardness);
		
		// 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    $("#pagination").empty();
	    infowindow.close();
	    myInfowindow.close();

	    $("#selectMap").text("지도에서 직접 선택");
		
		moveMarker.setMap(null);
		moveInfowindow.close();
		$("#condition").css("display","none");
	}
	
	
	
})

var arriveSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
arriveSize = new daum.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
arriveOption = { 
    offset: new daum.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

// 도착 마커 이미지를 생성합니다
var arriveImage = new daum.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

var arriveDragSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
    arriveDragSize = new daum.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
    arriveDragOption = { 
        offset: new daum.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };
 
// 도착 마커의 드래그 이미지를 생성합니다
var arriveDragImage = new daum.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);

var endMarker = new daum.maps.Marker();

$(document).on("click",".forEnd",function(){
	endMarker.setMap(null);
	
	var address = $(this).attr("data-address");
	var latitude = $(this).attr("data-latitude");
	var hardness = $(this).attr("data-hardness");
	
	

		
	var markerPosition = new daum.maps.LatLng(latitude,hardness);
	endMarker = new daum.maps.Marker({
		position : markerPosition,
		image : arriveImage
	});
	
	

	if (confirm(address+"(을)를 도착지로선택하시겠습니까")) {
		endMarker.setMap(map);
		/* endMarker.setDraggable(true); */
		$("#endAddress").val(address);
		$("#endLatitude").val(latitude);
		$("#endHardness").val(hardness);
		// 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    $("#pagination").empty();
	    infowindow.close();
	    myInfowindow.close();
	    
		$("#selectMap").text("지도에서 직접 선택");
		
		moveMarker.setMap(null);
		moveInfowindow.close();
		$("#condition").css("display","none");
	}
	
})
/* daum.maps.event.addListener(endMarker, 'dragend', function() {
	alret("aaaaaaaaaaaaaaaaaa");
	var  latlng  = endMarker.getPosition();
	var address;
	searchDetailAddrFromCoords(endMarker.getPosition(),
			function(result, status) {
				if (status === daum.maps.services.Status.OK) {
					address = result[0].road_address.address_name;
										
					$("#endSpot").val(address);
					
				}
			});
    
}); */



var moveMarker = new daum.maps.Marker();

$(document).on("click","#selectMap",function(){
	if ($("#selectMap").text() =="지도에서 선택 취소") {
		$(this).text("지도에서 직접 선택");
		
		moveMarker.setMap(null);
		moveInfowindow.close();
		$("#condition").css("display","none");
		
	}else{
		$("#map").css("height","400px");
		$("#condition").css("display","block");
		$(this).text("지도에서 선택 취소");
		
		var latlng = map.getCenter(); 
		
		moveMarker.setPosition(latlng);
		moveMarker.setMap(map);
		
		latlng = moveMarker.getPosition();
		// 마커가 드래그 가능하도록 설정합니다 
		moveMarker.setDraggable(true); 
	
		searchDetailAddrFromCoords(moveMarker.getPosition(),
				function(result, status) {
					if (status === daum.maps.services.Status.OK) {
						address = result[0].address.address_name;
						var iwContent = '<div style="padding:5px;"> '+ address +'<p><button type="button" data-address="'+address+'" data-latitude="'+ latlng.getLat() +'" data-hardness="' + latlng.getLng() + '" class="forStrat">출발지로</button><button type="button" data-address="'+address+'" data-latitude="'+ latlng.getLat() +'" data-hardness="' + latlng.getLng() + '" class="forEnd">도착지로</button></p></div>';
						moveInfowindow.close();
						moveInfowindow.setContent(iwContent); 
				
						daum.maps.event.addListener(moveMarker, 'click', function() {
						    moveInfowindow.open(map, moveMarker);  
						});
					}
				});
		
	}
	
	
})
/* //  마커 이미지를 변경합니다
startMarker.setImage(startDragImage); */



var moveInfowindow = new daum.maps.InfoWindow({
	removable : true
});

daum.maps.event.addListener(moveMarker, 'dragstart', function() {
    // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
	moveInfowindow.close();
});


daum.maps.event.addListener(moveMarker, 'dragend', function() {
	var  latlng  = moveMarker.getPosition();
	var address;
	searchDetailAddrFromCoords(moveMarker.getPosition(),
			function(result, status) {
				if (status === daum.maps.services.Status.OK) {
					address = result[0].address.address_name;
					var iwContent = '<div style="padding:5px;"> '+ address +'<p><button type="button" data-address="'+address+'" data-latitude="'+ latlng.getLat() +'" data-hardness="' + latlng.getLng() + '" class="forStrat">출발지로</button><button type="button" data-address="'+address+'" data-latitude="'+ latlng.getLat() +'" data-hardness="' + latlng.getLng() + '" class="forEnd">도착지로</button></p></div>';
					moveInfowindow.close();
					moveInfowindow.setContent(iwContent); 
			
					daum.maps.event.addListener(moveMarker, 'click', function() {
					    moveInfowindow.open(map, moveMarker);  
					});
					
					
				}
			});
    
});

$(function() {
	if ("${result}" != "") {
		alert("등록이 완료 되었습니다 승인 완료되면 등록하신 이메일 로알려드릴께요.");
	}
	$(document).on("click","#selectDone",function(){
		
		/* alert(startMarker.getPosition()); */
		if ($("#startSpot").val()=="") {
			alert("출발지를 선택해주세요.");
			return;
		}
		if ($("#endSpot").val()=="") {
			alert("도착지를 선택해주세요.");
			return;
		}
		
		

		var distance = calculateDistance(startMarker.getPosition().getLat(), startMarker.getPosition().getLng(), endMarker.getPosition().getLat(), endMarker.getPosition().getLng())
		/* alert(distance); */
		var befor = distance + "";
		var afterStr = befor.split('.');
		
		var first = afterStr[1].substring( 0, 3 );
		var last = afterStr[0] + "." + afterStr[1].substring( 0, 3 );
		
		/* alert(last);  */
		if (distance <= 1) {
			$("#alert").css("display","block");
			$("#alert").append("두지점간의 거리는 "+last+"km 입니다. 1km 이하는 이용할수없습니다.");
			return;
		}
		var startInfo = "<p>출발지 : " + $("#startAddress").val() + "</p>";
		var endInfo = "<p>도착지 : " + $("#endAddress").val() + "</p>";
		var betweenInfo = "<p>두지점간의 거리는 "+last+"km 입니다.</p>";
		$("#modal-body").empty();
		$("#modal-body").append(startInfo);
		$("#modal-body").append(endInfo);
		$("#modal-body").append(betweenInfo);
		
		modal.style.display = "block";
		
	})
})

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

//Get the modal
var modal = document.getElementById('myModal');

//Get the button that opens the modal
var btn = document.getElementById("myBtn");

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//When the user clicks the button, open the modal 
/* btn.onclick = function() {
	modal.style.display = "block";
} */

$(document).on("click","#modalCancel",function(){
	modal.style.display = "none";
})

//When the user clicks on <span> (x), close the modal
/* span.onclick = function() {
	alert("aaaaaaaaaaa");
modal.style.display = "none";
} */

//When the user clicks anywhere outside of the modal, close it
/* window.onclick = function(event) {
if (event.target == modal) {
 modal.style.display = "none";
}
} */

$(document).on("click","#modalOk",function(){
		
	$("#f1").submit();
	
})


</script>


<%@ include file="../include/footer.jsp"%>