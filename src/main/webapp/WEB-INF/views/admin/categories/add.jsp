<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- import library jsp -->
<%@page import="java.util.List"%>
<!--com.java.project.controller.admin;-->
<%@ page import="com.java.project.entity.CategoriesEntity"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- end import -->
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
							<h1>Add Categories</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Add Type Form</li>
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
									<h3 class="card-title">Categories</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmCategories"
									action="${pageContext.servletContext.contextPath}/admin/categories/new"
									method="POST" enctype="multipart/form-data">
									<div class="card-body">
										<div class="form-group">
											<label for="name">Name Categories</label> <input type="text"
												class="form-control" id="name_categories" name="name_categories"
												multiple="multiple" placeholder="Enter name" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label>Status Categories</label> <select class="form-control"
												id="status_categories" name="status_categories" required="required">
												<option value="-1" selected="selected">Select
													Status</option>
													<option value="1">Active</option>
													<option value="0">None Active</option>
											</select> <span id="category-error" class="error invalid-feedback"></span>
										</div>
									</div>
									<!-- /.card-body -->
								</form>
								<div class="card-footer">
									<button id="btnType" type="submit" class="btn btn-primary">Submit</button>
								</div>

							</div>
						</div>
					</div>
				</div>
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
			let name = $('#name_categories');
			//let category = $('#categoryType');
			let hasSubmit = [];
			if (name.val().length === 0) {
				hasSubmit.push(1);
				$('#name_categories').addClass('form-control is-invalid');
				$('#name_categories-error').html('Please enter name!');
			} else {
				$('#name_categories').removeClass('form-control is-invalid');
				$('#name_categories').addClass('form-control is-valid');
				$('#name_categories-error').html('');
			}
			if ( $('#status_categories').val() === null) {
				hasSubmit.push(1);
				$('#status_categories').addClass('form-control is-invalid');
				$('#status_categories-error')
						.html('Please choose category!');
			} else {
				$('#status_categories').removeClass(
						'form-control is-invalid');
				$('#status_categories').addClass('form-control is-valid');
				$('#status_categories-error').html('');
			}
			if (hasSubmit.length === 0) {
				$('#frmCategories').submit();
			}
			console.log(hasSubmit);
		});
	</script>
</body>
</html>