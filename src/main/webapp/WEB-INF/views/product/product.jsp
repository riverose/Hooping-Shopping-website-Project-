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

<!-- Favicon -->
<link href="/ping/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet">
<link href="/ping/resources/css/product.css" rel="stylesheet">
<link href="/ping/resources/css/review.css" rel="stylesheet">

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="/ping/resources/mail/jqBootstrapValidation.min.js"></script>
<script src="/ping/resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="/ping/resources/js/main.js"></script>
<script src="../resources/js/option_detail.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../resources/js/product_check.js"></script>

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	
	function getParam(sname) {

    var params = location.search.substr(location.search.indexOf("?") + 1);

    var sval = "";

    params = params.split("&");

    for (var i = 0; i < params.length; i++) {

        temp = params[i].split("=");

        if ([temp[0]] == sname) { sval = temp[1]; }

    }

    return sval;

}
	
	$(document).ready(function(){
		
		if(getParam("range") == 1){
			
			$("#tab-pane-1-a").removeClass('active');
			$("#tab-pane-1").removeClass('active show');
			$("#tab-pane-2-a").addClass('active');
			$("#tab-pane-2").addClass('active show');
			
			var offset = $("#tab-pane-2-a").offset();
	        $('html, body').animate({scrollTop : offset.top}, 1);
	        
	        if(getParam("currPageNo") != 1){
				
	        	$(".bestbox").remove();

			}
		}
		
	});
	
</script>

</head>

<body>
	<div style="display: none;" id="getproductid">${product.productId }</div>
	<%-- 	<h1>${options }</h1> --%>
	<div id="header"></div>
	<input type="hidden" id="scroll" value="scrollValue"/>
	
	<div class="container-fluid py-5">
		<div class="imageselect">
			<select name="image" class="imageselectbox"
				onChange="selectForm(this.options[this.selectedIndex].value)">
				<option value="1">?????? ?????????</option>
				<option value="2">?????? ?????????</option>
			</select>
		</div>
	</div>
		<div class="row px-xl-5 contaner">
			<div class="col-lg-5 pb-5">
				<div id="product-detail-img">
					<div id="allForms" class="carousel-inner border">
						<div class="carousel-item active" style="text-align: center;">
                     		<c:choose>
		                        <c:when test="${best.reviewImg != null}">
		                           <img style="width: 100%" class="w-100 h-100" src="/ping/resources/img/reviewImg/${best.reviewImg}" alt="Image">
		                        </c:when>
		                        <c:otherwise>
		                                 <img id="sampleImg"src="/ping/resources/img/reviewEx.jpg" alt="" style="height: 315px;">
		                        </c:otherwise>
		                     </c:choose>
                  		</div>
						<div class="carousel-item active" style="display: none;">
							<img style="width: 100%" src="${product.pimageAddr1}">
							<input type="hidden" value="${product.pimageAddr1}" id="cartpimage"/>
						</div>
					</div>
				</div>
			</div>
		

			<div class="col-lg-7 pb-5">
				<form action="/ping/order/orderProduct.do" method='post'>
					<input type="hidden" value="${product.productId }" name="productid" /> <input type="hidden" value="${product.productName }" name='productName' /> <input type="hidden" value="${product.productPrice }" name='productPrice' />

					<h5 class="font-weight-semi-bold" style="text-decoration: underline; text-underline-position: under;">${product.productCo }</h5>
					<h5 class="font-weight-semi-bold">${product.productName }</h5>
					<div class="d-flex mb-3">
						<select name="color" id="colorselectbox" class="btn btn-dark">
							<option class="color_choice" value="??????">??????</option>
							<c:forEach items="${options }" var="color">
								<option class="color_choice" value="${color.optionsColor }">${color.optionsColor }</option>
							</c:forEach>
						</select>
					</div>
					<div class="d-flex mb-4">
						<select name="size" id="sizeselectbox" class="btn select-size" onchange="changeSize()">
							<option value="?????????">?????????</option>
						</select>
					</div>
					<div class="d-flex mb-4">
						<select name="cartCount" id="countselectbox" class="stockselectbox select-size" disabled>
						  <option>??????</option>
             	 		</select>&nbsp;
          			</div>
					<div class="d-flex align-items-center mb-4 pt-2" style="
						    display: flex !important;
						    justify-content: space-between;
						    width: 200px;">
						<button id="btn_buy" type="button" class="btn btn-dark" style="border-radius: 5px; width: 111px;">
								<div class="buytext" style="margin-left: 14px;">????????????</div>
						</button>
						<button type="button" id="cartBtn" class="btn btn-dark" style="wdit">
							<div class="buytext">????????????</div>
							
						</button>
					</div>
						<div class="d-flex align-items-center mb-4 pt-2">
					</div>
					<div class="lobimg">
						<a class="likeimg" href=""><img src="/ping/resources/img/like.png" alt=""></a> <a class="buyimg" href=""><img src="/ping/resources/img/buy.png" alt=""></a>
					</div>
				</form>
			</div>
		</div>
		<div class="row px-xl-5">
			<div class="col">
				<div class="nav nav-tabs justify-content-center border-secondary mb-4">
					<a class="nav-item-1 nav-link active" data-toggle="tab" href="#tab-pane-1" id="tab-pane-1-a" >????????????</a> 
					<a class="nav-item-1 nav-link" data-toggle="tab" href="#tab-pane-2" id="tab-pane-2-a">??????</a> 
