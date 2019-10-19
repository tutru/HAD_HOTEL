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
Customer Update
<c:url value="/updateEmployee" var="updateEmployee" />
<form:form action="${updateEmployee}" method="POST" modelAttribute="employee">
	    Mã nhân viên: <form:input path="employeeid" readonly="true" />
		<br />
		Tên: <form:input path="name" />
		<br />
    	Ngày sinh: <form:input path="birthday" id="datepicker" />
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
		Số CMND: <form:input path="government" />
		<br />
		Số ĐT: <form:input path="phone" />
		<br />
		Email: <form:input path="email" />
		<br />
		Địa chỉ: <form:input path="address" />
		<br />
		Hình: <form:input path="image" />
		<br />
		Lương: <form:input path="salary" />
		<br />
		<button type="submit">Update</button>
		<button type="submit"><a href="<c:url value="/employee-list" />">Danh sách nhân viên</a></button>
	</form:form>

</body>
</html>