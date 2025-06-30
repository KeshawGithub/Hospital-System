package hospital_user_servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital_CRUD.UserCurd ;
import hospital_dbconn.dbconn;
import hospital_entity.user;

@WebServlet("/userResgister")
public class UserRegister extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException {
		String fullname=req.getParameter("name");
		String email=req.getParameter("mail");
		String password=req.getParameter("password");
		 user u=new user(fullname,email,password);
		 UserCurd uc=new UserCurd (dbconn.getConn());
		 
		 HttpSession session=req.getSession();
		 
		 String f=uc.register(u);
		 if(f=="true") {
			 session.setAttribute("sucMsg", "Register Successfull..!");
			 res.sendRedirect("signup.jsp");
			
		 }else if(f=="DUPLICATE_EMAIL") {
			 session.setAttribute("dupemailMsg", "Email is already use..!");
			 res.sendRedirect("signup.jsp");
		 }
		 else {
			 session.setAttribute("errorMsg", "Some thing wrong on server");
			 res.sendRedirect("signup.jsp");
			 
		 }
	}
}
