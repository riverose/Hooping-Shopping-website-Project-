  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href="/ping/resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet">
<link href="/ping/resources/css/serviceBoard.css" rel="stylesheet">
<link href="/ping/resources/css/serviceTap.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<!-- 링크 -->
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<!-- 링크 -->
<script src="/ping/resources/mail/jqBootstrapValidation.min.js"></script>
<script src="/ping/resources/mail/contact.js"></script>

<!-- Template Javascript -->
<!-- 링크 -->
<script src="/ping/resources/js/main.js"></script>

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>Document</title>

</head>
<body>

	<div class="container">
		<%@include file="../board/serviceTap.jsp"%>
		<div class="board-search-div">
			<div>
				<div class="card-body">
					<form action="/ping/board/getBoardList.do" method="post">

						<select name="searchCondition" id="searchCondition">
							<option value='boardTitle'>제목</option>
							<option value='boardContent'>내용</option>
							<option value='memberName'>작성자</option>
						</select>
						<div class="input-group mb-0">

							<input name="searchKeyword" type="text" class="form-control"
								placeholder="Search" aria-describedby="project-search-addon" id="keyword" style="border-radius: 5px; border: grey 1px solid;"
								/>
							<div class="input-group-append">
								<button class="btn btn-info btn btn-dark" style="margin-left: 10px; border-radius: 5px" type="submit"
									id="project-search-addon">
									<i>검색</i>
								</button>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive project-list">
							<table class="table project-table table-centered table-nowrap">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">날짜</th>
										<th scope="col">작성자</th>
										<th scope="col">답변여부</th>
										<!-- <th scope="col">Action</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${bList}" var="board" varStatus="i">
										<tr>
											<th>${ cnt - (pagination.currPageNo -1)*pagination.sizePerPage -i.index }</th>
											<td align="left"><a
												href="/ping/board/getBoard.do?boardId=${board.boardId }">
													${board.boardTitle }</a></td>
											<td><fmt:formatDate value="${board.boardDate }"
													pattern="yyyy-MM-dd" /></td>
											<td>
												<div class="user-id">
													<span>${board.memberName }</span>
												</div>
											</td>
											<td>
												<c:choose>
													<c:when test="${board.answerYN eq '1'.charAt(0)}">
														<span class="text-success font-12">답변완료</span>
													</c:when>
													<c:otherwise>
														<span class="text-danger font-12">대기중</span>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- end project-list -->
						<!-- start write-btn -->
						<div>
							<div class="board-input-div justify-content-end">
								<form action="/ping/board/writeBoard.do">
									<button id="writeBoardBtn" type="button" class="btn btn-dark board-write-btn">글쓰기</button>
								</form>
							</div>

						</div>

						<div class="pt-3">
							<ul class="pagination justify-content-center mb-0">
								<c:if test="${pagination.prev}">
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')" >이전</a></li>
								</c:if>
								<c:forEach begin="${pagination.startPage}"
									end="${pagination.endPage}" var="idx">
									<li
										class="page-item <c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/> ">
										<a class="page-link" href="#" 
										onClick="fn_pagination('${idx}', '${pagination.range}', event)">
											${idx} </a>
									</li>
								</c:forEach>
								<c:if test="${pagination.next}">
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end row -->
	</div>
</body>
<script>    
//이전 버튼

$("#writeBoardBtn").click(function(){
	
	var sessionId = '<%=session.getAttribute("memberId")%>';
	if (sessionId == '' || sessionId == 'null') {

		swal.fire({
			  title: "작성 오류!",
			  text: "로그인 하기 전에는 문의글을 작성하실 수 없어요",
			  icon: "error",
			})
		return;
	}
	
	$("#writeBoardBtn").prop("type","submit");
})

function fn_prev(currPageNo, range, pageSize) {

	var currPageNo = (range - 1) * pageSize;
	var range = range - 1;

	var url = "/ping/board/getBoardList.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchCondition=" + $("select[name=searchCondition]").val();
	url = url + "&searchKeyword=" + $("input[name=searchKeyword]").val();
	location.href = url;

}

//페이지 번호 클릭

function fn_pagination(currPageNo, range, event) {

	var url = "/ping/board/getBoardList.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchCondition=" + $("select[name=searchCondition]").val();
	url = url + "&searchKeyword=" + $("input[name=searchKeyword]").val();
	location.href = url;	

}
//다음 버튼 이벤트
function fn_next(currPageNo, range, pageSize) {

	var currPageNo = (range * pageSize) + 1;
	var range = parseInt(range) + 1;	

	var url = "/ping/board/getBoardList.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchCondition=" + $("select[name=searchCondition]").val();
	url = url + "&searchKeyword=" + $("input[name=searchKeyword]").val();
	location.href = url;
}

	$(function(){
		
	})

</script>    
<%@include file="../main/footer.jsp"%>
</html>