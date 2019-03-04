<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<%-- ${map.useInfoVO }
	${map.carInfoVO } --%>
	<%-- ${map.driverLatitude }
	${map.driverHardness } --%>
<section class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">운전자 정보,위치</h3>
					
				</div>

			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							
						</div>
						<div class="box-body">
							<div id="map" style="width: 100%; height: 400px;"></div>
							<table>
								<tr>
									<td></td>
								</tr>
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

<script type="text/javascript">
var lat=${map.driverLatitude };
var lon=${map.driverHardness };
var map;
var marker = new daum.maps.Marker();
$(function() {
	makeMap();
	
	//실시간 운전자위치 가지고오기
	
})
function makeMap() {
		marker.setMap(null); 
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
		marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
	}
</script>




<%@ include file="../include/footer.jsp"%>