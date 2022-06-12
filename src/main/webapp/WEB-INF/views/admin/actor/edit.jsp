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
							<h1>Edit Actor Form</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Edit Actor Form</li>
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
									<h3 class="card-title">Actor Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmCategories"
									action="${pageContext.servletContext.contextPath}/admin/actor/update"
									method="POST" enctype="multipart/form-data">
									<div class="card-body">
										<div class="form-group">
											<label for="name">Name Actor</label>
												<input type="hidden" id="id_actor"
												name="id_actor" value="${actorEdit.id_actor}">
												<input type="text" class="form-control" id="name_actor" name="name_actor"
													placeholder="Enter name" maxlength="20"
														value="${actorEdit.name_actor}">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
															
										
										<div class="form-group">
											<label for="name">Image Actor</label></br>
												<img src="${pageContext.request.contextPath}/img/${actorEdit.image_actor}"
													id="image_actor" name="image_actor" alt="" style="width: 150px; height: 150px"></br></br>
												<input type="file"
													class="form-control" id="imageActor" name="imageActor"
														multiple="multiple" placeholder="Enter name" maxlength="20">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Country Actor</label></br>
												<input type="text" class="form-control" id="country_actor" name="country_actor"
													placeholder="Enter Country" maxlength="20"
														value="${actorEdit.country_actor}">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Age Actor</label></br>
												<input type="text" class="form-control" id="age_actor" name="age_actor"
													placeholder="Enter Country" maxlength="20"
														value="${actorEdit.age_actor}">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Follow Actor</label></br>
												<input type="text" class="form-control" id="follow_actor" name="follow_actor"
													placeholder="Enter Country" maxlength="20"
														value="${actorEdit.follow_actor}">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<%-- <div class="form-group">
											<label>Status</label> <select class="form-control"
												id="status_categories" name="status_categories" required="required">
												<option value="-1" selected="selected">Select
													status</option>
													<c:choose>
														<c:when test="${categoriesEdit.status_categories == 1}">												
															<option selected="selected" value="${categoriesEdit.status_categories}">Active</option>
															<option value="${categoriesEdit.status_categories}">None Active</option>
														</c:when>
														<c:otherwise>
															<option value="${categoriesEdit.status_categories}">Active</option>
															<option selected="selected" value="${categoriesEdit.status_categories}">None Active</option>
														</c:otherwise>
													</c:choose>
											</select><span id="categoryType-error" class="error invalid-feedback"></span>
										</div> --%>
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
			let name = $('#name_actor');
			let country = $('#country_actor');
			let age = $('#age_actor');
			let follow = $('#follow_actor');
			
			let hasSubmit = [];
			if (follow.val().length === 0) {
				hasSubmit.push(1);
				$('#follow_actor').addClass('form-control is-invalid');
				$('#follow_actor-error').html('Please enter name!');
			} else {
				$('#follow_actor').removeClass('form-control is-invalid');
				$('#follow_actor').addClass('form-control is-valid');
				$('#follow_actor-error').html('');
			}
			if (age.val().length === 0) {
				hasSubmit.push(1);
				$('#age_actor').addClass('form-control is-invalid');
				$('#age_actor-error').html('Please enter name!');
			} else {
				$('#age_actor').removeClass('form-control is-invalid');
				$('#age_actor').addClass('form-control is-valid');
				$('#age_actor-error').html('');
			}
			if (name.val().length === 0) {
				hasSubmit.push(1);
				$('#name_actor').addClass('form-control is-invalid');
				$('#name_actor-error').html('Please enter name!');
			} else {
				$('#name_actor').removeClass('form-control is-invalid');
				$('#name_actor').addClass('form-control is-valid');
				$('#name_actor-error').html('');
			}
			if (country.val().length === 0) {
				hasSubmit.push(1);
				$('#country_actor').addClass('form-control is-invalid');
				$('#country_actor-error').html('Please enter name!');
			} else {
				$('#country_actor').removeClass('form-control is-invalid');
				$('#country_actor').addClass('form-control is-valid');
				$('#country_actor-error').html('');
			}
			if (country.val().length === 0) {
				hasSubmit.push(1);
				$('#country_actor').addClass('form-control is-invalid');
				$('#country_actor-error').html('Please enter name!');
			} else {
				$('#country_actor').removeClass('form-control is-invalid');
				$('#country_actor').addClass('form-control is-valid');
				$('#country_actor-error').html('');
			}
			if (hasSubmit.length === 0) {
				$('#frmCategories').submit();
			}
		});
	</script>
</body>
</html>