<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
	<link href="/ping/resources/css/jyp.css" rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet">
<link href="/ping/resources/css/myPage.css" rel="stylesheet">
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
		<div class="row">

			<div class="container-fluid pt-5">
				<div class="text-center mb-4">
					<h2 class="section-title px-5">
						<span class="px-2">MYPAGE</span>
					</h2>
				</div>

			</div>


		</div>
		<!-- end row -->
		<section class="mypage">
			<div class="mypage-top">
				<img src="/ping/resources/img/kakaoLogo.png" class="mypage-logo" />
				<div class="mypage-top-menu">

					<div class="mypage-basic">
						<div class="mypage-hello">
							<span>${myPageVO.memberName}님 안녕하세요</span>
							<div class="mypage-edit-btns">
								<a href="/ping/board/getGradeList.do">
								<button class="btn btn-dark border"
										style="color: black !important; background-color: white !important; 
										border: 3px solid rgb(238, 109, 109) !important; 
										border-radius: 10px !important;">회원혜택보기
								</button>
								</a>
								<a href="/ping/member/profile.do">
								<button class="btn btn-dark border"
										style="color: black !important; background-color: white !important; 
										border: 3px solid black !important; 
										border-radius: 10px !important;">프로필 수정
										</button></a>
							</div>
						</div>
						<span>현재 등급 : ${rateName}</span>
					</div>
				</div>
				<div class="mypage-top-vertical"></div>
				<div class="mypage-coupon-count">
					<span>쿠폰</span>
					<h4><a href="/ping/myPage/coupon.do?num=${myPageVO.memberId}"
onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">${couponCnt}개</a></h4>
				</div>
				<div class="mypage-top-vertical"></div>
				<div class="mypage-point-count">
					<span>포인트</span>
					<h2>0P</h2>
				</div>
			</div>

		</section>


		
		<div class="mypage-review-div">
		
			<h4>My Review</h4>
			<div class="table-responsive project-list">
				<table class="table project-table table-centered table-nowrap">
					<thead>
						<tr>
							<th scope="col"><input id="allCheck" type="checkbox"
								name="allCheck" /></th>

							<th scope="col">제목</th>
							<th scope="col">상품</th>
							<th scope="col">날짜</th>
							<th scope="col">댓글</th>
							<th scope="col">좋아요</th>
						</tr>
					</thead>
					<c:forEach items="${reviewList}" var="review">
						<tbody>
							<tr>
								<td class="text_ct"><input name="RowCheck" type="checkbox"
									value="${review.reviewId}" /></td>
								<td class="text_ct">${review.reviewTitle}</td>
								<td class="text_ct">${review.productId}</td>
								<td class="text_ct">${review.reviewDate}</td>
								<td class="text_ct">${review.reviewDate}</td>

								<td>${review.reviewThumbs}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<!-- recent div end -->
			<div class="mypage-recent-btns">
				<input type="button" value="선택삭제" onclick="deleteValue();" class="btn btn-dark border"
				style="color: black !important; background-color: white !important; 
										border: 3px solid rgb(238, 109, 109) !important; 
										border-radius: 10px !important;" >
			</div>
		</div>


		<!-- 페이징 버튼 -->

		<div class="pt-3">
			<ul class="pagination justify-content-center mb-0">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/> "><a
						class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}')">
							${idx} </a></li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">다음</a></li>
				</c:if>
			</ul>
		</div>
		
		
		
		<div class="mypage-recent-div">
			<h4>최근 주문내역</h4>
			<div class="table-responsive project-list">
				<table class="table project-table table-centered table-nowrap">
					<thead>
						<tr>
							<th scope="col">주문일</th>
							<th scope="col">주문번호</th>
							<th scope="col">상품정보</th>
							<th scope="col">수량</th>
							<th scope="col">상품금액</th>
							<th scope="col">진행상황</th>
							<th scope="col">리뷰/환불</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${paylist}" var="vo">
							<form action="/ping/myPage/writeReview.do" method="post">
								<input type="hidden" name="payId" value="${vo.payId}"> <input
									type="hidden" name="reviewId" value="${reviewId}">
								<tr>
									<td scope="row">${vo.payDate}</td>
									<td>${vo.payId}</td>
									<td>${vo.productName }<span>${vo.paySize }</span> <span>${vo.payColor }</span>
									</td>
									<td>${vo.payCount}</td>
									<td class="mypage-order-product-td">${vo.payCost}원</td>
									<td>배송중</td>
									<td><c:choose>
											<c:when test="${vo.reviewId eq 0 }">
												<c:choose>
													<c:when test="${vo.refundId eq 0 }">
														<div class="mypage-recent-btns"  id="payrrbtn">
															<a href="/ping/myPage/writeReview.do">
																<button
																style="color: black !important; background-color: white !important; 
																border: 3px solid rgb(238, 109, 109) !important; 
																border-radius: 10px !important;  margin-left: 5px; height: 43px;"> 리뷰작성하기</button>
															</a> 
															<a href="/ping/myPage/refund.do?paynum=${vo.payId }">
															<button type="button" style="height: 43px; color: black !important; background-color: white !important; border: 3px solid black !important; border-radius: 10px !important; " >
																<div class="mypage-refund-btn" style="color: black; width: 54px;">환불하기</div>
															</button>
															</a>
														</div>
													</c:when>
													<c:otherwise>
														환불된 상품입니다.
													</c:otherwise>
												</c:choose>

											</c:when>
											<c:otherwise>
												이미 리뷰가 작성된 상품입니다.
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<!-- 스크롤 시작  -->
		<div class="comments">
			
		</div>
		
		
	</div>

	<Script>
		//이전 버튼
		function fn_prev(currPageNo, range, pageSize) {

			var currPageNo = (range - 1) * pageSize;
			var range = range - 1;

			var url = "/ping/myPage/myPage.do";
			url = url + "?currPageNo=" + currPageNo;
			url = url + "&range=" + range;
			url = url + "&searchCondition="
					+ $("select[name=searchCondition]").val();
			url = url + "&searchKeyword="
					+ $("input[name=searchKeyword]").val();
			location.href = url;

		}

		//페이지 번호 클릭

		function fn_pagination(currPageNo, range) {

			var url = "/ping/myPage/myPage.do";
			url = url + "?currPageNo=" + currPageNo;
			url = url + "&range=" + range;
			url = url + "&searchCondition="
					+ $("select[name=searchCondition]").val();
			url = url + "&searchKeyword="
					+ $("input[name=searchKeyword]").val();
			location.href = url;

		}
		//다음 버튼 이벤트
		function fn_next(currPageNo, range, pageSize) {

			var currPageNo = (range * pageSize) + 1;
			var range = parseInt(range) + 1;

			var url = "/ping/myPage/myPage.do";
			url = url + "?currPageNo=" + currPageNo;
			url = url + "&range=" + range;
			url = url + "&searchCondition="
					+ $("select[name=searchCondition]").val();
			url = url + "&searchKeyword="
					+ $("input[name=searchKeyword]").val();
			location.href = url;
		}

		$(function() {
			//alert("1");
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;

			$("input[name='allCheck']").click(function() {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked;
				}
			});

			$("input[name='RowCheck']").click(function() {
				if ($("input[name='RowCheck']:checked").length = rowCnt) {
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[0].checked = false;
				}
			});

		});
		function deleteValue() {
			var url = "/ping/myPage/delete.do";
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) {
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0) {
				swal.fire({
					  title: "삭제 오류!",
					  text: "선택된 글이 없습니다",
					  icon: "error",
					})
			} else {
				
				Swal.fire({
				      title: "정말 삭제하시겠습니까?",
				      html: "리뷰의 삭제내역은 복구할 수 없습니다",
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
								url : url,
								type : 'post',
								traditional : true,
								data : {
									"valueArr" : valueArr
								},
								success : function(jdata) {
									if (jdata = 1) {
										 Swal.fire(
										          '삭제 성공',
										          '선택하신 리뷰가 삭제되었습니다',
										          'success'
										        )
										        
										location.replace("myPage.do");
									} else {
										alert("삭제 실패");
									}
								}
							});
				      }else{// if문
				    	  
				      }
				    })// 버튼 result
				
				
				
// 				var chk = confirm("정말 삭제하시겠습니까?");
// 				$.ajax({
// 					url : url,
// 					type : 'post',
// 					traditional : true,
// 					data : {
// 						valueArr : valueArr
// 					},
// 					success : function(jdata) {
// 						if (jdata = 1) {
// 							alert("삭제 성공");
// 							location.replace("myPage.do");
// 						} else {
// 							alert("삭제 실패");
// 						}
// 					}
// 				});
			}

		}
	</Script>

</body>
<%@include file="../main/footer.jsp"%>
</html>