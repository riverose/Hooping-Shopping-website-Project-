<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
<link href="/ping/resources/css/jyp.css" rel="stylesheet">
<!-- Libraries Stylesheet -->
<link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet" />
<link href="/ping/resources/css/signUp.css" rel="stylesheet" />

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

<script src="/ping/resources/js/main.js"></script>
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

<title>Document</title>
<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
<script src="../resources/js/js_userinput.js?ver=1"></script>

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
	<div class="container-fluid pt-5">
		<section class="signUp-section">

			<div class="signUp-logo">
				<h2 class="section-title px-5">
					<span class="px-2">SIGN UP</span>
				</h2>
			</div>

			<div class="contact-form">

				<div id="success"></div>
				<form action="signDetail.do" method="post" name="memberJoin"
					id="memberJoin" novalidate="novalidate">

					<!-- 이메일 인증  -->

					<div class="control-group">	
					<div class="login-email">
						<div class="form-group email-form">
							<span class="login-email-text">이메일 주소</span>
							<div class="input-group">
								<input type="text" class="form-control" name="userEmail1"
									id="userEmail1" placeholder="이메일"> <select
									class="form-control" name="userEmail2" id="userEmail2">
									<option>@naver.com</option>
									<option>@daum.net</option>
									<option>@gmail.com</option>
									<option>@hanmail.com</option>
									<option>@yahoo.co.kr</option>
								</select>
							</div>
						</div>
					</div>
					</div>
					<div class="control-group">
							<div class="input-group-addon">
									<button type="button" class="btn btn-primary"
										id="mail-Check-Btn">본인인증</button>
								</div>
								<br>
								
							
								<div class="mail-check-box">
									<input class="form-control mail-check-input" type="text"
										placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled"
										maxlength="6">
								</div>
								<span id="mail-check-warn"></span>
					
					</div>
					


					<div class="control-group">
						<span class="login-password-text">비밀번호</span><br /> <input
							name="memberPwd" type="text" class="form-control password-check-input" disabled="disabled"
							onkeydown="checkSpace()" id="pwd" required="required"
							data-validation-required-message="Please enter your email" />
					</div>
					<div class="control-group">
						<span class="login-password-text">비밀번호 확인</span><br /> <input
							type="text" name="memberPwd2" class="form-control password-check-input2" disabled="disabled"
							onkeydown="checkSpace()" id="pwdCheck" required="required"
							data-validation-required-message="Please enter your email" />
					</div>


					<div class="btn-div">
						<button type="button" class="btn btn-dark login-button">상세정보
							입력</button>
					</div>
				</form>

			</div>

		</section>
	</div>
</body>
<jsp:include page="../main/footer.jsp" flush="true"></jsp:include>
<script>
	$(function() {

		$(".login-button")
				.click(
						function() {
							var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
							var getCheck = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[\{\}\[\]\/?;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]).*$/);

							if ($('#mail-check-warn').html() != '인증번호가 일치합니다.'){
								
								swal.fire({
									  title: "이메일 오류!",
									  text: "이메일 인증을 진행해주세요",
									  icon: "error",
									})
								return false;
							}

							//비밀번호란 공백 확인
							if ($("#pwd").val() == "") {
								swal.fire({
									  title: "비밀번호 오류!",
									  text: "비밀번호를 입력해주세요",
									  icon: "error",
									})
								$("#pwd").focus();
								return false;
							}

							//비밀번호 유효성검사
							if (!getCheck.test($("#pwd").val())) {
								swal.fire({
									  title: "비밀번호 오류!",
									  text: "특수문자/문자/숫자포함 8~15자리 이내로만 입력해주세요",
									  icon: "error",
									})
								$("#pwd").val("");
								$("#pwd").focus();
								return false;
							}

							//비밀번호 확인란 공백 확인
							if ($("#pwdCheck").val() == "") {
								swal.fire({
									  title: "비밀번호 오류!",
									  text: "비밀번호 확인란을 입력해주세요",
									  icon: "error",
									})
								$("#pwdCheck").focus();
								return false;
							}

							//비밀번호 서로 확인
							if ($("#pwd").val() != $("#pwdCheck").val()) {
								swal.fire({
									  title: "비밀번호 오류!",
									  text: "비밀번호 확인란의 비밀번호가 일치하지 않아요",
									  icon: "error",
									})
								$("#pwd").val("");
								$("#pwdCheck").val("");
								$("#pwd").focus();
								return false;
							}

							$(".login-button").prop("type", "submit");

						})

	});

	function checkEmail() {
		var email = $('#email').val(); //id값이 "id"인 입력란의 값을 저장
		$.ajax({
			url : 'memberUsing.do', //Controller에서 요청 받을 주소
			type : 'post', //POST 방식으로 전달
			data : {
				'memberEmail' : email
			},
			dataType : 'text',
			success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
				if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
					$('#emailAlready').css("display", "none");
				} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
					$('#emailAlready').css("display", "inline-block");
					alert("이미 사용중인 메일주소입니다");
					$('#email').val('');
				}
			},
			error : function(request, status, error) { //요청 실패시 에러 확인을 위함
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	};

	function checkSpace() {
		var kcode = event.keyCode;
		if (kcode == 32)
			event.returnValue = false;

	};

	// 이메일 인증 api 비동기통신
	$('#mail-Check-Btn').click(function() {
		
		const Toast = Swal.mixin({
		      toast: true,
		      position: 'center-center',
		      showConfirmButton: false,
		      timer: 3000,
		      timerProgressBar: true,
		      didOpen: (toast) => {
		        toast.addEventListener('mouseenter', Swal.stopTimer)
		        toast.addEventListener('mouseleave', Swal.resumeTimer)
		      }
		 	})

		    Toast.fire({
		      icon: 'success',
		      title: '인증메일이 전송중입니다... 잠시만 기다려주세요'
		    });
		
		
		if($('input[name=userEmail1]').val() == ""){
			
			swal.fire({
				  title: "이메일 인증 오류!",
				  text: "이메일을 입력해주세요",
				  icon: "error",
				})
			return;
		}
		
		const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		

		$.ajax({
			type : 'get',
			url : 'mailCheck.do?email=' + eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function(data) {
				console.log("data : " + data);
				checkInput.attr('disabled', false);
				code = data;
				Swal.fire({
				      icon: 'success',
				      title: '인증번호가 전송되었습니다',
				      text: '이메일 확인 후 인증번호를 입력해주세요',
				    });
	
			},
			error : function() {
				alert("에러입니다.")
			}
		}); // end ajax
	}); // end send eamil

	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(
			function() {
				const inputCode = $(this).val();
				const $resultMsg = $('#mail-check-warn');
				const passwordInput = $('.password-check-input');
				const passwordInput2 = $('.password-check-input2');

				if (inputCode === code) {
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color', 'green');
					passwordInput.attr('disabled', false);
					passwordInput2.attr('disabled', false); 
					$('#mail-Check-Btn').attr('disabled', true);
					$('#userEamil1').attr('readonly', true);
					$('#userEamil2').attr('readonly', true);
					$('#userEmail2').attr('onFocus',
							'this.initialSelect = this.selectedIndex');
					$('#userEmail2').attr('onChange',
							'this.selectedIndex = this.initialSelect');
				} else {
					$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
					$resultMsg.css('color', 'red');
				}
			});
</script>

</html>