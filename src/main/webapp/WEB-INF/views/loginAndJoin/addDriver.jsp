<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="include/header.jsp"%> --%>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iCheck/square/blue.css">
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
#greetings{
	/* color: blue; */ 
	font-size: 20px;
}
.login-box-body{
	min-height: 300px;
}
.warning{
	color: red;
}
</style>	
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    GET <b>Add Driver</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
	<form id="f1" action="addDriver" method="post" enctype="multipart/form-data">
		<p class="login-box-msg" id="greetings"></p>
		<div id="answer"></div>
	</form>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/dist/jquery.min.js"></script> --%>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath }/resources/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath }/resources/plugins/iCheck/icheck.min.js"></script>
<script>
var i = 0;
var txt1 = "안녕 하세요. +${vo.nickname} 님 다시만나서 반갑습니다.+ GET을 이용해주셔서 감사합니다. +${vo.nickname} 님의 면허 정보를알려주세요. + 등록후  심사가진행됩니다.";
var speed = 70;    
var textbnt = "<div id='licensePhotoDiv'><br>${vo.nickname} 님의 면허 사진을 보여주세요.<br><input type='file' id='licensePhoto' name='licensePhoto'><button type='button' id='ok'>확인</button></div>";
function Greetings(){   	 
	if (i < txt1.length+1) {
	    if (i == txt1.length) {
	    	
	    	$("#answer").append(textbnt);
			return;
		}
	    if (txt1.charAt(i)=="+") {
	    	document.getElementById("greetings").innerHTML = "";
		}else{
			document.getElementById("greetings").innerHTML += txt1.charAt(i);
		}
	    i++;    	        	    
	    setTimeout(Greetings,speed);  
	  }
	
}
$(function () {
	Greetings();
	
	
})
$(document).on("click","#ok",function(){
	if ($("#licensePhoto").val()=="") {
		$("#greetings").empty();
		var alretText = "<span class='warning'>파일이 없거나 형식이 잘못되었습니다.</span>";
		$("#greetings").append(alretText);
		return;
	}
	$("#greetings").empty();
	$("#licensePhotoDiv").css("display","none");
	i = 0;
	txt1 = "다음은 차량입니다.";
	speed = 70;    
	textbnt = "<div id='carCardDiv'><br>${vo.nickname} 님의 자동차등록증을 보여주세요.<br><input type='file' id='carCard' name='carCard'><button type='button' id='ok2'>확인</button></div>";
	Greetings();
})
$(document).on("click","#ok2",function(){
	if ($("#carCard").val()=="") {
		$("#greetings").empty();
		var alretText = "<span class='warning'>파일이 없거나 형식이 잘못되었습니다.</span>";
		$("#greetings").append(alretText);
		return;
	}
	$("#greetings").empty();
	$("#carCardDiv").css("display","none");
	i = 0;
	txt1 = "감사합니다.";
	speed = 70;    
	textbnt = "<div id='relationshipCarownerDiv'><br>등록하신 차량의 차량소유주와의 관계를 입력해주세요.<br><input id='relationshipCarowner' name='relationshipCarowner' placeholder='ex) 어머니차,회사차'><button type='button' id='ok3'>확인</button></div>";
	Greetings();
	
})

$(document).on("click","#ok3",function(){
	if ($("#relationshipCarowner").val()=="") {
		$("#greetings").empty();
		var alretText = "<span class='warning'>관계를 입력하주세요.</span>";
		$("#greetings").append(alretText);
		return;
	}
	$("#greetings").empty();
	$("#relationshipCarownerDiv").css("display","none");
	i = 0;
	txt1 = "마지막 입니다.";
	speed = 70;    
	textbnt = "<br>${vo.nickname} 님의 자동차등록증을 보여주세요.<br><input type='file' id='insuranceCard' name='insuranceCard'><button type='button' id='done'>확인</button>";
	Greetings();
	
})

$(document).on("click","#done",function(){
	if ($("#insuranceCard").val()=="") {
		$("#greetings").empty();
		var alretText = "<span class='warning'>파일이 없거나 형식이 잘못되었습니다.</span>";
		$("#greetings").append(alretText);
		return;
	}
	/* $("#carCardDiv").css("display","block");
	$("#licensePhotoDiv").css("display","block"); */
	
	$("#f1").submit();
})
</script>
</body>


