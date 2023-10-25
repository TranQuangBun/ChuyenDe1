<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaopl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tất cả sách / truyện đã kích hoạt</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-bg:hover {
	background: #fcf7f7;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<%
	User user = (User) session.getAttribute("userobj");
	%>
	<!-- Toast -->
	<c:if test="${not empty addCart}">
		<script type="text/javascript">
			$(function() {
				toastr
						.success(
								"Chúc mừng bạn đã thêm thành công sách / truyện vào giỏ hàng!",
								"Thành công", {
									timeOut : 5000
								})
				toastr.options.newestOnTop = false;
				toastr.options.closeButton = true;
			});
		</script>
		<c:remove var="addCart" scope="session" />
	</c:if>


	<!-- Toast -->
	<c:if test="${not empty failed}">
		<script type="text/javascript">
			$(function() {
				toastr.danger("Thêm thất bại sách / truyện vào giỏ hàng!",
						"Thất bại", {
							timeOut : 5000
						})
				toastr.options.newestOnTop = false;
				toastr.options.closeButton = true;
			});
		</script>
		<c:remove var="failed" scope="session" />
	</c:if>	



	<div class="container-fluid ">
		<div class="row p-3">
			<%
			BookDaopl dao2 = new BookDaopl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3 rounded">
				<div class="card-body text-center crd-bg">
					<img alt="" src="book/<%=b.getPhoto()%>"
						style="width: 200px; height: 260px" class="img-thumbnail">
					<h4>
						<p class="text-uppercase mt-1"><%=b.getBookname()%></p>
					</h4>
					<b>
						<p><%=b.getAuthor()%></p>
					</b>
					<p>
						Category:
						<%=b.getBookCategory()%></p>
					<div class="row">

						<%
						if (user == null) {
						%>
						<a href="login.jsp" class="btn btn-danger col-sm ml-1 m-1"> <i
							class="fa-solid fa-cart-shopping"></i> Giỏ hàng
						</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
							class="btn btn-danger col-sm ml-1 m-1"> <i
							class="fa-solid fa-cart-shopping"></i> Giỏ hàng
						</a>
						<%
						}
						%>

						<!-- Details -->
						<a href="view_book.jsp?bid=<%=b.getBookId()%>"
							class="btn btn-success col-sm ml-1 m-1"> <i
							class="fa-solid fa-eye"></i> Chi tiết
						</a>
						<!-- Prices -->
						<a href="" class="btn btn-danger col-sm ml-1 m-1"> <i
							class="fa-solid fa-dollar-sign"></i> <%=b.getPrice()%>.000
						</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>