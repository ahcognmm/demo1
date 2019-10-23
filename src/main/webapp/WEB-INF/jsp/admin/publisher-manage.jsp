<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		                <h1 class="have-margin" style="padding-bottom:5px">Kho sách hiện có ${totalBook} sách <a href="${pageContext.request.contextPath }/admin/publisher-manage/add"><button type="button" class="btn btn-secondary">Thêm NXB</button></a></h1>
		                <div class="dashboard-order have-margin">
							    <table class="table-responsive-2 list">
							        <thead>
								        <tr>
								            <th>Tên NXB</th>
								            <th>Địa chỉ</th>
								            <th>Số điện thoại</th>
								            <th>Tùy chọn</th>
								        </tr>
							        </thead>
							        <tbody>
							        	<c:forEach items="${publishers}" var="thePublisher">
								        	<tr>
								                  <td>${thePublisher.name}</td>
								                  <td>${thePublisher.address}</td>
								                  <td>${thePublisher.phone }</td>
								                  <td>	
								                  	<div class="btn-group" role="group" aria-label="Basic example">
														  <a href="${pageContext.request.contextPath }/admin/publisher-manage/update?id=${thePublisher.id}"><button type="button" class="btn btn-secondary">Sửa</button></a>
														  <a href="${pageContext.request.contextPath }/admin/publisher-manage/delete?id=${thePublisher.id}"><button type="button" class="btn btn-primary">Xóa</button></a>
													</div>
								                  </td>
								            </tr>
							        	</c:forEach>
							        	
							                   
							        </tbody>
							    </table>
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



