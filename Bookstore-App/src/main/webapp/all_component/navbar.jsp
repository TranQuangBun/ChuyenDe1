<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid maincolor" style="height: 10px;"></div>
<div class="container-fluid p-3  ">
	<div class="row">
		<div class="col-md-3 text-success mb-3">
			<h3>
				<i class="fas fa-book"></i> B Book
			</h3>
		</div>

		<div class="col-md-6">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control me-2" type="search" name="ch" placeholder="Search"
					aria-label="Search" >
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>


		<c:if test="${not empty userobj }">
			<div class="col-md-3">
				<a href="setting.jsp" class="btn btn-success"><i
					class="fa-solid fa-user"></i> ${userobj.name}</a> <a
					href="logout" class="btn btn-primary"> Đăng xuất</a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i> Login</a> <a href="register.jsp"
					class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket"></i> Register</a>
			</div>
		</c:if>
	</div>


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
								aria-current="page" href="index.jsp"><i
									class="fa-solid fa-house"></i> Home</a></li>

							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="all_new_book.jsp"><i
									class="fa-solid fa-book"></i> New Book</a></li>

							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="all_old_book.jsp"><i
									class="fa-solid fa-book-open"></i> Old Book</a></li>

							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="all_recent_book.jsp"><i
									class="fa-solid fa-bookmark"></i> Recent Book</a></li>

						</ul>

						<c:if test="${not empty userobj }">
						<a href="cart.jsp" class="btn btn-light ms-auto my-2 my-sm-0">
						<i class="fa-solid fa-cart-shopping"></i> Giỏ hàng
						</a>	

						</c:if>
					</div>
				</div>
			</nav>
		</div>
	</section>