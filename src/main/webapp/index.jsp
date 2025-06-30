<%-- <%@page import="hospital_dbconn.dbconn"%>
<%@page import="java.sql.Connection"%> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allCSS.jsp"%>
<style type="text/css">
 .carousel-item:after{
	content: "";
	display: block;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgbs(0,0,0,0.1);
}
.carousel-caption{
	top: 70%;
}
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
}

</style>
</head>
<body>
	<%@include file="component/navBar.jsp"%>

	<%-- <%
    Connection conn = dbconn.getConn();
    if (conn != null) {
        out.print("Connection established successfully: " + conn);
    } else {
        out.print("Connection is null. Please check your database settings.");
    }
    %> --%>
    
	<!--A slideshow component for cycling through elements—images or slides of text—like a carousel  -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="image/medicine-green.jpg" class="d-block w-100" alt="medicine-green"
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="image/doctorGroupImg.jpeg" class="d-block w-100"
					alt="doctorGroupImg" height="500px">
			</div>
			<div class="carousel-item">
				<img src="image/various-doctor-hospital.jpg" class="d-block w-100"
					alt="doctor-hospital" height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
<br><br>


	<!--Key Features of our hospital  -->
	<div class="conatainer p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5 ">100% Safety</p>
								<p>Lorem Ipsum is simply dummy text of the printing and
									typesetting industry.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem Ipsum is simply dummy text of the printing and
									type setting industry.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem Ipsum is simply dummy text of the printing and
									type setting industry.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctor</p>
								<p>Lorem Ipsum is simply dummy text of the printing and
									type setting industry.</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="col-md-4 py-2 ">
				<img alt="Doctor Image" src="image/doctorImg.png" height="350px" width="410px">
			</div>
		</div>
	</div>
<br><hr><br>
 	<!--Our Team  -->
	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<br>
		<div class="row">
		
			<div class="col-md-3 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="image/d1.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Samuani Simi</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-3 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="image/d2.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Siva Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-3 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="image/d3.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Sonali Kumari </p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-3 mt-2">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="image/d4.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Mathue Samuel</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>
<br><br>

<%@ include file="component/footer.jsp"%>



</body>
</html>