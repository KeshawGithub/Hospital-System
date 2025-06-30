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
@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String SpecName=req.getParameter("specName");
		
		SpecialistCurd sc=new SpecialistCurd(dbconn.getConn());
		String f=sc.addSpecialist(id,SpecName);
		
		HttpSession session=req.getSession();
		if(f=="true")
		{
		session.setAttribute("succMsg", "Specialist Added..!");
		resp.sendRedirect("admin/AdminIndex.jsp ");
		}else if(f=="DUPLICATE_ID") {
			session.setAttribute("errorMsg", "Specialist Id is already used..!");
			resp.sendRedirect("admin/AdminIndex.jsp ");
		}else {
			session.setAttribute("errorMsg", "Something wrong on server..!");
			resp.sendRedirect("admin/AdminIndex.jsp");	
		}
	}
	

}  
