<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>

	<c:url value="/savePayment" var="savePayment" />
	<form:form action="${savePayment}" modelAttribute="payment"
		method="GET" enctype="multipart/form-data">

		<label>Payment Type ID</label>
		<form:input path="paymenttypeid" />
		<br />
		<br />
		<label>Reception ID</label>
		<form:input path="receptionid" />
		<br />
		<br />
		<label>Payment Amount</label>
		<form:input path="paymentamount" />
		<br />
		<br />
		<label id="textfield" class="col-sm-12">Payment Date</label>
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


		<br />
		<button type="submit">Save</button>

	</form:form>

</body>
</html>