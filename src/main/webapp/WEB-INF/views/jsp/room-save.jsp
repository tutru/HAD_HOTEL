<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>  
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Room Save</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin.css" rel="stylesheet">
</head>

<body id="page-top">
	<c:url value="/employee-save" var="urlSave" />
	<c:url value="/employee-view/" var="urlView" />
	<c:url value="/employee-update/" var="urlUpdate" />
	<c:url value="/employeeDelete/" var="urlDelete" />

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
					<a class="dropdown-item" href="list-account">List Account</a> <a
						class="dropdown-item" href="save-account">Create Account</a>
					<h6 class="dropdown-header">Role:</h6>
					<a class="dropdown-item" href="list-role">List Role</a> <a
						class="dropdown-item" href="save-role">Create Role</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-door-open"></i> <span>Room</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Room Type:</h6>
					<a class="dropdown-item" href="roomtype-list">List Room Type</a> <a
						class="dropdown-item" href="roomtype_save">Create Room Type</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Room Status:</h6>
					<a class="dropdown-item" href="roomstatus-list">List Room
						Status</a> <a class="dropdown-item" href="roomstatus-save">Create
						Room Status</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Room:</h6>
					<a class="dropdown-item" href="room-list">List Room</a> <a
						class="dropdown-item" href="room-save">Create Room</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
					class="fas fa-money-check-alt"></i> <span>Payment</span> </a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Payment Type:</h6>
					<a class="dropdown-item" href="paymenttype-list">List Payment
						Type</a> <a class="dropdown-item" href="paymenttype-save">Create
						Payment Type</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Payment:</h6>
					<a class="dropdown-item" href="payment-list">List Payment</a> <a
						class="dropdown-item" href="payment-save">Create Payment</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-check-square"></i> <span>Booking</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Reservation:</h6>
					<a class="dropdown-item" href="reservation-list">List
						Reservation</a> <a class="dropdown-item" href="reservation-save">Create
						Resertvation</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Reception:</h6>
					<a class="dropdown-item" href="reception-list">List Reception</a> <a
						class="dropdown-item" href="reception-save">Create Reception</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="pagesDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-list-ol"></i> <span>Service</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="service-list">List Service</a> <a
						class="dropdown-item" href="service-save">Create Service</a>
				</div></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Persion</a></li>
					<li class="breadcrumb-item active">Room Save</li>
				</ol>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Add Information Room
					</div>

				</div>
			</div>



			<div class="container">
				<c:url value="/saveRoom" var="saveRoom" />
				<form:form id="roomsAdd" action="${saveRoom}" modelAttribute="room"
					enctype="multipart/form-data" onsubmit="return validateForm()"
					name="myForm" method="POST">
					<div class="form-group row">
						<div class="col-md-6">
							<label> Name Room Type:</label> <select name="roomtypeid"
								class="form-control">
								<c:if test="${not empty listRoomType}">
									<c:forEach var="roomtype" items="${listRoomType}">
										<option value=${roomtype.roomtypeid}>${roomtype.roomtypename}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>

						<div class="col-md-6">
							<label>Name Room Status:</label> <select name="roomstatusid"
								class="form-control">
								<c:if test="${not empty listRoomStatus}">
									<c:forEach var="roomstatus" items="${listRoomStatus}">
										<option value=${roomstatus.roomstatusid } class="form-group">${roomstatus.roomstatusname}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<br />
					<br />
					<div class="form-group row">
						<div class="col-md-6">
							<label>Room Number: </label>
							<form:input class="form-control" path="roomnumber"
								placeholder="Room number" required="required"
								title="Please enter room number" type="number" />
							<div style="color: red;">${msg}</div>
						</div>

						<br /> <br />
						<div class="col-md-6">
							<label>Price</label>
							<form:input class="form-control" path="roomprice"
								placeholder="Price" required="required" type="number"
								title="Please enter price" />

						</div>
					</div>

					<br />
					<br />
					<div class="form-group row">
						<div class="col-md-6">
							<label>Image:</label>
							<output id="list">
								<img src="/HotelManagement/resources/image/441.jpg" width="120">
							</output>
							<span class="input-group-btn"> <span
								class="btn btn-default btn-file"> <input type="file"
									id="files" name="uploadImg">
							</span>
							</span>
							<script>
								if (window.FileReader) {
									function handleFileSelect(evt) {
										var files = evt.target.files;
										var f = files[0];
										var reader = new FileReader();

										reader.onload = (function(theFile) {
											return function(e) {
												document.getElementById('list').innerHTML = [ '<img src="', e.target.result, '" title="', theFile.name, '" width="120"/>' ]
														.join('');
											};
										})(f);

										reader.readAsDataURL(f);
									}
								} else {
									alert('This browser does not support FileReader');
								}

								document.getElementById('files')
										.addEventListener('change',
												handleFileSelect, false);
							</script>
							<br /> <br />
						</div>
						<div class="col-md-6">
							<label>Room Desc</label>
							<textarea name="roomdesc" rows="3" cols="50" class="form-control"
								required="required" title="Please enter desc" placeholder="desc">
                       </textarea>
						</div>
					</div>
					<br />
					<br />

					<form:button type="submit" class="btn btn-success">
						<i class="far fa-save"></i> Room Save</form:button>
					<form:button id="editbutton" type="submit" class="btn btn-danger">
						<a  style="text-decoration: none;color: white" href="<c:url value="/room-list" />"><i
							class="far fa-arrow-alt-circle-left"></i> Return</a>
					</form:button>
				</form:form>


				<script type="text/javascript">
					function validateForm() {
						var name = document.forms["myForm"]["roomnumber"].value;
						var a = document.forms["myForm"]["roomprice"].value;

						if (name == "") {
							alert("Số Phòng không được bỏ trống ");
							return false;
						}
						if (a == "") {
							alert("Tiền không được bỏ trống ");
							return false;
						}

						return true;
					}
				</script>


				<br />
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
					<a class="btn btn-primary" href="<c:url value="/logout"/>">Logout</a>
				</div>
			</div>
		</div>
	</div>



	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="resources/vendor/datatables/jquery.dataTables.js"></script>
	<script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="resources/js/demo/datatables-demo.js"></script>

</body>
</body>
</html>



