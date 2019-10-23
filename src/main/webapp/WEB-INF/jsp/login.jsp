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
							<form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST" >
								<!-- Place for messages: error, alert etc ... -->
							    <div class="form-group">
							       
		
										<!-- Check for login error -->
										<c:if test="${param.error != null}">
										<div class="single-login-2">
											<div class="alert alert-danger col-xs-offset-1 col-xs-10">
												Tài khoản hoặc mật khẩu không đúng !
											</div>
										</div>
										</c:if>
										<!-- Kiểm tra có phải vừa logout -->
										<c:if test="${param.logout != null }">
										<div class="single-login-2">
											<div class="alert alert-success col-xs-offset-1 col-xs-10">
												Bạn đã đăng xuất!
											</div>
										</div>
										</c:if>  
								<div class="single-login">
									<label>Tài khoản<span>*</span></label>
									<input type="text" name="username"/>
								</div>
								<div class="single-login">
									<label>Mật khẩu <span>*</span></label>
									<input type="password" name="password"/>
								</div>
								<div class="single-login single-login-2">
									<button type="submit" class="btn btn-success" value="Login" >Đăng nhập</button> 
									<!-- <input id="rememberme" type="checkbox" name="rememberme" value="forever">
									<span>Remember me</span> -->
								</div>
								<a href="${pageContext.request.contextPath }/register/showRegistrationForm">Bạn chưa có tài khoản? Đăng ký !</a>
								<br>
								<a href="${pageContext.request.contextPath }/forgot-password">Quên mật khẩu ? Reset</a>
								
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