<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htm>
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
		                <h1 class="have-margin" style="padding-bottom:5px">Tổng ${feedbacks.size()} ý kiến </h1>
		                <div class="dashboard-order have-margin">
							    <table class="table-responsive-2 list" >
							        <thead>
								        <tr>
								        	<th>Khách hàng</th>
								        	<th>Email</th>
								            <th>Chủ đề</th>
								            <th>Tin nhắn</th>
								            
								        </tr>
							        </thead>
							        <tbody>
							        	<c:forEach items="${feedbacks}" var="feedback">
								        	<tr>
								        		  
								                  <td>${feedback.name}</td>
								                  <td>${feedback.email}</td>
								                  <td>${feedback.subject}</td>
								                  <td  style="overflow:auto">${feedback.message }</td>							                 
								                 
								            </tr>
							        	</c:forEach>
							        	
							                   
							        </tbody>
							    </table>
							</div>
		
		                  <div class="list-pager">
		                    <nav aria-label="...">
								  <ul class="pagination pagination-sm">
								  <c:forEach  var="page" begin="1" end="${totalPage}"> 
								  	<c:if test="${page == currentPage }">
								  		<li class="page-item disabled">
								      	<a class="page-link" href="${pageContext.request.contextPath }/admin/feedback-manage?page=${page}" tabindex="-1">${currentPage }</a>
								    </li>
								  	</c:if>
								  	<c:if test="${page != currentPage }">
								   		 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/feedback-manage?page=${page}">${page}</a></li>
								    
								  	</c:if>

								   </c:forEach>
								  </ul>
								</nav>
		                  </div>
		            </div>
		        </div>
		    </div>
		</div>		<!--end wrap:content-right  -->

	</div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>

