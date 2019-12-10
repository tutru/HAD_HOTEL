<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<html lang="vn">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="ISO-8859-1">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Create Reservation</title>

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"></c:url>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/sb-admin.css"></c:url>">
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.css"></c:url>">
<style type="text/css">
#editbutton a{
color: white
}
#editbutton a{
text-decoration: none
}
</style>
</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index.html" ><img src="/HotelManagement/resources/image/logo.JPG" width="120"></a>

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
					<a class="dropdown-item">Account: ${name}</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Settings</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="index">
					<i class="fas fa-home"></i> <span>Home</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-tasks"></i> <span>Person</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Customer:</h6>
					<a class="dropdown-item" href="customer-list">List Customer</a> <a
						class="dropdown-item" href="customer-save">Create Customer</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Employee:</h6>
					<a class="dropdown-item" href="employee-list">List Employee</a> <a
						class="dropdown-item" href="employee-save">Create Employee</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-shield-alt"></i> <span>Security</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Account:</h6>
					<a class="dropdown-item" href="customer-list">List Account</a> <a
						class="dropdown-item" href="register.html">Create Account</a>
					<h6 class="dropdown-header">Role:</h6>
					<a class="dropdown-item" href="customer-list">List Role</a> <a
						class="dropdown-item" href="register.html">Create Role</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-door-open"></i> <span>Room</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Room Type:</h6>
					<a class="dropdown-item" href="roomtype-list">List Room Type</a> <a
						class="dropdown-item" href="roomtype-save">Create Room Type</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Room Status:</h6>
					<a class="dropdown-item" href="roomstatus-list">List Room
						Status</a> <a class="dropdown-item" href="roomstatus-save">Create
						Room Status</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Room:</h6>
					<a class="dropdown-item" href="customer-list">List Room</a> <a
						class="dropdown-item" href="register.html">Create Room</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-money-check-alt"></i> <span>Payment</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Payment Type:</h6>
					<a class="dropdown-item" href="customer-list">List Payment Type</a>
					<a class="dropdown-item" href="register.html">Create Payment
						Type</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Payment:</h6>
					<a class="dropdown-item" href="customer-list">List Payment</a> <a
						class="dropdown-item" href="register.html">Create Payment</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-check-square"></i> <span>Booking</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Reservation:</h6>
					<a class="dropdown-item" href="reservation-list">List
						Reservation</a> <a class="dropdown-item" href="<c:url value="/reservation-save"/>">Create Reservation</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Reception:</h6>
					<a class="dropdown-item" href="reception-list">List Reception</a> <a
						class="dropdown-item" href="reception-save">Create Reception</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-list-ol"></i> <span>Service</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="login.html">List Service</a> <a
						class="dropdown-item" href="register.html">Create Service</a>
				</div></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Booking</a></li>
					<li class="breadcrumb-item active">Create Reservation</li>
				</ol>
				<c:url value="/saveReservation" var="saveReservation" />
				<form:form action="${saveReservation}" method="POST"
					modelAttribute="reservation">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ID:</label>
							<form:input class="form-control" path="reservationid"
								readonly="true" />
							<br /> <label>Customer</label> <select class="form-control"
								name="customerid">
								<c:if test="${not empty listCustomer}">
									<c:forEach var="customer" items="${listCustomer}">
										<option value=${customer.customerid}>${customer.name}</option>
									</c:forEach>
								</c:if>
							</select> <br /> <label>Room Type</label> <select class="form-control"
								name="roomtypeid">
								<c:if test="${not empty listRoomType}">
									<c:forEach var="roomType" items="${listRoomType}">
										<option value=${roomType.roomtypeid}>${roomType.roomtypename}</option>
									</c:forEach>
								</c:if>
							</select> <br /> <label>Expected Check Date</label>
							<form:input class="form-control" path="expectedcheckdate"
								id="datepicker" placeholder="Expected Check Date" required="required" pattern="[a-z]\{20}"
								title="Please choose Date"/>
							<script>
								$(function() {
									$.datepicker.setDefaults({
										onClose : function(date, inst) {
											$("#selectedDtaeVal").html(date);
										}
									});

									$("#datepicker").datepicker({
										dateFormat : 'yy-mm-dd'
									});
								});
							</script>
							<br />
						</div>
						<div class="form-group col-md-6">
							<label>Expected Room:</label>
							<form:input class="form-control" path="expectedroom" />
							<br /> <label>Advance Deposit:</label>
							<form:input class="form-control" path="isdeposit" required="required" pattern="[0-9]\{20}"
								title="Please type Deposit"/>
							<br /> <label>Status:</label>
							<form:textarea rows="5" class="form-control" path="reservationstatus"
								placeholder="Reservation Status" />
							<br />
							<br/>
							<button type="submit" class="btn btn-success"> <i class="far fa-save"></i>Save</button>
							<form:button id="editbutton" type="submit" class="btn btn-danger">
								<a href="<c:url value="/reservation-list" />"><i class="far fa-arrow-alt-circle-left"></i>Return</a>
							</form:button>
						</div>
				</form:form>
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
