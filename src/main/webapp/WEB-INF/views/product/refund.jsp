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
<link href="/ping/resources/css/jyp.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<title>Document</title>

</head>
<body>

	<header>
		<div id="header"></div>
	</header>
	<section class="login-section">

		<div class="login-logo">
			<span>환불 정보 입력</span>
		</div>

		<div class="contact-form">

			<form action="/ping/myPage/refundCheck.do" method="post"  name="sentMessage" id="contactForm" novalidate="novalidate">
				<div class="control-group">
					<div class="login-email">
						<span class="login-email-text">환불 계좌</span><br />
					</div>
					<input name="account" type="text" class="form-control" id="account" required="required" data-validation-required-message="특수문자를 제외하고 입력해주세요" />
				</div>
				<div class="control-group">
					<span class="login-password-text">은행</span><br /> 
					<input name="bank" type="text" class="form-control" id="bank" required="required" data-validation-required-message="은행을 입력해주세요" />
				</div>
				<input type="hidden" name="payId" value="<%= request.getParameter("paynum") %>">
				<div class="btn-div">
					<input type="submit" class="btn btn-dark login-button" value="환불하기">
				</div>
			</form>
		</div>

	</section>

</body>
<%@include file="../main/footer.jsp"%>


<script>

</script>
</html>