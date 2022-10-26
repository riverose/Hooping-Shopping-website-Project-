<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<link href="/ping/resources/css/serviceArticle.css" rel="stylesheet">
<link href="/ping/resources/css/serviceTap.css" rel="stylesheet">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Document</title>

</head>
<body>

	<div class="container">
		<%@include file="../board/serviceTap.jsp"%>

		<article id="article" style="width: 100%">
			<header>
				<h2 id="ar-title">
					<span class="ar-tit">${board.boardTitle }</span>
				</h2>
			</header>
			<section id="ar-info">
				<strong> <span class="ar-user">${board.memberName }</span>
				</strong> <strong class="ar-date"> <span>${board.boardDate }</span>
				</strong>
			</section>
			<section id="ar-main">
				<div class="ar-main-text">
					<span>${board.boardContent }</span>
				</div>
			</section>
			<div class="answer-box">
				<section id="ans-box">
					<article id="ans-main">
						<c:choose>
								<c:when test="${bComment eq null && !(sessionScope.managerId eq null)}">
									<form action="/ping/board/saveBComment.do" method="post">
										<input type="hidden" name="bcommentUser" value="매니저"/>
										<input type="text" name="bcommentContents"
										style=" width: 80%; border-radius: 5px; border: 1px solid grey; height: 10%;"> 
										<input type="hidden" name="boardId" value="${board.boardId}" />
										<button class="btn-dark" style="width: 15%;height: 8%;font-size: 25;border-radius: 5px;margin-left: 30px;">답변하기</button>
									</form>
								</c:when>
								<c:otherwise>
								<form action="/ping/board/updateBComment.do" method="post">
									<c:if test="${!(bComment eq null)}">
									<input class="manager" value="${bComment.bcommentUser }" disabled 
									style=" background: border-box; background-color: transparent; border: none;" /> 
									<span class="ans-date">${bComment.bcommentDate }</span>
									<input name="bcommentIdStr" value="${bComment.bcommentId }" type="hidden"/>
									</c:if>
									
									<div class="answer-contents">
										<c:if test="${!(bComment eq null)}">
										<input id="bCommentContent" name="bcommentContents" type="text" class="ans-text" value="${bComment.bcommentContents }" disabled 
										style=" width: 80%; border-radius: 5px; border: 1px solid grey; height: 10%;">
										</c:if>
										<c:if test="${!(bComment eq null) && !(sessionScope.managerId eq null)}">
										<button id="modifyBComment" type="button" class="ans-edit btn-dark">답변 수정</button>
										<a href="/ping/board/deleteBComment.do?boardId=${bComment.boardId }"><button id="deleteBCommentBtn" type="button" class="ans-edit btn-dark">답변 삭제</button></a>
										
										<button id="updateBCommentBtn" hidden="true" class="ans-edit btn-dark">답변 수정완료</button>
										</c:if>
									</div>
									
								</form>
								</c:otherwise>
						</c:choose>

						<!-- 제이쿼리로 memberId가 같은 경우에만 수정, 삭제가 가능하도록 설정 -->
						<!--  제이쿼리로 이미 답변이 달린 게시글일 경우 수정, 삭제가 불가능하도록 설정 -->
						<div class="ans-btns">
							<ul class="ans-com-btn-ul">
								<li>
									<form action="/ping/board/modifyBoard.do">
										<input name="boardId" type="hidden" value="${board.boardId }">
										<button type="submit" class="btn-dark" id="updateBoardBtn" style="display : <c:choose><c:when test="${sessionScope.memberId == board.memberId}">inline</c:when><c:otherwise>none</c:otherwise></c:choose>">수정</button>
									</form>
								</li>

								<li>
									<form action="/ping/board/deleteBoard.do" method="post">
										<input name="boardId" type="hidden" value="${board.boardId }">
										<button class="btn-dark" type="submit" id="deleteBoardBtn" style="display : <c:choose><c:when test="${sessionScope.memberId == board.memberId}">inline</c:when><c:otherwise>none</c:otherwise></c:choose>">삭제</button>
									</form>
								</li>
							</ul>
							<ul class="ans-list-ul">
								<li><a href="/ping/board/getBoardList.do">
										<button class="btn-dark" style="width: 80px;height: 40px;border-radius: 5px;">목록</button>
								</a></li>
							</ul>
						</div>
					</article>
				</section>
			</div>
		</article>
	</div>
</body>
<script>
	$(function() {
		
		$("#modifyBComment").click(function(){
			
			Swal.fire({
			      title: "답글 수정",
			      html: "답글을 수정하시겠습니까?",
			      icon: 'question',
			      showCancelButton: true,
			      confirmButtonColor: '#3085d6',
			      cancelButtonColor: '#d33',
			      confirmButtonText: '확인',
			      cancelButtonText: '취소',
			      reverseButtons: true, // 버튼 순서 거꾸로
			      
			    }).then((result) => {
			    	if (result.isConfirmed) {
			    		$("#modifyBComment").prop("hidden", true);
						$("#deleteBCommentBtn").prop("hidden", true);
						$("#updateBCommentBtn").prop("hidden", false); 
						
						$("#bCommentContent").attr("disabled", false)
			    	
			    	}else{
			    		return;
			    	}
			    	
			    });
			
		});
		
	});
</script>
<%@include file="../main/footer.jsp"%>
</html>