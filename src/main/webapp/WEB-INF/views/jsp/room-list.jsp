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
	<form class="form-inline" action="employee-search" method="get">
		<input class="form-control mr-sm-2" type="search" name="name"
			placeholder="Search by name ..." />
		<button class="btn btn-primary" type="submit">
			<i class="fa fa-search"></i> Search
		</button>
	</form>
	<br />
	<table>

		<c:if test="${not empty listRoom}">
			<c:forEach var="room" items="${listRoom}">
				<tr class="text-center">
					<td>${room.roomid}</td>
					<td>${room.roomtypeid}</td>
					<td>${room.roomstatusid}</td>
				    <td>${room.roomimage }</td>
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