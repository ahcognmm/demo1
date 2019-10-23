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
	
	<!-- breadcrumbs-area-start -->
		<div class="breadcrumbs-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumbs-menu">
							<ul>
								<li><a href="${pageContext.request.contextPath }/"><span>Trang chủ</span></a></li>
								<li><a href="#"><span>${theBook.category}</span></a></li>								
								<li><a href="#" class="active"><span> ${theBook.name}</span> </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- product-main-area-start -->
		<div class="product-main-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
						<!-- product-main-area-start -->
						<div class="product-main-area">
							<div class="row">
							
								<div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
									<div class="flexslider">
										<ul class="slides">
											<li data-thumb="img/thum-2/1.jpg">
											  <img src="${theBook.image }" alt="woman" />
											</li>
											
										</ul>
									</div>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
									<div class="product-info-main" data-id="${theBook.id}">
										<div class="page-title">
											<h1>${theBook.name}</h1>
										</div>
										<div class="product-info-stock-sku">
											
											 	<span>Tác giả: </span>
												<span class="value"><span class="strong">${theBook.author }</span></span>
											<br>
											<span>Tình trạng: </span>
											<c:if test="${theBook.totalInStock > 0}"><span>Còn <span class="strong">${theBook.totalInStock}</span> sản phẩm</span></c:if>
											<c:if test="${theBook.totalInStock == 0}"><span>Hết hàng</span></c:if>
											
											
										</div>
										
										<div class="product-reviews-summary">
											<div class="rating-summary">
												<div class="rating-result" data-value="${theBook.rating }">
		                                        </div>
											</div>
											<div class="reviews-actions">
												<a href="${pageContext.request.contextPath }/shopping/book-detail?id=${theBook.id}#Reviews"><span class="strong">${reviews.size()}</span> nhận xét </a>
												
											</div>
										</div>
										<div class="product-info-price">
											<div class="price-final">
												<span>${theBook.price } đ</span>
												<span class="old-price">${theBook.price +10000}đ</span>
											</div>
										</div>
										<div class="product-add-form">
											<form action="${pageContext.request.contextPath }/users/${userId}/carts/${cartId }/add?" id="cart-add">
												<div class="quality-button">
													<input class="qty" type="number" value="1" name="quantity"/>
												</div>
												<input  style="display:none" name="bookId" value="${theBook.id}"/>
												<security:authorize access="isAuthenticated()">
													<a href="javascript:{}" onclick="document.getElementById('cart-add').submit();">Thêm vào giỏ hàng</a>
												</security:authorize>
												<security:authorize access="isAnonymous()">
													<a href="${pageContext.request.contextPath }/login">Thêm vào giỏ hàng</a>
												</security:authorize>
											</form>
										</div>
										
									</div>
								</div>
							</div>	
						</div>
						<!-- product-main-area-end -->
						<!-- product-info-area-start -->
						<div class="product-info-area mt-80">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li class="active"><a href="#Details" data-toggle="tab">Giới thiệu</a></li>
								<li><a href="#Reviews" data-toggle="tab">Review</a></li>
							</ul>
							<div class="tab-content">
                                <div class="tab-pane active" id="Details">
                                    <div class="valu">
                                      <p> ${theBook.description  }</p>
                                    </div>
                                </div>
                                <div class="tab-pane" id="Reviews">
                                    <div class="valu valu-2">
                                    <div class="review-add">
                                            <h3>Để lại nhận xét của bạn:</h3>
                                            
                                        </div>
                                        <security:authorize access="isAnonymous()">
                                        	<div class="review-add">
                                            <h3><a href="${pageContext.request.contextPath }/login">Đăng nhập để bình luận</a></h3>
                                            
                                        	</div>
                                        </security:authorize>
                                        <security:authorize access="isAuthenticated()">
                                        	
	                                        <form:form action="${pageContext.request.contextPath }/shopping/submit-review"
	                                        		method="POST" modelAttribute="review">
		                                        <div class="review-field-ratings">
		                                            <span>Đánh giá <sup>*</sup></span>
		                                            <div class="control">
		                                                <div class="single-control">
		                                                    
		                                                     <div id="rating" data-value="5"></div>
		                                                     <input name="hdrating" type="hidden" id="hdrating"/>
		                                                     
		                                                </div>
		                                                
		                                            </div>
		                                        </div>
		                                        <div class="review-form">        
		                                            
		                                            <div class="single-form">
		                                                <label>Nhận xét <sup>*</sup></label>		                                             
		                                                <form:textarea path="content" cols="10" rows="4"></form:textarea>
		                                                <form:errors path="content" style="color:red" />		                                                
		                                            </div>

												<form:input path="bookId" value="${theBookID }" cssStyle="display:none" />

											</div>
		                                        <div class="review-form-button">
		                                            <button type="submit" class="btn btn-success" value="Submit" >Đăng bình luận</button> 
		                                        </div>
	                                        </form:form>
                                        </security:authorize>
                                        <div class="section-title  mt-60">
                                            <h2>Nhận xét của khách hàng</h2>
                                        </div>
                                        <ul>
                                        	<c:if test="${reviews.size() !=0 }">
                                        		<c:forEach items="${reviews}" var="review">
                                        		
		                                        	<li>
		                                                
		                                                <div class="review-left">
		                                                    <div class="review-rating">
		                                                        <div><span>Đánh giá</span></div>
		                                                        <div class="rating-result" data-value="${review.rating }">
		                                                           
		                                                        </div>
		                                                    </div>
		                                                    
		                                                </div>
		                                                <div class="review-right">
		                                                    <div class="review-content">
		                                                        <h4>${review.content } </h4>
		                                                    </div>
		                                                    <div class="review-details">
		                                                        <p class="review-author">Người đánh giá: <a href="#">${review.userName }</a></p>
		                                                        <p class="review-date">Đăng vào <span>${review.created_at }</span></p>
		                                                    </div>	
		                                                </div>
		                                            </li>
		                                           </c:forEach>
                                        	</c:if>
                                        	<c:if test="${reviews.size() == 0 }">
                                        		<h5 style="padding-top:10px; color:#337ab7;">Hãy là người bình luận đầu tiên</h5>	
                                        	</c:if>
                                            
                                        </ul>
                                        
                                    </div>
                                </div>
                            </div>	
						</div>
						<!-- product-info-area-end -->
						
						
						
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="shop-left">
							<div class="left-title mb-20">
								<h4>Sách liên quan</h4>
							</div>
							<div class="random-area mb-30">
								<div class="product-active-2 owl-carousel">
									<div class="product-total-2">
										
										<c:forEach items="${relationalBook }" var="book">
											<div class="single-most-product">
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
														</ul>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
										
								</div>
							</div>
							<div class="banner-area mb-30">
								<div class="banner-img-2">
									<a href="#"><img src="/img/banner/33.jpg" alt="banner" /></a>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- product-main-area-end -->
	
	<%@ include file="common/footer.jsp" %>
	<%@ include file="common/script.jsp" %>

	<script type="text/javascript">
		$(function () {
			

			
			$("#rating").hillRate({
				stars: 5,
				valuesStar: [1,2,3,4,5] ,
				nameInput: "hdrating",
				imageStar:  {"default": '/img/js/star-rating/star-empty-gold.png', "full": "/img/js/star-rating/star-full-gold.png"},
				responsive: true

			});
			$(".rating-result").hillRate({
				stars: 5,
				valuesStar: [1,2,3,4,5] ,
				nameInput: "hdrating",
				imageStar:  {"default": '/img/js/star-rating/star-empty-gold.png', "full": "/img/js/star-rating/star-full-gold.png"},
				responsive: true,	
				edit: false
			});
			
		});
	</script>
	
</body>
</html>