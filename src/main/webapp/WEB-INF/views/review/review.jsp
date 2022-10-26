<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>EShopper - Bootstrap Shop Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
</style>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="/ping/resources/mail/jqBootstrapValidation.min.js"></script>
<script src="/ping/resources/mail/contact.js"></script>
<script src="/ping/resources/js/main.js"></script>

<!-- Favicon -->
<link href="/ping/resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet">
<link href="/ping/resources/css/review.css" rel="stylesheet">
<link href="/ping/resources/css/header.css" rel="stylesheet">

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>

	<!-- Review Box Start -->
	<div class="container-fluid pt-5">
		<div class="container-fluid px-xl-5">
			<div class="reviewTitle">
				<div class="fontGothic">
					<h2 class="section-title px-5">
						<span class="px-2">BEST REVIEW</span>
					</h2>
				</div>
			</div>
			<c:choose>
            <c:when test="${!empty reviewList }">
               <div class="px-xl-5 reviewBox">
                  <div class="bestReview">
                     <div class="oneReview reviewPage-OneReview">
                        <input type="hidden" value="${reviewList[0].reviewId }" class="reviewId" />
                        <div class="imgMix" style="position: relative">
                        <c:choose>
	                        <c:when test="${reviewList[0].reviewImg != null}">
	                           <img src="/ping/resources/img/reviewImg/${reviewList[0].reviewImg}" alt="">
	                        </c:when>
	                        <c:otherwise>
	                                 <img src="/ping/resources/img/1등.png" alt="없음">
	                        </c:otherwise>
                  		</c:choose>
<%--                            <img src="/ping/resources/img/reviewImg/${reviewList[0].reviewImg}" alt=""> <img src="/ping/resources/img/1등.png" alt="" style="position: absolute; width: 20%; right: 20%; top: -7%;"> --%>
                        </div>
                        <div class="reviewId" style="width: 40%; margin: auto;">
                           <span>${reviewList[0].memberName}</span><span>님의 리뷰</span>
                        </div>
                     </div>
                  </div>
                  <div class="reviewList px-xl-5 pb-3">
                     <c:forEach items="${reviewList}" var="review" begin="1">
                        <div class="oneReview reviewListdiv">
                           <input type="hidden" value="${review.reviewId }" class="reviewId" />
                           <div class="reviewImg">
                           <c:choose>
                        <c:when test="${review.reviewImg != null}">
                           <img src="/ping/resources/img/reviewImg/${review.reviewImg}" alt="">
                        </c:when>
                        <c:otherwise>
                                 <img src="/ping/resources/img/1등.png" alt="없음">
                        </c:otherwise>
                     </c:choose>
