<%@page import="com.hoo.ping.domain.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link href="img/favicon.ico" rel="icon">

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
<link href="/ping/resources/css/category.css" rel="stylesheet">

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="/ping/resources/mail/jqBootstrapValidation.min.js"></script>
<script src="/ping/resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="/ping/resources/js/main.js"></script>
<script src="/ping/resources/js/option_detail.js"></script>
<script>
	function getParameterByName(name) {
	  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	  results = regex.exec(location.search);
	  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	function filter(full){
		var items = full.split("~상품구분~");
		//alert($('#product_list_all').html(''));
		var str="";
		
		for(var item of items){
			if(item.split(',')[0]==''){
				continue;
			}
			str=str+'<div class="col-lg-4 col-md-6 col-sm-12 pb-1"><div class="card product-item border-0 mb-4"><div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0"><a href="/ping/product/getProduct.do?productid='+item.split(',')[0]+'"><img class="img-fluid w-100" src="'+item.split(',')[1]+'" alt=""></a></div><div class="card-body border-left border-right text-center p-0 pt-4 pb-3"><h6 class="text-truncate mb-3">'+item.split(",")[2]+'</h6><div class="d-flex justify-content-center"><h6>'+item.split(",")[3]+'원</h6></div></div><div class="card-footer d-flex justify-content-between bg-light border"><a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a><a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a></div></div></div>';
		}
		$('#product_list_all').html(str)
	}
	var colorSelect='';
	var brandSelect='';
	var gender = getParameterByName("gender");
	var type = getParameterByName("type");
	var min=0;
	var max=999999;
	$(function() {
		$(".filter-item").click(function(e) {
			var str = '.filter_' + this.innerHTML;
			var filter_on = document.querySelector(str);
			filter_on.classList.toggle('hidden_filter');
			this.classList.toggle('filter_on');
		}) // 함수 닫기
		$(".brand_list > div").click(function(e) {
			this.classList.toggle('brand_on');
		}) // 함수 닫기
		$(".color_list > div").click(function(e) {
			this.classList.toggle('color_on');
		}) //함수 닫기
		$(".go_ajax > div").click(function(){
			var brands = document.querySelectorAll('.brand_on');
			var colors = document.querySelectorAll('.color_on > div:nth-child(2)');
			
			colorSelect='';
			brandSelect='';
			
			for(var brand of brands){
				brand=brand.innerHTML.split('#')[1];
				brandSelect=brandSelect+','+brand
			}
			for(var color of colors){
				color=color.innerHTML;
				colorSelect=colorSelect+','+color
			}
			brandSelect=brandSelect.slice(1);
			colorSelect=colorSelect.slice(1);
			var ajax_list = {
					"brand_select" :brandSelect,
					"color_select" :colorSelect,
					"gender" : gender,
					"type" : type,
					"min":min,
					"max":max
			}
			console.log(ajax_list);
			$.ajax({
				type:'post',
				url : 'filterCheck.do',
				data : ajax_list,
				dataType : 'text',
				async : true, // submit이 진행이 안되도록 하는 비동기 통신 옵션
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
				success : function(resultData){
					filter(resultData);
				} // success시 함수
			});//ajax 닫기
			
		})// 함수 닫기
		
		$('#price_btn').click(function(){
			min=$('#min_price').val();
			max=$('#max_price').val();
			var ajax_list = {
					"brand_select" :brandSelect,
					"color_select" :colorSelect,
					"gender" : gender,
					"type" : type,
					"min":min,
					"max":max
			}
			$.ajax({
				type:'post',
				url : 'filterCheck.do',
				data : ajax_list,
				dataType : 'text',
				async : true, // submit이 진행이 안되도록 하는 비동기 통신 옵션
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
				success : function(resultData){
					filter(resultData);
					
				} // success시 함수
			});//ajax 닫기
		})
	})//전체 닫기
</script>
<style>
.hidden_filter {
	display: none;
}

.filter_on {
	border: 2px solid rgb(238,109,109) !important; 
	color: rgb(238,109,109) !important;
}

.color_list {
	display: flex;
	width: 100%;
	flex-wrap: wrap;
}

.color_list>div {
	width: 11%;
	border: 2px solid white;
}

.color_list>div:hover {
	border: 2px solid 2px solid rgb(238,109,109) !important;
}

.color_list>div>div {
	text-align: center;
}

.brand_list {
	display: flex;
	width: 100%;
	flex-wrap: wrap;
	padding-left: 20px;
}

.brand_list>div:hover {
	background: white;
	border-radius: 15px;
	border: 2px solid rgb(238,109,109);
	padding: 10px;
	margin: 5px;
}

.brand_on {
	background: white !important;
	color: rgb(238,109,109);
	border: 2px solid rgb(238,109,109) !important;
}

.color_on {
	border: 2px solid rgb(238,109,109) !important;
}

.brand_list>div {
	background: white;
	border-radius: 15px;
	border: 2px solid black;
	padding: 10px;
	margin: 5px;
}

.price_list {
	padding-left: 20px;
	width: 100%;
}

.price_list>div {
	margin: 5px;
}

hr {
	width: 100%;
}
</style>
</head>
<body>
	
	<div class="container-fluid pt-5">
			<div class="text-center mb-4">
				<h2 class="section-title px-5">
					<span class="px-2">Category</span>
				</h2>
			</div>

		<!-- 수정 시작-->
		<section class="filter">
			<div class="container">
				<div class="row">
					<div class="product-filter">
						<!-- 자바스크립트로 버튼 클릭시 필터내용 -->
						<span class="filter-item active" data-filter="all">FILTER</span> <span
							class="filter-item" data-filter="brand">BRAND</span> <span
							class="filter-item" data-filter="price">PRICE</span> <span
							class="filter-item" data-filter="color">COLOR</span>
					</div>

					<div style="width: 100%; margin: 10px;"
						class="filter_BRAND hidden_filter">
						<hr>
						<div class="brand_list go_ajax">
							<c:forEach items="${bList }" var="brand">
								<div>#${brand.productCo }</div>
							</c:forEach>
						</div>
					</div>
					<div style="width: 100%; margin: 10px;"
						class="filter_PRICE hidden_filter">
						<hr>
						<div class="price_list">
							<div>
								최소 금액 : <input id="min_price" type="text" value="0">
							</div>
							<div>
								최대 금액 : <input id="max_price" type="text" value="9999999">
								<input id="price_btn" type="button" name="price_btn" value="검색">
							</div>
						</div>
					</div>


					<div style="width: 100%; margin: 10px;"
						class="filter_COLOR hidden_filter">
						<hr>
						<div class="color_list go_ajax">
							<div>
								<div style="color: brown" class="color_circle">●</div>
								<div class="color_name">brown</div>
							</div>
							<div>
								<div style="color: grey" class="color_circle">●</div>
								<div class="color_name">grey</div>
							</div>
							<div>
								<div style="color: beige" class="color_circle">●</div>
								<div class="color_name">beige</div>
							</div>
							<div>
								<div style="color: #ffd400" class="color_circle">●</div>
								<div class="color_name">mustard</div>
							</div>
							<div>
								<div style="color: #771138" class="color_circle">●</div>
								<div class="color_name">burgundy</div>
							</div>
							<div>
								<div style="color: navy" class="color_circle">●</div>
								<div class="color_name">navy</div>
							</div>
							<div>
								<div style="color: #808000" class="color_circle">●</div>
								<div class="color_name">khaki</div>
							</div>
							<div>
								<div style="color: blue" class="color_circle">●</div>
								<div class="color_name">blue</div>
							</div>
							<div>
								<div style="color: ivory" class="color_circle">●</div>
								<div class="color_name">ivory</div>
							</div>
							<div>
								<div style="color: pink" class="color_circle">●</div>
								<div class="color_name">pink</div>
							</div>
							<div>
								<div style="color: #ede7df" class="color_circle">●</div>
								<div class="color_name">cream</div>
							</div>
							<div>
								<div style="color: white" class="color_circle">●</div>
								<div class="color_name">white</div>
							</div>
							<div>
								<div style="color: charcoal" class="color_circle">●</div>
								<div class="color_name">charcoal</div>
							</div>
							<div>
								<div style="color: black" class="color_circle">●</div>
								<div class="color_name">black</div>
							</div>
							<div>
								<div style="color: purple" class="color_circle">●</div>
								<div class="color_name">purple</div>
							</div>
							<div>
								<div style="color: orange" class="color_circle">●</div>
								<div class="color_name">orange</div>
							</div>
							<div>
								<div style="color: red" class="color_circle">●</div>
								<div class="color_name">red</div>
							</div>
							<div>
								<div style="color: green" class="color_circle">●</div>
								<div class="color_name">green</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	<div class="filter-brand" style="display: none;">
		<div class="brand-search">
			<input placeholder="브랜드검색">
		</div>
		<div class="brand-list">
			<ul>
				<li>BEST</li>
				<li>ABC</li>
				<li>가나다</li>
			</ul>
		</div>
	</div>


	<div class="filter-price" style="display: none;">


		<div class="filter-price1">
			<div class="price1">5만원 이하</div>
		</div>

		<div class="filter-price2">
			<div class="price2">5만원 ~ 10만원</div>
		</div>
		<div class="filter-price3">
			<div class="price3">10만원 ~ 20만원</div>
		</div>
		<div class="filter-price4">
			<div class="price4">20만원 ~ 30만원</div>
		</div>

	</div>
	</section>

	<!-- Shop Product Start -->
	<div id="product_div">
		<div id="product_list_all" class="row pb-3 col-12 pb-1">
			<c:forEach items="${plist}" var="product">
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
		<div>
			<div class="col-12 pb-1">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center mb-3">
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<!-- Shop Product End -->
	</div>

	<!-- Shop End -->

</body>
<%@include file="../main/footer.jsp"%>
</html>