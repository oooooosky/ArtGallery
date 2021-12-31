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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

function idDuplicate() {
    const id = document.getElementById('m_id').value
    const checkResult = document.getElementById('id-dup-check')

    $.ajax({
        type: 'post',
        url: 'idDuplicate',
        data: {'m_id': id},
        dataType: 'text',
        success: function(result) {
            if(result=="ok") {
            	if(id.length>=5) {
                checkResult.style.color="green"
                checkResult.innerHTML="멋진 아이디네요!"            		
            	}
            } else {
                checkResult.style.color="red"
                checkResult.innerHTML="이미 사용중인 아이디입니다."
            }
        },
        error: function(result) {
            	
        }
    })

}
    
function idCheck() {
            const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,20}$/;
            const id=document.getElementById('m_id').value
            const idCheck=document.getElementById('idCheck')

            if(id.length!=0) {
            	if(id.length<5) {
            		idCheck.innerHTML="영어 숫자조합 5~20글자 이내로 작성해주세요"
                	idCheck.style.color="red"            		
            	} else {
            		idCheck.innerHTML=""
            	}
            } else {
                idCheck.innerHTML="필수정보입니다."
                idCheck.style.color="red"
            }
        }

function phoneCheck() {
    const exp=/^\d{3}-\d{4}-\d{4}$/;
    const phone=document.getElementById('phone').value
    const result=document.getElementById('phone-check-result')

    if(phone.match(exp)) {
        result.innerHTML='사용 가능'
        result.style.color='green'
    } else {
        result.innerHTML='010-XXXX-XXXX 형식으로 써주세요'
        result.style.color='red'
    }
}

function nameCheck() {
	const name=document.getElementById('name').value
    if(name.length!=0) {
        nameResult.innerHTML="좋은 이름이네요!"
        nameResult.style.color='green'
    } else {
        nameResult.innerHTML='필수항목입니다.'
        nameResult.style.color='red'
    }
}

function pwCheck() {
    const pw=document.getElementById('pw').value
    const exp=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$-_])[a-zA-Z\d!@#$-_]{8,16}$/;

    if(pw.length!=0){
        if(pw.match(exp)) {
            pwResult.innerHTML='안전'
            pwResult.style.color='green'
        } else {
            pwResult.innerHTML='8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.'
            pwResult.style.color='red'
        }
    } else {
        pwResult.innerHTML='필수항목입니다.'
        pwResult.style.color='red'
    }
}

</script>
<style>
    span {
        display: block;
        text-align: left;
    }
</style>
</head>
<body>
	<div class="container text-center mt-5" style="border: 1px solid black; border-radius: 1rem;">
        <h2>S i g n U p</h2>
        <form action="join" method="post" enctype="multipart/form-data">

           	<span id="id-dup-check"></span>
            <span id="idCheck"></span>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="m_id" name="m_id" placeholder="I D" onkeyup="idDuplicate(); idCheck()" maxlength='20'>
                <label for="ID">I D</label>
            </div>
            <!-- <input class="form-control mb-3" type="text" name="m_id" id="m_id" placeholder="아이디를 입력하세요" onkeyup="idDuplicate()"> -->

			<span id="pwResult"></span>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" id="pw" name="m_pw" placeholder="P A S S W O R D" onkeyup="pwCheck()" maxlength="16">
                <label for="PW">P A S S W O R D</label>
            </div>
            <!-- <input class="form-control mb-3" type="password" name="m_pw" placeholder="비밀번호를 입력하세요"> -->

            <span id="nameResult"></span>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="m_name" id="name" placeholder="NA" onblur="nameCheck()" maxlength="10">
                <label for="NA">N A M E</label>
            </div>
            <!-- <input class="form-control mb-3" type="text" name="m_name" placeholder="이름을 입력하세요"> -->

            <!-- <div class="form-floating mb-3"> -->
                <!-- <input type="text" class="form-control" name="m_email" placeholder="EM"> -->
                <!-- <label for="EM">E M A I L</label> -->
            <!-- </div> -->
            <!-- <input class="form-control mb-3" type="text" name="m_email" placeholder="이메일을 입력하세요"> -->

			<span id="phone-check-result"></span>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="m_phone" id="phone" placeholder="PH" onblur="phoneCheck()">
                <label for="PH">P H O N E ( 010-XXXX-XXXX )</label>
            </div>
            <!-- <input class="form-control mb-3" type="text" name="m_phone" placeholder="전화번호를 입력하세요"> -->

            <div class="mb-3">
  				<input class="form-control" type="file" name="m_file" multiple>
			</div>

            <input type="submit" class="btn btn-outline-success mb-3" style="width:100%" value="S u c c e s s">

            <a href="/" class="btn btn-outline-danger mb-3" style="width:100%">C a n c l e</a>

        </form>
    </div>
</body>
</html>