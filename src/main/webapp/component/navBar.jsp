<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark  bg-success ">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa fa-house-chimney-medical "></i>MEDI HOME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<!-- When user is not login -->
				<c:if test="${empty userObj }">
					<li class="nav-item p-2"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp"><i
							class="fa fa-right-to-bracket">&nbsp;&nbsp;</i>Admin</a></li>
					<li class="nav-item p-2"><a class="nav-link active"
						aria-current="page" href="doctor_login.jsp">Doctor</a></li>
					<li class="nav-item p-2"><a class="nav-link active"
						aria-current="page" href="Appointment.jsp">Appointment</a></li>
					<li class="nav-item p-2"><a class="nav-link active"
						aria-current="page" href="user_login.jsp">User</a></li>
				</c:if>

				<!-- When user is login -->
				<c:if test="${not empty userObj }">
					<li class="nav-item p-2"><a class="nav-link active"
						aria-current="page" href="Appointment.jsp">Appointment</a></li>
					<li class="nav-item p-2"><a class="nav-link active"
						aria-current="page" href="ViewAppointment.jsp">View Appointment</a></li>
					<form action="/HospitalSystem/userLogout" method="post">
					<div class="dropdown p-2">
						<button class="btn btn-success dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false"><i class="fa-solid fa-circle-user">&nbsp;</i>${userObj.fullName}</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="userChangePassword.jsp">Change Password</a></li>
							<li><button type="submit" class="dropdown-item">LogOut</button></li>
						</ul>
					</div>
					</form>
						
					
				</c:if>
			</ul>
		</div>
	</div>
</nav>