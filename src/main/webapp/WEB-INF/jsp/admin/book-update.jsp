<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="../common/head.jsp" %>
	<link rel="stylesheet" href="/css/account.css">
</head>
<body >
	<%@ include file="../common/header.jsp" %>
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
		                <h1 class="have-margin" style="padding-bottom:5px">Cập nhật sách </h1>
						<div class="account-profile register-form">
			                <form:form action="${pageContext.request.contextPath }/admin/book-manage/update?id=${book.id }" 
			                				modelAttribute="book" method="POST">
			                		<c:if test="${bindingError != null}">
				                		<div class="form-group error">
	                                        ${bindingError}	
	                        			</div>
                        			</c:if>
								    <div class="form-group">
                                        <label class="control-label" for="full_name">Tên sách </label>
			                            <div class="input-wrap">
			                                <form:input path="name" class="form-control" id="full_name" placeholder="Tên sách muốn thêm"></form:input>
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			<div class="form-group">
                                        <label class="control-label" for="author">Tác giả </label>
			                            <div class="input-wrap">
			                                <form:input path="author" class="form-control" id="author" placeholder="Tác giả sách"></form:input>
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			<div class="form-group">
                                                  <label class="control-label" for="publisher">Nhà xuất bản </label>
			                            <div class="input-wrap">
			                                <form:input path="publisher" class="form-control" id="publisher" placeholder="Nhà xuất bản ..."></form:input>
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			<div class="form-group">
                                                  <label class="control-label" for="category">Thể loại </label>
			                            <div class="input-wrap">
			                                <form:input path="category" class="form-control" id="category" placeholder="Thể loại của sách"></form:input>
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			<div class="form-group">
                                                  <label class="control-label" for="price">Giá tiền </label>
			                            <div class="input-wrap">
			                                <form:input path="price" class="form-control" id="price" ></form:input>
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			<div class="form-group">
                                                  <label class="control-label" for="year">Năm xuất bản </label>
			                            <div class="input-wrap">
			                                <form:input path="year" class="form-control" id="year" ></form:input>
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			<div class="form-group">
                                                  <label class="control-label" for="image">URL ảnh </label>
			                            <div class="input-wrap">
			                                <form:input path="image" class="form-control" id="image" placeholder="Đường dẫn của ảnh bìa"></form:input>	                             
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			<div class="form-group">
                                                  <label class="control-label" for="description">Giới thiệu  </label>
			                            <div class="input-wrap">
			                                <form:input path="description" class="form-control" id="description" placeholder="Giới thiệu chi tiết"></form:input>
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			<div class="form-group">
                                                  <label class="control-label" for="totalInStock">Số lượng </label>
			                            <div class="input-wrap">
			                                <form:input type="number" path="totalInStock" class="form-control" id="totalInStock" placeholder="Số lượng có trong kho..."></form:input>
			                                <span class="help-block"></span>
			                            </div>
                        			</div>
                        			
                        			
                        			<div class="form-group">
			                            <div class="input-wrap margin">
			                                <button type="submit" class="btn btn-info btn-block btn-update">
			                                	Cập nhật

			                                </button>
			                            </div>
                        			</div>
                        			

							</form:form>
							</div>
		
		                  <div class="list-pager">
		                    
		                  </div>
		            </div>
		        </div>
		    </div>
		</div>		<!--end wrap:content-right  -->

	</div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>



