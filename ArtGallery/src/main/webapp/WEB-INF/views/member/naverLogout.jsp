<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
* {
	font-family: 'Gowun Dodum', sans-serif;
}
</style>
<body>
  <div class="container mt-5 text-center" style="border: 1px solid black; border-radius:1rem;">
    <h1 style="margin-top:20%;">Art Gallery에서 로그아웃</h1>
    <a class="btn btn-outline-danger mt-3" href="/member/Main">C a n c e l</a>
   <div class="mt-5" style="margin-bottom: 30%;" id="Nlogout"></div>
  </div>
   
   
   
   
   
   
   
   
   
   
    <div class="login-area" style="display: none">
      <div id="button_area">
        <div id="naverIdLogin"></div>
      </div>
    </div>
  <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <script type="text/javascript">
  
  const naverLogin = new naver.LoginWithNaverId(
   {
    clientId: "BucDDpnDi4_0v8SAMYoe",
    callbackUrl: "http://localhost:8080/",
    loginButton: {color: "green", type: 2, height: 40}
    }
   );
  

    naverLogin.init();
    naverLogin.getLoginStatus(function (status) {
      if (status) {
          const nickName=naverLogin.user.getNickName();
          const age=naverLogin.user.getAge();
          const birthday=naverLogin.user.getBirthday();
          setLoginStatus();
		  console.log(naverLogin);
	}
    });

          var accessToken = naverLogin.accessToken.accessToken
          console.log(accessToken)
	  
      var Nlogout = document.getElementById('Nlogout')
      /* var NLogout = '<a onclick="reroading()" class="btn btn-outline-danger" href="https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=BucDDpnDi4_0v8SAMYoe&client_secret=zmVe7xWfIE&service_provider=NAVER&access_token=';
      NLogout += accessToken;
      NLogout += '" target="blank">로그아웃</a>'; */
      // NLogout = '<a class="btn btn-outline-danger" href="http://nid.naver.com/nidlogin.logout">로그아웃</a>';
      NLogout = '<button class="btn btn-outline-danger" onclick="NaverLogout()">L o g O u t</button>';
      /* console.log(NLogout) */
      Nlogout.innerHTML = NLogout;
      
      function NaverLogout(){
			
			var logout = window.open('http://nid.naver.com/nidlogin.logout','viewss','width=1000,height=500,location=no,status=no,scrollbars=yes');
			
			setTimeout(function(){
				logout.close();
				location.href='/';
			}, 500); 
			
			
		}
      
    function setLoginStatus(){
    
    	
    	
			

     
			
			
      const button_area=document.getElementById('button_area');
      button_area.innerHTML="<button id='btn_logout'></button>";

      const logout=document.getElementById('btn_logout');
      logout.addEventListener('click',(e)=>{
        naverLogin.logout();
	location.replace("http://localhost:8080/member/naverLogout");
      })
    }
   

  </script>
</html>