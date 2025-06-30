    package hospital_admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital_CRUD.DoctorCurd;
import hospital_dbconn.dbconn;
import hospital_entity.Doctor;
@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String id=req.getParameter("id");
		String fullName=req.getParameter("fullName");
		String dobString = req.getParameter("dob");
		String qualification=req.getParameter("qualification");
		String specialist=req.getParameter("specialist");
		String email=req.getParameter("email");
		String mobileNumber=req.getParameter("mobileNumber");
		String password=req.getParameter("password");
		 // Parse dobString to java.sql.Date
        java.sql.Date dob = java.sql.Date.valueOf(dobString);

		Doctor d=new Doctor(id,fullName,dob,qualification,specialist,email,mobileNumber,password);
		DoctorCurd dc=new DoctorCurd(dbconn.getConn());
		HttpSession session=req.getSession();
		if(dc.registerDoctor(d)) {
			session.setAttribute("DsucMsg", "Doctor Added Successfull..!");
			resp.sendRedirect("admin/doctor.jsp");
		}else {
			session.setAttribute("DerrorMsg", "Something wrong on server..!");
			resp.sendRedirect("admin/doctor.jsp");
		}
		}catch(Exception e) {
			HttpSession session = req.getSession();
		    session.setAttribute("errorMsg", "An error occurred: " + e.getMessage());
		    resp.sendRedirect("admin/doctor.jsp");
		}
		
		
	}

}
