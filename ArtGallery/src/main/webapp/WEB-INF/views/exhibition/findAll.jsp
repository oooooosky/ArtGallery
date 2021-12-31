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
#index {
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

	<div class="container mt-3" id="index" style="border: 1px solid black; border-radius: 1rem;">
        
        <div class="d-flex bd-highlight">
			<div class="p-2 flex-grow-1 bd-highlight" style="font-size:1.5em;">
				<a class="nav-link active text-dark" aria-current="page" href="/exhibition/paging">E x h i b i t i o n</a>
			</div>
		</div>
        
        <div class="text-center">
            <table class="table table-hover text-center">
                <tr>
                    <th>글번호</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>조회수</th>
                    <th>좋아요</th>
                    <th>작성시간</th>
                    <c:if test="${sessionScope.loginId eq 'admin123'}">
                        <th>삭제</th>
                    </c:if>
                </tr>
            <c:forEach items="${eList}" var="e">
                <tr>
                    <td>${e.e_number}</td>
                    <td>${e.e_writer}</td>
                    <c:if test="${sessionScope.loginId ne null}">
                    	<td><a class="text-dark" style="text-decoration-line: none;" href="/exhibition/detailM?e_number=${e.e_number}&page=${paging.page}&m_number=${sessionScope.loginNumber}">${e.e_title}</a></td>
                    </c:if>
                    <c:if test="${sessionScope.kakaoN ne null}">
                    	<td><a class="text-dark" style="text-decoration-line: none;" href="/exhibition/detailK?e_number=${e.e_number}&page=${paging.page}&k_number=${sessionScope.kakaoNumber}">${e.e_title}</a></td>
                    </c:if>
                    <c:if test="${sessionScope.naverName ne null}">
                    	<td><a class="text-dark" style="text-decoration-line: none;" href="/exhibition/detailN?e_number=${e.e_number}&page=${paging.page}&n_number=${sessionScope.naverNumber}">${e.e_title}</a></td>
                    </c:if>
                    <td>${e.e_hits}</td>
                    <td>${e.e_count}</td>
                    <td>${e.e_date}</td>
                    <c:if test="${sessionScope.loginId eq 'admin123'}">
                        <td><a class="btn btn-outline-dark" href="delete?e_number=${e.e_number}">D e l e t e</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
            <a href="/exhibition/writing" class="btn btn-outline-dark mb-3">W r i t i n g</a>
            <c:if test="${sessionScope.loginId eq 'admin123'}">
                <a href="/member/cancle?m_number=${sessionScope.loginNumber}" class="btn btn-outline-danger mb-3">A d m i n P a g e</a>
            </c:if>
			<c:if test="${sessionScope.loginId ne 'admin123'}">
				<c:if test="${sessionScope.kakaoN eq null}">
					<c:if test="${sessionScope.naverName eq null}">
						<a href="/member/cancle?m_number=${sessionScope.loginNumber}" class="btn btn-outline-danger mb-3">M a i n P a g e</a>
					</c:if>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.loginId ne 'admin123'}">
				<c:if test="${sessionScope.kakaoN ne null}">
					<a href="/member/Main" class="btn btn-outline-danger mb-3">M a i n P a g e</a>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.loginId ne 'admin123'}">
				<c:if test="${sessionScope.naverName ne null}">
					<a href="/member/Main" class="btn btn-outline-danger mb-3">M a i n P a g e</a>
				</c:if>
			</c:if>
        <div class="d-flex justify-content-center">
		    
		    <nav aria-label="Page navigation">
                <ul class="pagination">
                    
                    <c:choose>
                        <c:when test="${paging.page<=1}">

                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

			            </c:when>
			            <c:otherwise>

                            <li class="page-item">
                                <a class="page-link" href="/exhibition/paging?page=${paging.page-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                        </c:otherwise>
		            </c:choose>

                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			    <c:choose>
				    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">
                                ${i}
                            </a>
                        </li>
				    </c:when>
				    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/exhibition/paging?page=${i}">${i}</a>
                        </li>
				    </c:otherwise>
			    </c:choose>
		        </c:forEach>



                <c:choose>
                    <c:when test="${paging.page>=paging.maxPage}">
                        
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>

                    </c:when>
                    <c:otherwise>

                        <li class="page-item">
                            <a class="page-link" href="/exhibition/paging?page=${paging.page+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>

                    </c:otherwise>
                </c:choose>
                  
                </ul>
            </nav>
		    
	    </div>

    </div>
	
	</div>


</body>
</html>