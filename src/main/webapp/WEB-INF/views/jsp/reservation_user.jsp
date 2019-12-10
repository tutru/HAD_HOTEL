<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	rel="stylesheet">
<title>HAD Reservation</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<!--  <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700"> -->

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/aos.css">
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/fancybox.min.css">
<link rel="stylesheet" href="resources/css/jquery.timepicker.css">

<link rel="stylesheet"
	href="resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/fonts/fontawesome/css/font-awesome.min.css">

<!-- Theme Style -->
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>

	<header class="site-header js-site-header">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-6 col-lg-4 site-logo" data-aos="fade">
					<a href="index_user">HAD Hotel</a>
				</div>
				<div class="col-6 col-lg-8">


					<div class="site-menu-toggle js-site-menu-toggle" data-aos="fade">
						<span></span> <span></span> <span></span>
					</div>
					<!-- END menu-toggle -->

					<div class="site-navbar js-site-navbar">
						<nav role="navigation">
							<div class="container">
								<div class="row full-height align-items-center">
									<div class="col-md-6 mx-auto">
										<ul class="list-unstyled menu">
											<li><a href="index_user" />Home</a></li>
											<li><a href="rooms_user" />Rooms</a></li>
											<li><a href="about" />About</a></li>
											<li><a href="events" />Events</a></li>
											<li><a href="contact" />Contact</a></li>
											<li><a href="service-user" />Service</a></li>
										</ul>
									</div>
								</div>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- END head -->

	<section class="site-hero inner-page overlay"
		style="background-image: url(resources/images/hero_4.jpg)"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row site-hero-inner justify-content-center align-items-center">
				<div class="col-md-10 text-center" data-aos="fade">
					<h1 class="heading mb-3">Reservation Form</h1>
					<ul class="custom-breadcrumbs mb-4">
						<li><a href="index_user">Home</a></li>
						<li>&bullet;</li>
						<li>Reservation</li>
						</br>
						<li>Welcome customer : ${name}</li>
					</ul>
				</div>
			</div>
		</div>

		<a class="mouse smoothscroll" href="#next">
			<div class="mouse-icon">
				<span class="mouse-wheel"></span>
			</div>
		</a>
	</section>
	<!-- END section -->

	<section class="section contact-section" id="next">
		<div class="container">
			<c:url value="/saveReservationUser" var="saveReservationUser" />
			<form:form action="${saveReservationUser}" method="POST"
				modelAttribute="reservation">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Customer</label> <select class="form-control"
							name="customerid" readonly="true">
							<c:forEach var="customer" items="${listCustomer}">
								<option value=${customer.customerid}>${name}</option>
							</c:forEach>
						</select> <br /> <label>Room Type</label> <select class="form-control"
							name="roomtypeid">
							<c:if test="${not empty listRoomType}">
								<c:forEach var="roomType" items="${listRoomType}">
									<option value=${roomType.roomtypeid}>${roomType.roomtypename}</option>
								</c:forEach>
							</c:if>
						</select> <br /> <label>Expected Check Date</label>
						<form:input class="form-control" path="expectedcheckdate"
							id="datepicker" placeholder="Expected Check Date"
							required="required" pattern="[a-z]\{20}"
							title="Please choose Date" />
						<script>
							$(function() {
								$.datepicker.setDefaults({
									onClose : function(date, inst) {
										$("#selectedDtaeVal").html(date);
									}
								});

								$("#datepicker").datepicker({
									dateFormat : 'yy-mm-dd'
								});
							});
						</script>
						<br />
					</div>
					<div class="form-group col-md-6">
						<label>Expected Room:</label> <select class="form-control"
							name="expectedroom">
							<c:if test="${not empty listRoom}">
								<c:forEach var="room" items="${listRoom}">
									<option value=${room.roomnumber}>${room.roomnumber}</option>
								</c:forEach>
							</c:if>
						</select> <br /> <label>Advance Deposit:</label>
						<form:input class="form-control" path="isdeposit"
							required="required" pattern="[0-9]\{20}"
							title="Please type Deposit" />
						<br /> <label>Status:</label>
						<form:textarea rows="2" class="form-control"
							path="reservationstatus" placeholder="Reservation Status" />
						<br />
					</div>
			</form:form>
			<button type="submit" class="btn btn-success">
				<i class="far fa-save"></i> Save
			</button>
		</div>
	</section>

	<section class="section testimonial-section bg-light">
		<div class="container">
			<div class="row justify-content-center text-center mb-5">
				<div class="col-md-7">
					<h2 class="heading" data-aos="fade-up">People Says</h2>
				</div>
			</div>
			<div class="row">
				<div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up"
					data-aos-delay="200">

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_1.jpg" alt="Image placeholder"
								class="rounded-circle mx-auto">
						</div>
						<blockquote>

							<p>&ldquo;A small river named Duden flows by their place and
								supplies it with the necessary regelialia. It is a paradisematic
								country, in which roasted parts of sentences fly into your
								mouth.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; Jean Smith</em>
						</p>
					</div>

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_2.jpg" alt="Image placeholder"
								class="rounded-circle mx-auto">
						</div>
						<blockquote>
							<p>&ldquo;Even the all-powerful Pointing has no control about
								the blind texts it is an almost unorthographic life One day
								however a small line of blind text by the name of Lorem Ipsum
								decided to leave for the far World of Grammar.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; John Doe</em>
						</p>
					</div>

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_3.jpg" alt="Image placeholder"
								class="rounded-circle mx-auto">
						</div>
						<blockquote>

							<p>&ldquo;When she reached the first hills of the Italic
								Mountains, she had a last view back on the skyline of her
								hometown Bookmarksgrove, the headline of Alphabet Village and
								the subline of her own road, the Line Lane.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; John Doe</em>
						</p>
					</div>


					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_1.jpg" alt="Image placeholder"
								class="rounded-circle mx-auto">
						</div>
						<blockquote>

							<p>&ldquo;A small river named Duden flows by their place and
								supplies it with the necessary regelialia. It is a paradisematic
								country, in which roasted parts of sentences fly into your
								mouth.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; Jean Smith</em>
						</p>
					</div>

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_2.jpg" alt="Image placeholder"
								class="rounded-circle mx-auto">
						</div>
						<blockquote>
							<p>&ldquo;Even the all-powerful Pointing has no control about
								the blind texts it is an almost unorthographic life One day
								however a small line of blind text by the name of Lorem Ipsum
								decided to leave for the far World of Grammar.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; John Doe</em>
						</p>
					</div>

					<div class="testimonial text-center slider-item">
						<div class="author-image mb-3">
							<img src="resources/images/person_3.jpg" alt="Image placeholder"
								class="rounded-circle mx-auto">
						</div>
						<blockquote>

							<p>&ldquo;When she reached the first hills of the Italic
								Mountains, she had a last view back on the skyline of her
								hometown Bookmarksgrove, the headline of Alphabet Village and
								the subline of her own road, the Line Lane.&rdquo;</p>
						</blockquote>
						<p>
							<em>&mdash; John Doe</em>
						</p>
					</div>

				</div>
				<!-- END slider -->
			</div>

		</div>
	</section>



	<section class="section bg-image overlay"
		style="background-image: url('resources/images/hero_4.jpg');">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left"
					data-aos="fade-up">
					<h2 class="text-white font-weight-bold">A Best Place To Stay.
						Reserve Now!</h2>
				</div>
				<div class="col-12 col-md-6 text-center text-md-right"
					data-aos="fade-up" data-aos-delay="200">
					<a href="reservation.html"
						class="btn btn-outline-white-primary py-3 text-white px-5">Reserve
						Now</a>
				</div>
			</div>
		</div>
	</section>

	<footer class="section footer-section">
		<div class="container">
			<div class="row mb-4">
				<div class="col-md-3 mb-5">
					<ul class="list-unstyled link">
						<li><a href="#">About Us</a></li>
						<li><a href="#">Terms &amp; Conditions</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Rooms</a></li>
					</ul>
				</div>
				<div class="col-md-3 mb-5">
					<ul class="list-unstyled link">
						<li><a href="#">The Rooms &amp; Suites</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Restaurant</a></li>
					</ul>
				</div>
				<div class="col-md-3 mb-5 pr-md-5 contact-info">
					<!-- <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->
					<p>
						<span class="d-block"><span
							class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span>
							132 Ly Tu Trong Street, Quận 1, TP. Hồ Chí Minh, Việt Nam </span>
					</p>
					<p>
						<span class="d-block"><span
							class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span>
							(+1) 435 3533</span>
					</p>
					<p>
						<span class="d-block"><span
							class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span>
							had@gmail.com</span>
					</p>
				</div>
				<div class="col-md-3 mb-5">
					<p>Sign up for our newsletter</p>
					<form action="#" class="footer-newsletter">
						<div class="form-group">
							<input type="email" class="form-control" placeholder="Email...">
							<button type="submit" class="btn">
								<span class="fa fa-paper-plane"></span>
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row pt-5">
				<p class="col-md-6 text-left">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="icon-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>

				<p class="col-md-6 text-right social">
					<a href="#"><span class="fa fa-tripadvisor"></span></a> <a href="#"><span
						class="fa fa-facebook"></span></a> <a href="#"><span
						class="fa fa-twitter"></span></a> <a href="#"><span
						class="fa fa-linkedin"></span></a> <a href="#"><span
						class="fa fa-vimeo"></span></a>
				</p>
			</div>
		</div>
	</footer>


	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/jquery.fancybox.min.js"></script>


	<script src="resources/js/aos.js"></script>

	<script src="resources/js/jquery.timepicker.min.js"></script>



	<script src="resources/js/main.js"></script>
</body>
</html>