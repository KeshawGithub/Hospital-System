<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@page import="hospital_dbconn.dbconn"%> 
<%@page import="hospital_CRUD.DoctorCurd"%>
<%@page import="hospital_entity.Doctor"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
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
	 <p class="text-center text-light fs-1 "><b>D</b>octor  <b>D</b>ashboard</p>
	   <div class="row justify-content-center">
	   	 
	   <%
	   Doctor d=(Doctor)session.getAttribute("doctorObj");
	   DoctorCurd dc=new DoctorCurd(dbconn.getConn());
	     %>
	   	 
	   	 		<div class="col-md-4 mt-3">
	   	 	 		<div class="card paint-card">
                		<div class="card-body text-center text-success">
                    		<i class="fas fa-user-md fa-3x"></i><br>
                    		<p class="fs-4 text-center">Doctor<br><%=d.getFullName()%></p>
               			 </div>
            		</div>
	   			 </div>
	   	 
	   	 		<div class="col-md-4 mt-3">
            		<div class="card paint-card">
                		<div class="card-body text-center text-success">
                    		<i class="fas fa-calendar-alt fa-3x"></i><br>
                    		<p class="fs-4 text-center">Total Appointment<br><%=dc.countAppointmentbydoctorId(d.getId())%></p>
                		</div>
           		 	</div>
	   	 		</div>
	   	 
       
        
	   </div>
</div>
</body>
</html>