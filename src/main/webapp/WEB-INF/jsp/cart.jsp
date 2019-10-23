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
								<li><a href="#">Home</a></li>
								<li><a href="#" class="active">Giỏ hàng</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		<!-- entry-header-area-start -->
		<div class="entry-header-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="entry-header-title">
							<h2>Giỏ hàng của tôi</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- entry-header-area-end -->
		
		<!-- cart-main-area-start -->
		<div class="cart-main-area mb-70">
			<div class="container">
			<form action="${pageContext.request.contextPath }/users/${userId}/carts/${cartId }">
				<div class="row">
					<div class="col-lg-12">
						
								<input  style="display:none" name="bookId" value="${theBook.id}"/>
							<div class="table-content table-responsive">
								<table>
									<thead>
										<tr>
											<th class="product-thumbnail">Hình ảnh</th>
											<th class="product-name">Tên sách</th>
											<th class="product-price">Giá</th>
											<th class="product-quantity">Số lượng</th>
											<th class="product-subtotal">Tổng tiền</th>
											<th class="product-remove">Xóa</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${bookMap }" var="entry" >
										<tr>
											<td class="product-thumbnail"><a href="#"><img src="${entry.key.image }" alt="man" /></a></td>
											<td class="product-name"><a href="${pageContext.request.contextPath }/shopping/book-detail?id=${entry.key.id}">${entry.key.name }</a></td>
											<td class="product-price"><span class="amount">${entry.key.price }đ</span></td>
											
											<td class="product-quantity"><input type="number" name="quantity" value="${entry.value}"></td>
											<td class="product-subtotal">${entry.key.price * entry.value}đ</td>
											<td class="product-remove"><a href="${pageContext.request.contextPath }/users/${userId }/carts/${cartId}/delete?bookId=${entry.key.id}"><i class="fa fa-times"></i></a></td>
										</tr>
										
									</c:forEach>
										
									</tbody>
								</table>
							</div>
						
					</div>
				</div>
				<div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                        <!-- <div class="buttons-cart mb-30">
                            <ul>
                                <li><a>Cập nhật giỏ hàng</a></li>
                                <li><a href="#">Tiếp tục mua sắm</a></li>
                            </ul>
                        </div>
                        <div class="coupon">
                            <h3>Coupon</h3>
                            <p>Nhập coupon nếu bạn có</p>
                            <div>
                                <input type="text" placeholder="Coupon code">
                                <a href="#">Apply Coupon</a>
                            </div>
                        </div> -->
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="cart_totals">
                            <h2>Tổng giỏ hàng</h2>
                            <table>
                                <tbody>
                                    <!-- <tr class="cart-subtotal">
                                        <th>Tạm tính</th>
                                        <td>
                                            <span class="amount">£215.00</span>
                                        </td>
                                    </tr> -->
                                    <!-- <tr class="shipping">
                                        <th>Phí ship</th>
                                        <td>
                                            <ul id="shipping_method">
                                                <li>
                                                    <input type="radio">
                                                    <label>
                                                        Flat Rate:
                                                        <span class="amount">£7.00</span>
                                                    </label>
                                                </li>
                                               
                                            </ul>
                                        </td>
                                    </tr> -->
                                    <tr class="order-total">
                                        <th>Thành tiền</th>
                                        <td>
                                            <strong>
                                                <span class="amount">${cart.totalPrice}đ</span>
                                            </strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="wc-proceed-to-checkout">
                                <a href="${pageContext.request.contextPath }/checkout/shipping">Tiến hành thanh toán</a>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
			</div> <!--  end container-->
		</div>
		<!-- cart-main-area-end -->
	<%@ include file="common/footer.jsp" %>
	<%@ include file="common/script.jsp" %>
</body>
</html>