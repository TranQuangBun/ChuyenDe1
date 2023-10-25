<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBook - Đăng nhập</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body
	style="background-image: url(img/registerbg.jpg); background-size: cover; background-repeat: no-repeat;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-cody">
						<h4 class="text-center text m-2">Đăng Nhập</h4>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1" class="m-2"> Địa chỉ
									Email</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Email" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="m-2">Mật khẩu</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Mật khẩu"
									required="required" name="password">
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Lưu thông tin</label>
							</div>
							<div class="text-center p-1 m-2">
								<button type="submit" class="btn btn-primary">Đăng nhập</button>
								<br> <a href="register.jsp">Đăng ký tài khoản</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>