<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- import library jsp -->
<%@page import="java.util.List"%>
<!--com.java.project.controller.admin;-->
<%@ page import="com.java.project.entity.ActorEntity"%>
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
		<div class="content-wrapper" style="min-height: 1299.69px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>User list</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">User list</li>
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
						<div class="col-12">
							<!-- /.card -->
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">User list</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div id="example1_wrapper"
										class="dataTables_wrapper dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12">
												<table id="example1"
													class="table table-bordered table-striped dataTable dtr-inline"
													role="grid" aria-describedby="example1_info">
													<thead>
														<tr role="row">
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Id User</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">UserName</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Password</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Name</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Phone</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Email</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Address</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Gender</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Role</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Status</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Id Product</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Action</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="user" items="${userList}">
															<tr>
																<td>${user.id_user}</td>
																<td>${user.username}</td>
																<td>${user.password }</td>
																<td>${user.name }</td>
																<td>${user.phone }</td>
																<td>${user.email }</td>
																<td>${user.address }</td>
																<td>${user.gender }</td>
																<td>${user.role}</td>
																<td>${user.status_user}</td>
																<td>${user.product.name_product}</td>
																<td class="project-actions text-center"><a
																	class="btn btn-primary btn-sm"
																	href="${pageContext.request.contextPath}/admin/user/detail?id=${user.id_user}"><i
																		class="fas fa-folder"></i>View</a> <a
																	class="btn btn-info btn-sm"
																	href="${pageContext.request.contextPath}/admin/user/edit?id=${user.id_user}"><i
																		class="fas fa-pencil-alt"></i>Edit</a></td>
															</tr>
														</c:forEach>
													</tbody>
													<tfoot>
													</tfoot>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
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
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
		});
	</script>
</body>
</html>