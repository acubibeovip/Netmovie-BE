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
							<h1>Add Coin Account</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Add Coin Account Form</li>
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
									<h3 class="card-title">Coin Account</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmCategories"
									action="${pageContext.servletContext.contextPath}/admin/coin/new"
									method="POST" enctype="multipart/form-data">
									<div class="card-body">
										<div class="form-group">
											<label for="name">Amount</label> <input type="text"
												class="form-control" id="amount" name="amount"
												multiple="multiple" placeholder="Enter amount">
											<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label>Status Coin</label> <select class="form-control"
												id="status" name="status" required="required">
												<option value="-1" selected="selected">Select
													Status</option>
													<option value="1">Active</option>
													<option value="0">None Active</option>
											</select> <span id="category-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">User</label> 
											<select class="form-control" id="user" name="user" required="required">
													<option value="-1" selected="selected">Select User</option>
												<c:forEach var="user" items="${userList}">
													<option value="${user.id_user} ">${user.username}</option>
												</c:forEach>
											</select> 
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
			let amount = $('#amount');
			let status = $('#status');
			let user = $('#user');
			
			let hasSubmit = [];
			
			if (amount.val().length === 0) {
				hasSubmit.push(1);
				$('#amount').addClass('form-control is-invalid');
				$('#amount-error').html('Please enter name!');
			} else {
				$('#amount').removeClass('form-control is-invalid');
				$('#amount').addClass('form-control is-valid');
				$('#amount-error').html('');
			}
			if (status.val().length === 0) {
				hasSubmit.push(1);
				$('#status').addClass('form-control is-invalid');
				$('#status-error').html('Please enter name!');
			} else {
				$('#status').removeClass('form-control is-invalid');
				$('#status').addClass('form-control is-valid');
				$('#status-error').html('');
			}
			if ( $('#user').val() === null) {
				hasSubmit.push(1);
				$('#user').addClass('form-control is-invalid');
				$('#user-error').html('Please choose category!');
			} else {
				$('#user').removeClass('form-control is-invalid');
				$('#user').addClass('form-control is-valid');
				$('#user-error').html('');
			}
			
			if (hasSubmit.length === 0) {
				$('#frmCategories').submit();
			}
			console.log(hasSubmit);
		});
	</script>
</body>
</html>