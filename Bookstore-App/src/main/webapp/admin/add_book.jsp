<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sách / truyện</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="contaier">
		<div class="row mt-3 p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Thêm sách / truyện</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="../BookAdd" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Tên sách</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Tên tác giả</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Giá </label> <input name="price"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="inputState">Loại sách</label> <select
									id="inputState" name="btype" class="form-control">
									<option selected>----- Lựa chọn -----</option>
									<option value="New Book">Sách mới</option>
									<option value="Old Book">Sách cũ</option>

								</select>
							</div>

							<div class="form-group mt-3">
								<label for="inputState">Trạng thái sách</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>----- Lựa chọn -----</option>
									<option value="Active">Đã kích hoạt</option>
									<option value="Not Active">Chưa kích hoạt</option>
								</select>
							</div>

							<div class="form-group p-2 mt-3 mb-3">
								<label for="exampleFromControlFile1"> <b>Tải ảnh bìa</b>
								</label> <input name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Thêm</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>