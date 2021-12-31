<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	<div class="container text-center mt-5">
		<h2>카카오페이</h2>
        <form action="/auction/success" name="success" method="post">
			<input type="hidden" name="a_number" value="${auction.a_number}">
			<c:if test="${sessionScope.kakaoN eq null}">
				<c:if test="${sessionScope.naverName eq null}">
					<input type="hidden" name="m_id" value="${sessionScope.loginId}">
				</c:if>
			</c:if>
			<c:if test="${sessionScope.kakaoN ne null}">
				<input type="hidden" name="m_id" value="${sessionScope.kakaoN}">
			</c:if>
			<c:if test="${sessionScope.naverName ne null}">
				<input type="hidden" name="m_id" value="${sessionScope.naverName}">
			</c:if>
		</form>
        <div class="row gx-5 mt-5" id="outer">
        <div class="col">
            <img id="image" src="/resources/upload/${auction.a_filename}" style="border-radius: 1rem; margin-left: 5%; width:70%;">
        </div>
        <div class="col">
        	<h3>작품명 : ${auction.a_title}</h3>
        	<h4>결제 금액 : ${bid.b_bid} 원</h4>
        	<c:if test="${sessionScope.kakaoN eq null}">
				<c:if test="${sessionScope.naverName eq null}">
        			<h4>결제자 명 : ${sessionScope.loginName}</h4>
        		</c:if>
			</c:if>
        	<c:if test="${sessionScope.kakaoN ne null}">
        		<c:if test="${sessionScope.naverName eq null}">
        			<h4>결제자 명 : ${sessionScope.kakaoN}</h4>
        		</c:if>
			</c:if>
			<c:if test="${sessionScope.naverName ne null}">
				<c:if test="${sessionScope.kakaoN eq null}">
        			<h4>결제자 명 : ${sessionScope.naverName}</h4>
        		</c:if>
        	</c:if>
            <button class="btn btn-warning text-dark" id="check_module" type="button">kakaoPay</button>
            <a class="btn btn-outline-danger" href="/auction/auction">C a n C l e</a>
        </div>
        </div>
	</div>

<script>

    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp69496546'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'kakao', // version 1.1.0부터 지원.
            /* 
                'kakao':카카오페이, 
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card':신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            /* 
                merchant_uid에 경우 
                https://docs.iamport.kr/implementation/payment
                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                참고하세요. 
                나중에 포스팅 해볼게요.
             */
            name: '주문명 : ${auction.a_title}',
            //결제창에서 보여질 이름
            amount: ${bid.b_bid},
            //가격 
            buyer_id: '${auction.a_id}',

            buyer_postcode: '123-456',
            // m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '결제 금액 : ' + rsp.paid_amount;
                success.submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });
</script>
</body>
</html>
