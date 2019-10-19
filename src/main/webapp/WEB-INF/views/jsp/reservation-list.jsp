<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>
	<c:url value="/reservation-save" var="urlSave" />
	<c:url value="/reservation-view/" var="urlView" />
	<c:url value="/reservation-update/" var="urlUpdate" />
	<c:url value="/reservationDelete/" var="urlDelete" />


	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
	</script>
	<div>RESERVATION LIST</div>
	<form:form action="/HotelManagement/reservation-search"
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
				<th>reservationid</th>
				<th>customerid</th>
				<th>roomtypeid</th>
				<th>expectedcheckdate</th>
				<th>expectedroom</th>
				<th>isdeposit</th>
				<th>reservationstatus</th>
				<th></th>
			</tr>
			<c:if test="${not empty listReservation}">
				<c:forEach var="reservation" items="${listReservation}">
					<tr class="text-center">
						<td>${reservation.reservationid}</td>
						<td>${reservation.customerid}</td>
						<td>${reservation.roomtypeid}</td>
						<td>${reservation.expectedcheckdate}</td>
						<td>${reservation.expectedroom}</td>
						<td>${reservation.isdeposit}</td>
						<td>${reservation.reservationstatus}</td>
						<%-- <td><button>
								<a href="${urlView}/${reservation.reservationid}">View</a>
							</button></td> --%>
							<td><button>
								<a href="${urlUpdate}/${reservation.reservationid}">Update</a>
							</button></td>
						<td><button>
								<a href="${urlDelete}/${reservation.reservationid}">Delete</a>
							</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</table>
</body>
</html>