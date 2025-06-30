<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="hospital_dbconn.dbconn"%> 
<%@page import="hospital_CRUD.DoctorCurd"%>
<%@page import="hospital_CRUD.AppointmentCurd"%>
<%@page import="hospital_CRUD.SpecialistCurd"%>
<%@page import="hospital_entity.Specialist"%>
<%@page import="hospital_CRUD.UserCurd"%>
<%@page import="hospital_entity.user"%>
<%@page import="hospital_entity.Doctor"%>
<%@page import="hospital_entity.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<%@include file="../component/allCSS.jsp"%>
<style>
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.5);
}
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty adminObj }">
<c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>
<div class="container p-5">
    <p class="text-center fs-1"><b>A</b>dmin <b>D</b>ashboard</p>
    
    <!-- Display success or error messages with the help of JSTL -->
    <c:if test="${not empty sucMsg}">
        <p class="text-center text-success fs-3">${sucMsg}</p>
        <c:remove var="sucMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty succMsg}">
        <p class="text-center text-success fs-3">${succMsg}</p>
        <c:remove var="succMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty errorMsg}">
        <p class="text-center text-danger fs-3">${errorMsg}</p>
        <c:remove var="errorMsg" scope="session"/>
    </c:if>
   <%
   	DoctorCurd count=new DoctorCurd(dbconn.getConn());
   %>
  

    <div class="row">
        <div class="col-md-4 mt-3">
            <div class="card paint-card">
                <div class="card-body text-center text-success" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                    <i class="fas fa-user-md fa-3x"></i><br>
                    <p class="fs-4 text-center">Doctor<br><%=count.countDoctor()%></p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-3">
            <div class="card paint-card">
                <div class="card-body text-center text-success"data-bs-toggle="modal" data-bs-target="#exampleModal4">
                    <i class="fas fa-user-circle fa-3x"></i><br>
                    <p class="fs-4 text-center">User<br><%=count.countUser()%></p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-3">
            <div class="card paint-card">
                <div class="card-body text-center text-success"data-bs-toggle="modal" data-bs-target="#exampleModal3">
                    <i class="fas fa-calendar-alt fa-3x"></i><br>
                    <p class="fs-4 text-center">Total Appointment<br><%=count.countAppointment()%></p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-3">
            <div class="card paint-card">
                <div class="card-body text-center text-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fas fa-clipboard-list fa-3x"></i><br>
                    <p class="fs-4 text-center">Specialist<br><%=count.countSpecialist()%></p>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Modal Add Specialist</-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <form action="../addSpecialist" method="post">
      <div class="modal-body">
      
       		<div class="form-group">
       		<label>Enter Specialist Id</label>
       		<input type="text" name="id" class="form-control" required>
       		<label>Enter Specialist Type </label>
       		<input type="text" name="specName" class="form-control" required>
       		</div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">View Data </button>
        <button type="submit" class="btn btn-success">Add Specialist</button>
      </div>
      </form>
    </div>
  </div>
</div>



