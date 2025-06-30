<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@page import="hospital_dbconn.dbconn"%> 
<%@page import="hospital_CRUD.AppointmentCurd"%>
<%@page import="hospital_entity.Appointment"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor comment</title>
<%@include file="../component/allCSS.jsp"%>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
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
	   	<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body">
				<p class="text-center fs-3 ">Patient Comment</p>
				<%
				String email = request.getParameter("email");
				String patientName = request.getParameter("patientName");

				AppointmentCurd ac=new AppointmentCurd(dbconn.getConn());
				Appointment a=ac.getAppointmentByEmailPatient(email,patientName); 
				%>
			 		<!-- Display success or error messages with the help of JSTL -->
				<c:if test="${not empty CsucMsg}">
        			<p class="text-center text-success fs-2">${CsucMsg}</p>
        			<c:remove var="CsucMsg" scope="session"/>
    			</c:if>
    			<c:if test="${not empty CerrorMsg}">
        			<p class="text-center text-danger fs-2">${CerrorMsg}</p>
        			<c:remove var="CerrorMsg" scope="session"/>
    			</c:if>
    			<form action="../comment" method="post"> 
    			 	<div class="row">
                       		<!--left div  -->
                       		<div class="col-md-6">
                       			<div class="mb-3">
                            		<label class="form-label">Patient Name</label>
                            		<input readonly name="patientName" type="text" class="form-control" value="<%=a.getPatientName()%>">
                        		</div>
                        		<div class="mb-3">
                            		<label class="form-label">Age</label>
                            		<input readonly name="age" type="text" class="form-control"value="<%=a.getAge()%>">
                        		</div>
                        	</div>
                        	<!--right div  -->
                        	<div class="col-md-6">
                        		<div class="mb-3">
                            		<label class="form-label">Diseases</label>
                            		<input readonly name="diseases" type="text" class="form-control"value="<%=a.getDiseases()%>">
                        		</div>
                        		
                        		<div class="mb-3">
                            		<label class="form-label">Contact Number</label>
                            		<input readonly name="mobNo" type="text" class="form-control"value="<%=a.getContactNumber()%>">
                        		</div>
                        	</div>	
                        		<div class="mb-3">
                            		<label class="form-label">Comment</label>
                            		<textarea required name="status" class="form-control" rows="3" cols="4"></textarea>
                        		</div>
                        		<input type="hidden" name="email" value="<%=a.getEmail()%>"></input>
                        		<input type="hidden" name="doctorId" value="<%=a.getDoctorId()%>"></input>
                       </div>
                        <button type="submit" class="mt-3 btn btn-success col-md-12">submit</button>	
    				</form>
			
					</div>
				 </div>
			</div> 
	  </div>
</div>

</body>
</html>


