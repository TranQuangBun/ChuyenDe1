<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBook - Admin</title>
<%@include file="/admin/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body
	style="background-image: url(/img/registerbg.jpg); background-size: cover; background-repeat: no-repeat;">
	<%@include file="../admin/navbar.jsp"%>

<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"></c:redirect>
</c:if>

	<div class="container">
		<div class="row mt-3 p-4">

<!-- Add Book -->
			<div class="col-md-3">
				<a href="add_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i><br>
							<hr>
							<h4>Thêm sách / truyện</h4>
							<hr>
						</div>
					</div>
				</a>
			</div>

<!-- All Book -->
			<div class="col-md-3">
				<a href="all_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i>
							<hr>
							<h4>Tất cả sách / truyện</h4>
							<hr>
						</div>
					</div>
				</a>
			</div>

<!-- Order Book -->
			<div class="col-md-3">
				<a href="all_order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-gift fa-3x text-success"></i>
							<hr>
							<h4>Đơn đặt hàng</h4>
							<hr>
						</div>
					</div>
				</a>
			</div>

<!-- Logout -->
			<div class="col-md-3">
			<a href="#">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-money-bill-trend-up fa-3x"></i>
						<hr>
						<h4>Thống kê</h4>
						<hr>
					</div>
				</div>
				</a>
			</div>
			
		</div>
	</div>

<div style="margin-top:164px"></div>
<%@include file="/all_component/footer.jsp"%>
</body>
</html>