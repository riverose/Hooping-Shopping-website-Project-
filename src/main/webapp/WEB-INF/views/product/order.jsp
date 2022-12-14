<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Hoopping</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="resources/img/favicon.ico" rel="icon">

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
<link href="/ping/resources/css/order.css" rel="stylesheet">
<link href="/ping/resources/css/jyp.css" rel="stylesheet">

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>	

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
<script>

	//??? ??????????????? ????????? ?????? ?????? ????????? ?????? ????????? ??????, ???????????? ???????????? ???????????? ????????? ????????? ???????????? ????????? ???????????????.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

						// ????????? ????????? ?????? ????????? ?????? ????????? ????????????.
						// ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
						var roadAddr = data.roadAddress; // ????????? ?????? ??????
						var extraRoadAddr = ''; // ?????? ?????? ??????

						// ??????????????? ?????? ?????? ????????????. (???????????? ??????)
						// ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
						if (data.bname !== '' && /[???|???|???]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// ???????????? ??????, ??????????????? ?????? ????????????.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// ??????????????? ?????? ????????? ?????? ????????? ?????????.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// ???????????? ???????????? ?????? ?????? ?????? ????????? ?????????.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// ???????????? '?????? ??????'??? ????????? ??????, ?????? ???????????? ????????? ?????????.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(?????? ????????? ?????? : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(?????? ?????? ?????? : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<script>
function setDisplay(){
    if($('input:radio[id=radio1]').is(':checked')){
        $('#baseAddress').show();
        $('.number').hide();
    }else{
        $('#baseAddress').hide();
        $('.number').show();
    }
}
$(function(){
	$('#decide_coupon').click(function(){
		
		
	var totalPrice=$('body> form > div > div > div.rightontainer > table > tbody > tr:nth-child(1) > td:nth-child(2)').text();
	//alert(totalPrice);
	if(totalPrice==""){
	totalPrice=$('body > form > div > div > div.rightontainer > table > tbody > tr:nth-child(1) > td:nth-child(3)').text()
	}
	if($('#coupon_selected option:selected').val()!="????????? ???????????????"){
		
	$("#mail-check-warn").hide();
		
	$.ajax({
	type:'post',
	url : 'couponCheck.do',
	data : {'couponId':$('#coupon_selected').val(), 'totalPrice':totalPrice},
	async : true, // submit??? ????????? ???????????? ?????? ????????? ?????? ??????
	contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	success : function(resultData){
	//alert(resultData);
	$('body > form > div > div > div.rightontainer > table > tbody > tr:nth-child(2) > td:nth-child(2)').text(Number(totalPrice)-Number(resultData));
	if($('body > form > div > div > div.rightontainer > table > tbody > tr:nth-child(3) > td:nth-child(2)').text()==''){
	$('body > form > div > div > div.rightontainer > table > tbody > tr:nth-child(3) > td:nth-child(3)').text(resultData);
	}
	else{
	$('body > form > div > div > div.rightontainer > table > tbody > tr:nth-child(3) > td:nth-child(2)').text(resultData);
	}
	$('body > form > div > div > div.rightontainer > input[type=hidden]:nth-child(6)').val(Number(resultData));
	$('body > form > div > div > div.rightontainer > input[type=hidden]:nth-child(11)').val($('#coupon_selected').val());
	} // success??? ??????
	});//ajax ??????
	}
	else{
		$("#mail-check-warn").show();
	}
	})// decide_coupon ????????? ?????? ??????
	})//?????? ??????

</script>
 
</head>

<body>

	<!-- ???????????? ?????? -->
	<form
		action='<c:choose>
		<c:when test="${product != null }">/ping/order/saveOrderPay.do</c:when>
		<c:otherwise>/ping/order/saveCartPay.do</c:otherwise>
		</c:choose>'
		method="post">
		<div class="container-fluid pt-5">
			<div class="container">
				<!-- 				<h1 class="text">????????????</h1> -->
				<!-- 				<hr class="st-1"> -->
				<div class="leftcontainer">
					<h2 class="section-title px-5" style="margin-left: 250px;">
						<span class="px-2">ORDER</span>
					</h2>
					<div class="pitext">
						<hr>
						<h3>????????? ??????</h3>
					</div>
					<hr style="color: rgb(255, 255, 255);">
					<div class="username">
						<a>??????????????? </a>
						<!-- 					<input class="username-1" type="text" size="8" class="nametext" -->
						<%-- 							id="text" placeholder="${sessionScope.memberName }"> --%>
						<div>
						<input style="text-align: center;" class="username-1" type="text" class="nametext"
							 placeholder="${sessionScope.memberName }"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='${sessionScope.memberName }'">
						</div>
					</div>
					<hr>
					<div class="phone">
						<a>????????? ??????</a>
						<div>
							<input style="text-align: center;" type="text" class="sec"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='${sessionScope.memberPhoneNum }'"
								placeholder="${sessionScope.memberPhoneNum }">
						</div>
					</div>
					<hr>
					<div class="adress">
						<a>?????? ??????</a>
						<div>
							<input style="text-align: center;" type='radio' id="radio1" name='a' checked
								value='${sessionScope.memberBaseAddress }'
								onchange="setDisplay()"> <label for="radio1">????????????</label>
							<input style="text-align: center;" type='radio' id="radio2" name='a' value=''
								onchange="setDisplay()"> <label for="radio2">????????????</label>
							<div id="baseAddress">
								<input style="text-align: center;" type='text' name='content'
									value='${sessionScope.memberBaseAddress }'>
							</div>
						</div>
						<div class="number" style="display: none">
							<input style="text-align: center;" name='content' type="text" id="sample4_postcode" placeholder="????????????">
							<input style="text-align: center;" name='content' type="button" onclick="sample4_execDaumPostcode()"
								value="???????????? ??????" class="as" id="as"><br>
							<%-- 					<input type="text" class="number-1" id="text" placeholder="${sessionScope.memberBaseAddress }">  --%>
							<input style="text-align: center;" name='content' type="text" id="sample4_roadAddress" placeholder="???????????????"
								class="add-1"> <input style="text-align: center;" name='content' type="text"
								id="sample4_jibunAddress" placeholder="????????????" class="add-2">
							<span id="guide" style="color: #999; display: none"></span>
							<%-- 					<input type="text" id="sample4_detailAddress" placeholder="${sessionScope.memberBaseAddress }">  --%>
							<input style="text-align: center;" name='content' type="text" id="sample4_detailAddress" class='result'>
							<input style="text-align: center;" name='content' type="text" id="sample4_extraAddress" placeholder="????????????">
						</div>
					</div>
					<hr>
					<div class="message">
						<p class="message-1">?????? ?????????</p>
						<input type="text" class="message-2">
					</div>
					<hr>

					<div class="Goods">
						<h3>????????????</h3>
						<hr>
						<table id="sideTb_left">
							<tr style="border-bottom: 1px solid rgb(192, 191, 191);">
								<td id="sideTb_left_td" style="width: 30%; text-align: center;"><span
									id="sideTb_menu">?????????</span></td>
								<td id="sideTb_left_td" style="width: 10%; text-align: center;"><span
									id="sideTb_menu">??????</span></td>
								<td id="sideTb_left_td" style="width: 10%; text-align: center;"><span
									id="sideTb_menu">??????</span></td>
								<td id="sideTb_left_td" style="width: 10%; text-align: center;"><span
									id="sideTb_menu">????????????</span></td>
							</tr>
							<tbody>
								<c:choose>
									<c:when test="${product != null }">
										<tr>
											<td id="sideTb_left_td" style="width: 5%">
												<div style="display: grid; grid-template-columns: 1fr 2fr;">
													<div>
														<img style="width: 50%" src="${product.pimageAddr1}">
													</div>
													<div>
														<div>
															<span>${product.productName }</span>
														</div>
														<div>
															<span style="color: grey;font-size: 13px;">size : ${size } <br> color : ${color }</span>
														</div>
													</div>
												</div>
											</td>
											<td id="sideTb_left_td"
												style="width: 5%; text-align: center;"><span>${count }</span></td>
											<td id="sideTb_left_td" style="width: 5%; text-align: center;"><span
												id="productPrice">${product.productPrice }</span></td>
											<td id="sideTb_left_td" style="width: 5%; text-align: center;"><span
												id="cartSum">${product.productPrice }</span></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${cartList}" var="cart" varStatus="i">

											<tr>
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
												<td id="sideTb_left_td"
													style="width: 5%; text-align: center;"><span
													id="cartCount">${cart.cartCount }</span></td>
												<td id="sideTb_left_td" style="width: 5%; text-align: center;;"><span
													id="productPrice">${cart.productPrice }</span></td>
												<td id="sideTb_left_td" style="width: 5%; text-align: center;"><span
													id="cartSum">${cartSumList[i.index]}</span></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<hr>
					</div>

					<div class="sale">
						<div class="saletext">
							<h3>?????? ??????</h3>
						</div>
						<hr>
						<div class="sale-1">
							<a>?????? ????????????</a> <a class="sale-2">${product.productPrice}</a>
						</div>
						<hr>
						<div class="sale-3">
							<a>????????????</a> 
							<select id="coupon_selected" style="color: white" name="coupon" class="btn btn-dark">
								<option style="color: white" class="coupon_choice"
									value="????????? ???????????????">????????? ???????????????</option>
								<c:forEach items="${couponList }" var="coupon">
									<option style="color: white" class="coupon_choice"
										value="${coupon.couponId }">${coupon.couponName }:
										${coupon.couponPrice }</option>
								</c:forEach>
							</select>
							<div id="decide_coupon" class="btn btn-dark"
								style="border-radius: 5px;">?????? ??????</div>
						</div>
						<div id="mail-check-warn" style="display: none">????????? ??????????????????</div>
						<hr>
					</div>
					<div class="payment">
               <div class="paytext">
                  <h3>?????? ??????</h3>
                  <div id="paysel-check" style="display: none">??????????????? ??????????????????</div>
               </div>
               <hr>
               <div class="paysel-1">
                  <input type="radio" id="radio4" name="radioCheck" value="???????????????"> <label for="radio4">
                     ???????????????</label>
               </div>
               <hr>
               <div>
                  <div class="normal" >
                     <input type="radio" id="radio5" name="radioCheck" value="?????? ??????"> <label
                        for="radio5" >?????? ??????</label>
                  </div>
               </div>
               <div class="cardbuy">
                  <button id="as">????????????</button>
               </div>
               <div class="cardbuy-1">
                  <button id="as">????????????</button>
               </div>
               <div class="cardbuy-1">
                  <button id="as">????????????</button>
               </div>
               <div class="cardbuy-1">
                  <button id="as">???????????????</button>
               </div>
               <div class="cardbuy-1">
                  <button id="as">International Payments</button>
               </div>
               <hr>
            </div>
				</div>
				<div style="text-align: center;" class="rightontainer">
				<h4 style="margin-top: 15px;">??????????????????</h4>
				<table style=" width: 100%;">
						<tr style="text-align: center;">
							<td style="width:57.5%;">??? ?????? ??????</td>
							<td>${sum}</td>
							<td>${totalSum }</td>
						</tr>
						<tr style="text-align: center;">
							<td style="width:57.5%;">????????????</td>
							<td></td>
						</tr>
						<tr style="text-align: center;">
							<td style="width:57.5%;">??????????????????</td>
							<td>${sum}</td>
							<td>${totalSum }</td>
							
						</tr>
					</table>
					<button class="btn-1" id="btn-1" disabled="disabled">????????????</button>
               <!-- ????????? api ?????? -->
              		 <button type="button" class="btn-1" id="charge_kakao" disabled="disabled">????????? ????????????</button>
				<input type="hidden" value="${product.productId }" name="productId" />
				<input type="hidden" value="${product.productPrice }" name='productPrice' />
				<input type="hidden" value="${product.productName}" name='productName' />
				<input	type="hidden" value="${color}" name='optionsColor' /> 
				<input	type="hidden" value="${size}" name='optionsSize' />
				<input type="hidden" value="${sessionScope.memberId }" name='memberId' /> 
				<input type="hidden" value="0" name="couponId"/>
				
<!-- 					<h4 style="text-align: center;">??????????????????</h4> -->
<!-- 					<div style="display: flex;"> -->
<!-- 						<div class="text-left">??? ?????? ??????</div> -->
<%-- 						<div class="text-right">${product.productPrice}</div> --%>
<!-- 					</div> -->
<!-- 					<br> -->
<!-- 					<div style="display: flex;"> -->
<!-- 						<div class="text-left">????????????</div> -->
<!-- 					</div> -->
<!-- 					<br> -->
<!-- 					<div style="display: flex;"> -->
<!-- 						<div class="text-left">??????????????????</div> -->
<%-- 						<div class="text-right">${product.productPrice}</div> --%>
<!-- 					</div> -->
<!-- 					<button style="text-align: center;" class="btn-dark btn-1">????????????</button> -->

					<!-- 					<h4 class="pricetext">??????????????????</h4> -->
<!-- 					<div class="l-1"> -->
<!-- 						<hr> -->
<!-- 					</div> -->
<!-- 					<div class="p-1"> -->
<!-- 						<span>??? ?????? ??????</span><br> <br> ?????????<br> <br> -->
<!-- 						????????????<br> <br> POINT -->
<!-- 					</div> -->
<!-- 					<div class="p-2"> -->
<%-- 						${product.productPrice}<br> <br> 0???<br> <br> --%>
<!-- 						0???<br> <br> 0??? -->
<!-- 					</div> -->
<!-- 					<div class="l-2"> -->
<!-- 						<hr> -->
<!-- 					</div> -->
<!-- 					<div class="p-3"> -->
<!-- 						??????????????????<br> <br> ???????????? ????????? -->
<!-- 					</div> -->
<!-- 					<div class="p-4"> -->
<%-- 						${product.productPrice}<br> <br> ??? --%>
<!-- 					</div> -->
<!-- 					<div class="buy-btn"> -->
<%-- 						<input type="hidden" value="${product.productId }" --%>
<%-- 							name="productId" /> 
								<input type="hidden" value="${productName }" name='productName' /> 
								<input type="hidden" value="${product.productPrice }" name='productPrice' /> 
								
								<input
<%-- 							type="hidden" value="${size}" name='optionsSize' /> <input type="hidden" value="${sessionScope.memberId }" name='memberId' /> --%>
<!-- 						<button class="btn-dark btn-1">????????????</button> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</form>

	<div id="footer"></div>
</body>
<script>
   
   $("#btn-1").click(function(){
	   
	  var test = $("input[name='radioCheck']:checked").val();
	  
	  if(test != "?????? ??????"){
		  
		  $('#paysel-check').show();
		  return;
	  }
	   
   });
   
   // ??????????????? api 
   $("input[name='radioCheck']").click(function(){
      var test = $("input[name='radioCheck']:checked").val();
      if($("input[name='radioCheck']:checked").val() == '???????????????'){
         $('#charge_kakao').attr('disabled', false);
      }else{
         //$('.btn-1').attr('disabled', false);
         $('#btn-1').attr('disabled', false);
      };
   });

   
   $('#charge_kakao').click(function () {
       // getter
       var IMP = window.IMP;
       IMP.init('imp28556407');
       var productId = $('input[name=productId]').val();
       console.log("??????id" +productId);
       var productName = $('input[name=productName]').val();
       console.log(productName);
       var productPrice = $('input[name=productPrice]').val();
       console.log(productPrice);
       var optionsColor = $('input[name=optionsColor]').val();
       console.log(optionsColor);
       var optionsSize = $('input[name=optionsSize]').val();
       console.log(optionsSize);
       var memberId = $('input[name=memberId]').val();
       console.log(memberId);
       
      
       IMP.request_pay({
           pg: 'kakaopay',
           merchant_uid: 'merchant_' + new Date().getTime(),
         pId: productId,
           name: productName,
           amount: productPrice,
           color: optionsColor,
           size: optionsSize,
           member: memberId
       }, function (rsp) {
           console.log(rsp);
           if (rsp.success) {
               var msg = '????????? ?????????????????????.';
               msg += '??????ID : ' + rsp.imp_uid;
               msg += '?????? ??????ID : ' + rsp.merchant_uid;
               msg += '?????? ?????? : ' + rsp.paid_amount;
               msg += '?????? ???????????? : ' + rsp.apply_num;
               $.ajax({
                   type: "GET", 
                   url: "kakaoPay.do", //?????? ???????????? ?????? url ??????
                   data: {
                      
                      "memberId" : memberId,
                        "optionsSize" : optionsSize,
                      "optionsColor" : optionsColor,
                       "productPrice" : productPrice,
                        "productId" :  productId,
                        "productName" : productName
                        
                   },
               });
           } else {
               var msg = '????????? ?????????????????????.';
               msg += '???????????? : ' + rsp.error_msg;
           }
           Swal.fire({
        	      icon: 'success',
        	      title: '?????? ??????.',
        	      text: msg,
        	    });
           document.location.href="/ping/myPage/myPage.do"; //alert??? ?????? ??? ????????? url ??????
       });
   });
</script>
<%@include file="../main/footer.jsp"%>
</html>