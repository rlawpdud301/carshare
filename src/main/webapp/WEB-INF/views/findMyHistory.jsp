<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<style type="text/css">
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
#user_photo img{
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
      		<td id="user_photo"></td>
      		<td id="user_info"></td>
      	</tr>
      </table>
    </div>
    <div class="modal-footer">
      <h3><button id="modalCancel" type="button">닫기</button></h3>
    </div>
  </div>

</div>
<section class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">History 이용내역</h3>운전자 번호를 클릭 하시면 운전자정보 확인가능					
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">User 이용내역</h4><br> (운전자 번호를 클릭 하시면 운전자정보 확인가능)
						</div>
						<div class="box-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 10px;">NO</th>
										<th>출발지</th>
										<th>도착지</th>
										<th>요금</th>
										<th>이용 시간</th>
										<th>운전자 번호</th>
									</tr>
								</thead>
								<tbody id="tableBody">
									<c:forEach var="result" items="${map.userList}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${result.startAddress}</td>
											<td>${result.endAddress}</td>
											<td>${result.fee} 원</td>
											<td><fmt:formatDate value="${result.startTime}" type="both"/>~<fmt:formatDate value="${result.endTime}" type="both"/></td>
											<td><a class="findeMember" data-no="${result.dMemberNo.memberNo}">${result.dMemberNo.memberNo}</a></td>
										</tr>
										
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">Driver 이용내역</h4><br> (이용자 번호를 클릭 하시면 이용자정보 확인가능)
						</div>
						<div class="box-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 10px;">NO</th>
										<th>출발지</th>
										<th>도착지</th>
										<th>요금</th>
										<th>이용 시간</th>
										<th>이용자 번호</th>
									</tr>
								</thead>
								<tbody id="tableBody">
									<c:forEach var="result" items="${map.driverList}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${result.startAddress}</td>
											<td>${result.endAddress}</td>
											<td>${result.fee} 원</td>
											<td><fmt:formatDate value="${result.startTime}" type="both"/>~<fmt:formatDate value="${result.endTime}" type="both"/></td>
											<td><a class="findeMember" data-no="${result.uMemberNo.memberNo}">${result.uMemberNo.memberNo}</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
var modal = document.getElementById('myModal');
$(function() {
	$(document).on("click",".findeMember",function(){
		getMemberInfo($(this).attr("data-no"));
	})
	$(document).on("click","#modalCancel",function(){
			modal.style.display = "none";
	})
	
})
function getMemberInfo(memberNo) {
	
	$.ajax({
		url : "${pageContext.request.contextPath}/getMemberInfo",
		type : "get",
		data : "memberNo=" + memberNo,
		dataType : "json",
		success : function(data) {
			//홈컨ㅌ롤러 만들기
			console.log(data);
			$("#user_photo").empty();
			$("#user_info").empty();
			$("#user_photo").append("<img src='" + data.photo + "'>");
			$("#user_info").append(data.nickname);
			modal.style.display = "block";

		}		
	})
}
</script>
<%@ include file="include/footer.jsp"%>