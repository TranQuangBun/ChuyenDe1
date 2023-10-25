<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng của bạn</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>


	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row">



			<div class="col-md-6">
				<h3 class="text-center text-success p-3 mt-2 text-uppercase">Mặt
					hàng đã chọn</h3>

				<input type="hidden" value="${userobj.id}" name="id">


				<div class="card bg-white">
					<div class="card-body">
						<table class="table table-hover table-default">
							<thead>
								<tr>
									<th scope="col">Tên Sách</th>
									<th scope="col">Tác giả</th>
									<th scope="col">Giá tiền</th>
									<th scope="col">Hủy đơn</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOpl dao = new CartDAOpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotal_price();
								%>
								<tr>
									<th score="row"><%=c.getBook_name()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%>0</td>
									<td><a
										href="remove_cart?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Xóa đơn</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Tổng tiền phải trả:</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%> <i class="fa-solid fa-dollar-sign"></i></td>
								</tr>

							</tbody>
						</table>

					</div>
				</div>

			</div>


			<div class="col-md-6">
				
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-success p-3 mt-2 text-uppercase">Chi tiết đơn hàng</h3>
					
						<form action="ordercart" method="post">
						
							<input type="hidden" value="${userobj.id}" name="id">
	
							<div class="form-group row">
							
								<label for="inputEmail3" class="col-sm-3 col-form-label">Họ
									và Tên: </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputEmail3" name="username"
										placeholder="Họ tên" value="${userobj.name}" required>
								</div>
								
							</div>

							<div class="form-group row mt-3">
							
								<label for="inputEmail3" class="col-sm-3 col-form-label">Email:
								</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputEmail3"  name="email"
										placeholder="Email" value="${userobj.email }" required>
								</div>
								
							</div>

							<div class="form-group row mt-3">
								<label for="inputEmail3" class="col-sm-3 col-form-label">Số
									điện thoại: </label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="inputEmail3" name="phone"
										placeholder="Số điện thoại" value="${userobj.phone}" required>
								</div>
							</div>

							<div class="form-group row mt-3">
								<label for="inputEmail3" class="col-sm-3 col-form-label">Địa
									chỉ: </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputEmail3" name="address"
										placeholder="Địa chỉ số nhà / tên đường " required>
								</div>
							</div>

							<div class="form-group row mt-3">
								<label for="inputEmail3" class="col-sm-3 col-form-label">Thành
									phố: </label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputEmail3" name="city"
										placeholder="Địa chỉ thành phố " name="" required>
								</div>
							</div>

							<div class="form-group row mt-3">
								<label for="inputEmail3" class="col-sm-3 col-form-label">Tỉnh:
								</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="inputEmail3" name="state"
										placeholder="Địa chỉ tỉnh " name="" required>
								</div>
							</div>

							<div class="form-group mt-3">
								<label>Phương thức thanh toán</label> <select
									class="form-control mt-2" name="paymentType">
									
									<option value="noselect">----- Lựa chọn -----</option>
									<option value="COD">Tiền mặt</option>
									<option value="Banking">Chuyển khoản</option>
								</select>
							</div>

							<div class="mt-4 text-center">
								<button class="btn btn-success p-2">Mua ngay</button>
								<button class="btn btn-warning p-2">Tiếp tục mua hàng</button>
							</div>

						</form>
					</div>
				</div>
			</div>


		</div>
	</div>


</body>
</html>