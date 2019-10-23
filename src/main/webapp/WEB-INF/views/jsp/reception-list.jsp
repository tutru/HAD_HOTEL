<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<body>
	<c:url value="/reception-save" var="urlSave" />
	<c:url value="/reception-view/" var="urlView" />
	<c:url value="/reception-update/" var="urlUpdate" />
	<c:url value="/receptionDelete/" var="urlDelete" />


	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
	</script>
	<div>RECEPTION LIST</div>
	<br />
	<table>

		<table border="1px">
			<tr>
				<th>receptionid</th>
				<th>customerid</th>
				<th>reservationid</th>
				<th>roomid</th>
				<th>checkindate</th>
				<th>expectedcheckindate</th>
				<th>checkoutdate</th>
				<th>serviceid</th>
				<th>reservationstatus</th>
				<th></th>
			</tr>
			<c:if test="${not empty listReception}">
				<c:forEach var="reception" items="${listReception}">
					<tr class="text-center">
						<td>${reception.receptionid}</td>
						<td>${reception.customerid}</td>
						<td>${reception.reservationid}</td>
						<td>${reception.roomid}</td>
						<td>${reception.checkindate}</td>
						<td>${reception.expectedcheckindate}</td>
						<td>${reception.checkoutdate}</td>
						<td>${reception.serviceid}</td>
						<td>${reception.reservationstatus}</td>
						<%-- <td><button>
								<a href="${urlView}/${reservation.reservationid}">View</a>
							</button></td> --%>
							<td><button>
								<a href="${urlUpdate}/${reception.receptionid}">Update</a>
							</button></td>
						<td><button>
								<a href="${urlDelete}/${reception.receptionid}">Delete</a>
							</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</table>
</body>
</html>