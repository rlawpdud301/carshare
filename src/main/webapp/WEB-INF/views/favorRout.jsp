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
					<h3 class="box-title">즐겨 찾기</h3>				
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">User 즐겨 찾기</h4><button>User 즐겨 찾기 추가</button>
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
									<c:forEach var="result" items="${map.userList}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${result.startAddress}</td>
											<td>${result.endAddress}</td>
											<td><button class="useThisUser" data-RouteNo="${result.routeNo}">이경로 이용하기</button><button class="view" data-RouteNo="${result.routeNo}">상세정보(지도,삭제)</button></td>
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
							<h4 class="box-title">Driver 즐겨 찾기</h4><button>Driver 즐겨 찾기 추가</button>
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
									<c:forEach var="result" items="${map.driverList}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${result.startAddress}</td>
											<td>${result.endAddress}</td>
											<td><button class="useThisDriver" data-RouteNo="${result.routeNo}">이경로 이용하기</button><button class="view" data-RouteNo="${result.routeNo}">상세정보(지도,수정,삭제)</button></td>
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
$(function() {
	$(document).on("click",".useThisUser",function(){
		if(confirm("이경로로 등록 하시겠습니까?")){
			location.href="${pageContext.request.contextPath }/nowuse/nowRouteUploadForFavor?routeNo="+$(this).attr("data-RouteNo");
		}
	})
	$(document).on("click",".useThisDriver",function(){
		alert("준비중");
	})
	$(document).on("click",".view",function(){
		location.href="${pageContext.request.contextPath }/readFavor?routeNo="+$(this).attr("data-RouteNo");
	})
})

</script>
<%@ include file="include/footer.jsp"%>