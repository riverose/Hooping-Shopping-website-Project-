<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href=/ping/resources/img/favicon.ico " rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ping/resources/css/style.css" rel="stylesheet">
<link href="/ping/resources/css/profile.css" rel="stylesheet">
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
<div class="container-fluid pt-5">
   <section class="signUp-section" style="text-align: center;">

      <h2 class="section-title px-5">
         <span class="px-2">PROFILE UPDATE</span>
      </h2>
      <div class="contact-form">
         <div id="success"></div>
         <form action="/ping/member/memberUpdate.do" method="post" name="sentMessage" onkeydown="checkSpace()" id="contactForm" novalidate="novalidate">
            <div class="profile-control-group">
               <span class="profile-subtitle">로그인 정보</span>
               <div class="login-email">
                  <span class="login-email-text" style="margin-left: 44.5%;">이메일 주소</span><br />
               </div>
               <input type="text" class="form-control profile-form-control" onkeydown="checkSpace()" id="email" name="memberEmail"
               required="required" data-validation-required-message="Please enter your name" value="${sessionScope.memberEmail}" readonly="readonly"/>
            </div>
            <div class="profile-control-group">
               <div class="login-email">
                  <span class="login-email-text" style="margin-left: 45.5%;">비밀번호</span><br />
               </div>
               <input type="password" class="form-control profile-form-control" onkeydown="checkSpace()" id="pwd" name="memberPwd"
               required="required" data-validation-required-message="Please enter your name" value="${sessionScope.memberPwd}"/>
            </div>
            <div class="profile-control-group">
               <span class="profile-subtitle">개인 정보</span><br />
               <div class="login-email">
                  <span class="login-email-text" style="margin-left: 47.5%;">이름</span><br />
               </div>
               <input type="text" class="form-control profile-form-control" onkeydown="checkSpace()" id="name" name="memberName"
               required="required" data-validation-required-message="Please enter your email" value="${sessionScope.memberName}"/>
            </div>
            <div class="profile-control-group">
               <span class="login-password-text">휴대폰 번호</span><br /> 
               <input type="text" class="form-control profile-form-control" onkeydown="checkSpace()" id="phoneNum" name="memberPhoneNum"
               required="required" data-validation-required-message="Please enter your email" value="${sessionScope.memberPhoneNum}" />

            </div>
            <div class="profile-control-group">
               <span class="login-password-text">주소</span><br /> 
               <input type="text" class="form-control profile-form-control" onkeydown="checkSpace()" id="address" name="memberBaseAddress"
               required="required" data-validation-required-message="Please enter your email" value="${sessionScope.memberBaseAddress}"/>

            </div>
            <div class="profile-control-group">
               <span class="login-password-text">인스타그램</span><br /> 
               <input type="text" class="form-control profile-form-control" onkeydown="checkSpace()" id="instaId" name="memberInstagramId"
               required="required" data-validation-required-message="Please enter your email" value="${sessionScope.memberInstagramId}"/>

            </div>

            <div class="btn-div">
                  <button type="submit" class="btn btn-dark login-button">저장하기</button>
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
          var getName= RegExp(/^[가-힣]+$/);
          var getCheckId= RegExp(/^[a-zA-Z0-9]|[a-zA-Z0-9]+[._]|[._]+[a-zA-Z0-9]{4,12}$/);
          var getPhoneNum = RegExp(/^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/); //형식 설정
         //이메일 공백 확인
         if ($("#email").val() == "") {

            swal.fire({
					  title: "입력 오류!",
					  text: "이메일을 입력해주세요",
					  icon: "error",
					})
            $("#email").focus();
            return false;
         }
         //비밀번호란 공백 확인
         if ($("#pwd").val() == "") {
            
            swal.fire({
				  title: "입력 오류!",
				  text: "비밀번호를 입력해주세요",
				  icon: "error",
				})
            $("#pwd").focus();
            return false;
         }  
         //비밀번호 확인란 공백 확인
          if($("#pwdCheck").val() == ""){
              
              swal.fire({
				  title: "입력 오류!",
				  text: "비밀번호 확인란을 입력해주세요",
				  icon: "error",
				})
              $("#pwdCheck").focus();
              return false;
          }
         //이름 공백 검사
          if($("#name").val() == ""){
        	  
        	  swal.fire({
				  title: "입력 오류!",
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
				  title: "입력 오류!",
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
				  title: "입력 오류!",
				  text: "주소를 입력해주세요",
				  icon: "error",
				})
				
            $("#address").focus();
            return false;
         }
         //인스타 공백 검사
         if ($("#instaId").val() == "") {
        	 
        	 swal.fire({
				  title: "입력 오류!",
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
   
   function checkEmail(){
       var email = $('#email').val(); //id값이 "id"인 입력란의 값을 저장
       $.ajax({
           url:'memberUsing.do', //Controller에서 요청 받을 주소
           type:'post', //POST 방식으로 전달
           data:{'memberEmail':email},
           dataType : 'text',
           success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
               if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                   $('#emailAlready').css("display", "none");
               } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                   $('#emailAlready').css("display","inline-block");
                   alert("이미 사용중인 메일주소입니다");
                   $('#email').val('');
               }
           },
           error :function(request, status, error){       //요청 실패시 에러 확인을 위함
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              }
       });
   };
   
   function checkSpace(){
      var kcode = event.keyCode;
      if(kcode == 32) event.returnValue = false;
      
   };
   
</script>

</html>