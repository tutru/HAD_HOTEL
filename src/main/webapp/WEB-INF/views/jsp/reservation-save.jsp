<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>reservation-save</title>
</head>
<body>
Reservation save
<c:url value="/saveReservation" var="saveReservation" />
<form:form action="${saveReservation}" method="POST" modelAttribute="reservation">
    	<label>customerid:</label> 
    	<form:input path="customerid" />
    	<br/>
    	<label>roomtypeid:</label> 
    	<form:input path="roomtypeid" />
    	<br/>
    	<label>expectedcheckdate:</label> 
    	<form:input path="expectedcheckdate" />
    	<br/>
    	<label>expectedroom:</label> 
    	<form:input path="expectedroom" />
    	<br/>
    	<label>isdeposit:</label> 
    	<form:input path="isdeposit" />
    	<br/>
    	<label>reservationstatus:</label> 
    	<form:input path="reservationstatus" />
    	<br/>
		<form:button type="submit"> Thêm</form:button>
		<button type="submit"><a href="<c:url value="/reservation-list"/>">List Reservation</a></button>
	</form:form>
</body>
</html>