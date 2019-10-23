<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="common/head.jsp" %>
	<link rel="stylesheet" href="/css/account.css">
</head>
<body class="tiki-account">
	<%@ include file="common/header.jsp" %>
	<div class="tiki-account chrome">
  
    	<div class="breadcrumb-wrap">
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12">
		                <ol class="breadcrumb">
		                    <li><a href="/">Trang chủ</a></li>
		                    <li class="active">Quản lý trang web</li>
		                </ol>
		            </div>
		        </div>
		    </div>
		</div>		<!-- end breadcumb-wrap -->
	
		<div class="wrap">
		    <div class="container-full">
		        <div class="row-style-1">
		        
		             <%@ include file="common/menu-left.jsp" %>
		            
				<div class="content-right">
                
                <h1 class="have-margin">Thông tin tài khoản</h1>
		            <div class="account-profile register-form">
                    <form:form modelAttribute="user" class="content" method="post" action="${pageContext.request.contextPath }/user/account/update" id="edit-account">
							<form:input style="display:none" type="text" path="id" class="form-control" value="${userId }"></form:input>
                           <div class="form-group">
                                <label class="control-label" for="first_name">Họ đệm </label>
	                            <div class="input-wrap">
	                                <form:input type="text" path="firstName" class="form-control" id="first_name"  placeholder="Họ đệm"></form:input>
	                            </div>
                        	</div>
                        	 <div class="form-group">
                                <label class="control-label" for="last_name">Tên </label>
	                            <div class="input-wrap">
	                                <form:input type="text" path="lastName" class="form-control" id="last_name"  placeholder="Tên"></form:input>
	                                
	                            </div>
                        	</div>
                        	<div class="form-group">
                                <label class="control-label" for="phone">Số điện thoại: </label>
	                          	<div class="input-wrap">	
	                          		<form:input type="text" path="phoneNumber" class="form-control"  id="phone"></form:input>  
	                          		<c:if test="${error != null}">
	                          			<span class="help-block"> ${error}</span>	
	                          		</c:if>                       
	                          	
								</div>
                        	</div>
                        	<div class="form-group">
                                <label class="control-label" for="form_email" >Email </label>
	                          	<div class="input-wrap">	
	                          		<form:input type="text" disabled="true" path="email" class="form-control"  id="form_email"></form:input>                         
	                          	
								</div>
                        	</div>

                           
                        <div class="form-group">
                            <div class="input-wrap margin">
                                <button type="submit" class="btn btn-info btn-block btn-update">Cập nhật </button>
                            </div>
                        </div>
                    </form:form>
                    <form:form  action="${pageContext.request.contextPath }/user/account/updatePassword">
                      <div class="form-group">
                                  <div class="input-wrap margin">
                                    <label class="checkbox">
                                        Thay đổi mật khẩu
                                   </label>

                            </div>
                        </div>
                        <div class="password-group" style="display: block;">
                            <div class="form-group">
                                <label class="control-label" for="old_password">Mật khẩu cũ</label>
                                <div class="input-wrap">
                                    <input type="password" name="old_password" class="form-control" id="old_password" value="" autocomplete="off" placeholder="Nhập mật khẩu cũ">
                                    <c:if test="${errorPass != null}">
                                    	<span class="help-block">${errorPass }</span>
                                    </c:if>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="control-label" for="new-password">Mật khẩu mới</label>
                                <div class="input-wrap">
                                    <input type="password" name="new_password" class="form-control" id="new_password" value="" autocomplete="off" placeholder="Mật khẩu từ 6 đến 32 ký tự">
                                    <span class="help-block"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="re_new_password">Nhập lại</label>
                                <div class="input-wrap">
                                    <input type="password" name="re_new_password" class="form-control" id="re_new_password" value="" autocomplete="off" placeholder="Nhập lại mật khẩu mới">
                                    <span class="help-block"></span>
                                </div>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="input-wrap margin">
                                <button type="submit" class="btn btn-info btn-block btn-update">Cập nhật mật khẩu</button>
                            </div>
                        </div>
                        </form:form>
                </div>
                </div>
                
		        </div>
		    </div>
		</div>		

	</div>
	
	<%@ include file="common/footer.jsp" %>
</body>
</html>


 

