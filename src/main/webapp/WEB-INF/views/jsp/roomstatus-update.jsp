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
<c:url value="/updateRoomStatus" var="updateRoomStatus" />
<form:form action="${updateRoomStatus}" method="POST" modelAttribute="roomstatus">
	    Mã trạng thái phòng: <form:input path="roomstatusid" readonly="true" />
		<br />
		Tên trạng thái phòng: <form:input path="roomstatusname" />
		<br />
		Mô tả trạng thái: <form:input path="roomstatusdesc" />
		<br />
		
		<button type="submit">Update</button>
		<button type="submit"><a href="<c:url value="/roomstatus-list" />">Danh sách loại phòng</a></button>
	</form:form>

</body>
</html>