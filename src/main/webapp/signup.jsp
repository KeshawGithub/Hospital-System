<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%--  <%@page import="javax.servlet.ServletException"%>
    <%@page import="javax.servlet.http.HttpServlet"%>
    <%@page import="javax.servlet.http.HttpServletRequest"%>
    <%@page import="javax.servlet.http.HttpServletResponse"%> --%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Register form</title>
<%@include file="component/allCSS.jsp"%>
<style>
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.5);
}

</style>
</head>
<body>
<%@include file="component/navBar.jsp"%>
<br><br>
<div class="conatiner p-5">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-4 text-center">User Register</p>
					 <!-- Display success or error messages with the help of servlet -->
                       <%--  <%
                            HttpSession session1 = request.getSession(false);
                            if (session1 != null) {
                                String sucMsg = (String) session1.getAttribute("sucMsg");
                                String errorMsg = (String) session1.getAttribute("errorMsg");
                                if (sucMsg != null) {
                        %>
                                    <div class="alert alert-success"><%= sucMsg %></div>
                        <%
                                    session.removeAttribute("sucMsg");
                                } else if (errorMsg != null) {
                        %>
                                    <div class="alert alert-danger"><%= errorMsg %></div>
                        <%
                                    session.removeAttribute("errorMsg");
                                }
                            }
                        %> --%>
                        <!-- Display success or error messages with the help of jstl -->
                        <c:if test="${not empty sucMsg }">
                        <p class="text-center text-success fs-3">${sucMsg}</p>
                        <c:remove var="sucMsg" scope="session"/>
					    </c:if>
						<c:if test="${not empty errorMsg }">
                        <p class="text-center text-danger fs-3">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session"/>
                        </c:if>
                        <c:if test="${not empty dupemailMsg }">
                        <p class="text-center text-danger fs-3">${dupemailMsg}</p>
                        <c:remove var="dupemailMsg" scope="session"/>
                        </c:if>
                        
                        
                        
					<form action="userResgister" method="post">
					<div class="mb-3">
							<label class="form-label">Full Name</label>
							<input required name="name" type="text" class="form-control">
						</div>
						<div class="mb-3">
							<label class="form-label">Email address</label>
							<input required name="mail" type="email" class="form-control">
						</div>
						<div class="mb-3">
							<label class="form-label">Password</label>
							<input required name="password" type="password" class="form-control"> 
						</div>
						<button type="submit" class="btn bg-success text-white " style="width:100%;margin-top:10px">Register</button>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>