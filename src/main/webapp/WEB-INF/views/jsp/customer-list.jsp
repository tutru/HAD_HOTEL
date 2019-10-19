<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>
	<c:url value="/customer-save" var="urlSave" />
	<c:url value="/customer-view/" var="urlView" />
	<c:url value="/customer-update/" var="urlUpdate" />
	<c:url value="/customerDelete/" var="urlDelete" />


	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
	</script>
	<div>CUSTOMER LIST</div>
	<form:form action="/HotelManagement/customer-search"
		modelAttribute="customer" method="get">

		<td><input type="search" name="name" placeholder="Tìm kiếm ..."></td>
		<td><button type="submit">Tìm kiếm</button></td>
		<td><button>
				<a href="${urlSave}"> Trở về trang thêm mới</a>
			</button></td>

	</form:form>

	<br />
	<table>

		<table border="1px">
			<tr>
				<th>customerid</th>
				<th>name</th>
				<th>governmentid</th>
				<th>address</th>
				<th>phone</th>
				<th>email</th>
				<th>image</th>
				<th>ccnumber</th>
				<th></th>
			</tr>
			<c:if test="${not empty listCustomer}">
				<c:forEach var="customer" items="${listCustomer}">
					<tr class="text-center">
						<td>${customer.customerid}</td>
						<td>${customer.name}</td>
						<td>${customer.governmentid}</td>
						<td>${customer.address}</td>
						<td>${customer.phone}</td>
						<td>${customer.email}</td>
						<td>${customer.image}</td>
						<td>${customer.ccnumber}</td>
						<td><button>
								<a href="${urlView}/${customer.customerid}">View</a>
							</button></td>
							<td><button>
								<a href="${urlUpdate}/${customer.customerid}">Update</a>
							</button></td>
						<td><button>
								<a href="${urlDelete}/${customer.customerid}">Delete</a>
							</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</table>
</body>
</html>