<!-- Modal Doctor Details-->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">Doctor Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
			<table class="table">
			<thead>
				<tr>
					<th scope="col">Doctor Id</th>
					<th scope="col">Full Name</th>
					<th scope="col">DOB</th>
					<th scope="col">Qualification</th>
					<th scope="col">Specialist</th>
					<th scope="col">Email</th>
					<th scope="col">Mob No</th>
					<th scope="col">Password</th>
				</tr>
			</thead>
			    <tbody>
                    <%
                        DoctorCurd dc = new DoctorCurd(dbconn.getConn());
                        List<Doctor> ListDoctor = dc.getAllDoctor();
                        if (ListDoctor != null && !ListDoctor.isEmpty()) {
                            for (Doctor d : ListDoctor) {
                    %>
                    <tr>
                        <td><%= d.getId() != null ? d.getId() : "N/A" %></td>
                        <td><%= d.getFullName() != null ? d.getFullName() : "N/A" %></td>
                        <td>
                            <%= d.getDob() != null ? new java.text.SimpleDateFormat("dd-MM-yyyy").format(d.getDob()) : "N/A" %>
                        </td>
                        <td><%= d.getQualification() != null ? d.getQualification() : "N/A" %></td>
                        <td><%= d.getSpecialist() != null ? d.getSpecialist() : "N/A" %></td>
                        <td><%= d.getEmail() != null ? d.getEmail() : "N/A" %></td>
                        <td><%= d.getMobNo() != null ? d.getMobNo() : "N/A" %></td>
                        <td><%= d.getPassword() != null ? d.getPassword() : "N/A" %></td>
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
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Specialist Details-->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">Specialist Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
			<table class="table">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Specialist</th>
					
				</tr>
			</thead>
			    <tbody>
                    <%
                    SpecialistCurd sc=new SpecialistCurd(dbconn.getConn());
    				List<Specialist> list=sc.getAllSpecialist();
                        if (list != null && !list.isEmpty()) {
                            for (Specialist s : list) {
                    %>
                    <tr>
                        <td><%= s.getId() %></td>
                        <td><%= s.getSpecialistName() != null ? s.getSpecialistName() : "N/A" %></td>
                        <td>
                        <td>
                            <form action="../DeleteSpecialist" method="post" style="display:inline;">
    							<input type="hidden" name="id" value="<%= s.getId() %>">
    							<button type="submit" class="btn btn-sm btn-danger">Delete</button>
							</form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No Specialist Found</td>
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

<!-- Modal Appointment Details-->
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">Appointment Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
			<table class="table">
			<thead>
				<tr>
					<th scope="col">Email</th>
					<th scope="col">Patient Name</th>
					<th scope="col">Gender</th>
					<th scope="col">Age</th>
					<th scope="col">Appointment Date</th>
					<th scope="col">Contact Number</th>
					<th scope="col">Diseases</th>
					<th scope="col">Address</th>
					<th scope="col">Doctor Name</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			    <tbody>
                    <%
                    	DoctorCurd dcurd=new DoctorCurd(dbconn.getConn());
                        AppointmentCurd ac = new AppointmentCurd(dbconn.getConn());
                        List<Appointment> ListAppointment = ac.getAllAppointment();
                        if (ListAppointment != null && !ListAppointment.isEmpty()) {
                            for (Appointment a : ListAppointment) {
                            	Doctor d=dc.getDoctorByIndex(a.getDoctorId());
                    %>
                    <tr>
                        <td><%= a.getEmail() != null ? a.getEmail() : "N/A" %></td>
                        <td><%= a.getPatientName() != null ? a.getPatientName() : "N/A" %></td>
                        <td><%= a.getGender() != null ? a.getGender() : "N/A" %></td>
                        <td><%= a.getAge() != null ? a.getAge() : "N/A" %></td>
                        <td>
                            <%= a.getAppointmentDate() != null ? new java.text.SimpleDateFormat("dd-MM-yyyy").format(a.getAppointmentDate()) : "N/A" %>
                        </td>
                        <td><%= a.getContactNumber() != null ? a.getContactNumber() : "N/A" %></td>
                        <td><%= a.getDiseases() != null ? a.getDiseases() : "N/A" %></td>
                        <td><%= a.getFullAddress() != null ? a.getFullAddress() : "N/A" %></td>
                        <td><%= d.getFullName() != null ? d.getFullName() : "N/A" %></td>
                        <td><%= a.getStatus() != null ? a.getStatus() : "N/A" %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No Appointment Found</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
			</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal User Details-->
<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"  id="exampleModalLabel">User Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
			<table class="table">
			<thead>
				<tr>
					<th scope="col">Email</th>
					<th scope="col">Full Name</th>
					<th scope="col">Password</th>
					<th scope="col">Action</th>
					
				</tr>
			</thead>
			    <tbody>
                    <%
                    	UserCurd uc=new UserCurd(dbconn.getConn());
                       
                        List<user> ListUser = uc.getAllUser();
                        if (ListUser != null && !ListUser.isEmpty()) {
                            for (user u : ListUser) {
                            	
                    %>
                    <tr>
                        <td><%= u.getEmail() != null ? u.getEmail() : "N/A" %></td>
                        <td><%= u.getFullName() != null ? u.getFullName() : "N/A" %></td>
                        <td><%= u.getPassword() != null ? u.getPassword() : "N/A" %></td>
                        <td>
                            <form action="../DeleteUser" method="post" style="display:inline;">
    							<input type="hidden" name="email" value="<%= u.getEmail() %>">
    							<button type="submit" class="btn btn-sm btn-danger">Delete</button>
							</form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No User Found</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
			</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>
