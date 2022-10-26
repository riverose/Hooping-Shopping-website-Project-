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

<!-- kakao login api -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/ping/resources/lib/easing/easing.min.js"></script>
<script src="/ping/resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>Document</title>

</head>
<body>

	<header>
		<div id="header"></div>
	</header>
	<div class="container-fluid pt-5">
	<section class="login-section">
<!-- 1019로그인수정 -->
		<div class="login-logo">
			<h2 class="section-title px-5">
				<span class="px-2">LOGIN</span>
			</h2>
		</div>

		<div class="contact-form">

			<div id="success" ></div>
			<form style="display: flex; flex-direction: column; align-items: center;"
			 method="post"  name="sentMessage" novalidate="novalidate" >
				<div class="control-group" >
					<div class="login-email">
						<span class="login-email-text">이메일 주소</span><br />
					</div>
					<input name="memberEmail" type="text" class="form-control" id="email" required="required" data-validation-required-message="Please enter your name" />
				</div>
				<div class="control-group">
					<span class="login-password-text">비밀번호</span><br /> 
					<input name="memberPwd" type="password" class="form-control" id="pwd" required="required" data-validation-required-message="Please enter your email" />
				</div>
				<div class="btn-div" style="padding-bottom: 50px;">
					<button type="button" class="btn btn-dark login-button">로그인</button>
				</div>
			</form>
		</div>

	</section>
	</div>

</body>
<%@include file="../main/footer.jsp"%>

<script>

	$(function(){
	    
		$(".login-button").click(function() {
		    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		    var getCheck= RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[\{\}\[\]\/?;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]).*$/);
			
			//이메일 공백 확인
			if ($("#email").val() == "") {
				swal.fire({
					  title: "이메일 주소가 비었어요!",
					  text: "이메일을 입력해주세요",
					  icon: "error",
					})
				$("#email").focus();
				return false;
			}
			
			//이메일 유효성 검사
			if(!getMail.test($("#email").val())){
		        swal.fire({
					  title: "이메일형식에 맞게 입력해주세요!",
					  text: " 예시) id@domain.com",
					  icon: "error",
					})
		        $("#email").val("");
		        $("#email").focus();
		        return false;
		      }

			//비밀번호란 공백 확인
			if ($("#pwd").val() == "") {
				 swal.fire({
					  title: "비밀번호를 확인해주세요!",
					  text: " 예시) id@domain.com",
					  icon: "error",
					});
				$("#pwd").focus();
				return false;
			}
		    			
			/* $(".login-button").prop("type", "submit"); */
			
			var memberEmail = $("input[name=memberEmail]").val();
			var memberPwd = $("#pwd").val();
			
			$.ajax({
				url : "/ping/member/idCheck.do",
				data : {
					"memberEmail" : memberEmail,
					"memberPwd" : memberPwd
				},
				dataType : "text",
				type : "POST",
				success : function(data) {
					
					if(data == "success"){
						location.href="/ping/main.do"
					
					}else{
						swal.fire({
							  title: "로그인 오류!",
							  text: "이메일 혹은 비밀번호가 정확하지 않아요",
							  icon: "error",
							})
						
					}			
					
				}
			})
			
		})
		
	 
	});
</script>
</html>