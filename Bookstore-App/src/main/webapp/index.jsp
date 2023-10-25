<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDaopl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBook - Sách truyện</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url(img/book.jpg);
	height: 55vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-bg:hover {
	background: #fcf7f7;
}
</style>
</head>
<body>

	<% 
	User user = (User)session.getAttribute("userobj");
	
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2 class="text-center text-success">BBOOK Management System</h2>
	</div>


	<!-- Start Recent Book -->

	<div class="container-fluid ">
		<h3 class="text-center m-4">SÁCH / TRUYỆN GẦN ĐÂY</h3>
		<div class="row">
			<%
			BookDaopl dao2 = new BookDaopl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card-body text-center crd-bg">
					<img alt="" src="book/<%=b.getPhoto()%>"
						style="width: 200px; height: 260px" class="img-thumbnail">
					<h4>
						<p class="text-uppercase mt-1"><%=b.getBookname()%></p>
					</h4>
					<b>
						<p><%=b.getAuthor()%></p>
					</b>
					<p>
						Category:
						<%=b.getBookCategory()%></p>
					<div class="row">
						
						<%
						if(user==null){
						%>
						<a href="login.jsp" class="btn btn-danger col-sm ml-1 m-1"> 
							<i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a> 
						<%
						} else {
						%>
						<a href="cart?bid=<%= b.getBookId()%>&&uid=<%= user.getId() %>" class="btn btn-danger col-sm ml-1 m-1"> 
							<i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a> 
						<%
						}  
						%>

						<!-- Details -->
							<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success col-sm ml-1 m-1"> 
							<i class="fa-solid fa-eye"></i> Chi tiết </a> 
						<!-- Prices -->	
							<a href="" class="btn btn-danger col-sm ml-1 m-1">
							<i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%>.000 </a>
						</div>
				</div>
			</div>
			<%
			}
			%>

			<div class="text-center mt-1">
				<a href="" class="btn btn-danger btn-sm p-3 m-2 text-ưhite">Xem
					tất cả</a>
			</div>
		</div>

		<!-- End Recent Book -->
		
		
		<hr>
		
		
		<!-- Start New Book -->

		<div class="container-fluid ">
			<h3 class="text-center m-4">SÁCH / TRUYỆN MỚI</h3>
			<div class="row">

				<%
				BookDaopl dao = new BookDaopl(DBConnect.getConn());
				List<BookDtls> list = dao.getNewBook();
				for (BookDtls b : list) {
				%>
				<div class="col-md-3">
					<div class="card-body text-center crd-bg">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 200px; height: 260px" class="img-thumbnail">
						<h4>
							<p class="text-uppercase mt-1"><%=b.getBookname()%></p>
						</h4>
						<b>
							<p><%=b.getAuthor()%></p>
						</b>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
							
						<div class="row">
						
						<%
						if(user==null){
						%>
						<a href="login.jsp" class="btn btn-danger col-sm ml-1 m-1"> 
							<i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a> 
						<%
						} else {
						%>
						<a href="cart?bid=<%= b.getBookId()%>&&uid=<%= user.getId() %>" class="btn btn-danger col-sm ml-1 m-1"> 
							<i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a> 
						<%
						}  
						%>

						<!-- Details -->
							<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success col-sm ml-1 m-1"> 
							<i class="fa-solid fa-eye"></i> Chi tiết </a> 
						<!-- Prices -->	
							<a href="" class="btn btn-danger col-sm ml-1 m-1">
							<i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%>.000 </a>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>

			<div class="text-center mt-1">
				<a href="all_new_book.jsp"
					class="btn btn-danger btn-sm p-3 m-2 text-ưhite">Xem tất cả</a>
			</div>
		</div>

		<!-- End New Book -->

		<hr>
		<!-- Start Old Book -->

		<div class="container-fluid ">
			<div class="text-center m-4">
				<h3>SÁCH / TRUYỆN CŨ</h3>
				<br>
				<p>(Xuất bản lâu đời)</p>
			</div>
			<div class="row">
				<%
				BookDaopl dao3 = new BookDaopl(DBConnect.getConn());
				List<BookDtls> list3 = dao3.getOldBook();
				for (BookDtls b : list3) {
				%>
				<div class="col-md-3">
					<div class="card-body text-center crd-bg">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 200px; height: 260px" class="img-thumbnail">
						<h4>
							<p class="text-uppercase mt-1"><%=b.getBookname()%></p>
						</h4>
						<b>
							<p><%=b.getAuthor()%></p>
						</b>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">
						
						<%
						if(user==null){
						%>
						<a href="login.jsp" class="btn btn-danger col-sm ml-1 m-1"> 
							<i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a> 
						<%
						} else {
						%>
						<a href="cart?bid=<%= b.getBookId()%>&&uid=<%= user.getId() %>" class="btn btn-danger col-sm ml-1 m-1"> 
							<i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</a> 
						<%
						}  
						%>

						<!-- Details -->
							<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success col-sm ml-1 m-1"> 
							<i class="fa-solid fa-eye"></i> Chi tiết </a> 
						<!-- Prices -->	
							<a href="" class="btn btn-danger col-sm ml-1 m-1">
							<i class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%>.000 </a>
						</div>
					</div>
				</div>
				<%
				}
				%>


			</div>

			<div class="text-center mt-1">
				<a href="all_old_book.jsp"
					class="btn btn-danger btn-sm p-3 m-2 text-ưhite">Xem tất cả</a>
			</div>
		</div>


		<%@include file="all_component/footer.jsp"%>
		<!-- End Old Book -->
</body>
</html>