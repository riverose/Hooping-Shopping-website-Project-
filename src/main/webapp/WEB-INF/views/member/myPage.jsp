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
							<span>${myPageVO.memberName}??? ???????????????</span>
							<div class="mypage-edit-btns">
								<a href="/ping/board/getGradeList.do">
								<button class="btn btn-dark border"
										style="color: black !important; background-color: white !important; 
										border: 3px solid rgb(238, 109, 109) !important; 
										border-radius: 10px !important;">??????????????????
								</button>
								</a>
								<a href="/ping/member/profile.do">
								<button class="btn btn-dark border"
										style="color: black !important; background-color: white !important; 
										border: 3px solid black !important; 
										border-radius: 10px !important;">????????? ??????
										</button></a>
							</div>
						</div>
						<span>?????? ?????? : ${rateName}</span>
					</div>
				</div>
				<div class="mypage-top-vertical"></div>
				<div class="mypage-coupon-count">
					<span>??????</span>
					<h4><a href="/ping/myPage/coupon.do?num=${myPageVO.memberId}"
onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">${couponCnt}???</a></h4>
				</div>
				<div class="mypage-top-vertical"></div>
				<div class="mypage-point-count">
					<span>?????????</span>
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

							<th scope="col">??????</th>
							<th scope="col">??????</th>
							<th scope="col">??????</th>
							<th scope="col">??????</th>
							<th scope="col">?????????</th>
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
				<input type="button" value="????????????" onclick="deleteValue();" class="btn btn-dark border"
				style="color: black !important; background-color: white !important; 
										border: 3px solid rgb(238, 109, 109) !important; 
										border-radius: 10px !important;" >
			</div>
		</div>


		<!-- ????????? ?????? -->

		<div class="pt-3">
			<ul class="pagination justify-content-center mb-0">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">??????</a></li>
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
						onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">??????</a></li>
				</c:if>
			</ul>
		</div>
		
		
		
		<div class="mypage-recent-div">
			<h4>?????? ????????????</h4>
			<div class="table-responsive project-list">
				<table class="table project-table table-centered table-nowrap">
					<thead>
						<tr>
							<th scope="col">?????????</th>
							<th scope="col">????????????</th>
							<th scope="col">????????????</th>
							<th scope="col">??????</th>
							<th scope="col">????????????</th>
							<th scope="col">????????????</th>
							<th scope="col">??????/??????</th>
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
									<td class="mypage-order-product-td">${vo.payCost}???</td>
									<td>?????????</td>
									<td><c:choose>
											<c:when test="${vo.reviewId eq 0 }">
												<c:choose>
													<c:when test="${vo.refundId eq 0 }">
														<div class="mypage-recent-btns"  id="payrrbtn">
															<a href="/ping/myPage/writeReview.do">
																<button
																style="color: black !important; background-color: white !important; 
																border: 3px solid rgb(238, 109, 109) !important; 
																border-radius: 10px !important;  margin-left: 5px; height: 43px;"> ??????????????????</button>
															</a> 
															<a href="/ping/myPage/refund.do?paynum=${vo.payId }">
															<button type="button" style="height: 43px; color: black !important; background-color: white !important; border: 3px solid black !important; border-radius: 10px !important; " >
																<div class="mypage-refund-btn" style="color: black; width: 54px;">????????????</div>
															</button>
															</a>
														</div>
													</c:when>
													<c:otherwise>
														????????? ???????????????.
													</c:otherwise>
												</c:choose>

											</c:when>
											<c:otherwise>
												?????? ????????? ????????? ???????????????.
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
		
		
		<!-- ????????? ??????  -->
		<div class="comments">
			
		</div>
		
		
	</div>

	<Script>
		//?????? ??????
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

		//????????? ?????? ??????

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
		//?????? ?????? ?????????
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
					  title: "?????? ??????!",
					  text: "????????? ?????? ????????????",
					  icon: "error",
					})
			} else {
				
				Swal.fire({
				      title: "?????? ?????????????????????????",
				      html: "????????? ??????????????? ????????? ??? ????????????",
				      icon: 'warning',
				      showCancelButton: true,
				      confirmButtonColor: '#3085d6',
				      cancelButtonColor: '#d33',
				      confirmButtonText: '??????',
				      cancelButtonText: '??????',
				      reverseButtons: true, // ?????? ?????? ?????????
				      
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
										          '?????? ??????',
										          '???????????? ????????? ?????????????????????',
										          'success'
										        )
										        
										location.replace("myPage.do");
									} else {
										alert("?????? ??????");
									}
								}
							});
				      }else{// if???
				    	  
				      }
				    })// ?????? result
				
				
				
// 				var chk = confirm("?????? ?????????????????????????");
// 				$.ajax({
// 					url : url,
// 					type : 'post',
// 					traditional : true,
// 					data : {
// 						valueArr : valueArr
// 					},
// 					success : function(jdata) {
// 						if (jdata = 1) {
// 							alert("?????? ??????");
// 							location.replace("myPage.do");
// 						} else {
// 							alert("?????? ??????");
// 						}
// 					}
// 				});
			}

		}
	</Script>

</body>
<%@include file="../main/footer.jsp"%>
</html>