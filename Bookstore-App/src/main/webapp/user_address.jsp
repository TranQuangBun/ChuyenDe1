<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Địa chỉ của bạn</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container ">
		<div class=row>
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
					<h3 class="text-center text-success p-1">Địa chỉ của bạn</h3>
						<form action="" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Địa chỉ:</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Thành phố:</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail1">Tỉnh:</label> <input
									name="price" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-primary mt-3">Hoàn thành</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>