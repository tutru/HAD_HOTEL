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
<c:url value="/updateReservation" var="updateReservation" />
<form:form action="${updateReservation}" method="POST" modelAttribute="reservation">
	    reservationid: <form:input path="reservationid" readonly="true" />
		<br />
    	customerid: <form:input path="customerid" />
		<br />
		roomtypeid: <form:input path="roomtypeid" />
		<br />
		expectedcheckdate: <form:input path="expectedcheckdate" />
		<br />
		expectedroom: <form:input path="expectedroom" />
		<br />
		isdeposit: <form:input path="isdeposit" />
		<br />
		reservationstatus: <form:input path="reservationstatus" />
		<br />

		<button type="submit">Update</button>
		<button type="submit"><a href="<c:url value="/reservation-list" />">List Reservation</a></button>
	</form:form>

</body>
</html>