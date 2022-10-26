<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="/ping/resources/css/jyp.css" rel="stylesheet">
    
<div class="container-fluid align-items-center" >
        
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="${pageContext.request.contextPath }/main.do" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold">
						<span class="text-primary font-weight-bold">&nbsp;<img alt="" src="/ping/resources/img/hooping.png" style="    width: 150px;"></span>
					</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
            	<!-- search{s} -->
                <form action="/ping/product/searchProduct.do">
                    <div class="input-group">
                        <input name="searchKeyword" type="text" class="form-control" placeholder="Search for products"
                        onfocus="this.placeholder=''" onblur="this.placeholder='Search for products'">
                    </div>
                </form>
                <!-- search{e} -->
            </div>
            <%
 	           String memberName=(String)session.getAttribute("memberName");
               String managerEmail=(String)session.getAttribute("managerEmail");
            %>
            <input id="loginId" type="hidden" value="${memberName}">
            <%if(memberName == null){ %>
            
                <%if (managerEmail == null){ %>
            
            <div class="col-lg-3 col-6 text-right" id="headerNotLogin" >
                <a href="${pageContext.request.contextPath }/member/login.do" class=" btn btn-dark btn border" >
                    <span class="badge">로그인</span>
                </a>
                <a href="${pageContext.request.contextPath }/member/signUp.do" class="btn btn-dark btn border" >
                    <span class="badge">회원가입</span>
                </a>
            </div>
            
            	<%}else{  %>
            	 
            	 <div class="col-lg-3 col-6 text-right" id="headerLogin"  >
            	 <h5 class="badge">매니저 로그인</h5>
                <a href="${pageContext.request.contextPath }/member/logout.do" class="btn btn-dark btn border">
                    <span class="badge">로그아웃</span>
                </a>
           		
           		<%} %>
            
            <%}else{ %>
            
            <div class="col-lg-3 col-6 text-right" id="headerLogin"  >
                <a href="${pageContext.request.contextPath }/member/logout.do" class="btn btn-dark btn border">
                    <span class="badge">로그아웃</span>
                </a>
                <a href="${pageContext.request.contextPath }/myPage/myPage.do" class="btn btn-dark btn border">
                    <span class="badge">마이페이지</span>
                </a>
                <a href="${pageContext.request.contextPath }/cart/getCartList.do" class="btn btn-dark btn border">
                    <span class="badge">장바구니</span>
                </a>
            </div>
            <%} %>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    
    <div class="container-fluid" id="home_all1">
        <div class="row border-top px-xl-5" id="home_all2">
            <div class="col-lg-9" id="nav">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0" id="home_all3">
                    <div class="navbar-nav mr-auto py-0" id="nav_center">
                        <div class="nav-item dropdown">
                            <a href="${pageContext.request.contextPath }/main.do" class="nav-link">HOME</a>                        
                        </div>
                        <div class="nav-item dropdown">
                            <a href="${pageContext.request.contextPath }/product/getProductList.do" class="nav-link dropdown-toggle" data-toggle="dropdown">MEN</a>
                            <div class="dropdown-menu rounded-0 m-0" id="drop_menu">
                                <a href="${pageContext.request.contextPath }/product/getProductList.do?gender=M&type=아우터" class="dropdown-item">Outer</a>
                                <a href="${pageContext.request.contextPath }/product/getProductList.do?gender=M&type=티셔츠" class="dropdown-item">T-shirts</a>
                                <a href="${pageContext.request.contextPath }/product/getProductList.do?gender=M&type=팬츠" class="dropdown-item">Pants</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="${pageContext.request.contextPath }/product/getProductList.do" class="nav-link dropdown-toggle" data-toggle="dropdown">WOMEN</a>
                            <div class="dropdown-menu rounded-0 m-0" id="drop_menu">
                                <a href="${pageContext.request.contextPath }/product/getProductList.do?gender=F&type=아우터" class="dropdown-item">Outer</a>
                                <a href="${pageContext.request.contextPath }/product/getProductList.do?gender=F&type=티셔츠" class="dropdown-item">Top</a>
                                <a href="${pageContext.request.contextPath }/product/getProductList.do?gender=F&type=팬츠" class="dropdown-item">Pants</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="${pageContext.request.contextPath }/review/getReviewPage.do" class="nav-link">REVIEW</a>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="${pageContext.request.contextPath }/best/getBestProductList.do?gender=A" class="nav-link">BEST</a>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="${pageContext.request.contextPath }/event/eventList.do" class="nav-link">EVENT</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- -----------------------------------------헤더종료------------------------------------------- -->
    <!-- -----------------------------------------헤더종료------------------------------------------- -->
    <!-- -----------------------------------------헤더종료------------------------------------------- -->
