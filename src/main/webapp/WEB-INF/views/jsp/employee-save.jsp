<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="ISO-8859-1">
<body>

	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
	</script>

	<div>THÊM MỚI THÔNG TIN KHÁCH HÀNG</div>
	<c:url value="/saveEmployee" var="saveEmployee" />
	<form:form id="employeeAdd" action="${saveEmployee}"
		modelAttribute="employee" enctype="multipart/form-data">

		<label>Name:</label>
		<form:input type="text" path="name" />
		<br />
		<br />
		<label>Birthday:</label>
		<form:input type="text" path="birthday" id="datepicker" />

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
		<br />
		<label>Government ID:</label>
		<form:input type="text" path="governmentid" />
		<br />
		<br />
		<label>Phone:</label>
		<form:input type="text" path="phone" />
		<br />
		<br />
		<label>Email</label>
		<form:input path="email" type="text" />

		<br />
		<br />
		<label>Address</label>
		<form:input path="address" type="text" />
		<br />
		<br />

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

		<label>Salary:</label>
		<form:input path="salary" />

		<br />
		<br />
		<form:button type="submit"> Save</form:button>
		<form:button type="submit">
			<a href="<c:url value="/employee-list" />"> Xem danh sách khách
				hàng</a>
		</form:button>
	</form:form>

</body>
</html>