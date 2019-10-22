<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:url value="/update-account/" var="urlUpdate" />
	<c:url value="/accountDelete/" var="urlDelete" />
	<form:form action="/HotelManagement/account-search"
		modelAttribute="search" method="GET">
		<input type="search" name="username" placeholder="Tìm kiếm ..."/>
		<button style="margin-left: 20px;" type="submit">Tìm kiếm</button>		
	</form:form>
	<table>
		<br />
		<tr>
			<th>Id</th>
			<th>ID Nhân Viên</th>
			<th>ID trạng thái</th>
			<th>Tài khoản</th>
			<th>Mật khẩu</th>
			<th></th>
			<th></th>
		</tr>
		<div></div>
		<c:forEach var="ac" items="${list}">
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
	</table>
</body>
</html>