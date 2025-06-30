<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Login page</title>
<%@include file="component/allCSS.jsp" %>
<style>
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.5);
}

</style>
</head>
<body>
<%@include file="component/navBar.jsp" %>
<br><br>
<div class="conatiner p-5">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-4 text-center">Doctor Login</p>
					<!-- Display success or error messages with the help of jstl -->
					<c:if test="${not empty DLerrorMsg }">
                        <p class="text-center text-danger fs-3">${DLerrorMsg}</p>
                        <c:remove var="DLerrorMsg" scope="session"/>
                      </c:if>
                      <c:if test="${not empty DLsucMsg }">
                        <p class="text-center text-success fs-3">${DLsucMsg}</p>
                        <c:remove var="DLsucMsg" scope="session"/>
                      </c:if>
                      
					<form action="doctorLogin" method="post">
						<div class="mb-3">
							<label class="form-label">Email address</label>
							<input required name="email" type="email" class="form-control">
						</div>
						<div class="mb-3">
							<label class="form-label">Password</label>
							<input required name="password" type="password" class="form-control"> 
						</div>
						<button type="submit" class="btn bg-success text-white " style="width:100%;margin-top:10px">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>