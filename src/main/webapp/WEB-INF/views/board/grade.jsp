<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="/ping/resources/css/serviceGrade.css" rel="stylesheet">
<link href="/ping/resources/css/serviceTap.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="/ping/resources/mail/jqBootstrapValidation.min.js"></script>
<script src="/ping/resources/mail/contact.js"></script>


<!-- Template Javascript -->
<script src="resources/js/main.js"></script>

<title>회원 혜택 안내</title>

</head>
<body>
	<section>

		<div class="container">


			<%@include file="../board/serviceTap.jsp"%>
			<!-- tap-->
			<div class="row px-xl-5">
				<div class="col">
					<div class="nav nav-tabs justify-content-center border-secondary my-4 mb-4">
						<a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">회원등급/쿠폰</a> <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">POINT</a>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab-pane-1">
							<h4 class="mb-3">회원등급 기준 안내</h4>
							<div class="grade-standard-div">
								<div class="newbie-div">
									<span class="newbie-title" style="font-size: 20px">뉴비</span> 
									<span style="font-size: 25px">조건</span> 
									<span>기본 등급</span> 
									<span style="margin-top: 44px;font-size: 25px;">혜택</span> 
									<span>1000원 할인 쿠폰</span>
								</div>
								<div class="member-div">
									<span class="member-title" style="font-size: 20px">멤버</span> 
									<span style="font-size: 25px">조건</span> 
									<span>리뷰 1개 이상 작성</span> 
									<span style="margin-top: 44px;font-size: 25px;">혜택</span> 
									<span>15% 할인 쿠폰</span>
								</div>
								<div class="vip-div">
									<span class="vip-title" style="font-size: 20px">VIP</span>
									<span style="font-size: 25px">조건</span> 
									<span>회원 점수 100점 이상</span> 
									<span style="margin-top: 44px;font-size: 25px;">혜택</span> 
									<span>25% 할인 쿠폰</span>
								</div>
								<div class="influencer-div">
									<span class="influencer-title" style="font-size: 20px">인플루언서</span> 
									<span style="font-size: 25px">조건</span> 
									<span>회원 점수 100점 이상 <br> 베스트 리뷰 10개 이상</span> 
									<span style="margin-top: 20px;font-size: 25px;">혜택</span> 
									<span>30% 할인 쿠폰</span>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab-pane-2" >
							<h4 class="mb-3 point-title my-5">포인트 안내</h4>
							<div class="point-info">
								<div>
									<div class="row gy-4">

										<div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out">
											<div class="service-item position-relative">
												<div class="icon">
													<i class="bi bi-activity icon"></i>
												</div>
												<h4>구매 시</h4>
												<p>상품 비용이 1%가 적립됩니다</p>
											</div>
										</div>
										<!-- End Service Item -->

										<div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out">
											<div class="service-item position-relative">
												<div class="icon">
													<i class="bi bi-activity icon"></i>
												</div>
												<h4>이벤트 참여시</h4>
												<p>2%가 적립됩니다</p>
											</div>
										</div>
										<!-- End Service Item -->

										<div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out">
											<div class="service-item position-relative">
												<div class="icon">
													<i class="bi bi-activity icon"></i>
												</div>
												<h4>상품 구매시</h4>
												<p>포인트를 자유롭게 사용할 수 있습니다</p>
											</div>
										</div>
										<!-- End Service Item -->

										<div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out">
											<div class="service-item position-relative">
												<div class="icon">
													<i class="bi bi-activity icon"></i>
												</div>
												<h4>기타</h4>
												<p>등등</p>
											</div>
										</div>
										<!-- End Service Item -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<%@include file="../main/footer.jsp"%>
</body>
</html>