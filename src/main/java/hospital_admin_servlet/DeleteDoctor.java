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
@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		DoctorCurd dc=new DoctorCurd(dbconn.getConn());
		HttpSession session=req.getSession();
		if(dc.deleteDoctor(id)) {
			session.setAttribute("DDsucMsg", "Delete doctor details successfull..!");
			resp.sendRedirect("admin/doctor.jsp");
		}else {
			session.setAttribute("DDerrorMsg", "Something wrong on server..!");
			resp.sendRedirect("admin/doctor.jsp");
		}
	}

}
