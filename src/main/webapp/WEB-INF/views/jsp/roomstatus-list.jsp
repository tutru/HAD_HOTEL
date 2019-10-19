<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>
	<c:url value="/roomstatus-save" var="urlSave" />
	<c:url value="/roomstatus-view/" var="urlView" />
	<c:url value="/roomstatus-update/" var="urlUpdate" />
	<c:url value="/roomstatus-delete/" var="urlDelete" />

	<div>DANH SÁCH THÔNG TIN TRẠNG THÁI PHÒNG</div>
		<a href="${urlSave}">Thêm mới khách hàng</a>
	<br />
	<br />
	<form class="form-inline" action="roomstatus-search" method="get">
		<input class="form-control mr-sm-2" type="search" name="roomstatusname"
			placeholder="Search by name ..." />
		<button class="btn btn-primary" type="submit">
			<i class="fa fa-search"></i> Search
		</button>
	</form>
	<br />
		<table border="1" style="border-collapse: collapse;">
	<tr> 
	<td>Mã trạng thái phòng</td>
	<td>Tên trạng thái phòng</td>
	<td>Mô tả</td>
	<td></td>
	<td></td>
	</tr>

		<c:if test="${not empty listRoomStatus}">
			<c:forEach var="roomstatus" items="${listRoomStatus}">
				<tr class="text-center">
					<td>${roomstatus.roomstatusid}</td>
					<td>${roomstatus.roomstatusname}</td>
					<td>${roomstatus.roomstatusdesc}</td>
					 
					<td><button>
							<a href="${urlUpdate}/${roomstatus.roomstatusid}"> Cập nhật</a>
						</button></td>
					<td><button>
							<a href="${urlDelete}/${roomstatus.roomstatusid}"> Xóa</a>
						</button></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>