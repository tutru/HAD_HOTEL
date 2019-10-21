<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>
	<c:url value="/employee-save" var="urlSave" />
	<c:url value="/employee-view/" var="urlView" />
	<c:url value="/employee-update/" var="urlUpdate" />
	<c:url value="/employeeDelete/" var="urlDelete" />


	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
	</script>
	<div>DANH SÁCH THÔNG TIN KHÁCH HÀNG</div>
	<form:form action="/HotelManagement/employee-search"
		modelAttribute="employee" method="get">

		<td><input type="search" name="name" placeholder="Tìm kiếm ..."></td>
		<td><button type="submit">Tìm kiếm</button></td>
		<td><button>
				<a href="${urlSave}"> Trở về trang thêm mới</a>
			</button></td>
	</form:form>
	<br />
	<br />
	<table border="1" style="border-collapse: collapse;">
	<tr> 
	<td>Mã nhân viên</td>
	<td>Tên nhân viên</td>
	<td>Ngày sinh</td>
	<td>Số CMND</td>
	<td>Số ĐT</td>
	<td>Email</td>
	<td>Địa chỉ</td>
	<td>Hình</td>
	<td>Lương</td>
	<td></td>
	<td></td>
	</tr>

		<c:if test="${not empty listEmployee}">
			<c:forEach var="employee" items="${listEmployee}">
				<tr class="text-center">
					<td>${employee.employeeid}</td>
					<td>${employee.name}</td>
					<td>${employee.birthday}</td>
					<td>${employee.government }</td>
					<td>${employee.phone}</td>
					<td>${employee.email}</td>
					<td>${employee.address}</td>
					<td><img src="/HotelManagement/resources/image/${employee.image}" width="120"></td>
					<td>${employee.salary}</td>
					<td><button>
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i><a
								href="${urlUpdate}/${employee.employeeid}"> Cập nhật</a>
						</button></td>
					<td><button>
							<i class="fa fa-trash" aria-hidden="true"></i><a
								href="${urlDelete}/${employee.employeeid}"> Xóa</a>
						</button></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>