<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="container-fluid maincolor" style="height: 10px;"></div>
<div class="container-fluid p-3  ">
	<div class="row">
		<div class="col-md-3 text-success mb-3">
			<h3>
				<i class="fas fa-book"></i> B Book
			</h3>
		</div>

		<div class="col-md-6">
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<div class="col-md-3">
			<c:if test="${not empty userobj }">
				<a href="login.jsp" class="btn btn-success"><i
					class="fas fa-user"></i> ${userobj.name}</a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-danger"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</c:if>
			<c:if test="${empty userobj }">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i> Login</a>
				<a href="../register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket"></i> Register</a>
			</c:if>

		</div>

	</div>

	<!-- Logout Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Đăng xuất</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Bạn muốn đăng xuất không ?</h4>
						<div class="m-2 p-3">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Quay lại</button>

							<a href="../logout " type="button" class="btn btn-primary">Đăng xuất</a>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- End Logout Modal -->

	<section class="header p-2">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-dark">
				<div class="container-fluid">
					<a class="navbar-brand" href="#"><i class="fas fa-book"></i> B
						BOOK</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">

							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="home.jsp"><i
									class="fa-solid fa-house"></i> Home</a></li>
					</div>
				</div>
			</nav>
		</div>
	</section>