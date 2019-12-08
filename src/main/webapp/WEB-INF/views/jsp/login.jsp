
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Login</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body style="background-image: url('resources/image/backgroundLogin.jpg');">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row" style="background: gray;">
							<div class="col-lg-6 d-none d-lg-block bg-login-image">
								<img
									src="<%=request.getContextPath()%>/resources/image/logoLogin.png"
									width="500" height="500">

							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome</h1>
									</div>
									<form name="myForm" action="xacnhan" method="post"
										onsubmit="return validateForm()" class="user">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												name="username" placeholder="Enter username Address...">
										</div>

										<div class="form-group">
											<input type="password" name="password"
												class="form-control form-control-user"
												id="exampleInputPassword" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<p class="text-danger">${msg}</p>
											</div>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-primary">   Login   </button>
										</div>

									</form>
									<div></div>
									<hr>
									<div class="text-center">
										<button onclick="login()" id="login"
											class="btn btn-primary btn-user">Login With FaceBook</button>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script type="text/javascript">
		function validateForm() {
			var name = document.forms["myForm"]["username"].value;
			var a = document.forms["myForm"]["password"].value;

			if (name == "") {
				alert("Username can not be blank ");
				return false;
			}
			if (a == "") {
				alert("Password can not be blank");
				return false;
			}

			return true;
		}
	</script>
	<script>
		// initialize and setup facebook js sdk
		window.fbAsyncInit = function() {
			FB.init({
				appId : '2163711170531291',
				xfbml : true,
				version : 'v2.5'
			});
			FB
					.getLoginStatus(function(response) {
						//dang nhap thanh cong
						if (response.status === 'connected') {

							document.getElementById('login').style.visibility = 'hidden';
							window.location.href = 'index';
						} else if (response.status === 'not_authorized') {

						} else {

						}
					});
		};
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		// login with facebook with extra permissions
		function login() {
			FB
					.login(
							function(response) {
								if (response.status === 'connected') {
									document.getElementById('status').innerHTML = 'We are connected.';
									document.getElementById('login').style.visibility = 'hidden';
									window.location.href = 'index';
								} else if (response.status === 'not_authorized') {

								} else {
								}
							}, {
								scope : 'email'
							});
		}

		// getting basic user info
		function getInfo() {
			FB.api('/me', 'GET', {
				fields : 'name'
			}, function(response) {
				document.getElementById('status').innerHTML = response.name;
			});
		}
	</script>

	<div id="status"></div>
	<!--<button onclick="getInfo()">Get Info</button>-->


</body>

</html>
