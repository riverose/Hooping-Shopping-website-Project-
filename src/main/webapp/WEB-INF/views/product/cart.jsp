<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet">

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

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
	<section>

		<div class="container-fluid pt-5">
			<div class="text-center mb-4">
				<h2 class="section-title px-5">
					<span class="px-2">MY CART</span>
				</h2>
			</div>
	<div class="container-fluid text-dark mt-5 pt-5" id="wish-m">
		<div class="container-fluid" style="width: 100%; " id="wish-s">
			<span id="your_product1">????????? ?????? </span> <span id="your_product2">(1) </span>
			<form action="modifyCart.do" method="post" >
				<hr>
				<table id="sideTb_left" style="width:850px;">
					<tr style="border-bottom: 1px solid rgb(192, 191, 191);">
						<td id="sideTb_left_td" style="width: 4%">
							<input id="allCheck" type="checkbox" name="allCheck"/>
						</td>
						<td id="sideTb_left_td" style="width: 30%; text-align: center;"><span id="sideTb_menu">?????????</span></td>
						<td id="sideTb_left_td" style="width: 10%; text-align: center;"><span id="sideTb_menu">??????</span></td>
						<td id="sideTb_left_td" style="width: 13%; text-align: center;"><span id="sideTb_menu">??????</span></td>
						<td id="sideTb_left_td" style="width: 15%; text-align: center;"><span id="sideTb_menu">??????</span></td>
						<td id="sideTb_left_td" style="width: 13%; text-align: center;"><span id="sideTb_menu">????????????</span></td>
					</tr>
					<tbody>
						<c:forEach items="${getCartList}" var="cart" varStatus="i">
							<input type="hidden" id="productId" value="${cart.productId }" name="productId" />
							<tr>
								<td id="sideTb_left_td" style="width: 5%">
									<input name="RowCheck" type="checkbox" value="${cart.cartId}"/>
								</td>
								<td id="sideTb_left_td" style="width: 5%">
									<div style="display: grid; grid-template-columns: 1fr 2fr;">
										<div>
											<img style="width: 50%" src="${cart.pimageAddr1}">
										</div>
										<div>
											<div>
												<span>${cart.productName }</span>
											</div>
											<div>
												<span style="color: grey;font-size: 13px;">size : ${cart.cartSize } <br> color : ${cart.cartColor }</span>
											</div>
										</div>
									</div>
								</td>
								<td id="sideTb_left_td" style="width: 5%; text-align: center;">
									<input type="number" min="1" id="sideTb_nb" name="cartCount" value="${cart.cartCount }" max="${cart.optionsStock }">
									<input id="cartIdCheck" type="hidden" value="${cart.cartId}"/>
								</td>
									<td id="sideTb_left_td" style="width: 5%; text-align: center;">
										<span id="productPrice">${cart.productPrice }</span>
									</td>
									<td id="sideTb_left_td" style="width: 5%; text-align: center;">
										<span>??????</span>
									</td>
									<td id="sideTb_left_td" style="width: 5%; text-align: center;">
                   	<span id="cartSum">${cartSumList[i.index]}</span>
                  </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
				
<!-- 			<div class="buy-btn-1-1"> -->
<!-- 				<button class="btn-1-1" onclick="modifyCount();">???????????? ??????</button> -->
<!-- <!-- 				<input type="button" value="????????????" class="btn btn-outline-info" onclick="deleteValue();"> -->
<!-- 			</div> -->
			<div class="mypage-recent-btns">
				<input type="button" value="????????????" onclick="deleteValue();">
			</div>
			</form>
		</div>
	</div>

		<!-- ???????????? (????????????) -->
			<div class="text-center">
<!-- 			<p class="pricetext-1" id="last-cost">??????????????????</p> -->

<!-- 			<!-- ????????? -->
<!-- 			<div class="l-1-1"> -->
<!-- 				<hr> -->
<!-- 			</div> -->
<!-- 			<!-- ????????? -->

