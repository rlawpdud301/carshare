<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<style type="text/css">
</style>
<section class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">상세 정보</h3>				
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">${routeVO.routeNo }</h4>
						</div> 
						<div class="box-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 10px;">NO</th>
										<th>출발지</th>
										<th>도착지</th>
										<th>관리</th>
									</tr> 
								</thead>
								<tbody id="tableBody">
										<tr>
											<td>${routeVO.routeNo}</td>
											<td>${routeVO.startAddress}</td>
											<td>${routeVO.endAddress}</td>
											<td><button id="remove">삭제</button><button id="modified">바로이용하기</button></td>
										</tr>
										<tr>
											<td colspan="4">
												<div id="map" style="width: 100%; height: 400px;"></div>
											</td>
										</tr>									
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
var startAddress = "${routeVO.startAddress}";
var startLatitude = ${routeVO.startLatitude};
var startHardness = ${routeVO.startHardness};

var endAddress = "${routeVO.endAddress}";
var endLatitude = ${routeVO.endLatitude};
var endHardness = ${routeVO.endHardness};

var mapContainer = document.getElementById('map');
var mapOption = { 
    center: new daum.maps.LatLng(startLatitude, startHardness), 
    level: 8 
};


var map = new daum.maps.Map(mapContainer, mapOption); 

var startPosition = new daum.maps.LatLng(startLatitude, startHardness);

var startMarker = new daum.maps.Marker({
    position: startPosition
});

var startIwContent = '<div style="padding:5px;"><b style="color:blue">출발지<br></b>'+startAddress+'</div>';


var startInfowindow = new daum.maps.InfoWindow({
    position : startPosition, 
    content : startIwContent 
});
  
startInfowindow.open(map, startMarker); 


var endPosition = new daum.maps.LatLng(endLatitude, endHardness);

var endMarker = new daum.maps.Marker({
    position: endPosition
});

var endIwContent = '<div style="padding:5px;"><b style="color:blue">도착지<br></b>'+endAddress+'</div>';


var endInfowindow = new daum.maps.InfoWindow({
    position : endPosition, 
    content : endIwContent 
});
  
endInfowindow.open(map, endMarker); 

$(function() {
	
	startMarker.setMap(map);
	endMarker.setMap(map);
	
	
	$(document).on("click","#remove",function(){
		if(confirm("정말 삭제 하시겠습니까?")){ 
			location.href="${pageContext.request.contextPath }/removeFavorRout?routeNo=${routeVO.routeNo}";
		}
	})
	$(document).on("click","#modified",function(){
		/* confirm("정말 삭제 하시겠습니까?"); */
		alert("아직 지원하지않는 기능입니다.");
	})
})


</script>
<%@ include file="include/footer.jsp"%>