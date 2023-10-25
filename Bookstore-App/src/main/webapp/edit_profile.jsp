<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin người dùng</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container ">
		<div class=row>
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h3 class="text-center text-success p-1">Chỉnh sửa thông tin</h3>


						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<form action="update_profile" method="post">

							<input type="hidden" value="${userobj.id}" name="id">

							<div class="form-group">
								<label for="exampleInputEmail1">Họ tên:</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="fname" value="${userobj.name}">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Email:</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email" value="${userobj.email}">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Số điện thoại:</label> <input
									name="price" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phone" value="${userobj.phone}">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Mật khẩu:</label> <input
									name="price" type="password" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="password">
							</div>
	

							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-3">Hoàn
									thành</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

