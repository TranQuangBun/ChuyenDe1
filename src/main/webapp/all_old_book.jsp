<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaopl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sách / truyện cũ</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-bg:hover {
	background: #fcf7f7;
}
</style>
</head>
<body>

	<%
	User user = (User) session.getAttribute("userobj");
	%>


	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid ">
		<div class="row p-3">
			<%
			BookDaopl dao = new BookDaopl(DBConnect.getConn());
			List<BookDtls> list = dao.getOldBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3 rounded">
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
						if (user == null) {
						%>
						<a href="login.jsp" class="btn btn-danger col-sm ml-1 m-1"> <i
							class="fa-solid fa-cart-shopping"></i> Giỏ hàng
						</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
							class="btn btn-danger col-sm ml-1 m-1"> <i
							class="fa-solid fa-cart-shopping"></i> Giỏ hàng
						</a>
						<%
						}
						%>

						<!-- Details -->
						<a href="view_book.jsp?bid=<%=b.getBookId()%>"
							class="btn btn-success col-sm ml-1 m-1"> <i
							class="fa-solid fa-eye"></i> Chi tiết
						</a>
						<!-- Prices -->
						<a href="" class="btn btn-danger col-sm ml-1 m-1"> <i
							class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%>.000
						</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>