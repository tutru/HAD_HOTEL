<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>

</head>
<body>

				<c:url value="/updateService" var="updateService" />
				<form:form action="${updateService}" modelAttribute="service"
					method="POST">

					<label id="textfield" class="col-sm-12">Service ID</label>
					<form:input class="form-control form-control-lg" readonly="true"
						path="serviceid" />
					</br>
					<label id="textfield" class="col-sm-12">Service Name</label>
					<form:input path="servicename" class="form-control form-control-lg" />
					<br />
					<label id="textfield" class="col-sm-12">Service Desc</label>
					<form:input path="servicedesc" class="form-control form-control-lg" />
					
						<button type="submit"> Cập nhật </button>
				
				</form:form>
</body>
</html>