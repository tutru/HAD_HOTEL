<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>

<body>

	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
	</script>
	<div>THÊM MỚI THÔNG TIN TRẠNG THÁI PHÒNG</div>
	<c:url value="/updateRoom" var="updateRoom" />
	<form:form id="roomsAdd" action="${updateRoom}"
		modelAttribute="room" enctype="multipart/form-data">
		
		<label> Tên loại phòng:</label>
		<select name="roomtypeid">
			<c:if test="${not empty listRoomType}">
				<c:forEach var="roomtype" items="${listRoomType}">
					<option value=${roomtype.roomtypeid}>${roomtype.roomtypename}</option>
				</c:forEach>
			</c:if>
		</select>
		<br />
		<br />
		<label>Tên trạng thái phòng:</label>
		<select name="roomstatusid">
			<c:if test="${not empty listRoomStatus}">
				<c:forEach var="roomstatus" items="${listRoomStatus}">
					<option value=${roomstatus.roomstatusid}>${roomstatus.roomstatusname}</option>
				</c:forEach>
			</c:if>
		</select>
		<br />
		<br />
		<label>Image:</label>
		<output id="list">
			<img src="/HotelManagement/resources/image/" width="120">
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
		<label>Mô tả phòng</label>
		<form:input type="text" path="roomdesc" />
		<br />
		<br />
		<form:button type="submit"> Update</form:button>
		<form:button type="submit">
			<a href="<c:url value="/roomstatus-list" />"> Xem danh sách trạng
				thái phòng</a>
		</form:button>
	</form:form>

</body>

</html>