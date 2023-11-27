<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đơn hàng của bạn</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<h3 class="text-center text-success p-1 mt-3">Danh sách đơn hàng
		</h3>
		<table class="table table-striped">
			<thead class="maincolor text-white">
				<tr>
					<th scope="col">ID Đơn hàng</th>
					<th scope="col">Tên khách hàng</th>
					<th scope="col">Tên sách</th>
					<th scope="col">Tác giả</th>
					<th scope="col">Giá</th>
					<th scope="col">Phương thức thanh toán</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getBook(u.getEmail());
				for (Book_Order b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUsername()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>

				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>
</body>
</html>