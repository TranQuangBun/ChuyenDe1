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
<style type="text/css">
a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	color: #008000;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">

		<c:if test="${not empty userobj}">
			<h3 class="text-center text-success p-3 mt-2 text-uppercase">Xin
				chào ${userobj.name}</h3>
		</c:if>

		<div class="row">
			<div class="col-6 col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book fa-3x"></i>
							<h4 class="mt-3 text-dark">Bán sách/truyện cũ</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-6 col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x"></i>
							<h4 class="mt-3 text-dark">Sách/truyện của bạn</h4>
						</div>
					</div>
				</a>
			</div>


			<div class="col-6 col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-regular fa-id-card fa-3x"></i>
							<h4 class="mt-3 text-dark">Thông tin người dùng</h4>
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-6 mt-3">
				<a href="order_us.jsp">
					<div class="card">
						<div class="card-body text-danger text-center">
							<i class="fa-solid fa-box-archive fa-3x"></i>
							<h4 class="mt-3 text-dark">Đơn hàng của bạn</h4>
							<p class="text-dark">Xem thông tin đơn hàng</p>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-danger text-center">
							<i class="fa-regular fa-circle-question fa-3x"></i>
							<h4 class="mt-3 text-dark">Hỗ trợ người dùng</h4>
							<p class="text-dark">Thông tin liên lạc quản trị viên</p>
						</div>
					</div>
				</a>
			</div>



		</div>
</body>
</html>