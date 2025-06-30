package hospital_CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hospital_entity.Appointment;
import hospital_entity.user;

public class UserCurd {
	private Connection conn;

	public UserCurd(Connection conn) {
		super();
		this.conn = conn;
	}

	/*
	 * create table user_details(full_name varchar2(50) not null,email varchar2(50)
	 * primary key, password varchar2(50) not null)
	 */
	public String register(user u) {
		String f="false";
		try {
			String qry="insert into user_details(full_name,email,password)values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, u.getFullName());
			ps.setString(2,u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f="true";
			}
			
		}catch (SQLException e) {
            if (e instanceof java.sql.SQLIntegrityConstraintViolationException) {
                return "DUPLICATE_EMAIL"; // Custom message for unique constraint violation
            }
            e.printStackTrace();
        }
		return f;
	}
	
	public user login(String em, String pwd) {
	    user u = null;
	    try {
	        String qry = "SELECT full_name, email, password FROM user_details WHERE email = ? AND password = ?";
	        PreparedStatement ps = conn.prepareStatement(qry);
	        ps.setString(1, em);
	        ps.setString(2, pwd);
	        
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            u = new user();// changed to `if` as only one record is expected
	            u.setFullName(rs.getString("full_name"));  // Using column names is more readable
	            u.setEmail(rs.getString("email"));
	            u.setPassword(rs.getString("password"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();  // Consider using proper logging instead
	    }
	    return u;
	}
	public List<user> getAllUser(){
		
		List<user> list = new ArrayList<user>();
		user u = null;
		try {
			String qry = "select * from user_details ";
			PreparedStatement ps=conn.prepareStatement(qry);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				u=new user();
					u.setEmail(rs.getString("email"));
				 	u.setFullName(rs.getString("full_name"));
		            u.setPassword(rs.getString("password"));
				list.add(u);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public String changePassword(String email,String newPassword, String oldPassword, String password)
	{
		String f="false";
		try {
			if(password.equals(oldPassword)) {
				String qry="update user_details set password=? where email=?";
				PreparedStatement ps=conn.prepareStatement(qry);
				ps.setString(1, newPassword);
				ps.setString(2, email);
				int i=ps.executeUpdate();
				if(i==1) {
					f="true";   
				}
			}else {
				f="passwordMissmatch";
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	public boolean deleteUser(String email) {
		boolean f=false;
		try {
	        String qry = "DELETE FROM user_details WHERE email=?";
	        
	        PreparedStatement ps = conn.prepareStatement(qry);
	       
	        ps.setString(1, email); 
	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	    	 e.printStackTrace();
	    	   
	    }
		
		return f;
	}

}
 