<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ page import="com.bookstore.model.*"%>
      
<!DOCTYPE html>  
<html>
<body>
<!-- Header -->
		 <header>
			<!-- header-top-area-start -->
			<div class="header-top-area">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<!-- <div class="language-area">
								<ul>
									<li><img src="/img/flag/1.jpg" alt="flag" /><a href="#">Tiếng Việt<i class="fa fa-angle-down"></i></a>
										<div class="header-sub">
											<ul>
												<li><a href="#"><img src="img/flag/2.jpg" alt="flag" />france</a></li>
												<li><a href="#"><img src="img/flag/3.jpg" alt="flag" />croatia</a></li>
											</ul>
										</div>
									</li>
									
								</ul>
							</div> -->
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="account-area text-right">
								<ul>
									<security:authorize access="isAnonymous()">
										<li><a href="${pageContext.request.contextPath }/register/showRegistrationForm">Đăng ký</a></li>
										<li><a href="${pageContext.request.contextPath }/login">Đăng nhập</a></li>
									</security:authorize>
									<security:authorize access="isAuthenticated()">
										<li><a href="${pageContext.request.contextPath }/">Xin chào <security:authentication property="principal.username"/></a></li>
										<li><a href="${pageContext.request.contextPath }/user/account/edit">Quản lý tài khoản xxxx</a></li>
										<security:authorize access="hasRole('ADMIN')">
											<li><a href="${pageContext.request.contextPath }/admin/book-manage">Quản lý trang web</a></li>
										</security:authorize>
										<li><a href="${pageContext.request.contextPath }/logout">Đăng xuất</a></li>
									</security:authorize>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- header-top-area-end -->
			<!-- header-mid-area-start -->
			<div class="header-mid-area ptb-40">
				<div class="container">
					<div class="row">
						<div class="col-lg-5 col-md-5 col-sm-3 col-xs-12">
							<div class="logo-area text-center logo-xs-mrg">
								<a href="${pageContext.request.contextPath }/" class="navbar-brand">Book <span>Store</span></a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<div class="header-search">
								<form action="${pageContext.request.contextPath }/shopping/search/withName" id="form-search" >
									<input class="search__field" type="text" name="query" placeholder="Tìm kiếm tại đây..." />
									<input style="display:none" name="page" value="1"/>
									<a href="javascript:{}" onclick="document.getElementById('form-search').submit();"><i class="fa fa-search"></i></a>
								</form>
							</div>
						</div>
						
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
							<div class="my-cart">
								<ul>
									<li>
										<security:authorize access="isAuthenticated()">
											<a href="${pageContext.request.contextPath }/users/${userId}/carts/${cartId}"><i class="fa fa-shopping-cart"></i>Giỏ hàng</a>
											<span>${bookMap.size()}</span>
										</security:authorize>
										<security:authorize access="isAnonymous()">
											<a href="${pageContext.request.contextPath }/login"><i class="fa fa-shopping-cart"></i>Giỏ hàng</a>
											<span>0</span>
										</security:authorize>
										<div class="mini-cart-sub">
										<security:authorize access="isAuthenticated()">
											<div class="cart-product">
											
												<c:if test="${bookMap.size()!= 0}">
													<ul>
														<c:forEach items="${bookMap}" var="entry">
															<li>
																<div class="single-cart">
																	<div class="cart-img">
																	
																		<a href="#"><img src="${entry.key.image }" alt="book" /></a>
																	</div>
																	
																	<div class="cart-info">
																		<h5><a href="#"></a></h5>
																		<p>${entry.value} cuốn x ${entry.key.price }đ </p>
																	</div>
																	<div class="cart-icon">
																	    <a href="${pageContext.request.contextPath }/users/${userId }/carts/${cartId}/delete?bookId=${entry.key.id}"><i class="fa fa-remove"></i></a>
																	</div>
																</div>
															</li>
														
														</c:forEach>	
													</ul>
												</c:if>
											</div>
												
													
												<div class="cart-totals">
													
														<h5>Tổng <span>${cart.totalPrice}</span></h5>
													

												</div>
											<div class="cart-bottom">
												<a class="view-cart" href="${pageContext.request.contextPath }/users/${userId}/carts/${cartId}">Xem giỏ hàng</a>
												<a href="${pageContext.request.contextPath }/checkout/shipping">Thanh toán</a>
											</div>
											</security:authorize>
										</div> <!-- end mini cart -->
									
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- header-mid-area-end -->
			<!-- main-menu-area-start -->
			<div class="main-menu-area hidden-sm hidden-xs sticky-header-1" id="header-sticky">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="menu-area">
								<nav>
									<ul>
										<li class="active"><a href="${pageContext.request.contextPath }/">Trang chủ<i class="fa fa-angle-down"></i></a>
											
										</li>
										<li><a href="product-details.html">Sách<i class="fa fa-angle-down"></i></a>
											<div class="mega-menu">
												<span>
													<a href="#" class="title">Thể loại</a>
													<c:forEach items="${categories}" var="category" >
														<a href="${pageContext.request.contextPath }/shopping/search/withCategory?id=${category.id}&page=1">${category.name }</a>
													</c:forEach>	

												</span>
												<span>
													<a href="#" class="title">Nhà xuất bản</a>
													<c:forEach items="${publishers}" var="publisher" >
														<a href="${pageContext.request.contextPath }/shopping/search/withPublisher?id=${publisher.id}&page=1">${publisher.name }</a>
													</c:forEach>	
												</span>																
											</div>									
										</li>	
									</ul>
								</nav>
							</div>
							<div class="safe-area">
								<a href="${pageContext.request.contextPath }/shopping/contact">Liên hệ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- main-menu-area-end -->
			
		</header>	
</body>
</html>