<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
customer save
<c:url value="/saveCustomer" var="saveCustomer" />
<form:form action="${saveCustomer}" method="POST" modelAttribute="customer" enctype="multipart/form-data">
    	<label>ID:</label> 
    	<form:input path="customerid" />
    	<br/>
    	<label>Name:</label> 
    	<form:input path="name" />
    	<br/>
    	<label>government ID:</label> 
    	<form:input path="governmentid" />
    	<br/>
    	<label>address:</label> 
    	<form:input path="address" />
    	<br/>
    	<label>phone:</label> 
    	<form:input path="phone" />
    	<br/>
    	<label>email:</label> 
    	<form:input path="email" />
    	<br/>
    	<label>Image:</label>
		<output id="list">
			<img src="/HotelManagement/resources/image/441.jpg" width="120">
		</output>

		<span class="input-group-btn"> <span
			class="btn btn-default btn-file"> <input type="file"
				id="files" name="uploadImg" required="required">
		</span>
		</span>
		<script>
			if (window.FileReader) {
				function handleFileSelect(evt) {
					var files = evt.target.files;
					var f = files[0];
					var reader = new FileReader();

					reader.onload = (function(theFile) {
						return function(e) {
							document.getElementById('list').innerHTML = [ '<img src="', e.target.result, '" title="', theFile.name, '" width="120"/>' ]
									.join('');
						};
					})(f);

					reader.readAsDataURL(f);
				}
			} else {
				alert('This browser does not support FileReader');
			}

			document.getElementById('files').addEventListener('change',
					handleFileSelect, false);
		</script>
		<br />
		<br />
    	<label>CC number:</label> 
    	<form:input path="ccnumber" />
    	<br/>
		<button type="submit" >Thêm</button>
		<button type="submit"><a href="<c:url value="/customerList" />">List Customer</a></button>
	</form:form>
</body>
</html>