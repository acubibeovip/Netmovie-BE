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
							<h1>Edit Crawl Form</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
								<li class="breadcrumb-item active">Edit Crawl Form</li>
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
									<h3 class="card-title">Crawl Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form id="frmCategories"
									action="${pageContext.servletContext.contextPath}/admin/crawl/update"
									method="POST" enctype="multipart/form-data">
									<div class="card-body">
										<div class="form-group">
											<label for="name">Name Web Crawl</label>
												<input type="hidden" id="id_element_crawl"
												name="id_element_crawl" value="${editCrawl.id_element_crawl}">
												<input type="text" class="form-control" id="name_web_crawl" name="name_web_crawl"
													placeholder="Enter name" value="${editCrawl.name_web_crawl}">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
															
										
										<div class="form-group">
											<label for="name">Url Crawl</label></br>
												<input type="text"
													class="form-control" id="url_crawl" name="url_crawl"
														multiple="multiple" value="${editCrawl.url_crawl}" placeholder="Enter url">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Number Tag Crawl</label></br>
												<input type="text" class="form-control" id="number_tag_crawl" name="number_tag_crawl"
													placeholder="Enter Number Crawl"
														value="${editCrawl.number_tag_crawl}">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label for="name">Card Tag Crawl</label></br>
												<input type="text" class="form-control" id="card_tag_crawl" name="card_tag_crawl"
													placeholder="Enter Country"
														value="${editCrawl.card_tag_crawl}">
												<span id="nameType-error" class="error invalid-feedback"></span>
										</div>
										<div class="form-group">
											<label>Status</label> <select class="form-control"
												id="status_crawl" name="status_crawl" required="required">
												<option value="-1" selected="selected">Select
													status</option>
													<c:choose>
														<c:when test="${editCrawl.status_crawl == 1}">												
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
											<label>Categories film</label> <select class="form-control"
												id="categories " name="categories" required="categories">
												<option value="-1" selected="selected">Select
													categories</option>
													<c:forEach var ="categoriesEdit" items="${categoriesEdit}">													
														<c:choose>
															<c:when test="${editCrawl.categories.id_categories == categoriesEdit.id_categories}">												
																<option selected="selected" value="${categoriesEdit.id_categories}">${categoriesEdit.name_categories}</option>
															</c:when>
															<c:otherwise>
																<option value="${categoriesEdit.id_categories}">${categoriesEdit.name_categories}</option>
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
		let name = $('#name_web_crawl');
		let url = $('#url_crawl');
		let number = $('#number_tag_crawl');
		let card = $('#card_tag_crawl');
		let hasSubmit = [];
		if ( $('#categories').val() === null) {
			hasSubmit.push(1);
			$('#categories').addClass('form-control is-invalid');
			$('#categories-error').html('Please choose category!');
		} else {
			$('#categories').removeClass('form-control is-invalid');
			$('#categories').addClass('form-control is-valid');
			$('#categories-error').html('');
		}
		if (card.val().length === 0) {
			hasSubmit.push(1);
			$('#card_tag_crawl').addClass('form-control is-invalid');
			$('#card_tag_crawl-error').html('Please enter name!');
		} else {
			$('#card_tag_crawl').removeClass('form-control is-invalid');
			$('#card_tag_crawl').addClass('form-control is-valid');
			$('#card_tag_crawl-error').html('');
		}
		if (name.val().length === 0) {
			hasSubmit.push(1);
			$('#name_web_crawl').addClass('form-control is-invalid');
			$('#name_web_crawl-error').html('Please enter name!');
		} else {
			$('#name_web_crawl').removeClass('form-control is-invalid');
			$('#name_web_crawl').addClass('form-control is-valid');
			$('#name_web_crawl-error').html('');
		}
		if (number.val().length === 0) {
			hasSubmit.push(1);
			$('#number_tag_crawl').addClass('form-control is-invalid');
			$('#number_tag_crawl-error').html('Please enter name!');
		} else {
			$('#number_tag_crawl').removeClass('form-control is-invalid');
			$('#number_tag_crawl').addClass('form-control is-valid');
			$('#number_tag_crawl-error').html('');
		}
		if (url.val().length === 0) {
			hasSubmit.push(1);
			$('#url_crawl').addClass('form-control is-invalid');
			$('#url_crawl-error').html('Please enter name!');
		} else {
			$('#url_crawl').removeClass('form-control is-invalid');
			$('#url_crawl').addClass('form-control is-valid');
			$('#url_crawl-error').html('');
		}
		if (hasSubmit.length === 0) {
			$('#frmCategories').submit();
		}
		console.log(hasSubmit);
	});
	</script>
</body>
</html>