<!-- 					<a class="nav-item-1 nav-link" data-toggle="tab" href="#tab-pane-3" id="tab-pane-3-a">????????????</a> -->
				</div>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="tab-pane-1">
						<c:forEach items="${details }" var="item" varStatus="i">
							<img style="width: 70%; display: block; margin: auto;" src="${item }">

						</c:forEach>
					</div>
						<!-- ================== ?????? ??? ================ -->
						<div class="tab-pane fade" id="tab-pane-2">
							<c:choose>
								<c:when test="${!empty reviewList || !empty best}">
									<div class="review">
										<c:if test="${best != null }">
											<div class="bestbox">
												<div class="oneReviewProduct">
													<input type="hidden" value="${best.reviewId}" class="reviewId" id="bestReviewId" />
													<div class="review-info">
														<span>[ ????????? ?????? ]</span>
														<p>${best.memberName}???</p> 
														<div class="imgMix" style="position: relative">
															 <c:choose>
										                        <c:when test="${best.reviewImg != null}">
										                           <img src="/ping/resources/img/reviewImg/${best.reviewImg}" alt="">
										                        </c:when>
										                        <c:otherwise>
										                                 <img src="/ping/resources/img/reviewEx.jpg" alt="??????">
										                        </c:otherwise>
                  											</c:choose> <img src="/ping/resources/img/1???.png" alt="" style="position: absolute; width: 20%; right: 20%; top: -7%;">
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<div class="product-reviewList">
											<div class="sbox">
												<c:forEach items="${reviewList}" var="review">
													<div class="oneReviewProduct product-reviewListdiv">
														<input type="hidden" value="${review.reviewId}" class="reviewId" />
														<div class="review-info">
															<p>***???</p>
															<c:choose>
										                        <c:when test="${review.reviewImg != null}">
										                           <img class="product-reviewimg" src="/ping/resources/img/reviewImg/${review.reviewImg}" alt="">
										                        </c:when>
										                        <c:otherwise>
										                                 <img class="product-reviewimg" src="/ping/resources/img/reviewEx.jpg" alt="??????">
										                        </c:otherwise>
                  											</c:choose> 
														</div>
													</div>
												</c:forEach>
											</div>
										</div><!-- div sbox ??? -->
									</div><!-- div review ??? -->
								</c:when>
								<c:otherwise>
									<div id="productNoReview" style="text-align: center;"><h1>????????? ????????? ?????????</h1></div>
								</c:otherwise>
							</c:choose>
							<!-- div review ??? -->
							<!-- ======================== ????????? ?????? ?????? ========================-->
							<div class="pt-3">
								<ul class="pagination justify-content-center mb-0">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">??????</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
										<li class="page-item <c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/> "><a class="page-link" href="javascript:;" onClick="fn_pagination('${idx}', '${pagination.range}')"> ${idx} </a></li>
									</c:forEach>
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">??????</a></li>
									</c:if>
								</ul>
							</div>
							<!-- ======================== ????????? ?????? ??? ========================-->
							<!-- ======================== ?????? ??????????????? ?????? ======================== -->
							<div class="fullScreen dontshow">
								<div class="reviewDetail area">
									<input type="hidden" id="reviewDetail-reviewId" />
									<input type="hidden" id="reviewDetail-memberId" />
									<div class="reviewDetailImg">
										<img src="" alt="" id="reviewDetail-reviewImg">
										<div class="reviewDetailInfo">
											<div>?????????: <span id="reviewDetail-productName"></span></div> 
											<div>?????? ??????: <span id="reviewDetail-payColor"></span></div>  
											<div>?????? ?????????: <span id="reviewDetail-paySize"></span></div>  
											<div>?????? ?????? :  <span id="reviewDetail-reviewColor"></span></div>  
											<div>?????? ????????? :  <span id="reviewDetail-reviewSize"></span></div>  
											<div>?????????: <span id="reviewDetail-reviewQuality"></span></div> 
											<div id="reviewDetail-reviewHeightDiv">???: <span id="reviewDetail-reviewHeight" ></span></div> 
											<div id="reviewDetail-reviewWeightDiv">????????? : <span id="reviewDetail-reviewWeight"></span></div> 
										</div>
									</div>
									<div class="rightReviewDetailBox">
						
										<div class="reviewUserInfo">
											<span id="reviewDetail-memberName">***</span>???
											(<span id="reviewDetail-memberRating">??????</span>)<br>
											<div id="reviewDetail-memberInstagramId" style="display : none"></div> 
											<span id="reviewDetail-reviewStar" style="color : rgb(238,109,109);">???????????????</span>
										</div>
										<div class="ReviewDetailText" style="overflow-y: scroll">
											<div class="reviewFormPrint">
												
												<div id="reviewDetail-reviewText"></div>
											</div>
											<div class="readReviewComment">
												<span>??????</span><br />
												<div id="rCommentTitle"></div>
											</div>
						
										</div>
										<div class="ReviewDetailThumbs">
											<hr>
											<span>???</span> <span id="reviewDetail-reviewThumbs">0</span>?????? ???????????????.
											<div hidden="true" id="reviewThumbs-loginCheck"></div>
										</div>
										<div class="writeReviewComment">
											<form action="/ping/review/saveRComment.do" method="get">
												<input hidden="hidden" />
												<input type="text" name="rcommentContents" id="rCommentContents" placeholder="?????? ?????????..">
												<button type="button" id="rCommentBtn">??????</button>
												<div id="rCommentCheck" style="display: none">?????? ????????? ??????????????????</div>
											</form>
										</div>
									</div>
									<!-- rightReviewDetailBox ??? -->
								</div>
								<!-- reviewDetail area -->
							</div>
							<!-- fullScreen -->
						</div>
						<!-- tab-pane-2 ??? -->
				</div>
			</div>
		</div>
	<!-- Products End -->
