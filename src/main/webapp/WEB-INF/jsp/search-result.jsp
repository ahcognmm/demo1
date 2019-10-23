<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<li><a href="#">Trang chủ</a></li>
								<li><a href="#" class="active">Tìm kiếm</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		<!-- shop-main-area-start -->
		<div class="shop-main-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="shop-left">
							<div class="section-title-5 mb-30">
								<h2>Tùy chọn tìm kiếm</h2>
							</div>
							<div class="left-title mb-20">
								<h4>Thể loại</h4>
							</div>
							<div class="left-menu mb-30">
								<ul>
									<c:forEach items="${categories}" var="category" >
										<li><a href="${pageContext.request.contextPath }/shopping/search/withCategory?id=${category.id}&page=1">${category.name }</a></li>
									</c:forEach>	
								</ul>
							</div>
							
							<div class="left-title mb-20">
								<h4>Nhà xuất bản</h4>
							</div>
							<div class="left-menu mb-30">
								<ul>
									<c:forEach items="${publishers}" var="publisher" >
										<li><a href="${pageContext.request.contextPath }/shopping/search/withPublisher?id=${publisher.id}&page=1">${publisher.name }</a></li>
									</c:forEach>	
								</ul>
							</div>
	
						</div>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
						
						<div class="section-title-5 mb-30">
							<h2>Kết quả tìm kiếm sách</h2>
						</div>
						<div class="toolbar mb-30">
							<div class="shop-tab">
								<div class="tab-3">
									<ul>
										<li class="active"><a href="#th" data-toggle="tab"><i class="fa fa-th-large"></i>Grid</a></li>
									</ul>
								</div>
								<div class="list-page">
									<p>Tìm thấy ${books.size()} cuốn sách phù hợp với bạn </p>
								</div>
							</div>
							
							<div class="toolbar-sorter">
								<span>Sắp xếp theo</span>
								<select id="sorter" class="sorter-options" data-role="sorter">
									<option selected="selected" value="name"> Tên </option>
									<option value="popular"> Phổ biến </option>
									<option value="price"> Giá </option>
								</select>
								<a href="#"><i class="fa fa-arrow-up"></i></a>
							</div>
						</div>
						<!-- tab-area-start -->
						<div class="tab-content">
							<div class="tab-pane active" id="th">
							    <div class="row">
							    	<c:forEach items="${books}" var="book">
							      	  <div class="col-lg-3 col-md-4 col-sm-6">
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
						<!-- tab-area-end -->
						<!-- pagination-area-start -->
						<div class="pagination-area mt-50">
							
							<div class="page-number">
								<nav aria-label="...">
								  <ul class="pagination pagination-sm">
								  <c:forEach  var="page" begin="1" end="${totalPage}"> 
									  <c:if test="${type == 'book'}">
										  	<c:if test="${page == currentPage }">
										  		<li class="page-item disabled">
										      	<a class="page-link" href="${pageContext.request.contextPath }/shopping/search/withName?page=${page}&query=${query}" tabindex="-1">${currentPage }</a>
										    </li>
										  	</c:if>
										  	<c:if test="${page != currentPage }">
										   		 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/shopping/search/withName?page=${page}&query=${query}">${page}</a></li>
										  	</c:if>
										</c:if>
										<c:if test="${type == 'category'}">
										  	<c:if test="${page == currentPage }">
										  		<li class="page-item disabled">
										      	<a class="page-link" href="${pageContext.request.contextPath }/shopping/search/withCategory?page=${page}&id=${categoryId}" tabindex="-1">${currentPage }</a>
										    </li>
										  	</c:if>
										  	<c:if test="${page != currentPage }">
										   		 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/shopping/search/withCategory?page=${page}&id=${categoryId}">${page}</a></li>
										  	</c:if>
										</c:if>
										<c:if test="${type == 'publisher'}">
										  	<c:if test="${page == currentPage }">
										  		<li class="page-item disabled">
										      	<a class="page-link" href="${pageContext.request.contextPath }/shopping/search/withPublisher?page=${page}&id=${publisherId}" tabindex="-1">${currentPage }</a>
										    </li>
										  	</c:if>
										  	<c:if test="${page != currentPage }">
										   		 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/shopping/search/withPublisher?page=${page}&id=${publisherId}">${page}</a></li>
										  	</c:if>
										</c:if>
								   </c:forEach>
								  </ul>
								</nav>
							</div>
						</div>
						<!-- pagination-area-end -->
					</div>
				</div>
			</div>
		</div>
		<!-- shop-main-area-end -->
		
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