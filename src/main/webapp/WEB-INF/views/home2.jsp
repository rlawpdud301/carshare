<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
</style>

</head>
<body>
	<form action="">
		
	</form>
	<a id="custom-login-btn" href="javascript:loginWithKakao()"> 
		<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
		width="300" />
	</a>
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('96466e1526b35b59aaba41206905a93d');
		function loginWithKakao() {
			// 로그인 창을 띄웁니다.
			Kakao.Auth.login({
				success : function(authObj) {
					console.log(JSON.stringify(authObj));
					Kakao.API.request({
						url: '/v1/user/me',
						success: function(res) {
							  alert(res.id);
							  alert(res.properties['nickname']);
							  alert(res.kaccount_email);
							  location.href = "http://www.naver.com";
						}
					})
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
		};
		//]]>
	</script>
</body>
</html>