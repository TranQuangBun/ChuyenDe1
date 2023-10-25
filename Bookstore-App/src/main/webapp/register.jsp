<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	  <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBook - Đăng ký</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body
	style="background-image: url(img/registerbg.jpg); background-size: cover; background-repeat: no-repeat;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text">Đăng Ký</h4>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						<form action="register" method="post">

							<div class="form-group">
								<label for="InputName" class="m-1">Tên của bạn</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="Name" placeholder="Nhập họ tên của bạn"
									required="required" name="fname"> <small id="#"
									class="form-text text-muted">Vui lòng nhập đầy đủ họ và
									tên.</small>
							</div>

							<div class="form-group">
								<label for="InputName" class="m-1">Địa chỉ Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="Name" placeholder="Nhập địa chỉ Email"
									required="required" name="email">
							</div>

							<div class="form-group">
								<label for="InputName" class="m-1">Mật khẩu</label> <input
									type="password" class="form-control" id="exampleInputEmail1"
									aria-describedby="Name" placeholder="Nhập mật khẩu"
									required="required" name="password">
							</div>

							<div class="form-group">
								<label for="InputName" class="m-1">Số điện thoại</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="Name" placeholder="Nhập số điện thoại"
									required="required" name="phone">
							</div>
							<div class="form-check m-2">
								<input class="form-check-input " type="checkbox" value="" id="defaultCheck1" name="check"> 
									<label class="form-check-label" for="defaultCheck1"> Kiểm tra thông tin </label>
							</div>
							<div class="text-center p-1 m-2">
								<button type="submit" class="btn btn-primary">Đăng ký</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>