<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Danh sách khách hàng</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
//////////////
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
	<c:url value="/nhanvien/" var="urllist" />
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
		<c:if test="${not empty search}">
			<c:forEach var="khachhang" items="${search}">
				<tr class="text-center">
					<td>${khachhang.idkh}</td>
					<td>${khachhang.ten}</td>
					<td>${khachhang.ngaysinh}</td>
					<td>${khachhang.sdt}</td>
					<td>${nhanvien.diachi}</td>
					<td><img
						src="/AgileProject3/resources/image/${khachhang.image}"
						width="120"></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<form:button id="chinhbutton" type="submit" class="btn btn-success">
		<a href="<c:url value="/khachhang-list" />"><i
			class="fa fa-arrow-left" aria-hidden="true"></i> Trở Về danh sách
			nhân viên</a>
	</form:button>

</body>
</html>