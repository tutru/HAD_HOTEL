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
customer save
<c:url value="/saveCustomer" var="saveCustomer" />
<form:form action="${saveCustomer}" method="POST" modelAttribute="customer">
    	<label>ID:</label> 
    	<form:input path="customerid" />
    	<br/>
    	<label>Name:</label> 
    	<form:input path="name" />
    	<br/>
    	<label>government ID:</label> 
    	<form:input path="governmentid" />
    	<br/>
    	<label>address:</label> 
    	<form:input path="address" />
    	<br/>
    	<label>phone:</label> 
    	<form:input path="phone" />
    	<br/>
    	<label>email:</label> 
    	<form:input path="email" />
    	<br/>
    	<label>image:</label> 
    	<form:input path="image" />
    	<br/>
    	<label>CC number:</label> 
    	<form:input path="ccnumber" />
    	<br/>
		<button type="submit" >Thêm</button>
		<button type="submit"><a href="<c:url value="/customerList" />">List Customer</a></button>
	</form:form>
</body>
</html>