<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaopl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin sách truyện</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center mt-3 p-4">Quản lý sách / truyện</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-hover">
		<thead class="thead-dark maincolor text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Hình ảnh</th>
				<th scope="col">Tên sách</th>
				<th scope="col">Tác giả</th>
				<th scope="col">Giá bán</th>
				<th scope="col">Thể loại</th>
				<th scope="col">Trạng thái</th>
				<th scope="col">Quản lý</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDaopl dao = new BookDaopl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllBooks();
			for (BookDtls b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhoto()%>"
					style="width: 50px; height: 80px;"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%>.000</td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>

				<td><a href="edit_book.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"> <i
						class="fa-solid fa-pen-to-square"></i> Sửa
				</a> <a href="../detele?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>
						Xóa</a></td>
			</tr>
			<%
			}
			%>


		</tbody>
	</table>

</body>
</html>