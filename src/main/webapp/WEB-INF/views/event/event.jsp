<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="/ping//resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet">
<link href="/ping/resources/css/event.css" rel="stylesheet">
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


</head>


<body>
	<!-- 이벤트 페이지 시작 -->
			<div class="container-fluid pt-5">
		<div id="eventPage">
			<h2 class="section-title px-5">
				<span class="px-2">EVENT</span>
			</h2>
		</div>
	</div>
		<div id="header-carousel" class="carousel slide" data-ride="carousel" style="height: 70%;">
			<div class="carousel-inner" style="height: 134%;">
				<div class="carousel-item active">
					<img id="si" class="img-fluid" src="/ping/resources/img/배너1.png"
						alt="Image">
				</div>
				<div class="carousel-item">
					<img id="si" class="img-fluid" src="/ping/resources/img/배너2.png"
						alt="Image">
				</div>
				<div class="carousel-item">
					<img id="si" class="img-fluid" src="/ping/resources/img/배너3.png"
						alt="Image">
				</div>
				<div class="carousel-item">
					<img id="si" class="img-fluid" src="/ping/resources/img/배너4.png"
						alt="Image">
				</div>
			</div>
			<a class="carousel-control-prev" href="#header-carousel"
				data-slide="prev">
				<div class="btn btn-dark" id="ss" >
					<span class="carousel-control-prev-icon mb-n2"></span>
				</div>
			</a> <a class="carousel-control-next" href="#header-carousel"
				data-slide="next">
				<div class="btn btn-dark" id="ss">
					<span class="carousel-control-next-icon mb-n2"></span>
				</div>
			</a>
		</div>



		<!-- 베너시작  -->
	<div class="eventBanner" style="text-align: center;">
	<h1 class="section-title px-5">
			<span class="px-2">BENEFIT</span>
		</h1>
		<ul>
			<li>
				<a href="/ping/review/getreviewPage.do" target="_blank">
					<img src="/ping/resources/img/배너1.png">
				</a> 
				<a href="/ping/review/getreviewPage.do" target="_blank">
					<img src="/ping/resources/img/배너2.png">
				</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="/ping/review/getreviewPage.do" target="_blank">
					<img src="/ping/resources/img/배너3.png">
				</a> 
				<a href="/ping/review/getreviewPage.do" target="_blank">
					<img src="/ping/resources/img/배너4.png">
				</a>
			</li>
		</ul>
	</div>

</body>
<%@include file="../main/footer.jsp"%>
</html>