package Hospital_Doctor_servlet;

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
@WebServlet("/EditDoctorProfile")
public class EditProfileDoctor extends HttpServlet{

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
			if(dc.UpdateDoctor(d)) {
				session.setAttribute("EDPsucMsg", "Update Successfull..!");
				resp.sendRedirect("Doctor/EditDoctorProfile.jsp");
			}else {
				session.setAttribute("EDPerrorMsg", "Something wrong on server..!");
				resp.sendRedirect("Doctor/EditDoctorProfile.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
