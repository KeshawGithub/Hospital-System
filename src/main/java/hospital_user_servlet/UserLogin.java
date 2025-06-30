package hospital_user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital_CRUD.UserCurd ;
import hospital_dbconn.dbconn;
import hospital_entity.user;
@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		HttpSession session=req.getSession();
		UserCurd uc=new UserCurd (dbconn.getConn());
		user u=uc.login(email, password);
		
		if(u!=null)
		{
			session.setAttribute("userObj", u);
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("ULerrorMsg", "Invalid Email and Password..!");
			resp.sendRedirect("user_login.jsp");
		}
	}

}
