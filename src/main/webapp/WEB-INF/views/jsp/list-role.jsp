<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>danh sách</title>
       
<!-- Custom styles for this template-->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"></c:url>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/sb-admin.css"></c:url>">
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.css"></c:url>">
 
</head>

<body id="page-top">
	<c:url value="/update-role/" var="urlUpdate" />
	<c:url value="/roleDelete/" var="urlDelete" />

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index"><img
			src="<%=request.getContextPath()%>/resources/image/logo.JPG"
			width="120"></a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
					class="badge badge-danger">9+</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
					class="badge badge-danger">7</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="<c:url value="/index"/>">
					<i class="fas fa-home"></i> <span>Home</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-tasks"></i> <span>Person</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Customer:</h6>
					<a class="dropdown-item" href="<c:url value="/customer-list"/>">List Customer</a> <a
						class="dropdown-item" href="<c:url value="/customer-save"/>">Create Customer</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Employee:</h6>
					<a class="dropdown-item" href="<c:url value="/employee-list"/>">List Employee</a> <a
						class="dropdown-item" href="<c:url value="/employee-save"/>">Create Employee</a>
					<div class="dropdown-divider"></div>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-shield-alt"></i> <span>Security</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Account:</h6>
					<a class="dropdown-item" href="<c:url value="/list-account"/>">List Account</a> <a
						class="dropdown-item" href="<c:url value="/save-account"/>">Create Account</a>
					<h6 class="dropdown-header">Role:</h6>
					<a class="dropdown-item" href="<c:url value="/list-role"/>">List Role</a> <a
						class="dropdown-item" href="<c:url value="/save-role"/>">Create Role</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-door-open"></i> <span>Room</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Room Type:</h6>
					<a class="dropdown-item" href="<c:url value="/roomtype-list"/>">List Room Type</a> <a
						class="dropdown-item" href="<c:url value="/roomtype-save"/>">Create Room Type</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Room Status:</h6>
					<a class="dropdown-item" href="<c:url value="/roomstatus-list"/>">List Room
						Status</a> <a class="dropdown-item" href="<c:url value="/roomstatus-save"/>">Create
						Room Status Status</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Room:</h6>
					<a class="dropdown-item" href="<c:url value="/room-list"/>">List Room</a> <a
						class="dropdown-item" href="<c:url value="/room-list"/>">Create Room</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
					class="fas fa-money-check-alt"></i> <span>Payment</span> </a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Payment Type:</h6>
					<a class="dropdown-item" href="<c:url value="/paymenttype-list"/>">List Payment Type</a> 
					<a class="dropdown-item" href="<c:url value="/paymenttype-save"/>">Create Payment Type</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Payment:</h6>
					<a class="dropdown-item" href="<c:url value="/payment-list"/>">List Payment</a> <a
						class="dropdown-item" href="<c:url value="/payment-save"/>">Create Payment</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-check-square"></i> <span>Booking</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Reservation:</h6>
					<a class="dropdown-item" href="<c:url value="/reservation-list"/>">List
						Reservation</a> <a class="dropdown-item" href="<c:url value="/reservation-list"/>">Create
						Resertvation</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Reception:</h6>
					<a class="dropdown-item" href="<c:url value="/reception-list"/>">List Reception</a> <a
						class="dropdown-item" href="<c:url value="/reception-save"/>">Create Reception</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-list-ol"></i> <span>Service</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="<c:url value="/service-list"/>">List Service</a> <a
						class="dropdown-item" href="<c:url value="/service-save"/>">Create Service</a>
				</div></li>
		</ul>
		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Persion</a></li>
					<li class="breadcrumb-item active">List Role</li>
				</ol>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Vai Trò
						<button type="submit" class="btn btn-dark float-right">
							<a href="<c:url value="/save-rolet" />"> Thêm Quyền</a>
						</button>
					</div>

					<div class="card-body">
						<div class="table-responsive">

							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Id</th>
										<th>Tên Quyền Quản Trị</th>
										<th>Mô Tả</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<c:if test="${not empty list}">
									<c:forEach var="role" items="${list}">
										<tr>
											<td>${role.roleid}</td>
											<td>${role.rolename}</td>
											<td>${role.roledesc}</td>
											<td>
											<button type="submit">
													<a href="${urlUpdate}/${role.roleid}"><i
														class="fas fa-pen" style="color: black"></i></a>
											</button>
											</td>
											
											<td>
											<button type="submit">
													<a href="${urlDelete}/${role.roleid}"><i
														class="fas fa-trash-alt" style="color: black"></i></a>
											</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Sticky Footer -->
		<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © HAD Hotel 2019</span>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.content-wrapper -->


	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
	<!-- Page level plugin JavaScript-->
	<script
		src="<c:url value="/resources/vendor/datatables/jquery.dataTables.js"/>"></script>
	<script
		src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.js"/>"></script>
	<!-- Custom scripts for all pages-->
	<script src="<c:url value="/resources/js/sb-admin.min.js"/>"></script>
	<!-- Demo scripts for this page-->
	<script src="<c:url value="/resources/js/demo/datatables-demo.js"/>"></script>
</body>
</html>