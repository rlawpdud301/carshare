<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="../include/header.jsp"%>
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


<div>
	<h1>배차 기다리는중...</h1>
	<table>
		<tr>
			<td>출발지 : </td>
			<td>${routeVO.startAddress }</td>
		</tr>
		<tr>
			<td>도착지 : </td>
			<td>${routeVO.endAddress }</td>
		</tr>
		<tr>
			<td></td>
			<td><button type="button" id="cancel" class="btn-danger">등록 취소 할래요</button></td>
		</tr>
	</table>
	
</div>
<script>

$(function () {
	$(document).on("click","#cancel",function(){
		if (confirm("정말 취소하시겠습니까?")) {
			location.href="${pageContext.request.contextPath }/nowuse/cancelRoute";
		}
	})
	$("#alert").css("display","block");
	$("#alert").append("두지점간의 거리는 km 입니다. 1km 이하는 이용할수없습니다.");
	
	/* modal.style.display = "block"; */
	
	
	
	

})
</script>
<%@ include file="../include/footer.jsp"%>