package hospital_admin_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import hospital_entity.user;
@WebServlet("/adminLogin")
public class Admin_login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		HttpSession session=req.getSession();
		
		if("admin123@gmail.com".equals(email) && "Admin123".equals(password) ) {
			session.setAttribute("adminObj", new user());
			session.setAttribute("sucMsg", "Admin Login Successfull..!");
			res.sendRedirect("admin/AdminIndex.jsp");
		}else {
			session.setAttribute("errorMsg", "Invalid Email and Password..!");
			res.sendRedirect("admin_login.jsp");
		}
	}

}
