<%@page import="java.lang.foreign.Linker.Option"%>
<%@page import="com.entity.BookDtls"%>
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
<title>Sửa sách / truyện</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="contaier">
		<div class="row mt-3 p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Sửa thông tin sách / truyện</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDaopl dao = new BookDaopl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>



						<form action="../editbook" method="post">
						
						<input type="hidden" name="id" value="<%=b.getBookId()%>">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Tên sách</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookname()%>">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Tên tác giả</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Giá </label> <input name="price"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getPrice()%>">
							</div>


							<div class="form-group mt-3">
								<label for="inputState">Trạng thái sách</label> <select
									id="inputState" name="categories" class="form-control">

									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Đã kích hoạt</option>
									<option value="Not Active">Chưa kích hoạt</option>
									<%
									} else {
									%>
									<option value="Active">Đã kích hoạt</option>
									<option value="Not Active">Chưa kích hoạt</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-group p-2 mt-3 mb-3">
								<label for="exampleFromControlFile1"> <b>Tải ảnh bìa</b>
								</label> <input name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Cập nhật sách</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>