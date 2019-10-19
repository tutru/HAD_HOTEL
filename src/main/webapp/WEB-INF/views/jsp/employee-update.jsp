<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdateHoaDon</title>
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

#wrapper {
	background-color: #f1f2f3;
}

#chinhbutton a {
	color: white;
	text-decoration: none;
}

.error-msg {
	font-size: 90%;
	font-style: italic;
	color: red;
}
</style>
</head>
<body>
	<c:url value="/updateHoaDon" var="updateHD" />
	<div id="wrapper">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				    <li><img style="margin-top: 15px;margin-left: 25px;"
                             src="/AgileProject3/resources/images/download.png"
                             width="220px"></li>
                    <li><a href="hoadonList"><i class="fa fa-home" aria-hidden="true"></i>
                            Trang chủ</a></li>
                    <li><a href="nhanvienList"><i class="fa fa-users" aria-hidden="true"></i>
                            Nhân viên</a></li>
                    <li><a href="khachhangList"><i class="fa fa-users" aria-hidden="true"></i>
                            Khách hàng</a></li>
                    <li><a href="loaiList"><i class="fa fa-shopping-bag"
                                              aria-hidden="true"></i> Loại sản phẩm</a></li>
                    <li><a href="sanphamList"><i class="fa fa-shopping-bag"
                                                 aria-hidden="true"></i> Sản phẩm</a></li>
                    <li><a href="hoadonList"><i
                                class="fa fa-shopping-cart" aria-hidden="true"></i> Hóa đơn</a></li>
                    <li><a href="billReport"><i class="fa fa-list-alt"
                                                aria-hidden="true"></i> Thống kê</a></li>
			</ul>
		</div>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-1">
						<a href="#" class="btn btn-danger" id="menu-toggle"><i
							class="fa fa-bars" aria-hidden="true"> Menu</i></a>
					</div>
				</div>
				<script>
					$("#menu-toggle").click(function(e) {
						e.preventDefault();
						$("#wrapper").toggleClass("menuDisplayed");
					});
				</script>

				<div style="text-align: center" id="menuproduct" class="col-sm-12">
					<i class="fa fa-file-text" aria-hidden="true"></i> CẬP NHẬT THÔNG TIN HÓA ĐƠN
				</div>
	<form:form action="${updateHD}" method="POST" modelAttribute="hoadon">
	    ID hóa đơn: <form:input class="form-control form-control-lg" path="idhd" readonly="true" />
		<br />
		Tên sản phẩm: <%-- <form:input path="idsp" /> --%>
		 <form:select class="form-control form-control-lg" path="idsp">
			<c:if test="${not empty listSanPham}">
				<c:forEach var="sanpham" items="${listSanPham}">
					<option value=${sanpham.idsp}>${sanpham.tensp}</option>
				</c:forEach>
			</c:if>
		</form:select>
		<br />
    	Số lượng: <form:input class="form-control form-control-lg" path="soluong" />
		<br />
    	Ngày nhập <%-- <form:input path="ngaynhap" /> --%>
		<form:input class="form-control form-control-lg" type="text" path="ngaynhap" id="datepicker" />
		<br />
		Tên nhân viên: <%-- <form:input class="form-control form-control-lg" path="idnv" /> --%>
		<select class="form-control form-control-lg" name="idnv">
			<c:if test="${not empty listNhanVien}">
				<c:forEach var="nhanvien" items="${listNhanVien}">
					<option value=${nhanvien.idnv}>${nhanvien.tennv}</option>
				</c:forEach>
			</c:if>
		</select>
		<br />
		Tên khách hàng: <%-- <form:input path="idkh" /> --%>
		<select class="form-control form-control-lg" name="idkh">
			<c:if test="${not empty listKhachHang}">
				<c:forEach var="khachhang" items="${listKhachHang}">
					<option value=${khachhang.idkh}>${khachhang.ten}</option>
				</c:forEach>
			</c:if>
		</select>
		<br />
		Ghi chú: <form:input class="form-control form-control-lg" path="ghichu" />
		<br />
		<button id="chinhbuttonds" class="btn btn-warning" type="submit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Cập nhật</button>
		<button id="chinhbutton" type="submit" class="btn btn-success"><a href="<c:url value="/hoadonList" />"><i
							class="fa fa-file-text-o" aria-hidden="true"></i> Danh sách hóa đơn</a></button>
	</form:form>

	<script>
		$(function() {
			$.datepicker.setDefaults({
				onClose : function(date, inst) {
					$("#selectedDtaeVal").html(date);
				}
			});

			$("#datepicker").datepicker();
		});
	</script>

</body>
</html>