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
	
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    GET <b>Add Driver</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
	<form action="addDriver" method="post" id="f1">
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
var txt1 = "안녕 하세요. +${vo.nickname} 님 만나서 반갑습니다.+ GET을 찾아주셔서 감사합니다. +저는 GET입니다. +${vo.nickname} 님의 안전한 GET 이용을위하여 개인정보 수집이 필요합니다. 계속하시겠습니까?";
var speed = 70;    
var textbnt = "<br><div><button type='button' id='yes'>yes</button><br><button type='button' id='no'>no</button></div>";
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
</script>
</body>


