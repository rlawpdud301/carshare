<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">Driver Mode 내주변 이용자</h3>
					<%-- <c:if test="${driver == driver}">
						
						<table class="table table-hover">
							<thead>
								<tr>
									<th><button class="btn-success" id="find">내주변
											이용자보기</button></th>
									<th><button class="btn-success" id="nowenrollment">지금갈경로
											등록하기</button></th>
									<th><button class="btn-success" id="enrollment">경로
											등록하기</button></th>
								</tr>
							</thead>
						</table>
					</c:if>
					<c:if test="${driver == user}">
						<h3 class="box-title">User Mode</h3>
						<table class="table table-hover">
							<thead>
								<tr>
									<th><button class="btn-primary" id="find">내주변
											드라이버보기</button></th>
									<th><button class="btn-primary" id="nowenrollment">지금갈경로
											등록하기</button></th>
									<th><button class="btn-primary" id="enrollment">경로
											등록하기</button></th>
								</tr>
							</thead>
						</table>
					</c:if> --%>
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
								<button type="button" class="btn">지도로 보기</button>
								<button type="button" class="btn">리스트로 보기</button>
							</div>
						</div>
						<div class="box-body">
							
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
	$(function() {
		$("#mode").text("Drive mode");
		$("body").removeClass("skin-blue");
		$("body").addClass("skin-green");

		/* $(document).on("click", "#find", function() {
			alert("aaa");
		}) */
		howfar = "five";
		 
		getMyLocation();
		
		$(document).on("click", ".howfar", function() {
			howfar = $(this).val().trim();
			getMyLocation();
		})
		
	}) 
	
	
	function getMyLocation() {
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude; // 위도
				var lon = position.coords.longitude; // 경도
				  
			 
				$.ajax({
					url : "${pageContext.request.contextPath}/driver/findaround",
					type : "get",
					data : "startLatitude=" + lat + "&startHardness=" + lon + "&howfar="+ howfar,
					dataType : "json",
					success : function(data) {
						console.log(data);
						$("#tableBody").empty();
						$.each(data,function(i,item) {
							var distance = calculateDistance(lat, lon, item.startLatitude, item.startHardness);
							
							var befor = distance + "";
							var afterStr = befor.split('.');
							
							var first = afterStr[1].substring( 0, 3 );
							var last = afterStr[0] + "." + afterStr[1].substring( 0, 3 );
							
							var tgda = $("<a>");
							
							var tgdtr = $("<tr>");
							var tgdtd1 = $("<td>").text(i+1);
							var tgdtd2 = $("<td>").text(item.startAddress);
							var tgdtd3 = $("<td>").text(item.endAddress);
							var tgdtd4 = $("<td>").text("약 "+last+"km");
							tgdtr.append(tgdtd1).append(tgdtd2).append(tgdtd3).append(tgdtd4);
							
							tgda
							
							$("#tableBody").append(tgdtr);
						})
						
					}
				})
				
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			
		}
		
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