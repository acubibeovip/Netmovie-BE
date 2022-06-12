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
							<h1>Add Video In Storage</h1>
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
									<h3 class="card-title">Video Storage</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmType"
									action="${pageContext.servletContext.contextPath}/admin/storage/new"
									method="POST" enctype="multipart/form-data">
									<div class="card-body">
										<div class="form-group">
											<label for="name">Image Video</label> <input type="file"
												class="form-control" id="imageStorage" name="imageStorage"
												multiple="multiple" placeholder="Enter name" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Video</label> <input type="file"
												class="form-control" id="videoStorage" name="videoStorage"
												multiple="multiple" placeholder="Enter name" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Id User</label> <input type="text"
												class="form-control" id="id_user" name="id_user"
												multiple="multiple" placeholder="Enter name" maxlength="20">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Description Storage</label> <input type="text"
												class="form-control" id="description_storage" name="description_storage"
												multiple="multiple" placeholder="Enter description storage" maxlength="20">
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
	<jsp:include page="../template/script.jsp"></jsp:include>
	<script>
		$('#btnType').on('click', function() {
			let name = $('#imageStorage');
			//let category = $('#categoryType');
			let hasSubmit = [];
			if (name.val().length === 0) {
				hasSubmit.push(1);
				$('#imageStorage').addClass('form-control is-invalid');
				$('#imageStorage-error').html('Please enter name!');
			} else {
				$('#imageStorage').removeClass('form-control is-invalid');
				$('#imageStorage').addClass('form-control is-valid');
				$('#imageStorage-error').html('');
			}
			/* if (category.val() === '-1') {
				hasSubmit.push(1);
				$('#categoryType').addClass('form-control is-invalid');
				$('#categoryType-error').html('Please choose category!');
			} else {
				$('#categoryType').removeClass('form-control is-invalid');
				$('#categoryType').addClass('form-control is-valid');
				$('#categoryType-error').html('');
			} */
			if (hasSubmit.length === 0) {
				$('#frmType').submit();
			}
			console.log(hasSubmit);
		});
	</script>
</body>
</html>