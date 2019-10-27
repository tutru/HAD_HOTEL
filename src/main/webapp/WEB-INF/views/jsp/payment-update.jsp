<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<c:url value="/updatePdayment" var="updatePdayment" />
	<form:form action="${updatePdayment}" modelAttribute="payment"
		method="POST">
		<label id="textfield" class="col-sm-12">Service ID</label>
		<form:input class="form-control form-control-lg" readonly="true"
			path="paymentid" />
		</br>
		<label id="textfield" class="col-sm-12">Service Name</label>
		<form:input path="paymenttypeid" class="form-control form-control-lg" />
		<br />
		<label id="textfield" class="col-sm-12">Service ID</label>
		<form:input class="form-control form-control-lg" readonly="true"
			path="receptionid" />
		</br>
		<label id="textfield" class="col-sm-12">Service Name</label>
		<form:input path="paymentamount" class="form-control form-control-lg" />
		<br />
		<label id="textfield" class="col-sm-12" >Payment Date</label>
		<form:input type="text" path="paymentdate" id="datepicker"
			class="form-control form-control-lg" />

		<script>
			$(function() {
				$.datepicker.setDefaults({
					onClose : function(date, inst) {
						$("#selectedDtaeVal").html(date);
					}
				});

				$("#datepicker").datepicker();
			});
		</script>

		<button type="submit">Cập nhật</button>

	</form:form>
</body>
</html>