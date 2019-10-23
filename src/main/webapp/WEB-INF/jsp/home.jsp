
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="common/head.jsp" %>
</head>
<body>

	<%@ include file="common/header.jsp" %>
	
	<!-- banner-area-start -->
		<div class="banner-area banner-res-large ptb-35">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="single-banner">
							<div class="banner-img">
								<a href="#"><img src="img/banner/1.png" alt="banner" /></a>
							</div>
							<div class="banner-text">
								<h4>Miễn phí vận chuyển</h4>
								<p>Cho tất cả mặt hàng hơn 100k</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="single-banner">
							<div class="banner-img">
								<a href="#"><img src="img/banner/2.png" alt="banner" /></a>
							</div>
							<div class="banner-text">
								<h4>Bảo đảm hoàn lại tiền</h4>
								<p>100% bảo đảm hoàn tiền</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 hidden-sm col-xs-12">
						<div class="single-banner">
							<div class="banner-img">
								<a href="#"><img src="img/banner/3.png" alt="banner" /></a>
							</div>
							<div class="banner-text">
								<h4>Trả tiền khi giao hàng</h4>
								
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="single-banner mrg-none-xs">
							<div class="banner-img">
								<a href="#"><img src="img/banner/4.png" alt="banner" /></a>
							</div>
							<div class="banner-text">
								<h4>Hỗ trợ</h4>
								<p>SĐT : + 0987.65432</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- banner-area-end -->
		<!-- slider-area-start -->
		<div class="slider-area">
			<div class="slider-active owl-carousel">
				<div class="single-slider pt-125 pb-130 bg-img" style="background-image:url(img/slider/1.jpg);">
				    <div class="container">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="slider-content slider-animated-1 text-center">
                                    
                                    <a href="#">Shop now</a>
                                </div>
                            </div>
                        </div>
				    </div>
				</div>
				<div class="single-slider slider-h1-2 pt-215 pb-100 bg-img" style="background-image:url(img/slider/2.jpg);">
				    <div class="container">
				        <div class="slider-content slider-content-2 slider-animated-1">
                            <h1>Bạn muốn tìm mua sách</h1>
                        </div>
				    </div>
				</div>
			</div>
		</div>
		<!-- slider-area-end -->
		<!-- product-area-start -->
		<div class="product-area pt-95 xs-mb">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title text-center mb-50">
							<h2>Top interesting</h2>
							
						</div>
					</div>
					<div class="col-lg-12">
						<!-- tab-menu-start -->
						<div class="tab-menu mb-40 text-center">
							<ul>
								<li class="active"><a href="#Newbooks" data-toggle="tab">Sách mới</a></li>
								<li><a href="#Purchasebooks"  data-toggle="tab">Bán chạy</a></li>
							</ul>
						</div>
						<!-- tab-menu-end -->
					</div>
				</div>
				<!-- tab-area-start -->
				<div class="tab-content">
					<div class="tab-pane active" id="Newbooks">
                        <div class="tab-active owl-carousel">
                            
                            <c:forEach items="${newBook }" var="book">
                            	<!-- single-product-start -->
	                            <div class="product-wrapper">
	                                <div class="product-img">
	                                    <a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">
	                                        <img src="${book.image }" alt="book" class="primary" />
	                                    </a>
	                                    
	                                    <div class="product-flag">
	                                        <ul>
	                                            <li><span class="sale">new</span></li>
	                                            <li><span class="discount-percentage">-5%</span></li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <div class="product-details text-center">
	                                    <div class="product-rating" data-value="${book.rating }">
	                                       
	                                    </div>
	                                    <div style="height:50px">
	                                    	<h4>
	                                    		<a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">${book.name }</a>
	                                    	</h4>
	                                    </div>
	                                    <div class="product-price">
	                                        <ul>
	                                            <li>${book.price }đ</li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <div class="product-link">
	                                    <div class="product-button">
		                                    <security:authorize access="isAuthenticated()">
												<a href="${pageContext.request.contextPath }/users/${userId}/carts/${cartId }/add?bookId=${book.id}&quantity=1" title="Thêm vào giỏ"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</security:authorize>
											<security:authorize access="isAnonymous()">
												<a href="${pageContext.request.contextPath }/login">Thêm vào giỏ hàng</a>
											</security:authorize>
	                                        
	                                    </div>
	                                    <div class="add-to-link">
	                                        <ul>
	                                            <li><a href="product-details.html" title="Chi tiết"><i class="fa fa-external-link"></i></a></li>
	                                        </ul>
	                                    </div>
	                                </div>	
	                            </div>
	                            <!-- single-product-end -->
                            </c:forEach>
                            
                        </div>
					</div>
					<div class="tab-pane fade" id="Purchasebooks">
                        <div class="tab-active owl-carousel">
                            <c:forEach items="${purchaseBook }" var="book">
                            	<!-- single-product-start -->
	                            <div class="product-wrapper">
	                                <div class="product-img">
	                                    <a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">
	                                        <img src="${book.image }" alt="book" class="primary" />
	                                    </a>
	                                    
	                                    <div class="product-flag">
	                                        <ul>
	                                            
	                                            <li><span class="discount-percentage">-5%</span></li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <div class="product-details text-center">
	                                    <div class="product-rating" data-value="${book.rating }"> </div>
	                                    
	                                    <div style="height:50px">
	                                    	<h4><a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">${book.name }</a></h4>
	                                    </div>
	                                    <div class="product-price">
	                                        <ul>
	                                            <li>${book.price }đ</li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <div class="product-link">
	                                    <div class="product-button">
	                                        <security:authorize access="isAuthenticated()">
											<a href="${pageContext.request.contextPath }/users/${userId}/carts/${cartId }/add?bookId=${book.id}&quantity=1" title="Thêm vào giỏ"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</security:authorize>
											<security:authorize access="isAnonymous()">
												<a href="${pageContext.request.contextPath }/login">Thêm vào giỏ hàng</a>
											</security:authorize>
	                                    </div>
	                                    <div class="add-to-link">
	                                        <ul>
	                                            <li><a href="product-details.html" title="Chi tiết"><i class="fa fa-external-link"></i></a></li>
	                                        </ul>
	                                    </div>
	                                </div>	
	                            </div>
	                            
	                            <!-- single-product-end -->
                            </c:forEach>
                       </div>
                    </div>

				</div>
				<!-- tab-area-end -->
			</div>
			</div>
		
		<!-- product-area-end -->
		<!-- banner-area-start -->
		<div class="banner-area-5 mtb-95">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="banner-img-2">
							<a href="#"><img src="img/banner/5.jpg" alt="banner" /></a>
							<div class="banner-text">
								<h3>Toàn bộ sách Kỹ năng mềm</h3>
								<h2>Giảm giá đến 30%</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- banner-area-end -->
		
		<!-- new-book-area-start -->
		<div class="new-book-area pb-50">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title bt text-center pt-100 mb-30 section-title-res">
							<h2>Sách yêu thích</h2>
						</div>
					</div>
				</div>
				 <div class="row">
					<c:forEach items="${interestingBook}" var="book">
						 <div class="col-lg-3 col-md-2 col-sm-6">
							  <!-- single-product-start -->
                              <div class="product-wrapper mb-40">
                                   <div class="product-img">
			                            <a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">
			                                <img src="${book.image }" alt="book" class="primary" />
			                            </a>
	                                   
			                            <div class="product-flag">
			                                <ul>
			                                    <li><span class="discount-percentage">-5%</span></li>
			                                </ul>
			                            </div>
			                      </div>
			                      <div class="product-details text-center">
			                           <div class="product-rating" data-value="${book.rating }">
	                                       
	                                   	</div>
			                            <div style="height:50px">
			                                 <h4><a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">${book.name }</a></h4>
			                            </div>
			                            <div class="product-price">
			                                 <ul>
			                                      <li>${book.price }đ</li>
			                                 </ul>
			                            </div>
			                        </div>
			                                <div class="product-link">
			                                    <div class="product-button">
			                                        <security:authorize access="isAuthenticated()">
													<a href="${pageContext.request.contextPath }/users/${userId}/carts/${cartId }/add?bookId=${book.id}&quantity=1" title="Thêm vào giỏ"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
													</security:authorize>
													<security:authorize access="isAnonymous()">
														<a href="${pageContext.request.contextPath }/login">Thêm vào giỏ hàng</a>
													</security:authorize>
			                                    </div>
			                                    <div class="add-to-link">
			                                        <ul>
			                                            <li><a href="product-details.html" title="Chi tiết"><i class="fa fa-external-link"></i></a></li>
			                                        </ul>
			                                    </div>
			                                </div>	
                                           	
                                  </div>
                                  <!-- single-product-end -->
							 </div>
						 </c:forEach>  
					</div>
			</div>
		</div>
		<!-- new-book-area-start -->

		<!-- most-product-area-start -->
		<div class="most-product-area pt-50 pb-50">
			<div class="container">
				<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 xs-mb">
						<div class="section-title-2 mb-30">
							<h3>Sách kỹ năng</h3>
						</div>
						<div class="product-active-2 owl-carousel">
							<div class="product-total-2">
							<c:forEach items="${selfhelpBook}" var="book">
								
								<div class="single-most-product bd mb-18">
									<div class="most-product-img">
										<a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}"><img src="${book.image }" alt="book" /></a>
									</div>
									<div class="most-product-content">
										 <div class="product-rating" data-value="${book.rating }">
	                                       
	                                   	</div>
										<h4><a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">${book.name }</a></h4>
										<div class="product-price">
											<ul>
												<li>${book.price }</li>
												<li class="old-price">${book.price+10000 }</li>
											</ul>
										</div>
									</div>
								</div>
								
							</c:forEach>
							</div>
								
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 xs-mb">
						<div class="section-title-2 mb-30">
							<h3>Sách văn học</h3>
						</div>
						<div class="product-active-2 owl-carousel">
							<div class="product-total-2">
							<c:forEach items="${literaryBook}" var="book">
								
								<div class="single-most-product bd mb-18">
									<div class="most-product-img">
										<a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}"><img src="${book.image }" alt="book" /></a>
									</div>
									<div class="most-product-content">
										 <div class="product-rating" data-value="${book.rating }">
	                                       
	                                   	</div>
										<h4><a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">${book.name }</a></h4>
										<div class="product-price">
											<ul>
												<li>${book.price }</li>
												<li class="old-price">${book.price + 10000 }</li>
											</ul>
										</div>
									</div>
								</div>
								
							</c:forEach>
							</div>
								
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 xs-mb">
						<div class="section-title-2 mb-30">
							<h3>Sách kinh tế</h3>
						</div>
						<div class="product-active-2 owl-carousel">
							<div class="product-total-2">
							<c:forEach items="${economicBook}" var="book">
								
								<div class="single-most-product bd mb-18">
									<div class="most-product-img">
										<a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}"><img src="${book.image }" alt="book" /></a>
									</div>
									<div class="most-product-content">
										 <div class="product-rating" data-value="${book.rating }">
	                                       
	                                   	</div>
										<h4><a href="${pageContext.request.contextPath }/shopping/book-detail?id=${book.id}">${book.name }</a></h4>
										<div class="product-price">
											<ul>
												<li>${book.price }</li>
												<li class="old-price">${book.price + 10000 }</li>
											</ul>
										</div>
									</div>
								</div>
								
							</c:forEach>
							</div>
								
						</div>
					</div>
					
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						<div class="block-newsletter">
							<h2>Đăng ký để nhận tin tức mới</h2>
							<p>Bạn luôn luôn nhận được những lợi ích tuyệt vời từ chúng tôi</p>
							<form action="#">
								<input type="text" placeholder="Nhập địa chỉ email của bạn" />
							</form>
							<a href="#">Gửi email</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- most-product-area-end -->
	<%@ include file="common/footer.jsp" %>
	<%@ include file="common/script.jsp" %>
	
	
		<script type="text/javascript">
			$(function() {
				$(".product-rating").hillRate({
					stars: 5,
					valuesStar: [1,2,3,4,5] ,
					imageStar:  {"default": '/img/js/star-rating/star-empty-gold.png', "full": "/img/js/star-rating/star-full-gold.png"},
					responsive: true,	
					edit: false
				});
			});
			
		</script>
	
</body>
</html>