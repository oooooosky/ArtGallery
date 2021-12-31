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
        <h2 class="text-center">R e g i s t r a t i o n</h2>
        <form action="/auction/registration" method="post" enctype="multipart/form-data">
        
        	<div class="form-floating mb-3">
  				<input type="text" class="form-control" id="AW" name="a_writer" placeholder="작가명">
 				<label for="AW">작가명</label>
			</div>
            
            <div class="form-floating mb-3">
  				<input type="text" class="form-control" id="AT" name="a_title" placeholder="작품명" maxlength="50">
 				<label for="AT">작품명</label>
			</div>
            
			<div class="form-floating mb-3">
  				<textarea class="form-control" id="AC" placeholder="내용" name="a_contents" style="height: 100px" maxlength="1000"></textarea>
 				<label for="AC">작품 설명</label>
			</div>
            
            <div class="form-floating mb-3">
  				<input type="text" class="form-control" id="BP" name="b_price" placeholder="경매 시작가">
 				<label for="BP">경매 시작가 (단위 : ₩)</label>
			</div>
            
			<div class="mb-3">
  				<label class="form-label">경매 종료 일자</label>
  				<input class="form-control" type="date" name="a_date">
			</div>
			
            <div class="mb-3">
  				<label for="formFileMultiple" class="form-label">작품 사진</label>
  				<input class="form-control" type="file" name="a_file" multiple>
			</div>
			
            <input class="btn btn-outline-success mb-3" style="width: 100%;" type="submit" value="S u c c e s s">
            
        </form>
            <a class="btn btn-outline-danger mb-3" style="width: 100%;" href="/auction/auction">C a n c l e</a>
    </div>
    
</body>
</html>
