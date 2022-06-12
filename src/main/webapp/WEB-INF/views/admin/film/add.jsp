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
							<h1>Add Film</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Add Film Form</li>
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
									<h3 class="card-title">Film</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmCategories"
									action="${pageContext.servletContext.contextPath}/admin/film/new"
									method="POST" enctype="multipart/form-data">
									<div class="card-body">
										<div class="form-group">
											<label for="name">Title Film</label> <input type="text"
												class="form-control" id="title_film" name="title_film"
												multiple="multiple" placeholder="Enter title film" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Description Film</label> <input type="text"
												class="form-control" id="description_film" name="description_film"
												multiple="multiple" placeholder="Enter description film">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label>Status Film</label> <select class="form-control"
												id="status_film" name="status_film" required="required">
												<option value="-1" selected="selected">Select
													Status</option>
													<option value="1">Active</option>
													<option value="0">None Active</option>
											</select> <span id="category-error" class="error invalid-feedback"></span>
										</div>
										
										<div class="form-group">
											<label>Categories Film</label>
											 <select class="form-control" id="categories" name="categories" required="required">
													<option value="-1" selected="selected">Select Categories</option>
												<c:forEach var="categories" items="${categoriesList}">
													<option value="${categories.id_categories} ">${categories.name_categories }</option>
												</c:forEach>
											</select> 
											<span id="category-error" class="error invalid-feedback"></span>
										</div>

										<div class="form-group">
											<label>Actor Film</label>
											 <select class="form-control" id="actor" name="actor" required="required">
													<option value="-1" selected="selected">Select Actor</option>
												<c:forEach var="actor" items="${actorList}">
													<option value="${actor.id_actor} ">${actor.name_actor}</option>
												</c:forEach>
											</select> 
											<span id="category-error" class="error invalid-feedback"></span>
										</div>
										
										<div class="form-group">
											<label>Storage Film</label>
											 <select class="form-control" id="storage" name="storage" required="required">
													<option value="-1" selected="selected">Select Storage Film</option>
												<c:forEach var="storage" items="${storageList}">
													<option value="${storage.id_storage} ">${storage.description_storage}</option>
												</c:forEach>
											</select> 
											<span id="category-error" class="error invalid-feedback"></span>
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
			let title = $('#title_film');
			let description = $('#description_film');
			let status = $('#status_film');
			let categories = $('#categories');
			
			let hasSubmit = [];
			
			if (title.val().length === 0) {
				hasSubmit.push(1);
				$('#title_film').addClass('form-control is-invalid');
				$('#title_film-error').html('Please enter name!');
			} else {
				$('#title_film').removeClass('form-control is-invalid');
				$('#title_film').addClass('form-control is-valid');
				$('#title_film-error').html('');
			}
			if (description.val().length === 0) {
				hasSubmit.push(1);
				$('#description_film').addClass('form-control is-invalid');
				$('#description_film-error').html('Please enter name!');
			} else {
				$('#description_film').removeClass('form-control is-invalid');
				$('#description_film').addClass('form-control is-valid');
				$('#description_film-error').html('');
			}
			if ( $('#status_film').val() === null) {
				hasSubmit.push(1);
				$('#status_film').addClass('form-control is-invalid');
				$('#status_film-error').html('Please choose category!');
			} else {
				$('#status_film').removeClass('form-control is-invalid');
				$('#status_film').addClass('form-control is-valid');
				$('#status_film-error').html('');
			}
			if ( $('#categories').val() === null) {
				hasSubmit.push(1);
				$('#categories').addClass('form-control is-invalid');
				$('#categories-error').html('Please choose category!');
			} else {
				$('#categories').removeClass('form-control is-invalid');
				$('#categories').addClass('form-control is-valid');
				$('#categories-error').html('');
			}
			if ( $('#actor').val() === null) {
				hasSubmit.push(1);
				$('#actor').addClass('form-control is-invalid');
				$('#actor-error').html('Please choose category!');
			} else {
				$('#actor').removeClass('form-control is-invalid');
				$('#actor').addClass('form-control is-valid');
				$('#actor-error').html('');
			}
			if ( $('#storage').val() === null) {
				hasSubmit.push(1);
				$('#storage').addClass('form-control is-invalid');
				$('#storage-error').html('Please choose category!');
			} else {
				$('#storage').removeClass('form-control is-invalid');
				$('#storage').addClass('form-control is-valid');
				$('#storage-error').html('');
			}
			if (hasSubmit.length === 0) {
				$('#frmCategories').submit();
			}
			console.log(hasSubmit);
		});
	</script>
</body>
</html>