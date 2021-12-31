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

* {
	font-family: 'Gowun Dodum', sans-serif;
}

</style>
<script>
const countDownTimer = function (id, date) {
    var _vDate = new Date(date); // 전달 받은 일자
    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24; var timer;
    function showRemaining() {
        var now = new Date();
        var distDt = _vDate - now;
        if (distDt < 0) {
            clearInterval(timer);
            document.getElementById(id).textContent = '0일 0시간 0분 0초';
            document.getElementById('end').textContent = '종료되었습니다'
            let output = "<c:if test='${sessionScope.loginId eq auction.a_id}'>";
			output += "<a class='btn btn-outline-dark mb-3' style='width:50%' href='/auction/kakaoPay'>P a y</a>";
			output += "</c:if>";
			output +="<c:if test='${sessionScope.kakaoN eq auction.a_id}'>";
			output +="<c:if test='${sessionScope.kakaoE eq auction.a_email}'>";
			output += "<a class='btn btn-outline-dark mb-3' style='width:50%' href='/auction/kakaoPay'>P a y</a>";
			output += "</c:if>";
			output += "</c:if>";
			output +="<c:if test='${sessionScope.naverName eq auction.a_id}'>";
			output +="<c:if test='${sessionScope.naverEmail eq auction.a_email}'>";
			output += "<a class='btn btn-outline-dark mb-3' style='width:50%' href='/auction/kakaoPay'>P a y</a>";
			output += "</c:if>";
			output += "</c:if>";
			document.getElementById('pay').innerHTML = output;
			/* document.getElementById('pay').innerHTML = "<a class='btn btn-outline-dark mb-3' style='width:50%' href='/auction/kakaoPay'>P a y</a>"; */
            return;
        }
    var days = Math.floor(distDt / _day);
    var hours = Math.floor((distDt % _day) / _hour);
    var minutes = Math.floor((distDt % _hour) / _minute);
    var seconds = Math.floor((distDt % _minute) / _second);
    //document.getElementById(id).textContent = date.toLocaleString() + "까지 : ";
    document.getElementById(id).textContent = days + '일 ';
    document.getElementById(id).textContent += hours + '시간 ';
    document.getElementById(id).textContent += minutes + '분 ';
    document.getElementById(id).textContent += seconds + '초';
    }
    timer = setInterval(showRemaining, 1000);
}
countDownTimer('count', '${auction.a_date}');
/* countDownTimer('count', '12-25-2021 08:54 PM'); */

function bid() {
	const cost = document.getElementById('cost').value
	const bid = document.getElementById('BB').value
	console.log(cost)
	console.log(bid)
	if(bid > cost) {
		purchase.submit();
	} else {
		alert('현재 입찰가보다 큰 가격을 입력하세요')
	}
}

</script>
</head>
<body>
	<div class="row gx-5 mt-5" id="outer">
        <div class="col">
            <img id="image" src="/resources/upload/${auction.a_filename}" style="border-radius: 1rem; margin-left: 5%; width:70%;">
        </div>
        <div class="col">
            <div id="title">
                <h1><strong>${auction.a_title}</strong></h1>
                <h6>작가명 : ${auction.a_writer}</h6>
            </div>
            <div id="contents">
                <h6>${auction.a_contents}</h6>
            </div>
            <c:if test="${auction.a_stock ne 0}">
                <div>
                	<h6>
                		경매 종료 날짜 : ${auction.a_date} 오전 09:00<br>
                		남은 경매 시간 : <span id="count"></span>
                	</h6>
                </div>
                <c:if test="${sessionScope.loginId ne 'admin123'}">
        	        <form action="/auction/bid" name="purchase" method="post">
                		<c:if test="${sessionScope.loginId ne null}">
                        	<input type="hidden" name="a_id" value="${sessionScope.loginId}">
                        </c:if>
                        <c:if test="${sessionScope.kakaoN ne null}">
                        	<input type="hidden" name="a_id" value="${sessionScope.kakaoN}">
                        	<input type="hidden" name="a_email" value="${sessionScope.kakaoE}">
                        </c:if>
                        <c:if test="${sessionScope.naverName ne null}">
                        	<input type="hidden" name="a_id" value="${sessionScope.naverName}">
                        	<input type="hidden" name="a_email" value="${sessionScope.naverEmail}">
                        </c:if>
                        <input type="hidden" name="a_number" value="${auction.a_number}">
                        <input type="hidden" id="cost" value="${bid.b_bid}">
                        <div class="form-floating mb-3" style="width:50%">
                            <input type="text" class="form-control" id="AI" placeholder="경매 입찰가" value="${auction.a_id}" readonly>
                            <label for="AI">현재 최고 입찰자 ID</label>
                        </div>
                        <div class="form-floating mb-3" style="width:50%">
                            <input type="text" class="form-control" id="BB" name="b_bid" placeholder="경매 입찰가" value="${bid.b_bid}">
                            <label for="BB">현재 입찰가 (단위 : ₩)</label>
                        </div>
                        <span id="end">
                            <input class="btn btn-outline-dark mb-3" style="width:50%" onclick="bid()" value="입 찰">
                        </span>
                    </form>
                </c:if>
            </c:if>

            <c:if test="${auction.a_stock eq 0}">
                <h2>S o l d O u t</h2>
            </c:if>
                
            <div id="pay">
            </div>

        	<c:if test="${sessionScope.loginId eq 'admin123'}">
        	    <a class="btn btn-outline-dark mb-3" style="width:50%" href="/auction/registration">R e g i s t r a t i o n</a>
        	</c:if>

        	<c:if test="${sessionScope.loginId eq 'aaa123'}">
        	    <a class="btn btn-outline-dark mb-3" style="width:50%" href="/auction/kakaoPay">T e s t P a y</a>
        	</c:if>
        	
        	<c:if test="${sessionScope.kakaoN eq 'ㅇ지석'}">
				<c:if test="${sessionScope.kakaoE eq 'ohjs813@naver.com'}">
					<c:if test="${sessionScope.loginId ne 'admin123'}">
						<a class='btn btn-outline-dark mb-3' style='width:50%' href='/auction/kakaoPay'>T e s t P a y</a>
					</c:if>
				</c:if>
			</c:if>
			
			<c:if test="${sessionScope.naverName eq '오지석'}">
				<c:if test="${sessionScope.naverNid eq 'kq_rWV-6fJrMcrKo0NNERuCQVR5s5hjkukb-oBz4gDA'}">
					<c:if test="${sessionScope.loginId ne 'admin123'}">
						<a class='btn btn-outline-dark mb-3' style='width:50%' href='/auction/kakaoPay'>T e s t P a y</a>
					</c:if>
				</c:if>
			</c:if>
        	

        	<a class="btn btn-outline-dark mb-3" style="width:50%" href="/auction/paging">Auction Record</a>
        	<c:if test="${sessionScope.kakaoN eq null}">
	        	<c:if test="${sessionScope.naverName eq null}">
		        	<a class="btn btn-outline-danger" style="width:50%" href="/member/cancle?m_number=${sessionScope.loginNumber}">M a i n P a g e</a>
	        	</c:if>
        	</c:if>
        	
        	<c:if test="${sessionScope.kakaoN ne null}">
	        	<a class="btn btn-outline-danger" style="width:50%" href="/member/Main">M a i n P a g e</a>
        	</c:if>
        	
        	<c:if test="${sessionScope.naverName ne null}">
	        	<a class="btn btn-outline-danger" style="width:50%" href="/member/Main">M a i n P a g e</a>
        	</c:if>
            
        </div>
	</div>


</body>
</html>