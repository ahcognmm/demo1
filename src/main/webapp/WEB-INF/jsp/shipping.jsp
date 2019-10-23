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
	
<body class="tiki-shipping">
	<%@ include file="common/header.jsp" %>

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

                    <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4 bs-wizard-step active">
                        <div class="text-center bs-wizard-stepnum">
                            <span class="hidden-xs">Địa Chỉ Giao Hàng</span>
                            <span class="visible-xs-inline-block">Địa Chỉ</span>
                        </div>
                        <div class="progress"><div class="progress-bar"></div></div>
                        <span class="bs-wizard-dot">2</span>
                    </div>

                    <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4 bs-wizard-step disabled">
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
	
	<div class="wrap">
    <div class="container">


		<div class="row row-style-2">
		    <form id="form-address" method="post" action="/checkout/shipping/saving_shipping_address">
				<div class="container">
		                <h5 class="visible-md-block visible-lg-block">Chọn địa chỉ giao hàng có sẵn bên dưới:</h5>
		        </div>
					<!-- List Address -->
		            <div class="row-address-list">
		            <c:forEach items="${addressList }" var="address">
		                <div class="col-lg-6 col-md-6 col-sm-6 item" id="item-1543179">
						    <div class="panel panel-default address-item is-default">
						        <div class="panel-body">
						            <p class="name">${address.fullName }</p>
						            <p class="address" title="Phòng 106-B9-KTX Đại học Bách khoa Hà Nội, Phường Bách Khoa, Quận Hai Bà Trưng, Hà Nội">
						                ${address.address }           </p>

						            <p class="phone">${address.phone }</p>
						            <p class="action">
						                <button type="button" class="btn btn-default btn-custom1 saving-address is-orange" data-id="1543179">
						                 	<a href="${pageContext.request.contextPath }/checkout/payment?addressId=${address.id}">Giao đến địa chỉ này</a>
						                </button>
						                <button type="button" class="btn btn-default btn-custom1 edit-address" data-id="1543179">Sửa</button>
						            </p>
						            <!-- <span class="default">Mặc định</span> -->
						          </div>
						    </div>				  
						</div>
					</c:forEach>
						<!-- <div class="col-lg-6 col-md-6 col-sm-6 item" id="item-5496157">
							    <div class="panel panel-default address-item">
							        <div class="panel-body">
							            <p class="name">xddd ds</p>
							            <p class="address" title="đ, Xã Hòa Nhơn, Huyện Hòa Vang, Đà Nẵng">
							                Địa chỉ: đ, Xã Hòa Nhơn, Huyện Hòa Vang, Đà Nẵng/p>
							            <p class="address">Việt Nam</p>
							            <p class="phone">Điện thoại: 0388372323</p>
							            <p class="action">
							                <button type="button" class="btn btn-default btn-custom1 saving-address is-black" data-id="5496157">
							                                            Giao đến địa chỉ này
							                                    </button>
							                <button type="button" class="btn btn-default btn-custom1 edit-address" data-id="5496157">Sửa</button>
							                                <button type="button" class="btn btn-default btn-custom1 deleting" data-id="5496157">Xóa</button>
							                            </p>
							                    </div>
							    </div>
						</div> -->
		
		             </div> <!--end list address  -->
		                <div class="container">
		            <p class="other">
		                                    Bạn muốn giao hàng đến địa chỉ khác?
		                    <a href="javascript:void(0)" id="addNewAddress">
		                        Thêm địa chỉ giao hàng mới
		                    </a>
		                            </p>
		        </div>
		    </form>
		    <div class="panel panel-default address-form is-edit" style="display: block;"><div class="panel-heading hidden-lg">Thêm địa chỉ giao hàng mới</div>
		<div class="panel-body">
		    <form:form action="${pageContext.request.contextPath }/checkout/payment/newAddress"
		    		modelAttribute="newAddress" class="form-horizontal bv-form" role="form" id="address-info" novalidate="novalidate">
		        <div class="form-group row">
		            <label for="full_name" class="col-lg-4 control-label visible-lg-block">Họ tên </label>
		            <div class="col-lg-8 input-wrap has-feedback">
		                <form:input  path="fullName" type="text" name="full_name" class="form-control address" id="full_name" value="" placeholder="Nhập họ tên" data-bv-field="full_name"></form:input>
		       		</div>
		       </div>
		
		        <div class="form-group row">
		            <label for="telephone" class="col-lg-4 control-label visible-lg-block">Điện thoại di động</label>
		            <div class="col-lg-8 input-wrap has-feedback">
		                <form:input path="phone" type="tel" name="telephone" class="form-control address" id="telephone"  placeholder="Nhập số điện thoại" data-bv-field="telephone"></form:input>
		            <small class="help-block" data-bv-validator="notEmpty" data-bv-for="telephone" data-bv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập Số điện thoại</small><small class="help-block" data-bv-validator="regexp" data-bv-for="telephone" data-bv-result="NOT_VALIDATED" style="display: none;">Số điện thoại không hợp lệ (chỉ chấp nhận số)</small><small class="help-block" data-bv-validator="stringLength" data-bv-for="telephone" data-bv-result="NOT_VALIDATED" style="display: none;">Số điện thoại chỉ được chứa 10 chữ số</small></div>
		        </div>
		
		
		        <div class="form-group row">
		            <label for="street" class="col-lg-4 control-label visible-lg-block">Địa chỉ</label>
		            <div class="col-lg-8 input-wrap has-feedback">
		                <form:textarea path="address" name="street" class="form-control address" id="street" placeholder="Ví dụ: 52, đường Trần Hưng Đạo" data-bv-field="street"></form:textarea>
		                <span class="help-block"></span>
		            <small class="help-block" data-bv-validator="notEmpty" data-bv-for="street" data-bv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập Địa chỉ</small><small class="help-block" data-bv-validator="regexp" data-bv-for="street" data-bv-result="NOT_VALIDATED" style="display: none;">Địa chỉ của bạn không hợp lệ </small></div>
		        </div>

		        
		        <div class="form-group row">
		            <div class="col-lg-offset-4 col-lg-8">
		                <input type="hidden" name="address_id" value="">
		                <button id="btn-address" type="submit" class="btn btn-primary btn-custom3" value="create">Giao đến địa chỉ này</button>
		            </div>
		        </div>
		    </form:form>
		</div>
		</div>
		</div>
		</div>
	</div>

	<%@ include file="common/footer.jsp" %>
	<%@ include file="common/script.jsp" %>
</body>
</html>