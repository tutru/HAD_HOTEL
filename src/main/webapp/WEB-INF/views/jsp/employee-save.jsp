<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
///////////////////////////////
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
	<div id="wrapper">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li><img style="margin-top: 15px;margin-left: 25px;"
					src="/AgileProject3/resources/image/fpt.jpg"
					width="220px"></li>
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
					<i class="fa fa-file-text" aria-hidden="true"></i> THÊM MỚI THÔNG
					TIN KHÁCH HÀNG
				</div>

				</br>


				<c:url value="/saveKhachHang" var="saveKhachHang" />


				<form:form id="khachhangAdd" action="${saveKhachHang}"
					modelAttribute="khachhang" enctype="multipart/form-data">

					<label id="textfield" class="col-sm-12">Tên khách hàng:</label>
					<form:input type="text" path="ten"
						class="form-control form-control-lg"
						placeholder="Nhập họ và tên..." />
					<br />

					<label id="textfield" class="col-sm-12">Ngày sinh:</label>
					<form:input type="text" path="ngaysinh" id="datepicker"
						class="form-control form-control-lg"
						placeholder="Chọn ngày sinh..." />

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

					<br />
					<label id="textfield" class="col-sm-12">Số điện thoại</label>
					<form:input path="sdt" type="text" cssClass="form-control"
						class="form-control form-control-lg" />
					
					<br />
					<label id="textfield" class="col-sm-12">Địa chỉ:</label>
					<form:input path="diachi" class="form-control form-control-lg"
						placeholder="Nhập địa chỉ..." />

					<br />
					<label id="textfield" class="col-sm-12">Hình:</label>
					<output id="list">
						<img src="/AgileProject3/resources/image/images.jpg" width="120">
					</output>

					<span class="input-group-btn"> <span
						class="btn btn-default btn-file"> <input type="file"
							id="files" name="uploadImg" required="required">
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

						document.getElementById('files').addEventListener(
								'change', handleFileSelect, false);
					</script>
					<br />
					<br />
					<form:button type="submit" class="btn btn-primary">
						<i class="fa fa-floppy-o" aria-hidden="true"></i> Thêm</form:button>
					<form:button id="chinhbutton" type="submit" class="btn btn-success">
						<a href="<c:url value="/khachhang-list" />"><i
							class="fa fa-file-text-o" aria-hidden="true"></i> Xem danh sách
							khách hàng</a>
					</form:button>

				</form:form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>