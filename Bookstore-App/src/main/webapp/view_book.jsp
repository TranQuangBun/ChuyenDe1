<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaopl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sách / truyện</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDaopl dao = new BookDaopl(DBConnect.getConn());
	BookDtls b=dao.getBookById(bid);
	%>
	
	
	<div class="container-fluid p-3">
		<div class="row ">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%= b.getPhoto() %>" style="width: 200px; height: 260px"><br>
				<h4 class="mt-3">Tên sách: <span class="text-success"><%= b.getBookname() %></span></h4>
				<h4>Tác giả: <span class="text-success"><%= b.getAuthor() %></span></h4>
				<h4>Loại: <span class="text-success"><%=b.getBookCategory() %></span></h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2 class="p-3 mb-3"><%= b.getBookname() %></h2>
				<div class="row ">
					<div class="col-md-4 text-danger text-center p-2 ">
						<i class="fa-solid fa-money-bills fa-2x"></i>
						<p class="text-uppercase">Tiền mặt</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 ">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p class="text-uppercase">Có thể hoàn trả</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 ">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p class="text-uppercase">Miễn phí vận chuyển</p>
					</div>

				</div>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"> <i
						class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng
					</a> <a href="" class="btn btn-success"> <%= b.getPrice() %>.000 <i
						class="fa-solid fa-dollar-sign"></i></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>