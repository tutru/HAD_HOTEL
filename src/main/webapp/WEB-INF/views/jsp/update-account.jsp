<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<br />
	<c:url value="/updateaccount" var="updateaccount" />
	<form:form action="${updateaccount}" modelAttribute="account"
		method="POST">

		<label>id</label>
		<form:input path="accountid" readonly="true" />
		<br />
		<label>ID Nhân Viên</label>
		<form:input path="employeeid" />
		<br />
		<label> Vai trò</label>
		<form:select path="roleid">
			<form:option value="2">admin</form:option>
			<form:option value="3">Nhân Viên </form:option>
		</form:select>
		<br />
		<label>mật khẩu</label>
		<form:input path="username" />
		<br />
		<label>mật mã</label>
		<form:input path="password" />
		<br />

		<button type="submit">Cập nhật</button>


	</form:form>
</body>
</html>