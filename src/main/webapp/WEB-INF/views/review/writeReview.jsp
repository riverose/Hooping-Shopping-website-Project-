<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap')
	;
</style>
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="/ping/resources/mail/jqBootstrapValidation.min.js"></script>
<script src="/ping/resources/mail/contact.js"></script>
<script src="/ping/resources/js/main.js"></script>

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
<link href="/ping/resources/css/writeReview.css" rel="stylesheet">
</head>

<body>

	<!-- writeReview Body -->
	<div class="reviewForm px-xl-5 my-5">
		<div class="uploadReviewImg">
			<img id="sampleImg"src="/ping/resources/img/reviewEx.jpg" alt="">
			<img id="preview" />
		</div>
		<div class="rightReviewInputBox">

			<form action="/ping/review/saveReview.do" method="post"
				enctype="multipart/form-data" id="reviewForm">
				<input type="file" maxlength="60" size="40" name='file' onchange="readURL(this);">
			
				<div class="reviewFormWrite">
					<div class="buyInfo">
						<div>구매한 상품 정보</div>
							<input name="payIdStr" type="hidden" value="${myPage.payId}" />
							<input name="productIdStr" type="hidden" value="${myPage.productId }" />
						
							
						<div>
							<input name="productName" type="text" value="상품 이름  : ${myPage.productName} " disabled />
						</div>
						<div>
							<input name="paySize" type="text" value="상품 사이즈  : ${myPage.paySize}" disabled/>
						</div>
						<div>
							<input name="payColor" type="text" value="상품 컬러  : ${myPage.payColor}" disabled />
						</div>
						<div></div>
						<hr>
					</div>
					<input type="text" name="reviewTitle" id="" placeholder="제목입니다.">
					<div class="InputReview Color">
						<div>색상</div>
						<div>
							<input type="radio" name="reviewColor" id="darker" value="생각보다 어두워요"><label
								for="darker" class="btn-secondary">생각보다 어두워요</label> <input
								type="radio" name="reviewColor" id="normal"  value="생각대로에요"><label
								for="normal" class="btn-secondary">생각대로에요</label> <input
								type="radio" name="reviewColor" id="brighter" value="생각보다 밝아요"><label
								for="brighter" class="btn-secondary">생각보다 밝아요</label>
						</div>
					</div>
					<div class="InputReview Size">
						<div>사이즈</div>
						<div>
							<input type="radio" name="reviewSize" id="smaller" value="생각보다 작아요"><label
								for="smaller" class="btn-secondary">생각보다 작아요</label> <input
								type="radio" name="reviewSize" id="normal2" value="생각대로에요"><label
								for="normal2" class="btn-secondary">생각대로에요</label> <input
								type="radio" name="reviewSize" id="bigger" value="생각보다 커요"><label for="bigger"
								class="btn-secondary">생각보다 커요</label>
						</div>
					</div>
					<div class="InputReview Quality">
					
						<div>퀄리티</div>
						<div>
							<input type="radio" name="reviewQuality" id="good" value="생각보다 작아요"><label
								for="good" class="btn-secondary">생각보다 좋아요</label> <input
								type="radio" name="reviewQuality" id="normal3" value="생각대로에요"><label
								for="normal3" class="btn-secondary">생각대로에요</label> <input
								type="radio" name="reviewQuality" id="bad" value="생각보다 커요"><label for="bad"
								class="btn-secondary">생각보다 나빠요</label>
						</div>
					</div>
					<div class="InputReview Height">
						<div>키</div>
						<input type="text" name="reviewHeightNull" placeholder="기입 선택 사항 입니다." oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
					</div>
					<div class="InputReview Weight">
						<div>몸무게</div>
						<input type="text" name="reviewWeightNull" placeholder="기입 선택 사항 입니다." oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
					</div>
					<div class="InputReview Total">
						<div>만족도</div>					
							
							 <input type="radio" name="reviewStar" value="1" id="rate1" ><label
								for="rate1" id="rateLabel1">☆</label>
							<input type="radio" name="reviewStar" value="2" id="rate2"><label
								for="rate2" id="rateLabel2">☆</label>
							<input type="radio" name="reviewStar" value="3" id="rate3"><label
								for="rate3" id="rateLabel3">☆</label>
							<input type="radio" name="reviewStar" value="4" id="rate4"><label
								for="rate4" id="rateLabel4">☆</label>
							<input type="radio" name="reviewStar" value="5" id="rate5"><label
								for="rate5" id="rateLabel5">☆</label>  	
					</div>
							
					<div class="InputReview Detail">
						<div class="textLengthWrap">
						<div><span class="textCount">0자</span><span class="textTotal">/200자</span></div>
						  </div>
						  <textarea name="reviewText" id="textBox" style="resize: none; width:100%;"  placeholder="텍스트를 입력하세요."></textarea>
						  
					</div>
					<div class="reviewSubmit">
						<input class="btn-primary" id="saveReviewBtn" type="button" value="제출하기">
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Template Javascript -->
	<script>
		$('.InputReview.Total input').click(function(){
			if ( $(this).val() == 1){
				$('#rateLabel1').text('★');
				$('#rateLabel2').text('☆');
				$('#rateLabel3').text('☆');
				$('#rateLabel4').text('☆');
				$('#rateLabel5').text('☆');
				
			}else if( $(this).val() == 2){
				$('#rateLabel1').text('★');
				$('#rateLabel2').text('★');
				$('#rateLabel3').text('☆');
				$('#rateLabel4').text('☆');
				$('#rateLabel5').text('☆');
				
			}else if( $(this).val() == 3){
				$('#rateLabel1').text('★');
				$('#rateLabel2').text('★');
				$('#rateLabel3').text('★');
				$('#rateLabel4').text('☆');
				$('#rateLabel5').text('☆');
				
			}else if( $(this).val() == 4){
				$('#rateLabel1').text('★');
				$('#rateLabel2').text('★');
				$('#rateLabel3').text('★');
				$('#rateLabel4').text('★');
				$('#rateLabel5').text('☆');
			
			}else{
				$('#rateLabel1').text('★');
				$('#rateLabel2').text('★');
				$('#rateLabel3').text('★');
				$('#rateLabel4').text('★');
				$('#rateLabel5').text('★');
			}
			
		});
		// 이미지 미리보기
		function readURL(input) {
			// const extractTextPattern = /(<([^>]+)>)/gi;
			// var deleteClass = document.getElementById('uploadReviewImg');
			// var oriText = deleteClass.innerHTML;
			 
			  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('preview').src = e.target.result;
			      
			    };
			    document.getElementById("sampleImg").style.display ='none';
			    reader.readAsDataURL(input.files[0]);
			  } else {
			    document.getElementById('preview').src = "";
			  }
			};
			
	$('#textBox').keyup(function (e) {
		let content = $(this).val();
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 200) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 200));
	        // 200자 넘으면 알림창 뜨도록
	        swal.fire({
									  title: "리뷰 오류!",
									  text: "글자수는 200자까지만 가능합니다",
									  icon: "error",
									})
	    };
	});
			
	$("#saveReviewBtn").click(function(){
		
		if( $("input[name=reviewTitle]").val() == "" ){
			
			swal.fire({
				  title: "리뷰 오류!",
				  text: "제목을 입력해주세요",
				  icon: "error",
				})
			return;
		}
		
		if( $("input[name=reviewColor]:radio:checked").length < 1 ){
			
			swal.fire({
				  title: "리뷰 오류!",
				  text: "색상 퀄리티를 선택해주세요",
				  icon: "error",
				})
			return;
		}
		
		if( $("input[name=reviewSize]:radio:checked").length < 1 ){
			
			swal.fire({
				  title: "리뷰 오류!",
				  text: "사이즈 퀄리티를 선택해주세요",
				  icon: "error",
				})
			return;
		}
		
		if( $("input[name=reviewQuality]:radio:checked").length < 1 ){
			
			swal.fire({
				  title: "리뷰 오류!",
				  text: "전체적인 상품의 퀄리티를 선택해주세요",
				  icon: "error",
				})
			return;
		}
		
		if( $("input[name=reviewStar]:radio:checked").length < 1 ){
			
			swal.fire({
				  title: "리뷰 오류!",
				  text: "별점을 선택해주세요",
				  icon: "error",
				})
			return;
		}
		
		if( $("input[name=reviewText]").val() == "" ){
			
			swal.fire({
				  title: "리뷰 오류!",
				  text: "리뷰 내용을 적어주세요",
				  icon: "error",
				})
			return;
		}
		
		if( $('#textBox').val().length < 5 ){
			
			swal.fire({
				  title: "리뷰 오류!",
				  text: "50자 이상 입력해주세요",
				  icon: "error",
				})
			return;
		}
		
		$("#saveReviewBtn").prop("type", "submit");
	});
	
		
	</script>
</body>
<%@include file="../main/footer.jsp"%>
</html>