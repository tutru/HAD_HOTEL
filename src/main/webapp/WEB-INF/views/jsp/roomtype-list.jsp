<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>
	<c:url value="/roomtype-save" var="urlSave" />
	<c:url value="/roomtype-view/" var="urlView" />
	<c:url value="/roomtype-update/" var="urlUpdate" />
	<c:url value="/roomtypeDelete/" var="urlDelete" />

	<div>DANH SÁCH THÔNG TIN KHÁCH HÀNG</div>
		<a href="${urlSave}">Thêm mới khách hàng</a>
	<br />
	<br />
	<form class="form-inline" action="roomtype-search" method="get">
		<input class="form-control mr-sm-2" type="search" name="roomtypename"
			placeholder="Search by name ..." />
		<button class="btn btn-primary" type="submit">
			<i class="fa fa-search"></i> Search
		</button>
	</form>
	<br />
		<table border="1" style="border-collapse: collapse;">
	<tr> 
	<td>Mã Phòng</td>
	<td>Tên Loại Phòng</td>
	<td>Mô Tả Loại Phòng</td>
	<td>Giá Phòng</td>
	<td></td>
	<td></td>
	</tr>

		<c:if test="${not empty listRoomType}">
			<c:forEach var="roomtype" items="${listRoomType}">
				<tr class="text-center">
					<td>${roomtype.roomtypeid}</td>
					<td>${roomtype.roomtypename}</td>
					<td>${roomtype.roomtypedesc}</td>
				    <td>${roomtype.roomprice }</td>  
					<td><button>
							<a href="${urlUpdate}/${roomtype.roomtypeid}"> Cập nhật</a>
						</button></td>
					<td><button>
							<a href="${urlDelete}/${roomtype.roomtypeid}"> Xóa</a>
						</button></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>