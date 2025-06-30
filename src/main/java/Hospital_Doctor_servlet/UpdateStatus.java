package Hospital_Doctor_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital_CRUD.AppointmentCurd;
import hospital_dbconn.dbconn;
@WebServlet("/comment")
public class UpdateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");	
		String patientName=req.getParameter("patientName");
		String doctorId=req.getParameter("doctorId");
		String status=req.getParameter("status");
		
		AppointmentCurd ac=new AppointmentCurd(dbconn.getConn());
		HttpSession session=req.getSession();
		if(ac.UpdateComment(patientName,email,doctorId,status))
		{
			session.setAttribute("USsucMsg", "Status update successful..!");
			resp.sendRedirect("Doctor/patient.jsp");
		}else {
			session.setAttribute("USerrorMsg", "Something wrong on server");
			resp.sendRedirect("Doctor/patient.jsp");
		}
	
	
	}

}
