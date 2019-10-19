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
<c:url value="/updateRoomType" var="updateRoomType" />
<form:form action="${updateRoomType}" method="POST" modelAttribute="roomtype">
	    Mã loại phòng: <form:input path="roomtypeid" readonly="true" />
		<br />
		Tên loại phòng: <form:input path="roomtypename" />
		<br />
		Mô tả loại phòng: <form:input path="roomtypedesc" />
		<br />
		Giá phòng: <form:input path="roomprice" />
		<br />
		<button type="submit">Update</button>
		<button type="submit"><a href="<c:url value="/roomtype-list" />">Danh sách loại phòng</a></button>
	</form:form>

</body>
</html>