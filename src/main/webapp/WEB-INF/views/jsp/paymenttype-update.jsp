<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>

</head>
<body>
	
		
				<c:url value="/updatepaymenttype" var="updatepaymenttype" />
				<form:form action="${updatepaymenttype}" modelAttribute="payment"
					method="POST">

					<label id="textfield" class="col-sm-12">ID</label>
					<form:input readonly="true"
						path="paymenttypeid" />
					</br>
					<label id="textfield" class="col-sm-12">Họ và tên</label>
					<form:input path="paymenttypename"  />
					<br />
					<label id="textfield" class="col-sm-12">Địa chỉ:</label>
					<form:input path="paymenttypedesc" />
					<br />
					<br />
					<button id="chinhbuttonds" class="btn btn-warning" type="submit">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Cập nhật
					</button>

				
				</form:form>
</body>
</html>