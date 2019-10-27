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

<title>List PaymentType</title>

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
	<c:url value="/paymenttype-update/" var="urlUpdate" />
	<c:url value="/paymenttypeDelete/" var="urlDelete" />
	<div id="wrapper">
		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Persion</a></li>
					<li class="breadcrumb-item active">List PaymentType</li>
				</ol>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> List PaymentType
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table style="text-align: center;" class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>PaymenttypeID</th>
										<th>Paymenttype Name</th>
										<th>Paymenttype Desc</th>
										<th></th>
										<th></th>


									</tr>
								</thead>
								<c:if test="${not empty listpaymenttype}">
									<c:forEach var="paymenttype" items="${listpaymenttype}">
										<tr>										
											<td>${paymenttype.paymenttypeid}</td>
											<td>${paymenttype.paymenttypename}</td>
											<td>${paymenttype.paymenttypedesc}</td>

											<td style="cursor: pointer;"><button class="btn btn-primary" type="submit">
													<a href="${urlUpdate}/${paymenttype.paymenttypeid}"><i class="fas fa-pen"  style="color: black"></i></a>
												</button></td>
											<td><button type="submit" class="btn btn-danger">
													<a href="${urlDelete}/${paymenttype.paymenttypeid}"><i class="fas fa-trash-alt" style="color: black"></i></a>
												</button></td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
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
</html>