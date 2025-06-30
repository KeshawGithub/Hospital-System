package hospital_CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hospital_entity.Specialist;

public class SpecialistCurd {
	private Connection conn;

	public SpecialistCurd(Connection conn) {
		super();
		this.conn = conn;
	}

	/*
	 * create table specialist(id varchar2(10) primary key, specialistName
	 * varchar2(50) not null);
	 */
	public String addSpecialist(int id, String specialistName) {
		String f = "false";
		try {
			String qry = "insert into specialist(id,specialistName)values(?,?)";
			PreparedStatement ps = conn.prepareStatement(qry);
			ps.setInt(1, id);
			ps.setString(2, specialistName);
			

			int i = ps.executeUpdate();
			if (i == 1) {
				f = "true";
			}
		} catch (Exception e) {
			 if (e instanceof java.sql.SQLIntegrityConstraintViolationException) {
	                return "DUPLICATE_ID"; // Custom message for unique constraint violation
	            }
			e.printStackTrace();
		}

		return f;
	}
	
	public List<Specialist> getAllSpecialist(){
		List<Specialist> list=new ArrayList<Specialist>();
		Specialist s=null;
		try {
			String qry="select * from specialist order by id asc";
			PreparedStatement ps=conn.prepareStatement(qry);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				s=new Specialist();
				s.setId(Integer.parseInt(rs.getString(1)));
	 			s.setSpecialistName(rs.getString(2));
				list.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean deleteSpecialist(int id)
	{
		boolean f = false;
		try {
	        String qry = "DELETE FROM specialist WHERE id=?";
	        
	        PreparedStatement ps = conn.prepareStatement(qry);
	       
	        ps.setInt(1, id); 
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
