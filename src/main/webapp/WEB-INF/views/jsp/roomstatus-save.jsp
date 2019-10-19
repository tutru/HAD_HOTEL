<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>

	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
	</script>
	<div>THÊM MỚI THÔNG TIN TRẠNG THÁI PHÒNG</div>
	<c:url value="/saveRoomStatus" var="saveRoomStatus" />
	<form:form id="roomStatusAdd" action="${saveRoomStatus}"
		modelAttribute="roomstatus" enctype="multipart/form-data">
		<label>Tên trạng thái:</label>
		<form:input type="text" path="roomstatusname" />
		<br />
		<br />
		<label>Mô tả trạng thái:</label>
		<form:input type="text" path="roomstatusdesc" />
		<br />
		<br />
		<form:button type="submit"> Thêm</form:button>
		<form:button type="submit">
			<a href="<c:url value="/roomstatus-list" />"> Xem danh sách trạng
				thái phòng</a>
		</form:button>
	</form:form>

</body>
</html>