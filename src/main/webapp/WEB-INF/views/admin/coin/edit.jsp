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
							<h1>Edit Coin Form</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Edit Coin Form</li>
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
									<h3 class="card-title">Coin Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmCategories"
									action="${pageContext.servletContext.contextPath}/admin/coin/update"
									method="post">
									<div class="card-body">
										<div class="form-group">
											<label for="name">Amount</label>
												<input type="hidden" id="id_coin"
												name="id_coin" value="${editCoin.id_coin}">
												<input type="text" class="form-control" id="amount" name="amount"
													placeholder="Enter amount" value="${editCoin.amount}">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label>Status</label> <select class="form-control"
												id="status" name="status" required="required">
												<option value="-1" selected="selected">Select
													status</option>
													<c:choose>
														<c:when test="${editCoin.status == 1}">												
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
											<label>User</label> <select class="form-control"
												id="user" name="user" required="required">
												<option value="-1" selected="selected">Select
													User</option>
													<c:forEach var ="userEdit" items="${userCoin}">													
														<c:choose>
															<c:when test="${editCoin.user.id_user == userEdit.id_user}">												
																<option selected="selected" value="${userEdit.id_user}">${userEdit.username}</option>
															</c:when>
															<c:otherwise>
																<option value="${userEdit.id_user}">${userEdit.username}</option>
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
			let amount = $('#amount');
			let status = $('#status');
			let user = $('#user');
			let hasSubmit = [];
			if (user.val().length === 0) {
				hasSubmit.push(1);
				$('#user').addClass('form-control is-invalid');
				$('#user-error').html('Please enter name!');
			} else {
				$('#user').removeClass('form-control is-invalid');
				$('#user').addClass('form-control is-valid');
				$('#user-error').html('');
			}
			if (amount.val().length === 0) {
				hasSubmit.push(1);
				$('#amount').addClass('form-control is-invalid');
				$('#amount-error').html('Please enter name!');
			} else {
				$('#amount').removeClass('form-control is-invalid');
				$('#amount').addClass('form-control is-valid');
				$('#amount-error').html('');
			}
			if (status.val() === '-1') {
				hasSubmit.push(1);
				$('#status').addClass('form-control is-invalid');
				$('#status-error').html('Please choose category!');
			} else {
				$('#status').removeClass('form-control is-invalid');
				$('#status').addClass('form-control is-valid');
				$('#status-error').html('');
			}
			if (hasSubmit.length === 0) {
				$('#frmCategories').submit();
			}
		});
	</script>
</body>
</html>