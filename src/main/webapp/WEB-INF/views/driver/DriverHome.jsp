<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
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
  z-index: 10; /* Sit on top */
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

#user_info img{
	width: 100px;
}


</style>
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <h2>상세 정보</h2>
    </div>
    <div class="modal-body" id="modal-body">
      <table>
      	<tr>
      		<td id="user_info"></td>
      		<td id="route_info"></td>
      	</tr>
      </table>
    </div>
    <!-- <form action="" id="f1">
    	<input type="hidden" id="routeNo">
    </form> -->
    <div class="modal-footer">
      <h3><button id="modalOk" type="button">같이가요~</button><button id="modalCancel" type="button">닫기</button></h3>
    </div>
  </div>

</div>
<section class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Driver Mode 내주변 이용자</h3>
					
				</div>

			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							<button type="button" class="howfar" value="three">내주변 약 300m</button>
							<button type="button" class="howfar" value="five">내주변 약 500m</button>
							<button type="button" class="howfar" value="seven">내주변 약 700m</button>
							<button type="button" class="howfar" value="ten">내주변 약 1km</button>
							<button type="button" class="howfar" value="twenty">내주변 약 2km</button>
							<div class="col-xs-4 col-xs-offset-8">
								<button type="button" class="btn" id="showMap">지도로 보기</button>
								<button type="button" class="btn" id="showList">리스트로 보기</button>
								<button type="button" class="btn" id="reflash">새로 고침</button>
							</div>
						</div>
						<div class="box-body">
							<div id="map" style="width: 100%; height: 400px;"></div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 10px;">NO</th>
										<th>출발지</th>
										<th>도착지</th>
										<th>나와의 거리</th>
									</tr>
								</thead>
								<tbody id="tableBody">
								
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96466e1526b35b59aaba41206905a93d&libraries=services"></script>


<script>

