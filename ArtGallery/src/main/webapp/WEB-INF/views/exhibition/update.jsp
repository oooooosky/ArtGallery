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
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
</head>
<body>
	<div class="container form-control mt-5">
        <h2 class="text-center">U p d a t e</h2>
        <div>
            <form action="/exhibition/update" method="post" enctype="multipart/form-data">
           		<input type="hidden" name="page" value="${page}">
                <input type="hidden" name="e_number" value="${exhibition.e_number}">
                
                <div class="form-floating mb-3">
				<input type="text" class="form-control" id="WR" name="e_writer" placeholder="작성자" value="${exhibition.e_writer}" readonly>
			   	<label for="WR">W r i t e r</label>
		  		</div>
                
                <div class="form-floating mb-3">
				<input type="text" class="form-control" id="TI" name="e_title" placeholder="제목" value="${exhibition.e_title}" maxlength="50">
			   	<label for="TI">T i t l e</label>
		  		</div>
                
                
                <div class="form-floating mb-3">
				<textarea class="form-control mb-3" id="CO" style="height: 100px" name="e_contents" maxlength="1000">${exhibition.e_contents}</textarea>
			   	<label for="CO">C o n t e n t s</label>
		  		</div>
                
                <div class="text-center">
				<h4>Current picture</h4>
				<img src="/resources/upload/${exhibition.e_filename}" style="height: 500px; border-radius: 1rem;">
				</div>
                
                <div class="mb-3">
            	<label for="formFileMultiple" class="form-label">Change the picture!</label>
  				<input class="form-control" type="file" name="e_file" multiple>
				</div>
				
                <input type="submit" class="btn btn-outline-success mb-3" style="width: 100%;" value="S u c c e s s">
            </form>
            	<a class="btn btn-outline-danger mb-3" style="width: 100%;" href="/exhibition/paging?page=${page}">C a n c l e</a>
        </div>
    </div>
</body>
</html>