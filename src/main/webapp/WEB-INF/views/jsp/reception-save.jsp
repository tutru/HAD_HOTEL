<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>reception-save</title>
</head>
<body>
Reception save
<c:url value="/saveReception" var="saveReception" />
<form:form action="${saveReception}" method="POST" modelAttribute="reception">
    	<label>customerid</label> 
    	<form:input path="customerid" />
    	<br/>
    	<label>reservationid:</label> 
    	<form:input path="reservationid" />
    	<br/>
    	<label>roomid:</label> 
    	<form:input path="roomid" />
    	<br/>
    	<label>checkindate:</label> 
    	<form:input path="checkindate" />
    	<br/>
    	<label>expectedcheckindate:</label> 
    	<form:input path="expectedcheckindate" />
    	<br/>
    	<label>checkoutdate:</label> 
    	<form:input path="checkoutdate" />
    	<br/>
    	<label>serviceid:</label> 
    	<form:input path="serviceid" />
    	<br/>
    	<label>reservationstatus:</label> 
    	<form:input path="reservationstatus" />
    	<br/>
		<form:button type="submit"> Thêm</form:button>
		<button type="submit"><a href="<c:url value="/reception-list"/>">List Reception</a></button>
	</form:form>
</body>
</html>