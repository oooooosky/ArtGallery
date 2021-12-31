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
<style>
body {
  padding: 10px;
  animation: fadein 3s;
  -moz-animation: fadein 3s; /* Firefox */
  -webkit-animation: fadein 3s; /* Safari and Chrome */
  -o-animation: fadein 3s; /* Opera */
}

@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}

* {
	font-family: 'Gowun Dodum', sans-serif;
}

</style>
</head>
<body>

<header>
  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: white;">
    <div class="container-fluid" style="font-size:1.5em;">
      <a class="navbar-brand" href="/" style="font-size:1.5em;">
        <img src="/resources/icon/parthenon.png" alt="" width="50" height="50" class="d-inline-block align-text-top">
        Art?Galley
      </a>
      <div class="d-flex" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item p-2">
            <a class="nav-link text-dark" href="/member/join">Sign Up</a>
          </li>
          <li class="nav-item p-2">
            <a class="nav-link text-dark" href="/member/login">Sign In</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<section>
  <h1 class="text-center" style="margin-top: 20%; margin-bottom: 18%">Welcome to Art Gallery</h1>
</section>

<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
  <div class="col-md-4 d-flex align-items-center">
    <span class="text-muted">© 2021 Art Gallery, Inc</span>
  </div>
</footer>

</body>
</html>