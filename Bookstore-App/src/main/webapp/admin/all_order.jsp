<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử đơn hàng</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<h4 class="text-center mt-3 p-4">Lịch sử đơn hàng</h4>

	<table class="table table-hover">
		<thead class="thead-light maincolor text-white">
			<tr>
				<th scope="col">ID Đơn hàng</th>
				<th scope="col">Tên khách hàng</th>
				<th scope="col">Email</th>
				<th scope="col">Địa chỉ</th>
				<th scope="col">Điện thoại</th>
				<th scope="col">Tên sách</th>
				<th scope="col">Tác giả</th>
				<th scope="col">Giá</th>
				<th scope="col">Phương thức thanh toán</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
			List<Book_Order> blist = dao.getAllOrder();
			for (Book_Order b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFullAdd()%></td>
				<td><%=b.getPhone()%></td>
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
	</div>
	</div>
	</div>
	</div>

</body>
</html>