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
							<h1>Add Actor</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Add Actor Form</li>
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
									<h3 class="card-title">Actor</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmCategories"
									action="${pageContext.servletContext.contextPath}/admin/actor/new"
									method="POST" enctype="multipart/form-data">
									<div class="card-body">
										<div class="form-group">
											<label for="name">Name Actor</label> <input type="text"
												class="form-control" id="name_actor" name="name_actor"
												multiple="multiple" placeholder="Enter name" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Image Actor</label> <input type="file"
												class="form-control" id="imageActor" name="imageActor"
												multiple="multiple">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Country Actor</label> <input type="text"
												class="form-control" id="country_actor" name="country_actor"
												multiple="multiple" placeholder="Enter country" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Age Actor</label> <input type="text"
												class="form-control" id="age_actor" name="age_actor"
												multiple="multiple" placeholder="Enter age" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Follow Actor</label> <input type="text"
												class="form-control" id="follow_actor" name="follow_actor"
												multiple="multiple" placeholder="Enter follow" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
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
	<jsp:include page="../template/script.jsp"></jsp:include>--
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
			if (name.val().length === 0) {
				hasSubmit.push(1);
				$('#name_actor').addClass('form-control is-invalid');
				$('#name_actor-error').html('Please enter name!');
			} else {
				$('#name_actor').removeClass('form-control is-invalid');
				$('#name_actor').addClass('form-control is-valid');
				$('#name_actor-error').html('');
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
			console.log(hasSubmit);
		});
	</script>
</body>
</html>