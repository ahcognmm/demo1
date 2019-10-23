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
					            <a href="${pageContext.request.contextPath }/user/account/edit"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> <span>Thông tin tài khoản</span></a>
					        </li>
					        <li >
					            <a href="${pageContext.request.contextPath }/user/orders?page=1"><i><img src="https://salt.tikicdn.com/assets/img/icon/ico-review.svg"></i> <span>Đơn hàng đã đặt</span><!-- <span class='noti-nav'>Mới</span> --></a>
					        </li>
     
      
					    </ul>
					</div> <!-- end menu-dropdown -->
					
					
		
		        </div> <!-- end content-left -->
</body>
</html>