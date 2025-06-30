package hospital_admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital_CRUD.UserCurd;
import hospital_dbconn.dbconn;
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		UserCurd dc=new UserCurd(dbconn.getConn());
		HttpSession session=req.getSession();
		if(dc.deleteUser(email)) {
			session.setAttribute("succMsg", "Delete User details successfull..!");
			resp.sendRedirect("admin/AdminIndex.jsp");
		}else {
			session.setAttribute("errorMsg", "Something wrong on server..!");
			resp.sendRedirect("admin/AdminIndex.jsp");
		}	
	}

}
