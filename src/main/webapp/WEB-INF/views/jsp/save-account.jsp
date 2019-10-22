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
	<c:url value="/saveaccount" var="saveaccount" />
	<form:form action="${saveaccount}" modelAttribute="account"
		method="GET">


		<br />
		<label>ID Nhân Viên</label>
		<select name="employeeid">
			<c:if test="${not empty listEmployee}">
				<c:forEach var="employee" items="${listEmployee}">
					<option value=${employee.employeeid}>${employee.name}</option>
				</c:forEach>
			</c:if>
		</select>

		<br />
		<br />
		<label>ID Vai trò</label>
		<select name="roleid">
			<c:if test="${not empty listRole}">
				<c:forEach var="role" items="${listRole}">
					<option value=${role.roleid}>${role.rolename}</option>
				</c:forEach>
			</c:if>
		</select>

		<br />
		<br />
		<label>mật Khẩu</label>
		<form:input path="username" />

		<br />
		<br />
		<label>mật mã</label>
		<form:input path="password" />

		<br />
		<button type="submit">save</button>

	</form:form>
</body>
</html>