<!-- 			<div class="p-1-1" id="total-cost">??? ?????? ??????</div> -->
<!-- 			<div class="p-2-1" id="total-cost">31,900???</div> -->
<!-- 			<div class="p-1-1" id="deli-cost">?????????</div> -->
<!-- 			<div class="p-2-1" id="deli-cost">0???</div> -->
<!-- 			<div class="p-1-1" id="coupon">????????????</div> -->
<!-- 			<div class="p-2-1" id="coupon">0???</div> -->
<!-- 			<div class="p-1-1" id="point">POINT</div> -->
<!-- 			<div class="p-2-1" id="point">0???</div> -->

<!-- 			<!-- ????????? -->
<!-- 			<div class="l-2-1"> -->
<!-- 				<hr> -->
<!-- 			</div> -->
<!-- 			<!-- ????????? -->

<!-- 			<div class="p-3-1" id="last-cost-fin">??????????????????</div> -->
<!-- 			<div class="p-4-1" style="color: red;" id="last-cost-fin">31,900???</div> -->
<!-- 			<div class="p-1-1" id="point-fin">???????????? ?????????</div> -->
<!-- 			<div class="p-2-1" id="point-fin">319???</div> -->

			<!-- ????????? -->
				<button id="cartOrderBtn" type="button" class="btn-1-2" style="margin-top:5%; margin-left:0%;">????????????</button>
			<!-- ????????? -->
		</div>
	</div>
</section>
	<!-- ???????????? ?????? -->

</body>

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
// 		$(function(){
// 			var chkObj = document.getElementsByName("RowCheck");
// 			var rowCnt = chkObj.length;
			
// 			$("input[name='allCheck']").click(function(){
// 				var chk_listArr = $("input[name='RowCheck']");
// 				for (var i=0; i<chk_listArr.length; i++){
// 					chk_listArr[i].checked = this.checked;
// 				}
// 			});
// 			$("input[name='RowCheck']").click(function(){
// 				if($("input[name='RowCheck']:checked").length == rowCnt){
// 					$("input[name='allCheck']")[0].checked = true;
// 				}
// 				else{
// 					$("input[name='allCheck']")[0].checked = false;
// 				}
// 			});
// 		});
		
// 		function deleteAlert(){
// 			alert("?????? ????????? ???????????????");
// 		}
		
// 		function modifyCount(){
// 			alert("????????? ?????????????????????");
// 		}


		$("input[name=cartCount]").bind('keyup input', function(){
			
 			var cartCount = $(this).val();
 			var productPrice = $(this).parent().next().children().text();
			var cartId = $(this).next().val();
			
			 $(this).parent().next().next().next().children().text(Number(cartCount) * Number(productPrice));
			
			$.ajax({
				
				url : "/ping/cart/updateCartCnt.do",
				type : "post",
				data : {"cartId" : cartId,
						"cartCount" : cartCount,
						"productPrice" : productPrice
				},
					
			});
		});

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
				if ($("input[name='RowCheck']:checked").length == rowCnt) {
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[1].checked = false;
				}
			});

		});
		function deleteValue() {
			var url = "/ping/cart/deleteCart.do";
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
					  text: "????????? ????????? ????????????",
					  icon: "error",
					})
			} else {
				
				Swal.fire({
				      title: "?????? ?????????????????????????",
				      html: "????????? ?????? ????????? ????????? ??? ????????????",
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
										        
										location.replace("getCartList.do");
									} else {
										alert("?????? ??????");
									}
								}
							});
				      }else{// if???
				    	  
				      }
				    })// ?????? result
				
			}

		}
		
		$("#cartOrderBtn").click(function(){
			
			Swal.fire({
			      title: "?????????????????????????",
			      html: "????????? ?????? ?????? ????????? ?????? ???????????????",
			      icon: 'question',
			      showCancelButton: true,
			      confirmButtonColor: '#3085d6',
			      cancelButtonColor: '#d33',
			      confirmButtonText: '??????',
			      cancelButtonText: '??????',
			      reverseButtons: true, // ?????? ?????? ?????????
			      
			    }).then((result) => {
			    	if (result.isConfirmed) {
			    		location.href="/ping/order/cartOrderProduct.do";	
			    	
			    	}else{
			    		return;
			    	}
			    	
			    });
			
		});
</script>
	

<%@include file="../main/footer.jsp"%>

</html>