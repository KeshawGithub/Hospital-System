<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@page import="hospital_dbconn.dbconn"%> 
<%@page import="hospital_CRUD.DoctorCurd"%>
<%@page import="hospital_entity.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Appointment</title>
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

<!-- Content Section -->
<div class="container p-3" >
    <div class="row">
        <!-- Left Column: Doctor Image -->
          <div class="col-md-6 p-2 mt-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="text-center fs-3">User Appointment</p><br>

                    <!-- Display Success or Error Messages -->
                	<c:if test="${not empty AsucMsg}">
                        <p class="text-center text-success fs-3">${AsucMsg}</p>
                        <c:remove var="AsucMsg" scope="session"/>
                    </c:if>
                    <c:if test="${not empty AerrorMsg}">
                        <p class="text-center text-danger fs-3">${AerrorMsg}</p>
                        <c:remove var="AerrorMsg" scope="session"/>
                    </c:if>

                    <!-- Appointment Form -->
                    <form action="userAppointment" method="post">
                   
                       <div class="row">
                       		<!--left div  -->
                       		<div class="col-md-6">
                       			<div class="mb-3">
                            		<label class="form-label">Name</label>
                            		<input required name="name" type="text" class="form-control">
                        		</div>
                        		<div class="mb-3">
                            		<label class="form-label">Gender</label>
                            		<div>
                                		<input type="radio" name="gender" value="male"> Male
                                		<input type="radio" name="gender" value="female"> Female
                            		</div>
                        		</div>
                        		<div class="mb-3">
                            		<label class="form-label">Age</label>
                            		<input required name="age" type="text" class="form-control">
                        		</div>
                        		<div class="mb-3">
                            		<label class="form-label">Email</label>
                            		<input required name="email" type="text" class="form-control" value="${userObj.email}">
                        		</div>
                       		</div>
                       		<!--right div  -->
                       		<div class="col-md-6">
                       			 <div class="mb-2">
                            		<label class="form-label">Appointment Date</label>
                            		<input required name="appointmentDate" type="date" class="form-control">
                        		</div>
                        		<div class="mb-2">
                            		<label class="form-label">Contact Number</label>
                            		<input required name="mobNo" type="text" class="form-control">
                       	 		</div>
                        		<div class="mb-3">
                            		<label class="form-label">Diseases</label>
                            		<input required name="diseases" type="text" class="form-control">
                        		</div>
                        		<div class="mb-2">
                            		<label class="form-label">Doctor</label>
                            		<select required name="doctor" class="form-control">
                                	<option>--select--</option>
                              		 <%
                        				DoctorCurd dc = new DoctorCurd(dbconn.getConn());
                       					List<Doctor> ListDoctor = dc.getAllDoctor();
                            			for (Doctor d : ListDoctor) 
                            			{
                   					 %>
                               			<option value="<%=d.getId()%>"><%=d.getFullName()%>(<%=d.getSpecialist()%>)</option>
                               		 <%
                            			}
                              	 	  %>
                            		</select>
                        		</div>
                       		</div>
                       </div>
                       
                        <div class="mb-3">
                            <label class="form-label">Full Address</label>
                            <textarea required name="address" class="form-control" rows="3" cols="4"></textarea>
                        </div>
                       
                        <c:if test="${empty userObj}">
                        <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success" >Submit</a>
                        </c:if>
                        <c:if test="${not empty userObj}">
	                       <button type="submit" class="col-md-12  btn btn-success">Submit</button>                        
						</c:if>
						
                    </form>
                </div>
            </div>
        </div>

        <!-- Right Column: Appointment Form -->
        <div class="col-md-6 " style="padding-left:100px; ">
            <img alt="Doctor Image" src="image/Doctor.png" class="img-fluid">
        </div>

    </div>
</div>
<%@include file="component/footer.jsp"%>
</body>
</html>





 						
                        
                      
                       