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
.div-info{
	
	position: relative;
}
.btn-close{
	position: absolute;
	top: 0px;
	right: 1px; 
} 
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
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
#placesList .item .marker_15 {background-position: 0 -654px;} 
</style>

<!-- class="hidden-xs" -->
<div id="map" style="width: 100%; height: 400px;"></div>
<label id="condition">출발지 선택중 . . .</label>
<div id="menu_wrap" class="bg_white">
	<div class="option">
		<div>		
			키워드 : <input type="text" value="사월역" id="keyword" size="15">
			<button type="button" id="keywordsrch">검색하기</button>			
		</div>
	</div>
	<hr>
	<ul id="placesList"></ul>
	<div id="pagination"></div>
</div>

<button id="myloc" type="button">내위치</button>
<p>
	<button id="selectStart" type="button">출발지선택</button>
	<label>출발지</label> <input type="text" id="startSpot" name="startSpot" readonly="">
	<input type="hidden" name="startAddress" id="startAddress">
	<input type="hidden" name="startLatitude" id="startLatitude">
	<input type="hidden" name="startHardness" id="startHardness">
</p>
<p>
	<button id="selectEnd" type="button">도착지선택</button>
	<label>도착지</label> <input type="text" id="endSpot" name="endSpot" readonly="">
	<input type="hidden" name="endAddress" id="endAddress">
	<input type="hidden" name="endLatitude" id="endLatitude">
	<input type="hidden" name="endHardness" id="endHardness">
</p>
<p id="result"></p>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?96466e1526b35b59aaba41206905a93d&libraries=services"></script>
<script>
getMyLocation();

$(document).on("click","#keywordsrch",function(){
	$("#map").css("height","200px");
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
                '</div><button type="button" class="places" data-address="'+ places.address_name +'" data-latitude="'+ places.y +'" data-hardness="' + places.x + '" class="forStrat">출발지로</button><button type="button" data-address="'+ places.address_name +'" data-latitude="'+ places.y +'" data-hardness="' + places.x + '" class="forEnd">도착지로</button>';           

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
		map : map
	});

function getMyLocation() {
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude; // 위도
				var lon = position.coords.longitude; // 경도

				var locPosition = new daum.maps.LatLng(lat, lon);// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

				// 마커를 표시합니다

				myMarker.setPosition(locPosition);
				myMarker.setMap(map);
				map.setLevel(2);
				// 지도 중심좌표를 접속위치로 변경합니다
				map.setCenter(locPosition);

				/* displayMarker(locPosition); */
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
			displayMarker(locPosition);
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
	$("#startAddress").val(address);
	$("#startLatitude").val(latitude);
	$("#startHardness").val(hardness);
	
	var markerPosition = new daum.maps.LatLng(latitude,hardness);
	startMarker = new daum.maps.Marker({
		position : markerPosition,
		image : startImage
	});
	startMarker.setMap(map);
	
	if (confirm(address+"(을)를 출발지로선택하시겠습니까")) {
		$("#startSpot").val(address);
		// 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    $("#pagination").empty();
	    infowindow.close();
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
	
	$("#endAddress").val(address);
	$("#endLatitude").val(latitude);
	$("#endHardness").val(hardness);
		
	var markerPosition = new daum.maps.LatLng(latitude,hardness);
	endMarker = new daum.maps.Marker({
		position : markerPosition,
		image : arriveImage
	});
	endMarker.setMap(map);
	

	if (confirm(address+"(을)를 도착지로선택하시겠습니까")) {
		$("#endSpot").val(address);
		// 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    $("#pagination").empty();
	    infowindow.close();
	}
	
})

</script>


<%@ include file="include/footer.jsp"%>