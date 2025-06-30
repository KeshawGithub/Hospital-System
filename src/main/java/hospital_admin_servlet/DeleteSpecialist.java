package hospital_admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital_CRUD.SpecialistCurd;
import hospital_dbconn.dbconn;

@WebServlet("/DeleteSpecialist")
public class DeleteSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		SpecialistCurd dc=new SpecialistCurd(dbconn.getConn());
		HttpSession session=req.getSession();
		if(dc.deleteSpecialist(id)) {
			session.setAttribute("succMsg", "Delete Specialist details successfull..!");
			resp.sendRedirect("admin/AdminIndex.jsp");
		}else {
			session.setAttribute("errorMsg", "Something wrong on server..!");
			resp.sendRedirect("admin/AdminIndex.jsp");
		}
	}
	

}
