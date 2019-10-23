<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="common/head.jsp" %>
	<link rel="stylesheet" href="/css/shipping.css" />	
	
</head>
	
<body>
	<%@ include file="common/header.jsp" %>
	<div class="tiki-shipping">
		<div class="shipping-header">
    <div class="container">
        <div class="row row-style-1">
            <div class="col-lg-2 visible-lg-block">
                <a href="/">
                    <i class="tikicon icon-logo-blue"></i>
                </a>
            </div>
            <div class="col-lg-8">
                <div class="row bs-wizard">

                    <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4 bs-wizard-step complete">
                        <div class="text-center bs-wizard-stepnum">
                            <span>Đăng Nhập</span>
                        </div>
                        <div class="progress"><div class="progress-bar"></div></div>
                        <span class="bs-wizard-dot">1</span>
                    </div>

                    <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4 bs-wizard-step complete">
                        <div class="text-center bs-wizard-stepnum">
                            <span class="hidden-xs">Địa Chỉ Giao Hàng</span>
                            <span class="visible-xs-inline-block">Địa Chỉ</span>
                        </div>
                        <div class="progress"><div class="progress-bar"></div></div>
                        <span class="bs-wizard-dot">2</span>
                    </div>

                    <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4 bs-wizard-step active">
                        <div class="text-center bs-wizard-stepnum">
                            <span class="hidden-xs">Thanh Toán &amp; Đặt Mua</span>
                            <span class="visible-xs-inline-block">Thanh Toán</span>
                        </div>
                        <div class="progress"><div class="progress-bar"></div></div>
                        <span class="bs-wizard-dot">3</span>
                    </div>

                </div>
            </div>
            
        </div>
    </div>
	</div>
	</div>
 	<div style="margin-top:60px">
	<!-- checkout-area-start -->
		<div class="checkout-area mb-70">
			<div class="container">
				<div class="row">
					<form action="${pageContext.request.contextPath }/checkout/order">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="checkbox-form">
								<h3>Địa chỉ giao hàng</h3>
								<div class="row">
										<div class="col-lg-12 col-md-6 col-sm-6 item" id="item-1543179">
										    <div class="panel panel-default address-chosen is-default">
										        <div class="panel-body">

										            <p class="name">Họ và tên: ${address.fullName }</p>
										             <p class="phone">Số điện thoại: ${address.phone }</p>
										            <p class="address">Địa chỉ: ${address.address } </p>
										            <p class="action">
										           <a href="${pageContext.request.contextPath }/checkout/shipping" class="btn btn-default btn-custom1 edit-address" >Sửa</a>
										           </p>
												  	
								 
										          </div>
										    </div>				  
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="your-order">
								<h3>Đơn hàng</h3>
								<div class="your-order-table table-responsive">
									<table>
										<thead>
											<tr>
												<th class="product-name">Sản phẩm</th>
												<th class="product-number">Số lượng</th>
												<th class="product-total">Tổng </th>
											</tr>							
										</thead>
										<tbody>
											<c:forEach items="${bookMap }" var="entry">
												<tr class="cart_item">
													<td class="product-name">
														${entry.key.name }
													</td>
													<td class="product-number">
														x <strong class="product-quantity">   ${entry.value } quyển</strong>
													</td>
													<td class="product-total">
														<span class="amount">${entry.key.price * entry.value}đ</span>
													</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr class="cart-subtotal">
												<th>Tổng tiền giỏ hàng</th>
												<td><span class="amount">${totalPriceCart }</span></td>
											</tr>
											<tr class="shipping">
												<th>Phí vận chuyển</th>
												<td>
													15000đ	
												</td>
											</tr>
											<tr class="order-total">
												<th>Tổng tiền</th>
												<td><strong><span class="amount">${totalPriceCart + 15000 }đ</span></strong>
												</td>
											</tr>								
										</tfoot>
									</table>
								</div>
								
									<div class="order-button-payment">
										<input type="submit" value="Đặt mua">
									</div>
								</div>
							</div>
							</form>
						</div>
					
				</div>
			</div>
		</div>
		<!-- checkout-area-end -->
		

	<%@ include file="common/footer.jsp" %>
	<%@ include file="common/script.jsp" %>
</body>
</html>