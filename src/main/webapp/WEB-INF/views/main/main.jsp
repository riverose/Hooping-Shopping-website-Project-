<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../main/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Hoopping</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

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
<!-- 링크 -->
<link rel="stylesheet" href="resources/css/style.css" />


<!-- JavaScript Libraries -->
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
<script>
// 	$(function(){
		
// 		$(document).on("ready", "#loginId", function(){
			
// 			if($("#loginId").val() != null){
// 				alert("멤버 로그인 했음");
// 				${"#headerNotLogin"}.hide();
// 				${"#headerLogin"}.show();
			
// 			}else{
				
// 				if($("#managerEmail").val() != null){
// 					alert("매니저 로그인 했음");

// 					${"#headerNotLogin"}.hide();
// 					${"#headerLogin"}.show();
				
// 				}else{
// 					${"#headerNotLogin"}.show();
// 					${"#headerLogin"}.hide();
// 				}
				
// 			}
// 		})
// 	})
</script>

</head>
<body>
	<div id="header-carousel" class="carousel slide" data-ride="carousel" style="height: 76%;">
		<div class="carousel-inner" style="height: 123%;">
			<div class="carousel-item active">
				<img id="si" class="img-fluid" src="resources/img/배너1.png"
					alt="Image">
			</div>
			<div class="carousel-item">
				<img id="si" class="img-fluid" src="resources/img/배너2.png"
					alt="Image">
			</div>
			<div class="carousel-item">
				<img id="si" class="img-fluid" src="resources/img/배너3.png"
					alt="Image">
			</div>
			<div class="carousel-item">
				<img id="si" class="img-fluid" src="resources/img/배너4.png"
					alt="Image">
			</div>
		</div>
		<a class="carousel-control-prev" href="#header-carousel"
			data-slide="prev">
			<div class="btn btn-dark" id="ss">
				<span class="carousel-control-prev-icon mb-n2"></span>
			</div>
		</a> <a class="carousel-control-next" href="#header-carousel"
			data-slide="next">
			<div class="btn btn-dark" id="ss">
				<span class="carousel-control-next-icon mb-n2"></span>
			</div>
		</a>
	</div>

	<div class="container-fluid pt-5">
		<div class="text-center mb-4">
			<h2 class="section-title px-5">
				<span class="px-2">WHAT'S NEW</span>
			</h2>
		</div>
		<div class="row px-xl-5 pb-3">
			<c:forEach items="${pList }" var="item">
				<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
					<div class="card product-item border-0 mb-4">
						<div
							class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
							<a href="/ping/product/getProduct.do?productid=${item.productId }"> <img
								class="img-fluid w-100" src="${item.pimageAddr1 }" alt="">
							</a>
						</div>
						<div
							class="card-body border-left border-right text-center p-0 pt-4 pb-3">
							<h6 class="text-truncate mb-3">${item.productName }</h6>
							<div class="d-flex justify-content-center">
								<h6>${item.productPrice }원</h6>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>