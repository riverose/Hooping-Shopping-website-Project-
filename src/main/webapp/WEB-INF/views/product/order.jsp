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

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
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
	if($('#coupon_selected option:selected').val()!="쿠폰을 선택하세요"){
		
	$("#mail-check-warn").hide();
		
	$.ajax({
	type:'post',
	url : 'couponCheck.do',
	data : {'couponId':$('#coupon_selected').val(), 'totalPrice':totalPrice},
	async : true, // submit이 진행이 안되도록 하는 비동기 통신 옵션
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
	} // success시 함수
	});//ajax 닫기
	}
	else{
		$("#mail-check-warn").show();
	}
	})// decide_coupon 클릭시 함수 닫기
	})//전체 닫기

</script>
 
</head>

<body>

	<!-- 붙일대상 시작 -->
	<form
		action='<c:choose>
		<c:when test="${product != null }">/ping/order/saveOrderPay.do</c:when>
		<c:otherwise>/ping/order/saveCartPay.do</c:otherwise>
		</c:choose>'
		method="post">
		<div class="container-fluid pt-5">
			<div class="container">
				<!-- 				<h1 class="text">주문결제</h1> -->
				<!-- 				<hr class="st-1"> -->
				<div class="leftcontainer">
					<h2 class="section-title px-5" style="margin-left: 250px;">
						<span class="px-2">ORDER</span>
					</h2>
					<div class="pitext">
						<hr>
						<h3>배송지 정보</h3>
					</div>
					<hr style="color: rgb(255, 255, 255);">
					<div class="username">
						<a>받으시는분 </a>
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
						<a>휴대폰 번호</a>
						<div>
							<input style="text-align: center;" type="text" class="sec"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='${sessionScope.memberPhoneNum }'"
								placeholder="${sessionScope.memberPhoneNum }">
						</div>
					</div>
					<hr>
					<div class="adress">
						<a>배송 주소</a>
						<div>
							<input style="text-align: center;" type='radio' id="radio1" name='a' checked
								value='${sessionScope.memberBaseAddress }'
								onchange="setDisplay()"> <label for="radio1">기본입력</label>
							<input style="text-align: center;" type='radio' id="radio2" name='a' value=''
								onchange="setDisplay()"> <label for="radio2">새로입력</label>
							<div id="baseAddress">
								<input style="text-align: center;" type='text' name='content'
									value='${sessionScope.memberBaseAddress }'>
							</div>
						</div>
						<div class="number" style="display: none">
							<input style="text-align: center;" name='content' type="text" id="sample4_postcode" placeholder="우편번호">
							<input style="text-align: center;" name='content' type="button" onclick="sample4_execDaumPostcode()"
								value="우편번호 찾기" class="as" id="as"><br>
							<%-- 					<input type="text" class="number-1" id="text" placeholder="${sessionScope.memberBaseAddress }">  --%>
							<input style="text-align: center;" name='content' type="text" id="sample4_roadAddress" placeholder="도로명주소"
								class="add-1"> <input style="text-align: center;" name='content' type="text"
								id="sample4_jibunAddress" placeholder="지번주소" class="add-2">
							<span id="guide" style="color: #999; display: none"></span>
							<%-- 					<input type="text" id="sample4_detailAddress" placeholder="${sessionScope.memberBaseAddress }">  --%>
							<input style="text-align: center;" name='content' type="text" id="sample4_detailAddress" class='result'>
							<input style="text-align: center;" name='content' type="text" id="sample4_extraAddress" placeholder="참고항목">
						</div>
					</div>
					<hr>
					<div class="message">
						<p class="message-1">배송 메세지</p>
						<input type="text" class="message-2">
					</div>
					<hr>

					<div class="Goods">
						<h3>주문상품</h3>
						<hr>
						<table id="sideTb_left">
							<tr style="border-bottom: 1px solid rgb(192, 191, 191);">
								<td id="sideTb_left_td" style="width: 30%; text-align: center;"><span
									id="sideTb_menu">상품명</span></td>
								<td id="sideTb_left_td" style="width: 10%; text-align: center;"><span
									id="sideTb_menu">수량</span></td>
								<td id="sideTb_left_td" style="width: 10%; text-align: center;"><span
									id="sideTb_menu">가격</span></td>
								<td id="sideTb_left_td" style="width: 10%; text-align: center;"><span
									id="sideTb_menu">상품금액</span></td>
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
							<h3>할인 받기</h3>
						</div>
						<hr>
						<div class="sale-1">
							<a>결제 예정금액</a> <a class="sale-2">${product.productPrice}</a>
						</div>
						<hr>
						<div class="sale-3">
							<a>할인쿠폰</a> 
							<select id="coupon_selected" style="color: white" name="coupon" class="btn btn-dark">
								<option style="color: white" class="coupon_choice"
									value="쿠폰을 선택하세요">쿠폰을 선택하세요</option>
								<c:forEach items="${couponList }" var="coupon">
									<option style="color: white" class="coupon_choice"
										value="${coupon.couponId }">${coupon.couponName }:
										${coupon.couponPrice }</option>
								</c:forEach>
							</select>
							<div id="decide_coupon" class="btn btn-dark"
								style="border-radius: 5px;">쿠폰 적용</div>
						</div>
						<div id="mail-check-warn" style="display: none">쿠폰을 선택해주세요</div>
						<hr>
					</div>
					<div class="payment">
               <div class="paytext">
                  <h3>결제 수단</h3>
                  <div id="paysel-check" style="display: none">결제수단을 입력해주세요</div>
               </div>
               <hr>
               <div class="paysel-1">
                  <input type="radio" id="radio4" name="radioCheck" value="카카오페이"> <label for="radio4">
                     카카오페이</label>
               </div>
               <hr>
               <div>
                  <div class="normal" >
                     <input type="radio" id="radio5" name="radioCheck" value="일반 결제"> <label
                        for="radio5" >일반 결제</label>
                  </div>
               </div>
               <div class="cardbuy">
                  <button id="as">신용카드</button>
               </div>
               <div class="cardbuy-1">
                  <button id="as">간편결제</button>
               </div>
               <div class="cardbuy-1">
                  <button id="as">현금결제</button>
               </div>
               <div class="cardbuy-1">
                  <button id="as">휴대폰결제</button>
               </div>
               <div class="cardbuy-1">
                  <button id="as">International Payments</button>
               </div>
               <hr>
            </div>
				</div>
				<div style="text-align: center;" class="rightontainer">
				<h4 style="margin-top: 15px;">최종결제금액</h4>
				<table style=" width: 100%;">
						<tr style="text-align: center;">
							<td style="width:57.5%;">총 상품 금액</td>
							<td>${sum}</td>
							<td>${totalSum }</td>
						</tr>
						<tr style="text-align: center;">
							<td style="width:57.5%;">할인쿠폰</td>
							<td></td>
						</tr>
						<tr style="text-align: center;">
							<td style="width:57.5%;">최종결제금액</td>
							<td>${sum}</td>
							<td>${totalSum }</td>
							
						</tr>
					</table>
					<button class="btn-1" id="btn-1" disabled="disabled">결제하기</button>
               <!-- 카카오 api 버튼 -->
              		 <button type="button" class="btn-1" id="charge_kakao" disabled="disabled">카카오 결제하기</button>
				<input type="hidden" value="${product.productId }" name="productId" />
				<input type="hidden" value="${product.productPrice }" name='productPrice' />
				<input type="hidden" value="${product.productName}" name='productName' />
				<input	type="hidden" value="${color}" name='optionsColor' /> 
				<input	type="hidden" value="${size}" name='optionsSize' />
				<input type="hidden" value="${sessionScope.memberId }" name='memberId' /> 
				<input type="hidden" value="0" name="couponId"/>
				
