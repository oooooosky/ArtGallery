<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<style>
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
</head>
<body>
	<div class="container text-center mt-5" style="border: 1px solid black; border-radius: 1rem;">
		<h2>S i g n I n</h2>
      		<form action="login" method="post">
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="m_id" name="m_id" placeholder="ID" maxlength="20">
					<label for="ID">I D</label>
				</div>
            	<!-- <input class="form-control mb-3" type="text" name="m_id" placeholder="아이디를 입력하세요"> -->

				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="m_pw" placeholder="PW" maxlength="16">
					<label for="PW">P W</label>
				</div>
            	<!-- <input class="form-control mb-3" type="password" name="m_pw" placeholder="비밀번호를 입력하세요"> -->

            	<input type="submit" class="btn btn-outline-success mb-3" style="width: 100%;" value="L o g i n">

            	<a href="/" class="btn btn-outline-danger mb-3" style="width: 100%;">C a n c l e</a>
			</form>
			<hr>
			<div class="text-center">
				<h3 class="mb-3">다른 계정으로 로그인</h3>

				<div class="d-flex justify-content-center">
				
					<!-- 네이버 -->
					<div id="naverIdLogin" class="p-2"></div>
	
					<!-- 카카오 -->
					<!-- <a id="kakao-login-btn"></a> -->
					<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=070aeade687be812b74c91bedf42e6ec&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code">
						<img src="/resources/icon/kakao_login_large_narrow.png" style="height:60px">
					</a>
				</div>
    			<!-- <script type='text/javascript'>
        		//<![CDATA[
        		// 사용할 앱의 JavaScript 키를 설정해 주세요.
        		Kakao.init('cdb7bfd91e47297c1c21c434264eab2f');
        		// 카카오 로그인 버튼을 생성합니다.
        		Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
      //]]>
    </script> -->
			</div>
			
	</div>
</body>
<script type="text/javascript">
   var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "BucDDpnDi4_0v8SAMYoe",
         callbackUrl: "http://localhost:8080/member/callBack",
         isPopup: false,
         loginButton: {color: "white", type: 3, height: 60}
      }
   );
   naverLogin.init();
</script>
</html>