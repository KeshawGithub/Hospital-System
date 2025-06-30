<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<%@page import="hospital_CRUD.AppointmentCurd"%>
<%@page import="hospital_dbconn.dbconn"%>
<%@page import="hospital_CRUD.DoctorCurd"%>
<%@page import="hospital_entity.Appointment"%>
<%@page import="hospital_entity.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Page</title>
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
	 
	   <div class="row ">
	   	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
			<p class="text-center fs-3 ">Patient Details</p>
			 <!-- Display success or error messages with the help of JSTL -->
				<c:if test="${not empty USsucMsg}">
        			<p class="text-center text-success fs-2">${USsucMsg}</p>
        			<c:remove var="USsucMsg" scope="session"/>
    			</c:if>
    			<c:if test="${not empty USerrorMsg}">
        			<p class="text-center text-danger fs-2">${USerrorMsg}</p>
        			<c:remove var="USerrorMsg" scope="session"/>
    			</c:if>
    			
			<table class="table">
			<thead>
				<tr>
					<th scope="col">Full Name</th>
					<th scope="col">Gender</th>
					<th scope="col">Age</th>
					<th scope="col">Appointment Date</th>
					<th scope="col">Email</th>
					<th scope="col">Mob No</th>
					<th scope="col">Diseases</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			    <tbody>
                    <%
                		 // Retrieve the doctor object from the session
                    	hospital_entity.Doctor doctorObj = (hospital_entity.Doctor) session.getAttribute("doctorObj");
                        AppointmentCurd dc = new AppointmentCurd(dbconn.getConn());
                        List<Appointment> ListAppointment = dc.getAllAppointmentDoctorLogin(doctorObj.getId());
                        if (ListAppointment != null && !ListAppointment.isEmpty()) {
                            for (Appointment a : ListAppointment) {
                    %>
                    <tr>
                        <td><%= a.getPatientName() != null ? a.getPatientName() : "N/A" %></td>
                        <td><%= a.getGender() != null ? a.getGender() : "N/A" %></td>
                        <td><%= a.getAge() != null ? a.getAge() : "N/A" %></td>
                        <td>
                            <%= a.getAppointmentDate() != null ? new java.text.SimpleDateFormat("dd-MM-yyyy").format(a.getAppointmentDate()) : "N/A" %>
                        </td>
                        <td><%= a.getEmail() != null ? a.getEmail() : "N/A" %></td>
                        <td><%= a.getContactNumber() != null ? a.getContactNumber() : "N/A" %></td>
                        <td><%= a.getDiseases() != null ? a.getDiseases() : "N/A" %></td>
                        <td><%= a.getStatus() != null ? a.getStatus() : "N/A" %></td>
                        <td>
                        <%
                        if("pending".equals(a.getStatus()))
                        {%>
                        	<a href="Comment.jsp?email=<%= a.getEmail()%>&patientName=<%=a.getPatientName() %>" class="btn btn-sm btn-success"><i class="fa-regular fa-comment">&nbsp;</i>Comment</a>
                        <%
                        }else{
                        	%>
                        	<a href="#" class="btn btn-sm btn-success disabled"><i class="fa-regular fa-comment">&nbsp;</i>Comment</a>
                        	<%
                        }
                        
                        %>   
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No Doctors Found</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
			</table>
		
			</div>
		</div>
	</div>
       
        
	   </div>
</div>



</body>
</html>