<!-- 					<h4 style="text-align: center;">최종결제금액</h4> -->
<!-- 					<div style="display: flex;"> -->
<!-- 						<div class="text-left">총 상품 금액</div> -->
<%-- 						<div class="text-right">${product.productPrice}</div> --%>
<!-- 					</div> -->
<!-- 					<br> -->
<!-- 					<div style="display: flex;"> -->
<!-- 						<div class="text-left">할인쿠폰</div> -->
<!-- 					</div> -->
<!-- 					<br> -->
<!-- 					<div style="display: flex;"> -->
<!-- 						<div class="text-left">최종결제금액</div> -->
<%-- 						<div class="text-right">${product.productPrice}</div> --%>
<!-- 					</div> -->
<!-- 					<button style="text-align: center;" class="btn-dark btn-1">결제하기</button> -->

					<!-- 					<h4 class="pricetext">최종결제금액</h4> -->
<!-- 					<div class="l-1"> -->
<!-- 						<hr> -->
<!-- 					</div> -->
<!-- 					<div class="p-1"> -->
<!-- 						<span>총 상품 금액</span><br> <br> 배송비<br> <br> -->
<!-- 						할인쿠폰<br> <br> POINT -->
<!-- 					</div> -->
<!-- 					<div class="p-2"> -->
<%-- 						${product.productPrice}<br> <br> 0원<br> <br> --%>
<!-- 						0원<br> <br> 0원 -->
<!-- 					</div> -->
<!-- 					<div class="l-2"> -->
<!-- 						<hr> -->
<!-- 					</div> -->
<!-- 					<div class="p-3"> -->
<!-- 						최종결제금액<br> <br> 적립예정 포인트 -->
<!-- 					</div> -->
<!-- 					<div class="p-4"> -->
<%-- 						${product.productPrice}<br> <br> 원 --%>
<!-- 					</div> -->
<!-- 					<div class="buy-btn"> -->
<%-- 						<input type="hidden" value="${product.productId }" --%>
<%-- 							name="productId" /> 
								<input type="hidden" value="${productName }" name='productName' /> 
								<input type="hidden" value="${product.productPrice }" name='productPrice' /> 
								
								<input
<%-- 							type="hidden" value="${size}" name='optionsSize' /> <input type="hidden" value="${sessionScope.memberId }" name='memberId' /> --%>
<!-- 						<button class="btn-dark btn-1">결제하기</button> -->
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
	  
	  if(test != "일반 결제"){
		  
		  $('#paysel-check').show();
		  return;
	  }
	   
   });
   
   // 카카오결제 api 
   $("input[name='radioCheck']").click(function(){
      var test = $("input[name='radioCheck']:checked").val();
      if($("input[name='radioCheck']:checked").val() == '카카오페이'){
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
       console.log("상품id" +productId);
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
               var msg = '결제가 완료되었습니다.';
               msg += '고유ID : ' + rsp.imp_uid;
               msg += '상점 거래ID : ' + rsp.merchant_uid;
               msg += '결제 금액 : ' + rsp.paid_amount;
               msg += '카드 승인번호 : ' + rsp.apply_num;
               $.ajax({
                   type: "GET", 
                   url: "kakaoPay.do", //충전 금액값을 보낼 url 설정
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
               var msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
           }
           Swal.fire({
        	      icon: 'success',
        	      title: '결제 완료.',
        	      text: msg,
        	    });
           document.location.href="/ping/myPage/myPage.do"; //alert창 확인 후 이동할 url 설정
       });
   });
</script>
<%@include file="../main/footer.jsp"%>
</html>