<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
#sidebar-wrapper {
	z-index: 1;
	position: absolute;
	width: 0;
	height: 100%;
	overflow-y: hidden;
	background: white;
	opacity: 0.9;
}

#page-content-wrapper {
	width: 100%;
	position: absolute;
	padding: 15px;
}

#wrapper.menuDisplayed #sidebar-wrapper {
	width: 300px;
}

#wrapper.menuDisplayed #page-content-wrapper {
	padding-left: 300px;
}

.sidebar-nav {
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 20px;
	line-height: 40px;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: black;
	font-family: Baskerville, "Palatino Linotype", Palatino,
		"Century Schoolbook L", "Times New Roman", "serif";
	font-weight: bold;
	font-size: 22px;
	margin-top: 12px;
}

.sidebar-nav li a:hover {
	color: #f37021;
}

#menuproduct {
	background-color: #0082c0;
	color: white;
	font-size: 20px;
	font-weight: bold;
	font-family: Baskerville, "Palatino Linotype", Palatino,
		"Century Schoolbook L", "Times New Roman", "serif";
	height: 60px;
	line-height: 60px;
	margin-top: 20px;
}

#textfield {
	background-color: white;
	height: 40px;
	line-height: 40px;
	font-size: 18px;
	font-family: Baskerville, "Palatino Linotype", Palatino,
		"Century Schoolbook L", "Times New Roman", "serif";
	font-weight: bold;
	border-top: 2px solid #0082c0;
}

#chinhmenutable {
	background-color: #0180bc;
	color: white;
}


#chinhbutton a {
	color: white;
	text-decoration: none;
}

#chinhbuttonds a {
	color: black;
	text-decoration: none;
}

#chinhbuttonds1 a {
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<c:url value="/employee-save" var="urlSave" />
	<c:url value="/employee-view/" var="urlView" />
	<c:url value="/employee-update/" var="urlUpdate" />
	<c:url value="/employeeDelete/" var="urlDelete" />

	<div id="wrapper">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li><img style="margin-top: 15px; margin-left: 25px;"
					src="/AgileProject3/resources/image/fpt.jpg" width="220px"></li>
				<li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>
						Trang chủ</a></li>
				<li><a href="#"><i class="fa fa-users" aria-hidden="true"></i>
						Nhân viên</a></li>
				<li><a href="#"><i class="fa fa-users" aria-hidden="true"></i>
						Khách hàng</a></li>
				<li><a href="#"><i class="fa fa-shopping-bag"
						aria-hidden="true"></i> Loại sản phẩm</a></li>
				<li><a href="#"><i class="fa fa-shopping-bag"
						aria-hidden="true"></i> Sản phẩm</a></li>
				<li><a href="HTML/hoadon.html"><i
						class="fa fa-shopping-cart" aria-hidden="true"></i> Hóa đơn</a></li>
				<li><a href="#"><i class="fa fa-list-alt"
						aria-hidden="true"></i> Thống kê</a></li>
			</ul>
		</div>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-1">
						<a href="#" class="btn btn-danger" id="menu-toggle"><i
							class="fa fa-bars" aria-hidden="true"></i> Menu</a>
					</div>

				</div>
				<script>
					$("#menu-toggle").click(function(e) {
						e.preventDefault();
						$("#wrapper").toggleClass("menuDisplayed");
					});
				</script>
				<div style="text-align: center" id="menuproduct" class="col-sm-12">
					<i class="fa fa-file-text" aria-hidden="true"></i> DANH SÁCH THÔNG
					TIN KHÁCH HÀNG
				</div>
				<form:form action="/AgileProject3/khachhang-search"
					modelAttribute="nhanvien" method="get">
					<table>
						<td><input type="search" name="ten"
							placeholder="Tìm kiếm ..."
							class="form-control form-control-lg col-sm-13"></td>
						<td><button style="margin-left: 20px;"
								class="btn btn-primary" type="submit">
								<i class="fa fa-search"></i> Tìm kiếm
							</button></td>
						<td><button style="margin-left: 20px;" id="chinhbuttonds1"
								type="button" class="btn btn-success">
								<i class="fa fa-arrow-left" aria-hidden="true"></i><a
									href="${urlSave}"> Trở về trang thêm mới</a>
							</button></td>
					</table>
				</form:form>

				<br />
				<table style="background-color: white" class="table table-striped">
					<tr id="chinhmenutable" class="text-center">
						<th
							style="font-weight: bold; font-family: Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'">MÃ
							KHÁCH HÀNG</th>
						<th
							style="font-weight: bold; font-family: Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'">TÊN
							KHÁCH HÀNG</th>
						<th
							style="font-weight: bold; font-family: Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'">NGÀY
							SINH</th>
						<th
							style="font-weight: bold; font-family: Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'">SỐ
							ĐIỆN THOẠI</th>
						<th
							style="font-weight: bold; font-family: Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'">ĐỊA
							CHỈ</th>
						<th
							style="font-weight: bold; font-family: Baskerville, 'Palatino Linotype', Palatino, 'Century Schoolbook L', 'Times New Roman', 'serif'">HÌNH</th>
					</tr>
					<c:if test="${not empty listEmployee}">
						<c:forEach var="employee" items="${listEmployee}">
							<tr class="text-center">
								<td>${employee.id}</td>
								<td>${employee.name}</td>
								<td>${employee.birthday}</td>
								<td>${employee.governmentid}</td>
								<td>${employee.phone}</td>
								<td>${employee.email}</td>
								<td>${employee.address}</td>
								<td>${employee.diachi}</td>
								<td><img
									src="/AgileProject3/resources/image/${employee.image}"
									width="120"></td>
									<td>${employee.salary}</td>
								<td><button id="chinhbuttonds" type="button"
										class="btn btn-warning">
										<i class="fa fa-pencil-square-o" aria-hidden="true"></i><a
											href="${urlView}/${employee.id}"> Xem</a>
									</button></td>
								<td><button id="chinhbuttonds1" type="button"
										class="btn btn-danger">
										<i class="fa fa-trash" aria-hidden="true"></i><a
											href="${urlDelete}/${employee.id}"> Xóa</a>
									</button></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</div>
</body>
</html>