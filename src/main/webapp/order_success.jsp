<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body
	style="background-image: url(img/registerbg.jpg); background-size: cover; background-repeat: no-repeat;">
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container text-center mt-4 text-white">
		<i class="fas fa-check-circle fa-5x text-sucess"></i>
		<h1>Cảm ơn bạn đã đặt hàng</h1>
		<h2>Đơn đặt hàng của bạn đã được ghi nhận!</h2>
		<h5>Trong khoảng 7 ngày đơn hàng sẽ được chuyển tới địa chỉ bạn
			đã cung cấp.</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Trang chủ</a> <a
			href="order_us.jsp" class="btn btn-danger mt-3"> Xem đơn hàng</a>
	</div>

</body>
</html>