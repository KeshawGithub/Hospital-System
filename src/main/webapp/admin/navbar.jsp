
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="AdminIndex.jsp"><i
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
					href="AdminIndex.jsp">Home</a></li>
				<li class="nav-item p-2"><a class="nav-Link active"
					style="color: white; text-decoration: none" aria-current="page"
					href="doctor.jsp">Doctor</a></li>
			</ul>
			<form action="/HospitalSystem/adminLogout" method="post">
				<div class="dropdown">
				<button class="btn btn-light dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">Admin</button>

				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><button type="submit" class="dropdown-item">LogOut</button></li>
				</ul>
				</div>
			</form>
		</div>
	</div>
</nav>