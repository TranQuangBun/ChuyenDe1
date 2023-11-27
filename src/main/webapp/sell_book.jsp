<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bán sách cũ</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container ">
		<div class=row>
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h3 class="text-center text-success p-1">Đăng bán sách cũ</h3>
						
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						
						<form action="add_old_book" method="post" enctype="multipart/form-data">
						
						<input type="hidden" value="${userobj.email}" name="user">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Tên sách:</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Tác giả:</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Giá tiền:</label> <input
									name="price" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group p-2 mt-3 mb-3">
								<label for="exampleFromControlFile1"> <b>Tải ảnh bìa</b>
								</label> <input name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Hoàn thành</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>