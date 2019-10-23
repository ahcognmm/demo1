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

	<!-- user-login-area-start -->
		<div class="user-login-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="login-title text-center mb-30">
							<h2>Login</h2>
						</div>
					</div>
					<div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
						<div class="login-form">
							<form:form action="${pageContext.request.contextPath}/forgot-password/update-password" method="POST" >
								
								<div class="single-login">
									<label>Mât khẩu mới<span>*</span></label>
									<input type="text" name="new_password"/>
								</div>
								<div class="single-login">
									<label>Nhập lại<span>*</span></label>
									<input type="text" name="re_new_password"/>
								</div>
								<div class="single-login single-login-2">
									<button type="submit" class="btn btn-success" value="Login" >Cập nhật</button> 
									
								</div>
								<a href="${pageContext.request.contextPath }/login">Quay lại trang đăng nhập</a>
							
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