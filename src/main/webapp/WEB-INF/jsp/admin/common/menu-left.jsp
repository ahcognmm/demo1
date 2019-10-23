<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<body>
				<div class="menu-left">
		                <div class="profiles">
						    <p class="image"><img src="https://salt.tikicdn.com/desktop/img/avatar.png?v=3" height="45" width="45" alt=""></p>
						    <p class="name">Tài khoản của</p>
						    <h6>Hoàng Lê</h6>
						</div>
					<div class="menu dropdown">
					    <button class="btn btn-default dropdown-toggle btn-block" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					        Danh mục <span class="caret"></span>
					    </button>
					    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					       <li class="active">
					            <a href="${pageContext.request.contextPath }/admin/dashboard"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> </i> <span>Dashboard</span><!-- <span class='noti-nav'>Mới</span> --></a>
					        </li>
					        <li>
					            <a href="${pageContext.request.contextPath }/admin/order-manage?page=1"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> </i> <span>Quản lý đơn hàng</span><!-- <span class='noti-nav'>Mới</span> --></a>
					        </li>
					        <li >
					            <a href="${pageContext.request.contextPath }/admin/book-manage"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> </i> <span>Quản lý sách</span><!-- <span class='noti-nav'>Mới</span> --></a>
					        </li>
					        <li>
					            <a href="${pageContext.request.contextPath }/admin/publisher-manage"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> </i> <span>Quản lý nhà xuất bản</span><!-- <span class='noti-nav'>Mới</span> --></a>
					        </li>
					        <li>
					            <a href="${pageContext.request.contextPath }/admin/category-manage"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> </i> <span>Quản lý danh mục sách</span><!-- <span class='noti-nav'>Mới</span> --></a>
					        </li>
					        <li>
					            <a href="${pageContext.request.contextPath }/admin/feedback-manage?page=1"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> </i> <span>Ý kiến khách hàng</span><!-- <span class='noti-nav'>Mới</span> --></a>
					        </li>
					         
					        <!-- <li class="">
					            <a href="https://tiki.vn/customer/notification"><i class="ico ico-ic-notifications"></i> <span>Thông báo của tôi</span> <span class="num-noti-nav">19</span></a>
					        </li>
					        <li class="">
					            <a href="https://tiki.vn/sales/order/history"> <i class="ico ico-ic-my-order"></i> <span>Quản lý đơn hàng</span></a>
					        </li>
					        <li class="">
					            <a href="https://tiki.vn/customer/address"> <i class="ico ico-ic-location "></i> <span>Sổ địa chỉ</span> </a>
					        </li>
					                <li class="">
					            <a href="https://tiki.vn/customer/paymentcard"><i class="ico ico-ic-credit-card"></i> <span>Thông tin thanh toán </span></a>
					        </li>
					                <li class="">
					            <a href="https://tiki.vn/nhan-xet-san-pham-ban-da-mua"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> Nhận xét sản phẩm đã mua</a>
					        </li>
					        <li class="">
					            <a href="https://tiki.vn/danh-rieng-cho-ban"><i class="ico ico-ic_seen"></i> Sản phẩm bạn đã xem</a>
					        </li>
					
					        <li class="">
					            <a href="https://tiki.vn/customer/wishlist"><i class="ico ico-ic-favorite"></i> <span> Sản phẩm yêu thích</span></a>
					        </li> -->
      
					    </ul>
					</div> <!-- end menu-dropdown -->
		
		        </div> <!-- end content-left -->
</body>
</html>