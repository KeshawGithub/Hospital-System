package hospital_user_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital_CRUD.UserCurd;
import hospital_dbconn.dbconn;
@WebServlet("/changePasswword")
public class changePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	String oldPassword=req.getParameter("oldPassword");
	String newPassword=req.getParameter("newPassword");
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	try {
		HttpSession session=req.getSession();
		UserCurd uc=new UserCurd(dbconn.getConn());
		String f=uc.changePassword(email, newPassword, oldPassword, password);
		 if(f=="true") {
			 session.setAttribute("CPsucMsg", "Changed Successfull..!");
			 res.sendRedirect("userChangePassword.jsp");
			
		 }else if(f=="passwordMissmatch") {
			 session.setAttribute("misMatch", "Old Password is not correct..!");
			 res.sendRedirect("userChangePassword.jsp");
		 }
		 else {
			 session.setAttribute("CPerrorMsg", "Some thing wrong on server");
			 res.sendRedirect("userChangePassword.jsp");
			 
		 }
	}catch(Exception e) {
		e.printStackTrace();
;	}
	
	}

}
