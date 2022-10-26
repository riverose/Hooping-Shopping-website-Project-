<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href="/ping/img/favicon.ico" rel="icon">

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
<link href="/ping/resources/css/best.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

<title>Document</title>

</head>
<body>

	<div id="a"></div>
	<section>

		<div class="container-fluid pt-5">
			<div class="text-center mb-4">
				<h2 class="section-title px-5">
					<span class="px-2">BEST</span>
				</h2>
			</div>
			<div class="tab-div">
				<div class="best-tap">
					<button class="best-tap-button">
						<a href="/ping/best/getBestProductList.do?gender=A">ALL</a>
					</button>
					<button class="best-tap-button">
						<a href="/ping/best/getBestProductList.do?gender=M">MEN</a>
					</button>
					<button class="best-tap-button">
						<a href="/ping/best/getBestProductList.do?gender=F">WOMEN</a>
					</button>
				</div>
			</div>

			<div class="best-row px-xl-5 pb-3">
				<c:forEach items="${toplist}" var="best" varStatus="i">

					<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
						<div class="card product-item border-0 mb-4">
							<div class="best-top3">
								<span class="best-top3-text">${i.count }위</span>
							</div>

							<!-- 상품사진 -->
							<div
								class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
								<a
									href="/ping/product/getProduct.do?productid=${best.productId }"><img
									class="img-fluid w-100" src="${best.pimageAddr1 }" alt=""></a>
							</div>
							<!-- 상품 이름 -->
							<div
								class="card-body border-left border-right text-center p-0 pt-4 pb-3">
								<h6 class="text-truncate mb-3">${best.productName }</h6>
								<div class="d-flex justify-content-center">
									<h6>${best.productPrice }원</h6>
								</div>
							</div>
							<!-- 상품..버튼 -->
							<div
								class="card-footer d-flex justify-content-between bg-light border">
								<a href="" class="btn btn-sm text-dark p-0"><i
									class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a href=""
									class="btn btn-sm text-dark p-0"><i
									class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
							</div>
						</div>

					</div>
				</c:forEach>

			</div>

			<div class="row px-xl-5 pb-3">
				<c:forEach items="${blist}" var="product">
					<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
						<div class="card product-item border-0 mb-4">
							<!-- 상품사진 -->
							<div
								class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
								<a
									href="/ping/product/getProduct.do?productid=${product.productId }"><img
									class="img-fluid w-100" src="${product.pimageAddr1 }" alt=""></a>
							</div>
							<!-- 상품 이름 -->
							<div
								class="card-body border-left border-right text-center p-0 pt-4 pb-3">
								<h6 class="text-truncate mb-3">${product.productName }</h6>
								<div class="d-flex justify-content-center">
									<h6>${product.productPrice }원</h6>
								</div>
							</div>
							<!-- 상품..버튼 -->
							<div
								class="card-footer d-flex justify-content-between bg-light border">
								<a href="" class="btn btn-sm text-dark p-0"><i
									class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a href=""
									class="btn btn-sm text-dark p-0"><i
									class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</section>
</body>
<%@include file="../main/footer.jsp"%>
</html>