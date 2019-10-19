<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>
	<c:url value="/room-save" var="urlSave" />
	<c:url value="/room-view/" var="urlView" />
	<c:url value="/room-update/" var="urlUpdate" />
	<c:url value="/roomDelete/" var="urlDelete" />


	<div>DANH SÁCH THÔNG TIN PHÒNG</div>
	<a href="${urlSave}">Thêm mới phòng mới</a>
	<br />
	<br />
	<form class="form-inline" action="employee-search" method="get">
		<input class="form-control mr-sm-2" type="search" name="name"
			placeholder="Search by name ..." />
		<button class="btn btn-primary" type="submit">
			<i class="fa fa-search"></i> Search
		</button>
	</form>
	<br />
	<br />
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td>Mã Phòng</td>
			<td>Mã Loại Phòng</td>
			<td>Mã Trạng Thái Phòng</td>
			<td>Hình</td>
			<td>Mô tả</td>
			<td></td>
			<td></td>
		</tr>
		<c:if test="${not empty listRoom}">
			<c:forEach var="room" items="${listRoom}">
				<tr class="text-center">
					<td>${room.roomid}</td>
					<td>${room.roomtypeid}</td>
					<td>${room.roomstatusid}</td>
					<td><img src="/resources/image/${room.roomimage}" width="120"></td>
					<td>${room.roomdesc }</td>
					<td><button>
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i><a
								href="${urlUpdate}/${room.roomid}"> Cập nhật</a>
						</button></td>
					<td><button>
							<i class="fa fa-trash" aria-hidden="true"></i><a
								href="${urlDelete}/${room.roomid}"> Xóa</a>
						</button></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>