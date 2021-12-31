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


        <div class="row gx-5 mt-5" id="outer">
            <div class="col">
                <img id="image" src="/resources/upload/${exhibition.e_filename}" style="border-radius: 1rem; margin-left: 5%; width:70%;">
            </div>
            <div class="col">
                <div id="title">
                    <h2><strong>${exhibition.e_title}</strong></h2>
                </div>
                <div id="contents">
                    <h6>${exhibition.e_contents}</h6>
                </div>
                <div>
                    <h6>작성자 : ${exhibition.e_writer}</h6>
                </div>
                
                <div>
			       <a class="text-dark heart" style="text-decoration-line: none;">
			           <img id="heart" src="/resources/icon/heart.svg">
			           좋아요
			       </a>
			   </div>
            
                <c:if test="${sessionScope.kakaoN ne null}">
	                <c:if test="${sessionScope.kakaoN eq exhibition.e_writer}">
		                <c:if test="${sessionScope.kakaoE eq exhibition.e_email}">
		                    <a class="btn btn-outline-dark" href="updateForm?e_number=${exhibition.e_number}&page=${page}">U p d a t e</a>
		                    <a class="btn btn-outline-dark" href="delete?e_number=${exhibition.e_number}">D e l e t e</a>
		                </c:if>
	                </c:if>
                </c:if>
                
                <a class="btn btn-outline-danger mb-3 mt-3" href="/exhibition/paging?page=${page}">E x h i b i t i o n L i s t</a>
            </div>
        </div>

        
        <%-- <img id="image" src="/resources/upload/${exhibition.e_filename}" style="width: 40%; border-radius: 1rem; margin-top: 5%; margin-left: 5%;"> --%>
        <%-- <c:if test="${sessionScope.loginId eq exhibition.e_writer}">
        <a class="btn btn-outline-success" href="updateForm?e_number=${exhibition.e_number}&page=${page}">U p d a t e</a>
        <a class="btn btn-outline-dark" href="delete?e_number=${exhibition.e_number}">D e l e t e</a>
        </c:if>
        <a class="btn btn-outline-danger mb-3 mt-3" href="/exhibition/paging?page=${page}">E x h i b i t i o n L i s t</a> --%>
    
</body>
<script>
    $(document).ready(function () {

        var heartval = ${heart.heart}
		/* var naver = ${sessionScope.naverNunmber}; */
        
        console.log(heartval)
        /* console.log(naver) */
        
        if(heartval>0) {
            console.log(heartval);
            $("#heart").prop("src", "/resources/icon/heart-fill.svg");
            $(".heart").prop('name',heartval)
        }
        else {
            console.log(heartval);
            $("#heart").prop("src", "/resources/icon/heart.svg");
            $(".heart").prop('name',heartval)
        }

            	
	        $(".heart").on("click", function () {
            
	        	var that = $(".heart");
	        	
			$.ajax({
	                url :'/exhibition/heartK',
	                type :'POST',
	                data : {'e_number':${exhibition.e_number}, 'k_number':${sessionScope.kakaoNumber}},
	                success : function(data){
	                    that.prop('name',data);
	                    if(data==1) {
	                        $('#heart').prop("src","/resources/icon/heart-fill.svg");
		                    alert('좋아요 성공!')
	                    }
	                    else{
	                        $('#heart').prop("src","/resources/icon/heart.svg");
		                    alert('좋아요 취소 성공!')
	                    }
	                    location.reload();
	
	                }
	            });
            	
            
	        });
            
    });
</script>
</html>
