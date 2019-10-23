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
							<h2>Yêu cầu khôi phục mật khẩu</h2>
						</div>
					</div>
					<div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
						<div class="login-form">
							<form:form action="${pageContext.request.contextPath}/forgot-password/sent-email" method="POST" >
								
								<div class="single-login">
									<label>Email<span>*</span></label>
									<input type="email" name="email"/>
								</div>
								<div class="single-login single-login-2">
									<button type="submit" class="btn btn-success" value="Login" >Khôi phục mật khẩu</button> 
									
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