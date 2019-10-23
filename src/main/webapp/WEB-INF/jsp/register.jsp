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

	<div class="user-login-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="login-title text-center mb-30">
							<h2>Đăng ký</h2>
							
						</div>
					</div>
					<div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
						<div class="billing-fields">
						<form:form action="${pageContext.request.contextPath}/register/processRegistrationForm"
								modelAttribute="newUser" method="POST">
							<div class="single-register">
									<label>Tên tài khoản<span>*</span></label>
									<form:input path="userName"></form:input>	
									<form:errors path="userName" style="color:red" />
							</div>
							
							<div class="single-register">	
									<label>Mật khẩu<span>*</span></label>
									<form:password path="password"></form:password>
									<form:errors path="password" style="color:red" />			
							</div>
							<div class="single-register">
								
									<label>Nhập lại mật khẩu<span>*</span></label>
									<input type="password" />
							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">
											<label>Họ đệm<span></span></label>
											<form:input path="firstName"></form:input>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">
											<label>Tên<span></span></label>
											<form:input path="lastName"></form:input>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">
										
										<label>Email<span>*</span></label>
										<form:input path="email"></form:input>
										<form:errors path="email" style="color:red" />
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">									
										<label>Số điện thoại<span></span></label>
										<form:input path="phoneNumber"></form:input>
										<form:errors path="phoneNumber" style="color:red" />									
									</div>
								</div>
							</div>

							
							<div class="single-register-3">
								<input id="rememberme" type="checkbox" name="rememberme" value="forever">
								<label class="inline">Tôi đồng ý <a href="#">Điều khoản &amp; Điều kiện</a></label>
							</div>
							<div class="single-register">
								<button type="submit" class="btn btn-success"  >Đăng ký</button>
							</div>
						</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- Registration Form -->
	<%-- <div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">
			
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign Up	</div>
				</div>
				<div style="padding-top: 30px" class="panel-body">
					<form:form action="${pageContext.request.contextPath}/register/processRegistrationForm"
					modelAttribute="newUser" class="form-horizontal" method="POST">
						<!-- Check for registration error -->
						<c:if test="${alreadyUserError != null}">
							<div class="alert alert-danger col-xs-offset-1 col-xs-10">
							${alreadyUserError}
							</div>
						</c:if>
						
					
						<!-- User name -->
						<form:input style="margin-top: 25px" path="userName" placeholder="Tên tài khoản (*)" class="form-control" />
						<form:errors path="userName" style="color:red" />
						
						<!-- Password -->
						<form:password style="margin-top: 25px" path="password" placeholder="Mật khẩu(*)" class="form-control" />
						<form:errors path="password" style="color:red" />
						
						<form:input style="margin-top: 25px" path="firstName" placeholder="Họ đêm" class="form-control" />
  						
  						<form:input style="margin-top: 25px" path="lastName" placeholder="Tên" class="form-control" />
  						
  						<form:input style="margin-top: 25px" path="email" placeholder="Email(*)" class="form-control" />
  						<form:errors path="email" style="color:red"/>
  						
  						<form:input style="margin-top: 25px" path="phoneNumber" placeholder="Số điện thoại" class="form-control" />
  											
						<button style="margin-top:10px" type="submit" class="btn btn-primary">Register</button>
					</form:form>
				</div>
			</div>
		</div> --%> <!--End register container  -->
	<%@ include file="common/footer.jsp" %>
	<%@ include file="common/script.jsp" %>
</body>
</html>