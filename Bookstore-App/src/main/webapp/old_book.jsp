<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDaopl"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sách truyện của bạn</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>

<div class="mt-3 p-3">
	<c:if test="${not empty failedMsg }">
		<h3 class="text-center text-danger">${failedMsg}</h3>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<c:if test="${not empty succMsg }">
		<h3 class="text-center text-success">${succMsg }</h3>
		<c:remove var="succMsg" scope="session" />
	</c:if>
</div>




	<div class="container p-5">
		<table class="table table-hover">
			<thead class="maincolor text-white">
				<tr>
					<th scope="col">Tên sách</th>
					<th scope="col">Tác giả</th>
					<th scope="col">Giá cả</th>
					<th scope="col">Thể loại</th>
					<th scope="col">Thao tác</th>
				</tr>
			</thead>
			<tbody>

				<!-- #18 26.07 -->

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDaopl dao = new BookDaopl(DBConnect.getConn());
				List<BookDtls> list = dao.getBookByOld(email, "Old Book");
				for (BookDtls b : list) {
				%>
				<tr>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a href="delete_old_book?email=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Xóa sách</a></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>

</body>
</html>