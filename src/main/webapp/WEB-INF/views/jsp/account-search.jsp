<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<br />
		<tr>
			<th>Id</th>
			<th>ID Nhân Viên</th>
			<th>ID trạng thái</th>
			<th>tài khoản</th>
			<th>Mật Khẩu</th>
			
			<th></th>
			<th></th>
		</tr>
		<div></div>
		<c:forEach var="ac" items="${search}">

			<tr>
				<td>${ac.accountid}</td>
				<td>${ac.employeeid}</td>
				<td>${ac.roleid}</td>
				<td>${ac.username}</td>
				<td>${ac.password}</td>
				<td><button type="submit">
						<a href="${urlUpdate}/${ac.accountid}">Sửa</a>
					</button></td>
				<td><button type="submit">
						<a href="${urlDelete}/${ac.accountid}">Xóa</a>
					</button></td>

			</tr>

		</c:forEach>
</body>
</html>