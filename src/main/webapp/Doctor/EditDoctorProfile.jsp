<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@page import="hospital_dbconn.dbconn"%> 
<%@page import="hospital_CRUD.SpecialistCurd"%>
<%@page import="hospital_entity.Specialist"%>
<%@page import="hospital_CRUD.DoctorCurd"%>
<%@page import="hospital_entity.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit profile</title>
<%@include file="../component/allCSS.jsp"%>
<style>
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.5);
}
body {
    background-image: url("${pageContext.request.contextPath}/image/doctorAdminBGI.jpg");
    background-repeat: no-repeat;
    background-size: cover; /* Ensures the full image is visible */
    background-position: center; /* Centers the image */
    height: 100vh; /* Sets the height of the body to full viewport height */
    margin: 0; /* Removes default margin to avoid gaps */
    background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent overlay */
    background-blend-mode: overlay; /* Blends the color with the image */
}

</style>
</head>
<body>
<%@include file="nav_bar.jsp"%>
<c:if test="${empty doctorObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<div class="container p-5">
	<div class="row justify-content-center">
		<div class="col-md-8">
			
				<div class="card paint-card">
					<div class="card-body">
						<form action="../EditDoctorProfile" method="post">
    						<div class="row">
    						<p class="text-center text-dark fs-3 ">Update Profile</p>
    						 <!-- Display success or error messages with the help of JSTL -->
								<c:if test="${not empty EDPsucMsg}">
        							<p class="text-center text-success fs-2">${EDPsucMsg}</p>
        							<c:remove var="EDPsucMsg" scope="session"/>
    							</c:if>
    							<c:if test="${not empty EDPerrorMsg}">
        							<p class="text-center text-danger fs-2">${EDPerrorMsg}</p>
        							<c:remove var="EDPerrorMsg" scope="session"/>
    							</c:if>
    						 <%
                        		Doctor d=(Doctor)session.getAttribute("doctorObj");
    						 	DoctorCurd dc = new DoctorCurd(dbconn.getConn());
                        		Doctor doc = dc.getDoctorByIndex(d.getId());	
                   			 %>
    						<!-- left div -->
    						<div class="col-md-6">
    						<div class="mb-1">
    							<label class="form-label">Doctor Id</label>
    							<input type="text" required name="id" class="form-control" value="<%=doc.getId()%>" readonly>
    						</div>
    						<div class="mb-1">
    							<label class="form-label">Full Name</label>
    							<input type="text" required name="fullName" class="form-control" value="<%=doc.getFullName()%>">
    						</div>
    						<div class="mb-1">
    							<label class="form-label">Date of Birth</label>
    							<input type="date" required name="dob" class="form-control" value="<%=doc.getDob()%>">
    						</div>
    						<div class="mb-1">
    							<label class="form-label">High Qualification</label>
    							<input type="text" required name="qualification" class="form-control" value="<%=doc.getQualification()%>">
    						</div>
    						</div>
    						<!-- right div -->
    						<div class="col-md-6">
    						<div class="mb-1">
    							<label class="form-label">Specialist</label>
    							<select name="specialist" required class="form-control">
    							<option><%=doc.getSpecialist()%></option>
    							<%
    							SpecialistCurd sc=new SpecialistCurd(dbconn.getConn());
    							List<Specialist> list=sc.getAllSpecialist();
    							for(Specialist s : list){
    							%>
    							<option><%=s.getSpecialistName()%></option>
    							<%	
    							}
    							%>
    							</select>	
    						</div>
    						<div class="mb-1">
    							<label class="form-label">Email</label>
    							<input type="email" required name="email" class="form-control"value="<%=doc.getEmail()%>">
    						</div>
    						<div class="mb-1">
    							<label class="form-label">Contact number</label>
    							<input type="text" required name="mobileNumber" class="form-control"value="<%=doc.getMobNo()%>">
    						</div>
    						<div class="mb-1">
    							<label class="form-label">Password</label>
    							<input type="text" required name="password" class="form-control"value="<%=doc.getPassword()%>">
    						</div>
    						</div>
    						<div class="modal-footer mt-4">
        						<button type="submit" class="btn btn-success" >Update Profile</button>
        						<a href="DoctorIndex.jsp" class="btn btn-danger">Close</a>
      						</div>
    						</div>
    					</form>
					</div>
				</div>
				
				
				
				
			
		</div>
	</div>
</div>
</body>
</html>


						
    						
    				
    						