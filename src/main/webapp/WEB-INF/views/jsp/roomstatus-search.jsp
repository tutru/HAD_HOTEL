<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Danh sách loại phòng</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</head>
<body>
	<%-- 	<c:url value="/nhanvien/" var="urllist" /> --%>
	<br />
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td>Mã trạng thái phòng</td>
			<td>Tên trạng thái phòng</td>
			<td>Mô tả</td>
		</tr>


		<c:forEach var="roomstatus" items="${search}">
			<tr class="text-center">
				<td>${roomstatus.roomstatusid}</td>
				<td>${roomstatus.roomstatusname}</td>
				<td>${roomstatus.roomstatusdesc}</td>
		</c:forEach>
	</table>
	<br />
	<form:button type="submit">
		<a href="<c:url value="/roomstatus-list" />"> Trở Về danh sách loại
			phòng</a>
	</form:button>

</body>
</html>