<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/ping/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/ping/resources/css/style.css" rel="stylesheet">
    <link href="/ping/resources/css/consulting.css" rel="stylesheet">
    

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

</head>

<body>
 
 <section>

     <!-- 입점상담 시작 -->
		<div class="container-fluid pt-5">
			<div class="text-center mb-4">
				<h2 class="on-title px-5">
					<span class="px-2">입점상담</span>
				</h2>
			</div>
		     <form action="#" method="post" style="display: flex; flex-direction: column; align-items: center;" >
		     
			     <div class="contact-form">
		      		<div class="form-control" style="margin-top: 10px;" >
		            	<span>회사명</span>
		       		</div>
		            <input type="text" class="form-control" style="margin-bottom: 10px;">
			       	<div class="form-control" style="margin-top: 10px;" >
			            <span>브랜드명</span>
			       	</div>
		            <input type="text" class="form-control" style="margin-bottom: 10px;">
			       	<div class="form-control" style="margin-top: 10px;" >
			            <span>담당자명</span>
			       	</div>
		            <input type="text" class="form-control" style="margin-bottom: 10px;">
			       	<div class="form-control" style="margin-top: 10px;" >
			            <span>전화번호</span>
			         </div>
		            <input type="text" class="form-control" style="margin-bottom: 10px;">
			         <div class="form-control" style="margin-top: 10px;" >
			            <span>회사주소</span>
			         </div>
		            <input type="text" class="form-control" style="margin-bottom: 10px;">
			         <div class="form-control" style="margin-top: 10px;" >
			            <span>회사소개</span>
			         </div>
		            <input type="text" class="form-control" style="margin-bottom: 10px;">
			       	<div class="form-control" style="margin-top: 10px;" > 
			            <span>브랜드 소개서</span>
			       	</div>
		            <input type="text" class="form-control" style="margin-bottom: 50px;">
			        <div class="text-center mb-4">
				        <button type="button" class="btn btn-dark login-button">신청</button> 
			        </div>
			     </div>
		    </form>
    	</div>
    </section>
    <!-- Footer End -->
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>