</body>
<script>    

	$("#btn_buy").click(function(){
		var sessionId = '<%=session.getAttribute("memberId")%>';
		
		if (sessionId == '' || sessionId == 'null') {
			
			swal.fire({
				  title: "?????? ??????!",
				  text: "????????? ?????? ????????? ???????????? ??? ????????????",
				  icon: "error",
				})
			return false;
		}
		
		if($("#colorselectbox").val()=="??????"){
			swal.fire({
				  title: "?????? ??????!",
				  text: "????????? ??????????????????",
				  icon: "error",
				})
			return false;
		}
		
		if($("#sizeselectbox").val()=="?????????"){
			swal.fire({
				  title: "?????? ??????!",
				  text: "???????????? ??????????????????",
				  icon: "error",
				})
			return false;
		
		}
		
		$("#btn_buy").prop("type","submit");
	})
	</script>
		<script type="text/javascript">
	
			//????????? ?????? ????????????
	
			function selectForm(frm) {
	
				var hiddenForms = document.getElementById("allForms");
	
				theForm = hiddenForms.getElementsByTagName("div");
	
				for (x = 0; x < theForm.length; x++) {
	
					theForm[x].style.display = "none";
	
				}
	
				if (theForm[frm - 1]) {
	
					theForm[frm - 1].style.display = "block";
	
				}
	
			}
		</script>
