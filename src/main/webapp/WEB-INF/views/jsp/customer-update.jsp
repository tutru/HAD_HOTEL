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
<c:url value="/updateCustomer" var="updateCustomer" />
<form:form action="${updateCustomer}" method="POST" modelAttribute="customer">
	    ID: <form:input path="customerid" readonly="true" />
		<br />
    	name: <form:input path="name" />
		<br />
		governmentid: <form:input path="governmentid" />
		<br />
		address: <form:input path="address" />
		<br />
		phone: <form:input path="phone" />
		<br />
		email: <form:input path="email" />
		<br />
		image: <form:input path="image" />
		<br />
		CC number: <form:input path="ccnumber" />
		<br />

		<button type="submit">Update</button>
		<button type="submit"><a href="<c:url value="/customer-list" />">Danh sách hóa đơn</a></button>
	</form:form>

</body>
</html>