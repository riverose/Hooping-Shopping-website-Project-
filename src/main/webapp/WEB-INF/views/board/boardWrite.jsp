<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet">
<link href="/ping/resources/css/serviceWrite.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

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

<title>Document</title>

</head>
<body>

	<section>
		<div class="container">
			<%@include file="../board/serviceTap.jsp"%>

			<article id="article" style="width: 100%">
				<header>
					<h2 id="ar-title">
						<span class="ar-tit">문의</span>
					</h2>
				</header>
				<section id="ar-info"></section>
				<div class="service-write-div">
					<form action="<c:choose>
									<c:when test="${updateBoard!=null}">
									/ping/board/updateBoard.do
									</c:when>
									<c:otherwise>
									/ping/board/saveBoard.do
									</c:otherwise>
									</c:choose>"
									 id="service-write-form">
									 
						<input name="memberId" type="hidden" value="<c:choose><c:when test="${updateBoard!=null}">${updateBoard.memberId }</c:when><c:otherwise>${sessionScope.memberId }</c:otherwise></c:choose>">
						<input name="memberName" type="hidden" value="<c:choose><c:when test="${updateBoard!=null}">${updateBoard.memberName }</c:when><c:otherwise>${sessionScope.memberName }</c:otherwise></c:choose>">
						<div class="service-write-title-div">
							<span class="service-write-title">제목</span> <input name="boardTitle" type="text" class="service-write-title-input" value="<c:if test="${updateBoard!=null}">${updateBoard.boardTitle}</c:if>" />
						</div>
						<div class="service-write-content-div">
							<input name="boardContent" class="service-write-content" type="text" value="<c:if test="${updateBoard!=null}">${updateBoard.boardContent}</c:if>" placeholder="질문을 명확하게 작성하셔야 원하시는 답변을 받으실수 있습니다" />
						</div>
						<input name="boardIdstr" type="hidden" value="<c:if test="${updateBoard!=null}">${updateBoard.boardId}</c:if>"/>

						<div class="service-write-btns-div">

							<ul class="service-write-btns-ul">
								<li>
								<c:choose>
									<c:when test="${updateBoard!=null}"> 
										<button type="submit" class="btn-dark service-write-btn" id="updateBoardBtn">수정</button>
									</c:when>
									<c:otherwise> 
										<button type="submit" class="btn-dark service-write-btn" id="saveBoardBtn">등록</button>
									</c:otherwise>
								</c:choose>
								</li>
								
								<li>
								
								</li>
							</ul>
						</div>
					</form>
					<a href="/ping/board/getBoardList.do"><button class="btn-dark">취소</button></a>
				</div>
			</article>
		</div>
	</section>
</body>
<script>
	
</script>
<%@include file="../main/footer.jsp"%>
</html>