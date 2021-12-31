<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>

	* {
		font-family: 'Gowun Dodum', sans-serif;
	}

    #title{
    	word-break: keep-all;
    }
	
	#contents{
    	word-break: keep-all;
    }
    
    #outer {
    	display: flex;
    	align-items: center;
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
</style>
</head>
<body>


        <div class="container gx-5 mt-5" style="border: 1px solid black; border-radius:1rem;" id="outer">
            <div class="col mt-3 text-center">
                <div id="title">
                    <h2><strong>작품명 : ${review.a_title}</strong></h2>
                </div>
                <hr>
                <div>
                    <h6>작성자 : ${review.m_id}</h6>
                </div>
                <div id="contents">
                    <h6>구매후기 : ${review.r_contents}</h6>
                </div>
                
                <a class="btn btn-outline-danger mb-3 mt-3" href="/auction/reviewPaging?page=${page}">R e v i e w</a>
            </div>
        </div>
    
</body>
</html>
