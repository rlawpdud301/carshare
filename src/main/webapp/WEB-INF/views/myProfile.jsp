<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<style type="text/css">
#memberSubmit{
	display: none;
}
#resetMember{
	display: none;
}
#alert{
	display: none;
}
#uIntro{
	background: #f1f1f1;
}
</style>
<div class="alert alert-warning alert-dismissible" id="alert">
	회원정보 수정중...
    <!-- <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> -->
</div>
<section class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">내정보 확인</h3>
				</div>
			</div>
			<c:if test="${map.carInfoVO == null}">
				<button>운전자 등록 하러가기</button><br><br>
			</c:if>
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">${map.memberVO.nickname }님 의 회원 정보</h4>
							<button class="btn btn-default" id="modifyMember">수정 하기</button>
						</div>
						<div class="box-body">
							<form action="updateMember" method="post" id="memberForm">
								<div class="form-group">
									<label>이름:</label> 
									<input type="text" class="form-control" id="name" name="name" value="${map.memberVO.name }" placeholder="${map.memberVO.name }" readonly="readonly">
								</div>
								<div class="form-group">
									<label>닉네임:</label>
									<input type="text" class="form-control" id="nickname" name="nickname" value="${map.memberVO.nickname }" placeholder="${map.memberVO.nickname }" readonly="readonly">
								</div>
								<div class="form-group">
									<label>이메일:</label> 
									<input type="email" class="form-control" id="email" name="email" value="${map.memberVO.email }" placeholder="${map.memberVO.email }" readonly="readonly">
								</div>
								<div class="form-group">
									<label>직업:</label> 
									<input type="text" class="form-control" id="jop" name="jop" value="${map.memberVO.jop }" placeholder="${map.memberVO.jop }" readonly="readonly" >
								</div>														
								<div class="form-group">
									<label>내소개:</label><br>
									<textarea rows="5" cols="50" readonly="readonly" id="uIntro" name="uIntro" style="resize: none;">${map.memberVO.uIntro}</textarea>
								</div>
								
								<button type="button" class="btn btn-default" id="memberSubmit">수정</button> <button type="reset" class="btn btn-default" id="resetMember">취소</button>
							</form>
						</div>

					</div>
				</div>
			</div>
			
			<c:if test="${map.carInfoVO != null}">
				<div class="row">  
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">${map.memberVO.nickname }님의 붕붕이 정보</h4>
						</div>
						<div class="box-body">
							<form action="">
								<div class="form-group">
									<label>차종:</label> 
									<input type="text" class="form-control" id="carName" name="carName" value="${map.carInfoVO.carName }" readonly="readonly">
								</div>
								<div class="form-group">
									<label>차번호:</label> 
									<input type="text" class="form-control" id="carNumber" name="carNumber" value="${map.carInfoVO.carNumber }" readonly="readonly">
								</div>
								
								<button type="button" class="btn btn-default" id="carInfoSubmit">Submit</button>
							</form>
						</div>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title">${map.memberVO.nickname }님의 면허 정보</h4>
						</div>
						<div class="box-body">
							<form action="">
								<div class="form-group">
									<label>면허죵류:</label> 
									<input type="text" class="form-control" id="licenseKind" name="licenseKind" value="${map.licenseInfoVO.licenseKind }" readonly="readonly">
								</div>
								<div class="form-group">
									<label>만료일:</label> 
									<input type="text" class="form-control" id="deadline" name="deadline" value="<fmt:formatDate value='${map.licenseInfoVO.deadline}' type='date'/>" readonly="readonly">
								</div>
								
								<button type="button" class="btn btn-default" id="licenseInfoSubmit">Submit</button>
							</form>
						</div>

					</div>
				</div>
			</div>
			</c:if>
			
		</div>
	</div>
</section>



<script>
var inputNickname = document.getElementById("nickname");
var inputEmail = document.getElementById("email");
var inputJop = document.getElementById("jop");
var inputUIntro = document.getElementById("uIntro");

	$(function() {
		
		$(document).on("click","#modifyMember",function() {
											
			$("#nickname").val("");									
			$("#email").val("");									
			$("#jop").val("");
			
			inputNickname.removeAttribute("readonly");
			inputEmail.removeAttribute("readonly");
			inputJop.removeAttribute("readonly");								
			inputUIntro.removeAttribute("readonly");
						
			
			
			$("#uIntro").css("background","white");
			$("#modifyMember").css("display","none");			
			$("#alert").css("display","block");			
			$("#memberSubmit").css("display","inline");
			$("#resetMember").css("display","inline");
			
		})
		$(document).on("click","#resetMember",function() {
			inputNickname.setAttribute("readonly", "readonly");
			inputEmail.setAttribute("readonly", "readonly");
			inputJop.setAttribute("readonly", "readonly");
			inputUIntro.setAttribute("readonly", "readonly");
			
			$("#uIntro").css("background","#f1f1f1");
			$("#alert").css("display","none");			
			$("#modifyMember").css("display","inline");									
			$("#memberSubmit").css("display","none");
			$("#resetMember").css("display","none");
		})
		
		$(document).on("click","#memberSubmit",function() {
			$("#memberForm").submit();
		})
	})
</script>
<%@ include file="include/footer.jsp"%>