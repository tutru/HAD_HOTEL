<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>

	<c:url value="/savePaymenttype" var="savePaymenttype" />
	<form:form action="${savePaymenttype}" modelAttribute="payment" method="GET">

		<label>PaymentType Name</label>
		<form:input path="paymenttypename"  />
		<br />
		<label>PaymentType Desc</label>
		<form:input path="paymenttypedesc"  />
		
	
		<br />
		<button type="submit"> save </button>

	</form:form>

</body>
</html>