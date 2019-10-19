<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>
	<div>THÊM MỚI THÔNG TIN LOẠI PHÒNG </div>
	<c:url value="/saveRoomType" var="saveRoomType" />
	<form:form id="roomTypeAdd" action="${saveRoomType}"
		modelAttribute="roomtype" enctype="multipart/form-data" >

		<label>Tên Phòng:</label>
		<form:input type="text" path="roomtypename" />
		<br />
		<br />
		
		<label>Mô tả phòng:</label>
		<form:input type="text" path="roomtypedesc" />
		<br />
		<br />
		<label>Giá:</label>
		<form:input type="text" path="roomprice" />
		<br />
		<br />
		
		<form:button type="submit"> Thêm</form:button>
		<form:button type="submit">
			<a href="<c:url value="/roomtype-list" />"> Xem danh sách khách hàng</a>
		</form:button>
	</form:form>

</body>
</html>