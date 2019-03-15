<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>GET | join</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.4 -->
  <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- Font Awesome -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <!-- Ionicons -->
  <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
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
    GET <b>JOIN</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
  <form action="join" method="post">
    <p class="login-box-msg" id="greetings">
    </p>
    <div id="answer"></div>
		<input type="hidden" name="memberNo" value="${vo.memberNo}">
		<input type="hidden" name="kakaoId" value="${vo.kakaoId}">
		<input type="hidden" name="naverId" value="${vo.naverId}">
		<input type="hidden" name="memberNo" value="${vo.memberNo}"> 
		<input type="hidden" name="nickname" value="${vo.nickname}">
		<input type="hidden" name="photo" value="${vo.photo}">

		<input type="hidden" name="name" id="name">
		<input type="hidden" name="phone" id="phone">
		<input type="hidden" name="jumin" id="jumin">
		<input type="hidden" name="email" id="email">
		<input type="hidden" name="jop" id="jop">
	</form>
	</div>
  <!-- /.login-box-body -->
  
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    
    
    window.setTimeout(Greetings,500);
    
    
    
    $(document).on("click","#yes",function(){
    	$("#greetings").empty();
    	$("#answer").empty();
    	i = 0;
    	textbnt = "<br>${vo.nickname} 님의 이름(법적이름)을 알려주세요.<br><input id='namebefor'><button type='button' id='ok'>확인</button>";
    	txt1 = "동의해주셔서 감사합니다. + 정보수집이시작됩니다.";
    	speed = 50; 
    	Greetings();
    	
    })
    $(document).on("click","#ok",function(){
    	var regname = /^[가-힣]{2,4}$/;
    	if(!regname.test($("#namebefor").val()))	{
    	   $("#greetings").empty();
    	   	var alretText = "<span class='warning'>이름 형식이 잘못되었습니다.</span>" ;
    	   	$("#greetings").append(alretText);
    	   	return;
    	}   	
    	$("#name").val($("#namebefor").val());
    	$("#greetings").empty();
    	$("#answer").empty();
    	i = 0;
    	txt1 = $("#name").val() + "님 감사합니다.";
    	textbnt = "<br>${vo.nickname} 님의 (본인 명의)휴대폰 전화번호를 알려주세요.<br><input type='password' id='phonebefor'><button type='button' id='ok2'>확인</button>";
    	speed = 50; 
        Greetings();   	
    })
    $(document).on("click","#ok2",function(){
    	var regphone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    	if(!regphone.test($("#phonebefor").val()))	{
      	   $("#greetings").empty();
      	   	var alretText = "<span class='warning'>전화번호 형식이 잘못되었습니다.</span>" ;
      	   	$("#greetings").append(alretText);
      	   	return;
      	}
    	$("#phone").val($("#phonebefor").val());
    	$("#greetings").empty();
    	$("#answer").empty();
    	txt1 = "감사합니다.";
    	textbnt = "<br>${vo.nickname} 님의 주민등록번호를 알려주세요.<br><input type='password' id='juminbefor'><button type='button' id='ok3'>확인</button>";
    	i = 0;
    	speed = 50; 
        Greetings();      	
    })
    $(document).on("click","#ok3",function(){
    	var regjumin = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-?[1-4][0-9]{6}$/;
    	if(!regjumin.test($("#juminbefor").val()))	{
       	   $("#greetings").empty();
       	   	var alretText = "<span class='warning'>주민등록번호 형식이 잘못되었습니다.</span>" ;
       	   	$("#greetings").append(alretText);
       	   	return;
       	}
    	
    	/* var jsonBody = {bno:bno,replyer:replyer,replytext:replytext};
    	$.ajax({
    		url : "${pageContext.request.contextPath}/",
			type : "post",
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"		
			},
			data:JSON.stringify(jsonBody),//" {bno:bno,replyer:replyer,replytext:replytext}"스트링으로변환
			dataType:"text",
			success : function(json) {
				console.log(json)
				alert(json);
				getPageList(1); 
				$("#newReplyWriter").val("");
				$("#newReplyText").val("");
			}
    	}) */
    	
    	$("#jumin").val($("#juminbefor").val());
    	$("#greetings").empty();
    	$("#answer").empty();
    	txt1 = "마지막입니다.";
    	textbnt = "<br>${vo.nickname} 님의 이메일주소를 알려주세요.<br><input id='emailbefor'>@<input id='emailbefor2'><select id='emailbefor3'><option value=' '>직접입력or선택하세요</option><option value='naver.com'>naver.com</option><option value='google.com'>google.com</option><option value='daum.net'>daum.net</option></select><button type='button' id='ok4'>확인</button>";
    	
    	i = 0;
    	speed = 50; 
        Greetings(); 
    
    })
    $(document).on("change","#emailbefor3",function(){
    	$("#emailbefor2").val($("#emailbefor3").val());
    })
    
    $(document).on("click","#ok4",function(){
    	var regemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	var emailbefor3 = $("#emailbefor").val() + "@" + $("#emailbefor2").val();
    	alert(emailbefor3);
    	if(!regemail.test(emailbefor3))	{
       	   $("#greetings").empty();
       	   	var alretText = "<span class='warning'>이메일 형식이 잘못되었습니다.</span>" ;
       	   	$("#greetings").append(alretText);
       	   	return;
       	}
    	$("#email").val(emailbefor3);
    	$("#greetings").empty();
    	$("#answer").empty();
    	txt1 = "수고하셨습니다. +필수정보는 모두 입력되었습니다. +나를 소개한다면 더 많은 사람들과 즐거운 드라이브가될수있을것입니다. 소개를해볼까요?";
    	textbnt = "<br><button type='button' id='add'>네! 소개할께요!</button><br><button type='submit' id='cancel'>아니요. 나중에 할께요!</button>";
    	i = 0;
    	speed = 50; 
        Greetings();
    })
    
    $(document).on("click","#add",function(){
    	$("#greetings").empty();
    	$("#answer").empty();
    	txt1 = "감사합니다. + 잠깐이면 됩니다.";
    	textbnt = "<br>${vo.nickname} 님의 직업을 알려주세요. 입력하지않으셔도됩니다.<br><input id='jopbefor'><br><button type='button' id='ok5'>확인</button><br><button type='submit' id='cancel'>잘못 눌렀어요 나중에할래요 바빠요!</button>";  	
    	i = 0;
    	speed = 50; 
        Greetings(); 
    })
    
    $(document).on("click","#ok5",function(){
    	$("#jop").val($("#jopbefor").val());
    	$("#greetings").empty();
    	$("#answer").empty();
    	txt1 = "";
    	alert($("#jop").val());
    	if ($("#jop").val() != null) {
    		txt1 = "${vo.nickname} 님 의직업은" + $("#jop").val() + "이군요.";
    		if ($("#jop").val() == "백수" || $("#jop").val() == "백조") {
    			txt1 = "${vo.nickname} 님 의직업은" + $("#jop").val() + "이군요. +부러워요.ㅠㅠ  + 진짜마지막이에요! 즐거운 드라이브되세요";
			}else{
				txt1 = "${vo.nickname} 님 의직업은" + $("#jop").val() + "이군요. +멋진 직업이네요.  + 진짜마지막이에요! 즐거운 드라이브되세요";
			}
    	}else{
    		txt1 = "진짜마지막이에요! 즐거운 드라이브되세요";
    	}
    	textbnt = "<br>${vo.nickname} 님 간단한 인사말을 해주시겠어요? 입력하지않으셔도됩니다.<br><textarea rows='7' cols='50' name='uIntro'></textarea><br><button type='submit' id='cancel'>확인</button>";
    	i = 0;
    	speed = 50; 
        Greetings();
        
    	
    })
    
    
    $(document).on("click","#no",function(){
    	
    	$("#greetings").empty();
    	$("#answer").empty();
    	i = 0;
    	textbnt = "<br><div><a href='/carshare'>네 </a><br><button type='button' id='yes'>아니요. 동의 하겠습니다.</button></div>";
    	txt1 = "동의 하지않으시면 저희 GET 을 이용하시기힘듭니다. 초기 로그인 화면으로 돌아가시겠습니다?";
    	speed = 50; 
    	Greetings();
    	
    })
  });
</script>
</body>
</html>
