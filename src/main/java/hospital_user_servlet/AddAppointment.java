package hospital_user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital_CRUD.AppointmentCurd;
import hospital_dbconn.dbconn;
import hospital_entity.Appointment;
@WebServlet("/userAppointment")
public class AddAppointment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
		String email=req.getParameter("email");
	    String patientName=req.getParameter("name");
	    String gender=req.getParameter("gender");
	    String age=req.getParameter("age");
	    String StringappointmentDate=req.getParameter("appointmentDate");
	    // Parse dobString to java.sql.Date
        java.sql.Date appointmentDate = java.sql.Date.valueOf(StringappointmentDate);
        String mobNo=req.getParameter("mobNo");
        String diseases=req.getParameter("diseases");
        String doctorId=req.getParameter("doctor");
        String address=req.getParameter("address");
        
        Appointment ap=new Appointment(email,patientName,gender,age,appointmentDate,mobNo,diseases,doctorId,"pending",address);	
        AppointmentCurd ac=new AppointmentCurd(dbconn.getConn());
        
        HttpSession session=req.getSession();
        if(ac.addAppointment(ap))
        {
        	session.setAttribute("AsucMsg", "Appointment Added Successfull..!");
			resp.sendRedirect("Appointment.jsp");
		}else {
			session.setAttribute("AerrorMsg", "Something wrong on server..!");
			resp.sendRedirect("Appointment.jsp");
		}
		}catch(Exception e) {
			HttpSession session = req.getSession();
		    session.setAttribute("AerrorMsg", "An error occurred: " + e.getMessage());
		    resp.sendRedirect("Appointment.jsp");
		}
	}

}
