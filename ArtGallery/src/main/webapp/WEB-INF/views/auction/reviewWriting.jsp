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
<style>
    label {
        display: block;
    }

	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
	
</style>
</head>
<body>
    <div class="container mt-5 form-control" style="border: 1px solid black; border-radius: 1rem;">
        <h2 class="text-center">R e v i e w</h2>
        <h4 class="text-center">이미 작성된 리뷰일 경우 자동으로 수정됩니다.</h4>
        <hr>
        <form action="/auction/reviewWriting" method="post">
        
        	<c:if test="${sessionScope.kakaoN eq null}">
	        	<c:if test="${sessionScope.naverName eq null}">
		        	<div class="form-floating mb-3">
		  				<input type="text" class="form-control" id="BW" name="m_id" placeholder="작성자" value="${sessionScope.loginId}" readonly>
		 				<label for="BW">구매자</label>
		 				<input type="hidden" name="e_email" value="null">
					</div>
	            </c:if>
            </c:if>
            
            <c:if test="${sessionScope.kakaoN ne null}">
	        	<div class="form-floating mb-3">
	  				<input type="text" class="form-control" id="BW" name="m_id" placeholder="작성자" value="${sessionScope.kakaoN}" readonly>
	 				<label for="BW">구매자</label>
				</div>
	 				<input type="hidden" name="a_email" value="${sessionScope.kakaoE}">
            </c:if>
            
            <c:if test="${sessionScope.naverName ne null}">
	        	<div class="form-floating mb-3">
	  				<input type="text" class="form-control" id="BW" name="m_id" placeholder="작성자" value="${sessionScope.naverName}" readonly>
	 				<label for="BW">구매자</label>
				</div>
	 				<input type="hidden" name="a_email" value="${sessionScope.naverEmail}">
            </c:if>
            
            <div class="form-floating mb-3">
	  				<input type="text" class="form-control" id="BW" name="a_title" placeholder="작성자" value="${auction.a_title}" readonly>
	 				<label for="BW">작품명</label>
				</div>
            
            <div class="form-floating mb-3">
  				<input type="text" class="form-control" id="BT" name="r_title" placeholder="제목" maxlength="50">
 				<label for="BT">리뷰 제목</label>
			</div>
            
			<div class="form-floating mb-1">
  				<textarea class="form-control" id="BC" placeholder="내용" name="r_contents" style="height: 100px" maxlength="1000"></textarea>
 				<label for="BC">구매 후기</label>
			</div>
            
            <input class="btn btn-outline-success mt-3 mb-3" style="width: 100%;" type="submit" value="S u c c e s s">
            
        </form>
            <a class="btn btn-outline-danger mb-3" style="width: 100%;" href="/auction/paging">C a n c l e</a>
    </div>
    
</body>
</html>