var howfar;
var loadDate;
var lat;
var lon;
var map;
var positions = new Array();
var iwContent = new Array();
var marker =new daum.maps.Marker();
/* var markers = new Array(); */
var infowindow = new daum.maps.InfoWindow({zIndex:1,removable : true});
var modal = document.getElementById('myModal');
var memberNo;
var routeNo;
	$(function() {
		$("#mode").text("Drive mode");
		$("body").removeClass("skin-blue");
		$("body").addClass("skin-green");

		/* $(document).on("click", "#find", function() {
			alert("aaa");
		}) */
		howfar = "five";
		 
		getMyLocation();
		
		
		$(document).on("click","#modalCancel",function(){
			modal.style.display = "none";
		})
		
		$(document).on("click", ".howfar", function() {
			howfar = $(this).val().trim();
			getMyLocation();
		})
		
		$(document).on("click", "#showMap", function() {
			$("#map").css("display","block");
			$(".table").css("display","none");
		})
		
		$(document).on("click", "#showList", function() {
			$("#map").css("display","none");
			$(".table").css("display","block");
		})
		$(document).on("click", ".listtgd", function() {
			routeNo=$(this).attr("date-index");
			memberNo=loadDate[routeNo].memberNo.memberNo;
			getInforAjax();
			
			/* alert(loadDate[routeNo].memberNo.memberNo); */
		})
		
		$(document).on("click","#modalOk",function(){
			alert($("#modalOk").attr("data-routeno"));
			waitingApproval($("#modalOk").attr("data-routeno"));
		})
		
		$(document).on("click", "#reflash", function() {
			getMyLocation();
		})
		
		
		$(".table").css("display","none");
		
		
		
	}) 
	
	function waitingApproval(waitrouteNo) {
		$.ajax({
			url : "${pageContext.request.contextPath}/driver/waitingApproval",
			type : "get",
			data : "routeNo=" + waitrouteNo + "&lat=" + lat+"&lon="+lon,
			dataType : "json",
			success : function(data) {
				console.log(data);
				alert("신청완료"); 
			}
			
		})
	}
	
	function getInforAjax() {
		//routinfo 필요없음
		$.ajax({
			url : "${pageContext.request.contextPath}/driver/getInfor",
			type : "get",
			data : "memberNo=" + memberNo,
			dataType : "json",
			success : function(data) {
				console.log(data);
				$("#route_info").empty();
				$("#user_info").empty();
				var userInfo = "<p><img src=" + data.photo + "></p><br><p>" + data.nickname + "</p>";
				$("#user_info").append(userInfo);
				
				var startInfo = "<p>출발지 : " + loadDate[routeNo].startAddress + "</p>";
				var endInfo = "<p>도착지 : " + loadDate[routeNo].endAddress + "</p>";
				
				var betweenDistace = getDistance();
				
				var betweenInfo = "<p>두지점간의 거리는 "+betweenDistace+"km 입니다.</p>";
				
				/* $("#routeNo").val(loadDate[routeNo].routeNo); */
				$("#modalOk").attr("data-routeno",loadDate[routeNo].routeNo);
				$("#route_info").append(startInfo);
				$("#route_info").append(endInfo);
				$("#route_info").append(betweenInfo);
				
				modal.style.display = "block";
			}
		})
	}
	
	function getDistance() {
		var distance = calculateDistance(loadDate[routeNo].startLatitude,loadDate[routeNo].startHardness,loadDate[routeNo].endLatitude,loadDate[routeNo].endHardness);
		var makeString = distance + "";
		var splitString = makeString.split('.');				
		var sumSting = splitString[0] + "." + splitString[1].substring( 0, 3 );
		return sumSting;
	}
	
	
	
	
	/* var apiGeolocationSuccess = function(position) {
	    alert("API geolocation success!\n\nlat = " + position.coords.latitude + "\nlng = " + position.coords.longitude);
	};

	var tryAPIGeolocation = function() {
	    jQuery.post( "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyDfF9tpSnoQk8VCzKtJkXCiFWsRf4ytTJ0", function(success) {
	        apiGeolocationSuccess({coords: {latitude: success.location.lat, longitude: success.location.lng}});
	    })
	    .fail(function(err) {
	        alert("API Geolocation error! \n\n"+err);
	    });
	};

	var browserGeolocationSuccess = function(position) {
	    alert("Browser geolocation success!\n\nlat = " + position.coords.latitude + "\nlng = " + position.coords.longitude);
	};

	var browserGeolocationFail = function(error) {
	    switch (error.code) {
	        case error.TIMEOUT:
	            alert("Browser geolocation error !\n\nTimeout.");
	            break;
	        case error.PERMISSION_DENIED:
	            if(error.message.indexOf("Only secure origins are allowed") == 0) {
	                tryAPIGeolocation();
	            }
	            break;
	        case error.POSITION_UNAVAILABLE:
	            alert("Browser geolocation error !\n\nPosition unavailable.");
	            break;
	    }
	};


	var tryGeolocation = function() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(
	                browserGeolocationSuccess,
	                browserGeolocationFail,
	                {maximumAge: 50000, timeout: 20000, enableHighAccuracy: true});
	    }
	};

	tryGeolocation(); */

	
	


	
	function getMyLocation() {
		marker.setMap(null);
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				lat = position.coords.latitude; // 위도
				lon = position.coords.longitude; // 경도
				
				makeMap();
			 
				
				$.ajax({
					url : "${pageContext.request.contextPath}/driver/findaround",
					type : "get",
					data : "startLatitude=" + lat + "&startHardness=" + lon + "&howfar="+ howfar,
					dataType : "json",
					success : function(data) {
						loadDate = data;
						console.log(data);
						makebody();	
						for (var i = 0; i < positions.length; i ++) {
							displayMarker(positions[i]); 
							
						   /*  var markers = new daum.maps.Marker({
						    	map: map,
						        position: positions[i].latlng,// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        title : positions[i].title
						    });
						    markers.setMap(map);
						   infowindow = new daum.maps.InfoWindow({
							    removable : true
							}); 
						   daum.maps.event.addListener(markers, 'click', function() {
							      // 마커 위에 인포윈도우를 표시합니다
							     infowindow.setContent("aa");
							     infowindow.open(map, markers);  
							}); */
						}
						
					}
				})
				
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			
		}
		
	}
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    marker = new daum.maps.Marker({
	        map: map,
	        position: place.latlng 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    daum.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent(place.iwContent);
	        infowindow.open(map, marker);
	    });
	}
	function makeMap() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new daum.maps.LatLng(lat, lon), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		}; 
		//지도를 생성합니다    
		map = new daum.maps.Map(mapContainer, mapOption);
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(lat, lon); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
	}
	function makebody() {
		$("#tableBody").empty();
		$.each(loadDate,function(i,item) {
			positions[i] = {
			        title: item.endAddress + " 까지가요.", 
			        latlng: new daum.maps.LatLng(item.startLatitude, item.startHardness),
			        iwContent : '<div><br><p>' + item.endAddress + ' 까지가요.</p><p><button date-index="'+i+'" class="listtgd">상새정보</button></p><br></div>'
			};
			
			
			
			
			var distance = calculateDistance(lat, lon, item.startLatitude, item.startHardness);
			
			var befor = distance + "";
			var afterStr = befor.split('.');
			
			var first = afterStr[1].substring( 0, 3 );
			var last = afterStr[0] + "." + afterStr[1].substring( 0, 3 );
			
			
			var tgdtr = $("<tr>").addClass("listtgd").attr("date-index",i);
			var tgdtd1 = $("<td>").text(i+1);
			var tgdtd2 = $("<td>").text(item.startAddress);
			var tgdtd3 = $("<td>").text(item.endAddress);
			var tgdtd4 = $("<td>").text("약 "+last+"km");
			tgdtr.append(tgdtd1).append(tgdtd2).append(tgdtd3).append(tgdtd4);
			
			$("#tableBody").append(tgdtr);
		})
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
<%@ include file="../include/footer.jsp"%>