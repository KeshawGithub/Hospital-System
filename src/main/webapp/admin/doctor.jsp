<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@page import="hospital_dbconn.dbconn"%> 
<%@page import="hospital_CRUD.SpecialistCurd"%>
<%@page import="hospital_CRUD.DoctorCurd"%>
<%@page import="hospital_entity.Specialist"%>
<%@page import="hospital_entity.Doctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminInDoctor</title>
<%@include file="../component/allCSS.jsp"%>
<style>
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.5);
}
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid p-3">
	<div class="row">
	<div class="col-md-4">
		<div class="card paint-card">
				<div class="card-body">
				<p class="fs-3 text-center">Add Doctor</p>
				 <!-- Display success or error messages with the help of JSTL -->
				<c:if test="${not empty DsucMsg}">
        			<p class="text-center text-success fs-2">${DsucMsg}</p>
        			<c:remove var="DsucMsg" scope="session"/>
    			</c:if>
    			<c:if test="${not empty DerrorMsg}">
        			<p class="text-center text-danger fs-2">${DerrorMsg}</p>
        			<c:remove var="DerrorMsg" scope="session"/>
    			</c:if>
    			
    			<form action="../AddDoctor" method="post">
    				<div class="mb-1">
    				<label class="form-label">Doctor Id</label>
    				<input type="text" required name="id" class="form-control">
    				</div>
    				<div class="mb-1">
    				<label class="form-label">Full Name</label>
    				<input type="text" required name="fullName" class="form-control">
    				</div>
    				<div class="mb-1">
    				<label class="form-label">Date of Birth</label>
    				<input type="date" required name="dob" class="form-control">
    				</div>
    				<div class="mb-1">
    				<label class="form-label">High Qualification</label>
    				<input type="text" required name="qualification" class="form-control">
    				</div>
    				<div class="mb-1">
    				<label class="form-label">Specialist</label>
    				<select name="specialist" required class="form-control">
    				<option>--select--</option>
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
    				<input type="email" required name="email" class="form-control">
    				</div>
    				<div class="mb-1">
    				<label class="form-label">Contact number</label>
    				<input type="text" required name="mobileNumber" class="form-control">
    				</div>
    				<div class="mb-1">
    				<label class="form-label">Password</label>
    				<input type="password" required name="password" class="form-control">
    				</div>
    				
    				<div class="modal-footer mt-4">
        				<button type="submit" class="btn btn-success" >Register Doctor</button>
      				</div>
    			</form>
				</div>
			</div>
		 </div>	
		<div class="col-md-8">
		<div class="card paint-card">
			<div class="card-body">
			<p class="fs-3 text-center">Doctor Details</p>
			 <!-- Display success or error messages with the help of JSTL -->
				<c:if test="${not empty EDsucMsg}">
        			<p class="text-center text-success fs-2">${EDsucMsg}</p>
        			<c:remove var="EDsucMsg" scope="session"/>
    			</c:if>
    			<c:if test="${not empty EDerrorMsg}">
        			<p class="text-center text-danger fs-2">${EDerrorMsg}</p>
        			<c:remove var="EDerrorMsg" scope="session"/>
    			</c:if>
    			<c:if test="${not empty DDsucMsg}">
        			<p class="text-center text-success fs-2">${DDsucMsg}</p>
        			<c:remove var="DDsucMsg" scope="session"/>
    			</c:if>
    			<c:if test="${not empty DDerrorMsg}">
        			<p class="text-center text-danger fs-2">${DDerrorMsg}</p>
        			<c:remove var="DDerrorMsg" scope="session"/>
    			</c:if>
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
					<th scope="col">Action</th>
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
                        <td>
                           
                            
                            <form action="../DeleteDoctor" method="post" style="display:inline;">
    							<input type="hidden" name="id" value="<%= d.getId() %>">
    							<button type="submit" class="btn btn-sm btn-danger">Delete</button>
							</form>
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