<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- import library jsp -->
<%@page import="java.util.List"%>
<!--com.java.project.controller.admin;-->
<%@ page import="com.java.project.entity.CommentEntity"%>
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
							<h1>Contact list</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Contact list</li>
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
									<h3 class="card-title">Contact list</h3>
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
																rowspan="1" colspan="1">Id Contact</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Title Contact</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Message Contact</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Email Contact</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Phone Contact</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Update Contact</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Modify Contact</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">Action</th>
														</tr>
													</thead>
													<tbody>
														<%
															System.out.println(request.getAttribute("listContact"));
														%>
														<c:forEach var="contact" items="${listContact}">
															<tr>
																<td>${contact.id_contact}</td>
																<td>${contact.title_contact}</td>
																<td>${contact.message_contact}</td>
																<td>${contact.email_contact}</td>
																<td>${contact.phone_contact}</td>
																<td>${contact.update_contact}</td>
																<td>${contact.modify_contact}</td>
																<td class="project-actions text-center"><a
																	class="btn btn-primary btn-sm"
																	href="${pageContext.request.contextPath}/admin/product/detail?id=${product.id}"><i
																		class="fas fa-folder"></i>View</a> <a
																	class="btn btn-info btn-sm"
																	href="${pageContext.request.contextPath}/admin/product/edit?id=${product.id}"><i
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