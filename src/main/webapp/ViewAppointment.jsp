<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="hospital_dbconn.dbconn"%> 
<%@page import="hospital_CRUD.AppointmentCurd"%>
<%@page import="hospital_CRUD.DoctorCurd"%>
<%@page import="hospital_entity.Appointment"%>
<%@page import="hospital_entity.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Appointment</title>
<%@include file="component/allCSS.jsp"%>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
    background: url("image/b1.jpg");
    height: 180px;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}
</style>
</head>
<body style="background-color:#9FE2BF">
<%@include file="component/navBar.jsp"%>

<!-- Background Image Section -->
<div class="container-fluid backImg p-5">
    <p class="text-center fs-2 text-white"></p>
</div>
<div class="container p-3" >
	<div class="col-md-12 p-1 mt-2">
		<div class="card paint-card">
			<div class="card-body">
				<p class="text-center fs-3">Appointment List</p><br>
				
				<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Gender</th>
					<th scope="col">Age</th>
					<th scope="col">Appointment Date</th>
					<th scope="col">Contact Number</th>
					<th scope="col">Diseases</th>
					<th scope="col">Doctor</th>
					<th scope="col">Full Address</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			    <tbody>
                   <%
                   // Retrieve the user object from the session
                   hospital_entity.user userObj = (hospital_entity.user) session.getAttribute("userObj");
                   String email=null;
                   if (userObj != null) {
                       // Use the getter method to access the email
                       email = userObj.getEmail();
                
                   } else {
                       System.out.println("User is not logged in.");
                   }
                   
                   DoctorCurd dc=new DoctorCurd(dbconn.getConn());
                   AppointmentCurd ac=new AppointmentCurd(dbconn.getConn());
                   List<Appointment> List=ac.getAllAppointmentUserLogin(email);
                   if (List != null && !List.isEmpty()) {
                       for (Appointment a : List) {
                    	   Doctor d=dc.getDoctorByIndex(a.getDoctorId());
               		%>
              		 <tr>
                  		 <td><%= a.getPatientName() != null ? a.getPatientName() : "N/A" %></td>
                   		<td><%= a.getGender() != null ? a.getGender()  : "N/A" %></td>
                   		<td><%= a.getAge() != null ? a.getAge()  : "N/A" %></td>
                   		<td>
                       		<%= a.getAppointmentDate() != null ? new java.text.SimpleDateFormat("dd-MM-yyyy").format(a.getAppointmentDate()) : "N/A" %>
                   		</td>
                   		<td><%= a.getContactNumber() != null ? a.getContactNumber() : "N/A" %></td>
                  		<td><%= a.getDiseases() != null ? a.getDiseases() : "N/A" %></td>
                   		<td><%= d.getFullName() != null ? d.getFullName() : "N/A" %></td>
                   		<td><%= a.getFullAddress() != null ? a.getFullAddress() : "N/A" %></td>
                   		<td><% 
                   			if("pending".equals(a.getStatus())){
                   			%>
                   			<a href="#" class="btn btn-warning">Pending...</a>	
                   			<%
                   			}else{
                   			%>
                   			<%= a.getStatus()%>	
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
                   <td colspan="12" class="text-center">No Appointment Found</td>
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
</body>
</html>