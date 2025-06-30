<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="hospital_entity.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Change Password</title>
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
	<div class="row justify-content-center">
		<div class="col-md-4 p-1 mt-2">
		<div class="card paint-card ">
			<div class="card-body ">
				<p class="text-center fs-3">Change Password</p><br>
				<!-- Display success or error messages with the help of jstl -->
						<c:if test="${not empty CPsucMsg }">
                        <p class="text-center text-success fs-3">${CPsucMsg}</p>
                        <c:remove var="CPsucMsg" scope="session"/>
                        </c:if>
						<c:if test="${not empty CPerrorMsg }">
                        <p class="text-center text-danger fs-3">${CPerrorMsg}</p>
                        <c:remove var="CPerrorMsg" scope="session"/>
                        </c:if>
                        <c:if test="${not empty misMatch }">
                        <p class="text-center text-danger fs-3">${misMatch}</p>
                        <c:remove var="misMatch" scope="session"/>
                        </c:if>
				<% user u = (user)session.getAttribute("userObj"); %>
				<form action="changePasswword" method="post">
				<input type="hidden" name="email" value="<%=u.getEmail()%>">
				<input type="hidden" name="password" value="<%=u.getPassword()%>">
						<div class="mb-3">
							<label class="form-label">Old Password</label>
							<input required name="oldPassword" type="password" class="form-control">
						</div>
						<div class="mb-3">
							<label class="form-label">New Password</label>
							<input required name="newPassword" type="password" class="form-control"> 
						</div>
						<button type="submit" class="btn bg-success text-white " style="width:100%;margin-top:10px">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>