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
	Reservation Update
	<c:url value="/updateReception" var="updateReception" />
	<form:form action="${updateReception}" method="POST"
		modelAttribute="reception">
	    receptionid: <form:input path="receptionid" readonly="true" />
		<br />
    	customerid: <form:input path="customerid" />
		<br />
		reservationid: <form:input path="reservationid" />
		<br />
		roomid: <form:input path="roomid" />
		<br />
		checkindate: <form:input path="checkindate" />
		<br />
		expectedcheckindate: <form:input path="expectedcheckindate" />
		<br />
		checkoutdate: <form:input path="checkoutdate" />
		<br />
		serviceid: <form:input path="serviceid" />
		<br />
		reservationstatus: <form:input path="reservationstatus" />
		<br />

		<button type="submit">Update</button>
		<button type="submit">
			<a href="<c:url value="/reservation-list" />">List Reception</a>
		</button>
	</form:form>

</body>
</html>