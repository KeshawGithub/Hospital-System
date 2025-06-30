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

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String pwd=req.getParameter("password");
		
		HttpSession session=req.getSession();
		
		DoctorCurd ds=new DoctorCurd(dbconn.getConn());
		Doctor d=ds.login(email, pwd);
		if(d!=null)
		{
			session.setAttribute("doctorObj", d);
			session.setAttribute("DLsuccMsg", "Doctor Login Successfull..!");
			resp.sendRedirect("Doctor/DoctorIndex.jsp");
		}else {
			session.setAttribute("DLerrorMsg", "Invalid Email and Password..!");
			resp.sendRedirect("doctor_login.jsp");
		}
	}

}
