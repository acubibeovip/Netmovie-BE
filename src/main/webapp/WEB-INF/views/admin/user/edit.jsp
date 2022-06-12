<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE <html xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:th="http://www.thymeleaf.org" 
    xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3"
    xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<html lang="en">
<jsp:include page="../template/head.jsp"></jsp:include>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="${pageContext.servletContext.contextPath}/dist/img/angry-nerds-logo-2.png"
				alt="AdminLTELogo" height="260" width="260">

		</div>
		<jsp:include page="../template/nav-bar.jsp"></jsp:include>
		<jsp:include page="../template/side-bar.jsp"></jsp:include>
		<!-- @author: Lam Cong Hau -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 1342.88px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Edit User Form</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Edit User Form</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- left column -->
						<div class="col-md-12">
							<!-- general form elements -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">User Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmCategories"
									action="${pageContext.servletContext.contextPath}/admin/user/update"
									method="POST" enctype="multipart/form-data">
									<div class="card-body">
										<div class="form-group">
											<label for="name">UserName</label>
												<input type="hidden" id="id_user"
												name="id_user" value="${userEdit.id_user}">
												<input type="text" class="form-control" id="username" name="username"
													placeholder="Enter name" maxlength="20"
														value="${userEdit.username}" disabled="disabled">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Password</label>
												<input type="text" class="form-control" id="password" name="password"
													placeholder="Enter password" maxlength="20"
														value="${userEdit.password}" disabled="disabled">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Name</label>
												<input type="text" class="form-control" id="name" name="name"
													placeholder="Enter name" maxlength="20"
														value="${userEdit.name}" disabled="disabled">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Phone</label>
												<input type="text" class="form-control" id="phone" name="phone"
													placeholder="Enter phone" maxlength="20"
														value="${userEdit.phone}" disabled="disabled">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Email</label>
												<input type="text" class="form-control" id="email" name="email"
													placeholder="Enter email" maxlength="20"
														value="${userEdit.email}" disabled="disabled">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Address</label>
												<input type="text" class="form-control" id="address" name="address"
													placeholder="Enter address" maxlength="20"
														value="${userEdit.address}" disabled="disabled">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Gender</label>
												<input type="text" class="form-control" id="gender" name="gender"
													placeholder="Enter gender" maxlength="20"
														value="${userEdit.gender}" disabled="disabled">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label>Role</label> <select class="form-control"
												id="role" name="role" required="required">
												<option value="-1">Select
													role</option>
													<c:choose>
														<c:when test="${userEdit.role == 'ROLE_ADMIN'}">												
															<option selected="selected" value="ROLE_ADMIN">ROLE_ADMIN</option>
															<option value="ROLE_USER">ROLE_USER</option>
														</c:when>
														<c:otherwise>
															<option value="ROLE_ADMIN">ROLE_ADMIN</option>
															<option selected="selected" value="ROLE_USER">ROLE_USER</option>
														</c:otherwise>
													</c:choose>
											</select><span id="categoryType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label>Status User</label> <select class="form-control"
												id="status_user" name="status_user" required="required">
												<option value="-1" selected="selected">Select
													status</option>
													<c:choose>
														<c:when test="${userEdit.status_user == 1}">												
															<option selected="selected" value="1">Active</option>
															<option value="0">None Active</option>
														</c:when>
														<c:otherwise>
															<option value="1">Active</option>
															<option selected="selected" value="0">None Active</option>
														</c:otherwise>
													</c:choose>
											</select><span id="categoryType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
												<label>Product Name</label> <select class="form-control"
												id="product" name="product" required="required">
												<option value="-1">Select
													product</option>
													<c:forEach var ="product" items="${productList}">
														<c:choose>
															<c:when test="${userEdit.product.id_product == product.id_product}">												
																<option selected="selected" value="${product.id_product}">${product.name_product}</option>
															</c:when>
															<c:otherwise>
																<option value="${product.id_product}">${product.name_product}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</select><span id="categoryType-error" class="error invalid-feedback"></span>
										</div>
									</div>
									<!-- /.card-body -->
								</form>
								<div class="card-footer">
									<button id="btnType" type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
							<!-- /.card -->

							<!-- general form elements -->

							<!-- /.card -->

							<!-- Input addon -->

							<!-- /.card -->
							<!-- Horizontal Form -->

							<!-- /.card -->

						</div>
						<!--/.col (left) -->
						<!-- right column -->

						<!--/.col (right) -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="../template/footer.jsp"></jsp:include>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<jsp:include page="../template/script.jsp"></jsp:include>
	<script>
		$('#btnType').on('click', function() {
			let status = $('#status_user');
			let role = $('#role');
			let product = $('#product');
			
			let hasSubmit = [];
			
			if (role.val() === '-1') {
				hasSubmit.push(1);
				$('#role').addClass('form-control is-invalid');
				$('#role-error').html('Please choose category!');
			} else {
				$('#role').removeClass('form-control is-invalid');
				$('#role').addClass('form-control is-valid');
				$('#role-error').html('');
			}
			if (product.val() === '-1') {
				hasSubmit.push(1);
				$('#product').addClass('form-control is-invalid');
				$('#product-error').html('Please choose category!');
			} else {
				$('#product').removeClass('form-control is-invalid');
				$('#product').addClass('form-control is-valid');
				$('#product-error').html('');
			}
			if (status.val() === '-1') {
				hasSubmit.push(1);
				$('#status_user').addClass('form-control is-invalid');
				$('#status_user-error').html('Please choose category!');
			} else {
				$('#status_user').removeClass('form-control is-invalid');
				$('#status_user').addClass('form-control is-valid');
				$('#status_user-error').html('');
			}
			if (hasSubmit.length === 0) {
				$('#frmCategories').submit();
			}
		});
	</script>
</body>
</html>