<script>
	
	// ?????? ?????? ?????? ??????
	$('#rCommentBtn').click(function() {
				
				var sessionId = '<%=session.getAttribute("memberId")%>';
				if (sessionId == '' || sessionId == 'null') {

					swal.fire({
						  title: "?????? ??????!",
						  text: "??????????????? ????????? ????????? ?????? ??? ????????????",
						  icon: "error",
						})
					$("#rCommentContents").val("");
					return;
				}
				
				var reviewWriterId = $("#reviewDetail-memberId").val();
				if(sessionId == reviewWriterId){
					
					swal.fire({
						  title: "?????? ??????!",
						  text: "????????? ????????? ????????? ????????? ?????? ??? ????????????",
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
										
									$("#rCommentTitle").append("<div class='oneComment'><div class='commentUserInfo' style= 'display: flex; justify-content: space-between;' ><span>"+value.memberName+ "</span><button id='deleteRComment"+index+"' style='display: none'><input type='hidden' value='"+value.rcommentId+"'/>??????</button></div><div class='commentText'>"+ value.rcommentContents+ "</div></div>")
									
									if(sessionId == value.memberId){
										$("#deleteRComment"+index+"").show();
									}
								});
							}
				})
			})

	// ?????? ???????????? ??????
	$('.fullScreen').click(function(e) {

		if ($(e.target).is('.fullScreen')) {

			$('.fullScreen').addClass('dontshow');
		}
	});
	
	// ?????? ???????????? ?????????
	$('.oneReviewProduct').click(function() {
		
		var reviewId = $(this).find("input").val();
		$.ajax({
			url : "/ping/review/selectedReview.do",
			data : {"reviewId" : reviewId},
			dataType : "json",
			type : "POST",
			success : function(data) {

				if(data.review.reviewImg == null){
					$("#reviewDetail-reviewImg").attr("src","/ping/resources/img/reviewEx.jpg");
				}else{
					$("#reviewDetail-reviewImg").attr("src","/ping/resources/img/reviewImg/"+ data.review.reviewImg);
				};
				
				$('#reviewDetail-reviewId').val(
						data.review.reviewId);
				$("#reviewDetail-memberId").val(
						data.review.memberId);
				
				if( $("#bestReviewId").val() == data.review.reviewId ){
					
					$("#reviewDetail-memberName").text(
							data.review.memberName);
				}else{
					$("#reviewDetail-memberName").text(
							"***");
				}
				
				
				if( data.review.reviewStar == 1 ){
					$("#reviewDetail-reviewStar").text("???????????????");
				}else if( data.review.reviewStar == 2 ){
					$("#reviewDetail-reviewStar").text("???????????????");
				}else if( data.review.reviewStar == 3 ){
					$("#reviewDetail-reviewStar").text("???????????????");
				}else if( data.review.reviewStar == 4 ){
					$("#reviewDetail-reviewStar").text("???????????????");
				}else{
					$("#reviewDetail-reviewStar").text("???????????????");
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
					
					$("#reviewDetail-memberRating").text("??????");
					$("#reviewDetail-memberInstagramId").hide();
					
				}else if(rate >= 10 ){
					
					if( data.bestCnt > 0 ){
						
						$("#reviewDetail-memberRating").text("???????????????");
						
						$("#reviewDetail-memberInstagramId").text(data.mvo.memberInstagramId);
						$("#reviewDetail-memberInstagramId").show();
						
					}else{
						
						$("#reviewDetail-memberRating").text("VIP");
						$("#reviewDetail-memberInstagramId").hide();

					}
					
				}else{
					
					$("#reviewDetail-memberRating").text("??????");
					$("#reviewDetail-memberInstagramId").hide();

				}

				$("#rCommentTitle").empty();
				
				var sessionId = '<%=session.getAttribute("memberId")%>';
				
				$.each( data.rCList, function(index, value) {
					
					$("#rCommentTitle").append("<div class='oneComment'><div class='commentUserInfo' style= 'display: flex; justify-content: space-between;' ><span>"+value.memberName+ "</span><button id='deleteRComment"+index+"' style='display: none'><input type='hidden' value='"+value.rcommentId+"'/>??????</button></div><div class='commentText'>"+ value.rcommentContents+ "</div></div>")					
					
					if(sessionId == value.memberId){
						$("#deleteRComment"+index+"").show();
					}
					
				});

					if(data.likeCheck == 0){
						$('.ReviewDetailThumbs').children()[1].innerText = '???'
						$('.ReviewDetailThumbs>span:nth-child(2)').attr('style', 'color:black;');
						$('.ReviewDetailThumbs').children()[2].innerText = data.review.reviewThumbs;
				 	
					}else if(data.likeCheck == 1){
						$('.ReviewDetailThumbs').children()[1].innerText = '???'
						$('.ReviewDetailThumbs>span:nth-child(2)').attr('style', 'color:red;');
						$('.ReviewDetailThumbs').children()[2].innerText = data.review.reviewThumbs;
					
					}else if(data.likeCheck == 99){
						$('.ReviewDetailThumbs').children()[1].innerText = '???'
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
	
	// ?????? ?????? ????????????
	$(document).on("click",".commentUserInfo > button",function(){ 
		
		var rcommentId = $(this).find("input").val();
		var reviewId = $("#reviewDetail-reviewId").val();
		
		Swal.fire({
		      title: "?????? ??????",
		      html: "????????? ?????????????????????????",
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
					
	 				url : "/ping/review/deleteRComment.do",
	 				data : {"rcommentId" : rcommentId,
	 						"reviewId" : reviewId},
	 				dataType : "json",
	 				type : "POST",
	 				success : function(data){
						
	 					$("#rCommentTitle").empty();
						
						var sessionId = '<%=session.getAttribute("memberId")%>';
						
	 					$.each( data.rCList, function(index, value) {
	 						$("#rCommentTitle").append("<div class='oneComment'><hr><div class='commentUserInfo'><span>"+ value.memberName+ "</span><button id='deleteRComment"+index+"' style='display: none'><input type='hidden' value='"+value.rcommentId+"'/>??????</button></div><div class='commentText'>"+ value.rcommentContents+ "</div></div>")
							
	 						if(sessionId == value.memberId){
	 							$("#deleteRComment"+index+"").show();
	 						}
							
	 					});
	 				}
	 			})
		      }else{// if???
		    	  
		      }
		    })// ?????? result
		
	});// ?????? ?????? ?????? ???
	
	// ?????? ????????? 
	$('.ReviewDetailThumbs').click(function() {
		
		if( $('#reviewThumbs-loginCheck').val() == "X"){
			swal.fire({
				  title: "????????? ??????!",
				  text: "??????????????? ????????? ???????????? ????????? ??? ????????????",
				  icon: "error",
				});
			return;
		}	
		
		var sessionId = '<%=session.getAttribute("memberId")%>';
		var reviewWriterId = $("#reviewDetail-memberId").val();
		if(sessionId == reviewWriterId){
			swal.fire({
				  title: "????????? ??????!",
				  text: "????????? ????????? ????????? ???????????? ????????? ??? ????????????",
				  icon: "error",
				});
			return;
		}
		
		var reviewId = $('#reviewDetail-reviewId').val();
		
		// ????????? ??????
		if ($('.ReviewDetailThumbs>span:nth-child(2)').text() == '???') {
			
			$.ajax({
				url : "/ping/review/insertThumbsYN.do",
				data : {"reviewId" : reviewId},
				dataType : "json",
				type : "POST",
				success : function(data) {
					
					$('.ReviewDetailThumbs').children()[1].innerText = '???'
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

		// ????????? ????????????
		}else {
			
			$.ajax({
				url : "/ping/review/deleteThumbsYN.do",
				data : {"reviewId" : reviewId},
				dataType : "json",
				type : "POST",
				success : function(data) {
					
					$('.ReviewDetailThumbs').children()[1].innerText = '???'
					$('.ReviewDetailThumbs>span:nth-child(2)').attr('style', 'color:black;');
						
					$('.ReviewDetailThumbs').children()[2].innerText = data.review.reviewThumbs;
					
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n"
							+ "message:"
							+ request.responseText + "\n"
							+ "error:" + error);
				}
			})
			
		}
	})
	
	// ?????? ????????? ??????
	function fn_prev(currPageNo, range, pageSize) {

	var currPageNo = (range - 1) * pageSize;
	var range = range - 1;

	var url = "/ping/product/getProduct.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&productid=" + $("input[name=productid]").val();
	location.href = url;

	}

	//????????? ?????? ??????
	
	function fn_pagination(currPageNo, range) {
		var checkstr = 1;
		var url = "/ping/product/getProduct.do";
		url = url + "?currPageNo=" + currPageNo;
		url = url + "&range=" + range;
		url = url + "&productid=" + $("input[name=productid]").val();
		url = url + "&checkstr=" + checkstr;
		location.href = url;	
		
		
	}
	//?????? ?????? ?????????
	function fn_next(currPageNo, range, pageSize) {
		
		
		var currPageNo = (range * pageSize) + 1;
		var range = parseInt(range) + 1;	
	
		var url = "/ping/product/getProduct.do";
		url = url + "?currPageNo=" + currPageNo;
		url = url + "&range=" + range;
		url = url + "&productid" + $("input[name=productid]").val();
		location.href = url;
		
	}
	
	// ????????? ?????? ??????
	$("#sizeselectbox").change(function(){
		
		if( $("#sizeselectbox").val() != "?????????" ){
			
			var productId = $("input[name=productid]").val();
			var color = $("select[name=color]").val();
			var size = $("select[name=size]").val();
			
			$.ajax({
				url : "/ping/product/getOptionsStock.do",
				data : {
					"productId" : productId,
					"color" : color,
					"size" : size,
				},
				dataType : "json",
				type : "POST",
				success : function(data) {
					var stock = Number(data);
					$("#countselectbox").empty();
					
					for(let i = 1; i <= data; i++ ){
						$("#countselectbox").append("<option value='"+i+"'>"+i+"</option>")
					}
					$("#countselectbox").attr("disabled", false);
					
				}
			})
		}
	});
	
	// ???????????? ??????
	$("#cartBtn").click(function(){
		
		var sessionId = '<%=session.getAttribute("memberId")%>';
		
		if (sessionId == '' || sessionId == 'null') {
			
			swal.fire({
				  title: "???????????? ??????!",
				  text: "????????? ?????? ????????? ??????????????? ????????? ??? ????????????",
				  icon: "error",
				})
			return false;
		}
		
		if($("#colorselectbox").val()=="??????"){
			swal.fire({
				  title: "???????????? ??????!",
				  text: "????????? ??????????????????",
				  icon: "error",
				})
			return false;
		}
		
		if($("#sizeselectbox").val()=="?????????"){
			swal.fire({
				  title: "???????????? ??????!",
				  text: "???????????? ??????????????????",
				  icon: "error",
				})
			return false;
		
		}
		
		var productId = $("input[name=productid]").val();
		var productName = $("input[name=productName]").val();
		var productPrice = $("input[name=productPrice]").val();
		var color = $("select[name=color]").val();
		var size = $("select[name=size]").val();
		var cartCount = $("select[name=cartCount]").val();
		var pimageAddr1 = $("#cartpimage").val();
		
		Swal.fire({
		      title: "??????????????? ??????????????????????",
		      html: "?????? ?????? : " + productName + "<br>?????? : " + color + "<br>????????? : " + size + "<br>?????? : " + cartCount,
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
						url : "/ping/cart/setCart.do",
						data : {
							"productId" : productId,
							"productName" : productName,
							"productPrice" : productPrice,
							"color" : color,
							"size" : size,
							"cartCount" : cartCount,
							"pimageAddr1" : pimageAddr1
						},
						dataType : "json",
						type : "POST",
						success : function(data) {
							Swal.fire(
							          '???????????? ??????!',
							          '??????????????? ????????? ???????????????',
							          'success'
							        )
						}
					})
		      }else{// if???
		    	  
		    	  Swal.fire(
				          '???????????? ??????',
				          '?????????????????????',
				          'success'
				        )
		    	  
		      }
		    })// ?????? result
		
		
		}); // ???????????? ???


</script>
<%@include file="../main/footer.jsp"%>
</html>