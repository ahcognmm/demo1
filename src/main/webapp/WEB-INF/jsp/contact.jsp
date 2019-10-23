<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="common/head.jsp" %>
	<style type="text/css">
		.errors {
			color: #ff0000;
			font-style: italic;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<%@ include file="common/header.jsp" %>
	<!-- contact-area-start -->
		<div class="contact-area mb-70 mt-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="contact-info">
							<h3>Thông tin liên hệ</h3>
							<ul>
								<li>
									<i class="fa fa-map-marker"></i>
									<span>Địa chỉ: </span>
									Đại học Bách khoa Hà Nội 							
								</li>
								<li>
									<i class="fa fa-envelope"></i>
									<span>Số điện thoại: </span>
									(+84) 38372328
								</li>
								<li>
									<i class="fa fa-mobile"></i>
									<span>Email: </span>
									<a href="#">info@bookstore.com</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="contact-form">
							<h3><i class="fa fa-envelope-o"></i>Để lại tin nhắn</h3>
                            <form:form id="contact-form" action="${pageContext.request.contextPath }/shopping/contact" method="post"
                            		modelAttribute="feedback">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="single-form-3">
                                            <form:input path="name" type="text" placeholder="Họ Tên"></form:input>
                                            <form:errors path="name" cssClass="errors"></form:errors>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="single-form-3">
                                            <form:input path="email" type="email" placeholder="Email"></form:input>
                                            <form:errors path="email" cssClass="errors"></form:errors>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single-form-3">
                                            <form:input path="subject" type="text" placeholder="Chủ đề"></form:input>
                                            <form:errors path="subject" cssClass="errors"></form:errors>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                         <div class="single-form-3">
                                            <form:textarea path="message" placeholder="Nội dung"></form:textarea>
                                            <form:errors path="message" cssClass="errors"></form:errors>
                                            <div><button class="submit" type="submit">Gửi ý kiến</button></div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                            <p class="form-messege"></p>
						</div>	
					</div>
				</div>
			</div>
		</div>
		<!-- contact-area-end -->
	
	<%@ include file="common/footer.jsp" %>
	<%@ include file="common/script.jsp" %>
</body>
</html>