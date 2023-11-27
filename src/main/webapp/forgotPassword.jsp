<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="all_component/allCss.jsp"%>
<%@ include file="all_component/navbar.jsp"%>
<div class="container">
	<div class="row p-2">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h4 class="text-center text m-2">Quên Mật Khẩu</h4>
					<!-- Form for password reset -->

					<form action="forgotPassword" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1" class="m-2"> Địa chỉ
								Email</label> <input type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Email" required="required" name="Email">

						</div>
						<div class="text-center p-1 m-2">
							<button type="submit" class="btn btn-primary">Đăng nhập</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>