<%--                               <img src="/ping/resources/img/reviewImg/${review.reviewImg}" alt=""> --%>
                           </div>
                           <div class="reviewId">
                              <span>${review.memberName}</span><span>님의 리뷰</span>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </c:when>
            <c:otherwise>
            <div><h1>아직 리뷰가 하나도 없어요</h1></div>
            </c:otherwise>
         </c:choose>
		</div>
	</div>
	<!-- Review Box End-->
	
	<!-- ======================== 리뷰 상세페이지 시작 ======================== -->
	<div class="fullScreen dontshow">
		<div class="reviewDetail area">
			<input type="hidden" id="reviewDetail-reviewId" />
			<input type="hidden" id="reviewDetail-memberId" />
			<div class="reviewDetailImg">
				<img src="" alt="" id="reviewDetail-reviewImg">
				<div class="reviewDetailInfo">
					<div>상품명: <span id="reviewDetail-productName"></span></div> 
					<div>상품 색상: <span id="reviewDetail-payColor"></span></div>  
					<div>상품 사이즈: <span id="reviewDetail-paySize"></span></div>  
					<div>리뷰 컬러 :  <span id="reviewDetail-reviewColor"></span></div>  
					<div>리뷰 사이즈 :  <span id="reviewDetail-reviewSize"></span></div>  
					<div>퀄리티: <span id="reviewDetail-reviewQuality"></span></div> 
					<div id="reviewDetail-reviewHeightDiv">키: <span id="reviewDetail-reviewHeight" ></span></div> 
					<div id="reviewDetail-reviewWeightDiv">몸무게 : <span id="reviewDetail-reviewWeight"></span></div> 
				</div>
			</div>
			<div class="rightReviewDetailBox">

				<div class="reviewUserInfo">
					<span id="reviewDetail-memberName">***</span>님
					(<span id="reviewDetail-memberRating">등급</span>)<br>
					<div id="reviewDetail-memberInstagramId" style="display : none"></div> 
					<span id="reviewDetail-reviewStar" style="color : rgb(238,109,109);">★★★★☆</span>
				</div>
				<div class="ReviewDetailText" style="overflow-y: scroll">
					<div class="reviewFormPrint">
						
						<div id="reviewDetail-reviewText"></div>
					</div>
					<div class="readReviewComment">
						<span>댓글</span><br />
						<div id="rCommentTitle"></div>
					</div>

				</div>
				<div class="ReviewDetailThumbs">
					<hr>
					<span>♡</span> <span id="reviewDetail-reviewThumbs">0</span>명이 좋아합니다.
					<div hidden="true" id="reviewThumbs-loginCheck"></div>
				</div>
				<div class="writeReviewComment">
					<form action="/ping/review/saveRComment.do" method="get">
						<input hidden="hidden" />
						<input type="text" name="rcommentContents" id="rCommentContents" placeholder="댓글 남기기..">
						<button type="button" id="rCommentBtn">입력</button>
						<div id="rCommentCheck" style="display: none">댓글 내용을 입력해주세요</div>
					</form>
				</div>
			</div>
			<!-- rightReviewDetailBox 끝 -->
		</div>
		<!-- reviewDetail area -->
	</div>
	<!-- fullScreen -->
	

	<!-- Template Javascript -->
	<script>

	// 리뷰 댓글 작성 로직
	$('#rCommentBtn').click(function() {
				
				var sessionId = '<%=session.getAttribute("memberId")%>';
				if (sessionId == '' || sessionId == 'null') {

					swal.fire({
						  title: "댓글 오류!",
						  text: "로그인하기 전에는 댓글을 다실 수 없습니다",
						  icon: "error",
						})
					$("#rCommentContents").val("");
					return;
				}
				
				var reviewWriterId = $("#reviewDetail-memberId").val();
				if(sessionId == reviewWriterId){
					
					swal.fire({
						  title: "댓글 오류!",
						  text: "본인이 작성한 글에는 댓글을 다실 수 없습니다",
						  icon: "error",
						})
					$("#rCommentContents").val("");
					return;
				}
				
				var reviewId = $("#reviewDetail-reviewId").val();
				var rcommentContents = $("#rCommentContents").val();

				if ($("#rCommentContents").val() == '') {
					$("#rCommentCheck").show();
					return;
				}

				$("#rCommentCheck").hide();

				$.ajax({

					url : "/ping/review/saveRComment.do",
					data : {
						"reviewId" : reviewId,
						"rcommentContents" : rcommentContents
					},
					dataType : "json",
					type : "POST",
					success : function(data) {
								
								$("#rCommentContents").val("");	
								$("#rCommentCheck").hide();
								$("#rCommentTitle").empty();

								$.each(data.rCList, function(index, value) {
									
									$("#rCommentTitle").append("<div class='oneComment'><div class='commentUserInfo' style= 'display: flex; justify-content: space-between;' ><span>"+ value.memberName+ "</span><button id='deleteRComment"+index+"' style='display: none'><input type='hidden' value='"+value.rcommentId+"'/>삭제</button></div><div class='commentText'>"+ value.rcommentContents+ "</div></div>")
									
									if(sessionId == value.memberId){
										$("#deleteRComment"+index+"").show();
									}
									
								});
							}
				})
			})

	// 리뷰 상세팝업 닫기
	$('.fullScreen').click(function(e) {

		if ($(e.target).is('.fullScreen')) {

			$('.fullScreen').addClass('dontshow');
		}
	});
	
	// 리뷰 상세팝업 띄우기
	$('.oneReview').click(function() {
		
		var reviewId = $(this).find("input").val();
		$.ajax({
			url : "/ping/review/selectedReview.do",
			data : {"reviewId" : reviewId},
			dataType : "json",
			type : "POST",
			success : function(data) {
				
				if(data.review.reviewImg == null){
					$("#reviewDetail-reviewImg").attr("src","/ping/resources/img/reviewImg/1등.png");
				}else{
					$("#reviewDetail-reviewImg").attr("src","/ping/resources/img/reviewImg/"+ data.review.reviewImg);
				}

				$('#reviewDetail-reviewId').val(
						data.review.reviewId);
				$("#reviewDetail-memberId").val(
						data.review.memberId);
				$("#reviewDetail-memberName").text(
						data.review.memberName);
				
				if( data.review.reviewStar == 1 ){
					$("#reviewDetail-reviewStar").text("★☆☆☆☆");
				}else if( data.review.reviewStar == 2 ){
					$("#reviewDetail-reviewStar").text("★★☆☆☆");
				}else if( data.review.reviewStar == 3 ){
					$("#reviewDetail-reviewStar").text("★★★☆☆");
				}else if( data.review.reviewStar == 4 ){
					$("#reviewDetail-reviewStar").text("★★★★☆");
				}else{
					$("#reviewDetail-reviewStar").text("★★★★★");
				}
				
				$("#reviewDetail-reviewText").text(
						data.review.reviewText);
				$("#reviewDetail-productName").text(
						data.review.productName);
				$("#reviewDetail-payColor").text(
						data.review.payColor);
				$("#reviewDetail-paySize").text(
						data.review.paySize);
				$("#reviewDetail-reviewQuality").text(
						data.review.reviewQuality);
				
				if(data.review.reviewHeight != 0){
					$("#reviewDetail-reviewHeight").text(
							data.review.reviewHeight);
				}else{
					$("#reviewDetail-reviewHeightDiv").remove();
				}
				
				if(data.review.reviewWeight != 0){
					$("#reviewDetail-reviewWeight").text(
							data.review.reviewWeight);
				}else{
					$("#reviewDetail-reviewWeightDiv").remove();
				}
				
				$("#reviewDetail-reviewColor").text(
						data.review.reviewColor);
				$("#reviewDetail-reviewSize").text(
						data.review.reviewSize);
				
				var rate = data.review.memberRating;
				if(rate >= 1 && rate < 10){
					
					$("#reviewDetail-memberRating").text("멤버");
					$("#reviewDetail-memberInstagramId").hide();
					
				}else if(rate >= 10 ){
					
					if( data.bestCnt > 0 ){
						
						$("#reviewDetail-memberRating").text("인플루언서");
						
						$("#reviewDetail-memberInstagramId").text(data.mvo.memberInstagramId);
						$("#reviewDetail-memberInstagramId").show();
						
					}else{
						
						$("#reviewDetail-memberRating").text("VIP");
						$("#reviewDetail-memberInstagramId").hide();

					}
					
				}else{
					
					$("#reviewDetail-memberRating").text("뉴비");
					$("#reviewDetail-memberInstagramId").hide();

				}
				
				$("#rCommentTitle").empty();
					
				var sessionId = '<%=session.getAttribute("memberId")%>';
				
				$.each( data.rCList, function(index, value) {
					
					if(value !== 0){
						$("#rCommentTitle").append("<div class='oneComment'><div class='commentUserInfo' style= 'display: flex; justify-content: space-between;' ><span>"+ value.memberName+ "</span><button id='deleteRComment"+index+"' style='display: none'><input type='hidden' value='"+value.rcommentId+"'/>삭제</button></div><div class='commentText'>"+ value.rcommentContents+ "</div></div>")

					}else{
						$("#rCommentTitle").append("<div class='oneComment'>아직 댓글이 없어요</div>")
					}
					
					if(sessionId == value.memberId){
						$("#deleteRComment"+index+"").show();
					}
					
				});

					if(data.likeCheck == 0){
						$('.ReviewDetailThumbs').children()[1].innerText = '♡'
						$('.ReviewDetailThumbs>span:nth-child(2)').attr('style', 'color:black;');
						$('.ReviewDetailThumbs').children()[2].innerText = data.review.reviewThumbs;
				 	
					}else if(data.likeCheck == 1){
						$('.ReviewDetailThumbs').children()[1].innerText = '♥'
						$('.ReviewDetailThumbs>span:nth-child(2)').attr('style', 'color:red;');
						$('.ReviewDetailThumbs').children()[2].innerText = data.review.reviewThumbs;
					
					}else if(data.likeCheck == 99){
						$('.ReviewDetailThumbs').children()[1].innerText = '♡'
						$('.ReviewDetailThumbs>span:nth-child(2)').attr('style', 'color:black;');
						$('.ReviewDetailThumbs').children()[2].innerText = data.review.reviewThumbs;
						$('#reviewThumbs-loginCheck').val("X");
					}

				$('.fullScreen').removeClass('dontshow');
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n"
						+ "message:"
						+ request.responseText + "\n"
						+ "error:" + error);
			}
		})

					});
	
	// 리뷰 댓글 삭제하기
	$(document).on("click",".commentUserInfo > button",function(){ 
		
		var rcommentId = $(this).find("input").val();
		var reviewId = $("#reviewDetail-reviewId").val();
		
		Swal.fire({
		      title: "댓글 삭제",
		      html: "댓글을 삭제하시겠습니까?",
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonColor: '#3085d6',
		      cancelButtonColor: '#d33',
		      confirmButtonText: '승인',
		      cancelButtonText: '취소',
		      reverseButtons: true, // 버튼 순서 거꾸로
		      
		    }).then((result) => {
		      if (result.isConfirmed) {
		        
		 			$.ajax({
					
	 				url : "/ping/review/deleteRComment.do",
	 				data : {"rcommentId" : rcommentId,
	 						"reviewId" : reviewId},
	 				dataType : "json",
	 				type : "POST",
	 				success : function(data){
						
	 					$("#rCommentTitle").empty();
						
						var sessionId = '<%=session.getAttribute("memberId")%>';
						
	 					$.each( data.rCList, function(index, value) {
							$("#rCommentTitle").append("<div class='oneComment'><div class='commentUserInfo' style= 'display: flex; justify-content: space-between;' ><span>"+ value.memberName+ "</span><button id='deleteRComment"+index+"' style='display: none'><input type='hidden' value='"+value.rcommentId+"'/>삭제</button></div><div class='commentText'>"+ value.rcommentContents+ "</div></div>")
							
	 						if(sessionId == value.memberId){
	 							$("#deleteRComment"+index+"").show();
	 						}
							
	 					});
	 				}
	 			})
		      }else{// if문
		    	  
		      }
		    })// 버튼 result
		
	});// 리뷰 댓글 삭제 끝
	
	// 리뷰 좋아요
	$('.ReviewDetailThumbs').click(function() {
		
		if( $('#reviewThumbs-loginCheck').val() == "X"){
			swal.fire({
				  title: "좋아요 오류!",
				  text: "로그인하기 전에는 좋아요를 찍으실 수 없습니다",
				  icon: "error",
				})
			return;
		}	
		
		var sessionId = '<%=session.getAttribute("memberId")%>';
		var reviewWriterId = $("#reviewDetail-memberId").val();
		if(sessionId == reviewWriterId){
			swal.fire({
				  title: "좋아요 오류!",
				  text: "본인이 작성한 글에는 좋아요를 찍으실 수 없습니다",
				  icon: "error",
				});
			return;
		}
		
		var reviewId = $('#reviewDetail-reviewId').val();
		// 좋아요 찍기
		if ($('.ReviewDetailThumbs>span:nth-child(2)').text() == '♡') {
			
			
			$.ajax({
				url : "/ping/review/insertThumbsYN.do",
				data : {"reviewId" : reviewId},
				dataType : "json",
				type : "POST",
				success : function(data) {
					
					$('.ReviewDetailThumbs').children()[1].innerText = '♥'
					$('.ReviewDetailThumbs>span:nth-child(2)').attr('style', 'color:red;');
						
					$('.ReviewDetailThumbs').children()[2].innerText = data.review.reviewThumbs;
					
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n"
							+ "message:"
							+ request.responseText + "\n"
							+ "error:" + error);
				}
				
			});

		// 좋아요 취소하기	
		}else {
			
			$.ajax({
				url : "/ping/review/deleteThumbsYN.do",
				data : {"reviewId" : reviewId},
				dataType : "json",
				type : "POST",
				success : function(data) {
					
					$('.ReviewDetailThumbs').children()[1].innerText = '♡'
					$('.ReviewDetailThumbs>span:nth-child(2)').attr('style', 'color:black;');
						
					$('.ReviewDetailThumbs').children()[2].innerText = data.review.reviewThumbs;
					
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n"
							+ "message:"
							+ request.responseText + "\n"
							+ "error:" + error);
				}
			});
			
		}
	})

</script>
</body>
<%@include file="../main/footer.jsp"%>
</html>