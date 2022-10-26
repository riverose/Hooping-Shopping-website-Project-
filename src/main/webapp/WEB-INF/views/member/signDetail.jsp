<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 	 <link href="/ping/resources/css/jyp.css" rel="stylesheet">
     <!-- Customized Bootstrap Stylesheet -->
     <link href="/ping/resources/css/style.css" rel="stylesheet">
     <link href="/ping/resources/css/signUp.css" rel="stylesheet">

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Document</title>
	<script type="text/javascript" src="../resources/js/jquery-1.7.1.js"></script>
	<script  src="../resources/js/js_userinput.js?ver=1"></script>
	
	<!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-fluid pt-5">
    <section class="signUp-section">

        <div class="signUp-logo">
				<h2 class="section-title px-5">
					<span class="px-2">SIGN Detail</span>
				</h2>
			</div>

        <div class="contact-form">

            <div id="success"></div>
            <form action="memberJoin.do" method="post" name="memberJoin" id="memberJoin">
            	
            	<input type="hidden" name="userEmail1" value= "${MemberVO.userEmail1 }"/>
            	<input type="hidden" name="userEmail2" value= "${MemberVO.userEmail2 }"/>
            	<input type="hidden" name="memberPwd" value= "${MemberVO.memberPwd }"/>
                <div class="control-group">
                    <div class="login-email">
                        <span class="login-email-text">이름</span><br/>
                    </div>
                    <input name="memberName" type="text" onkeydown="checkSpace()" class="form-control" id="name" 
                        required="required" data-validation-required-message="Please enter your name" />
                    <p class="help-block text-danger"></p>
                </div>
                <div class="control-group">
                    <span class="login-password-text">전화번호</span><br/>
                    <input name="memberPhoneNum" type="text" onkeydown="checkSpace()" class="form-control" id="phoneNum"
                        required="required" data-validation-required-message="Please enter your email" />
                </div>      
                <div class="control-group">
                    <span class="login-password-text">기본 배송지</span><br/>
                    <input name="memberBaseAddress" type="text" onkeydown="checkSpace()" class="form-control" id="address"
                        required="required" data-validation-required-message="Please enter your email" />
                </div>       
                 <div class="control-group">
                    <span class="login-password-text">인스타 아이디</span><br/>
                    <input name="memberInstagramId" type="text" onkeydown="checkSpace()" class="form-control" id="instaId"
                        required="required" data-validation-required-message="Please enter your email" />
                </div>           
                
                <div class="btn-div">
                    <button type="button" class="btn btn-dark login-button">가입하기</button>
                </div>
				<span id="idCheckResult" style="width:150px;color:red"></span>
            </form>
            
        </div>

    </section>
    </div>
</body>
<%@include file="../main/footer.jsp"%>
<script>	
	
	$(function(){
	    
		$(".login-button").click(function() {
			var getName= RegExp(/^[가-힣]+$/);
		    var getCheckId= RegExp(/^[a-zA-Z0-9]|[a-zA-Z0-9]+[._]|[._]+[a-zA-Z0-9]{4,12}$/);
		    var getPhoneNum = RegExp(/^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/); //형식 설정
			
		    //이름 공백 검사
		    if($("#name").val() == ""){
		        swal.fire({
					  title: "기입 오류!",
					  text: "이름을 입력해주세요",
					  icon: "error",
					})
		        $("#name").focus();
		        return false;
		    }

		    //이름 유효성 검사
		    if(!getName.test($("#name").val())){
		         swal.fire({
					  title: "이름 형식 오류!",
					  text: "이름은 한글로 입력해주세요",
					  icon: "error",
					})
		        $("#name").val("");
		        $("#name").focus();
		        return false;
		    }
			
		    //전화번호 공백 검사
			if ($("#phoneNum").val() == "") {
				swal.fire({
					  title: "기입 오류!",
					  text: "전화번호를 입력해주세요",
					  icon: "error",
					})
				$("#phoneNum").focus();
				return false;
			}
		    
		    // 전화번호 유효성 검사(숫자)			
			if (!getPhoneNum.test($("#phoneNum").val())) {
				swal.fire({
					  title: "전화번호 형식 오류!",
					  text: "- 없이 숫자만 입력해주세요(11자리)",
					  icon: "error",
					})
				$("#phoneNum").focus();
				return false;
			}
			
			//주소 공백 검사
			if ($("#address").val() == "") {
				swal.fire({
					  title: "기입 오류!",
					  text: "주소를 입력해주세요",
					  icon: "error",
					})
				
				$("#address").focus();
				return false;
			}
			
			//인스타 공백 검사
			if ($("#instaId").val() == "") {
				swal.fire({
					  title: "기입 오류!",
					  text: "인스타 아이디를 입력해주세요",
					  icon: "error",
					})
				$("#instaId").focus();
				return false;
			}
			
			//인스타 유효성 검사
			if (!getCheckId.test($("#instaId").val())) {
				swal.fire({
					  title: "인스타 형식 오류!",
					  text: "인스타 아이디에 한글을 입력할 수 없습니다",
					  icon: "error",
					})
				$("#instaId").focus();
				return false;
			}
			
			$(".login-button").prop("type", "submit");
			
		
		})
	});
	
	function checkSpace(){
		var kcode = event.keyCode;
		if(kcode == 32) event.returnValue = false;
		
	};
	
</script>
</html>