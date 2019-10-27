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

	<c:url value="/saveService" var="saveService" />
	<form:form action="${saveService}" modelAttribute="service" method="GET">

		<label>Service Name</label>
		<form:input path="servicename"  />
		<br />
		<label>Service Desc</label>
		<form:input path="servicedesc"  />
		
	
		<br />
		<button type="submit"> save </button>

	</form:form>

</body>
</html>