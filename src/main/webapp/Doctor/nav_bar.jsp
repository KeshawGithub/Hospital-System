
<%@page import="hospital_dbconn.dbconn"%> 
<%@page import="hospital_entity.Doctor"%>

<nav class="navbar navbar-expand-lg navbar-dark " style="background-color:rgb(51, 102, 0)">
	<div class="container-fluid">
		<a class="navbar-brand" href="DoctorIndex.jsp"><i
			class="fa fa-house-chimney-medical "></i>MEDI HOME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item p-2"><a class="nav-Link active"
					style="color: white; text-decoration: none" aria-current="page"
					href="DoctorIndex.jsp">Home</a></li>
			
				<li class="nav-item p-2"><a class="nav-Link active"
					style="color: white; text-decoration: none" aria-current="page"
					href="patient.jsp">Patient</a></li>
			</ul>
			<form action="/HospitalSystem/doctorLogout" method="post">
				<div class="dropdown">
				<button class="btn text-light dropdown-toggle" style="background-color:rgb(0, 102, 0)" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false"><i class="fa-solid fa-user-doctor">&nbsp;&nbsp;</i>${doctorObj.fullName}
				</button>
				
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li ><a class="dropdown-item" href="EditDoctorProfile.jsp">Edit Profile</a></li>
					<li ><button type="submit" class="dropdown-item">LogOut</button></li>
				</ul>
				</div>
			</form>
		</div>
	</div>
</nav>
