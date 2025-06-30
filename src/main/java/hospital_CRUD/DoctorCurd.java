package hospital_CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hospital_entity.Doctor;

public class DoctorCurd  {
	private Connection conn;

	public DoctorCurd() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DoctorCurd(Connection conn) {
		super();
		this.conn = conn;
	}

	/*
	 * create table
	 * doctor_details(Id varchar2(10) primary key, fullName varchar2(50) not
	 * null, dob date not null,
	 * qualification varchar2(50) not null,
	 * specialist varchar2(50) not null,
	 * email varchar2(100) unique not null,
	 * contactNumber varchar2(10) unique not null,password varchar2(20) not null);
	 */
	public boolean registerDoctor(Doctor d) {
	    boolean f = false;
	    try {
	        String qry = "INSERT INTO doctor_details(Id, fullName, dob, qualification, specialist, email, contactNumber, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        
	        PreparedStatement ps = conn.prepareStatement(qry);
	        ps.setString(1, d.getId()); // Fixed capitalization
	        ps.setString(2, d.getFullName());
	      
	        ps.setDate(3, d.getDob());// Added missing parentheses
	        ps.setString(4, d.getQualification());
	        ps.setString(5, d.getSpecialist());
	        ps.setString(6, d.getEmail());
	        ps.setString(7, d.getMobNo());
	        ps.setString(8, d.getPassword());

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	    	 e.printStackTrace();
	    	   
	    }
	    return f;
	}
	public List<Doctor> getAllDoctor()
	{	
			List<Doctor> list = new ArrayList<Doctor>();
			Doctor d = null;
			try {
				String qry = "select * from doctor_details order by id asc";
				PreparedStatement ps=conn.prepareStatement(qry);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					d=new Doctor();
					 	d.setId(rs.getString("Id"));
			            d.setFullName(rs.getString("fullName"));
			            d.setDob(rs.getDate("dob")); // Correctly mapped
			            d.setQualification(rs.getString("qualification"));
			            d.setSpecialist(rs.getString("specialist"));
			            d.setEmail(rs.getString("email"));
			            d.setMobNo(rs.getString("contactNumber"));
			            d.setPassword(rs.getString("password"));
					list.add(d);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		return list;
		
	}
	public Doctor getDoctorByIndex(String id)
	{	
			Doctor d = null;
			try {
				String qry = "select * from doctor_details where id=?";
				PreparedStatement ps=conn.prepareStatement(qry);
				ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					d=new Doctor();
					 	d.setId(rs.getString("Id"));
			            d.setFullName(rs.getString("fullName"));
			            d.setDob(rs.getDate("dob")); // Correctly mapped
			            d.setQualification(rs.getString("qualification"));
			            d.setSpecialist(rs.getString("specialist"));
			            d.setEmail(rs.getString("email"));
			            d.setMobNo(rs.getString("contactNumber"));
			            d.setPassword(rs.getString("password"));
					
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		return d;
		
	}
	public boolean UpdateDoctor(Doctor d) {
	    boolean f = false;
	    try {
	        String qry = "UPDATE doctor_details set fullName=?, dob=?, qualification=?, specialist=?, email=?, contactNumber=?, password=? WHERE id=?";
	        
	        PreparedStatement ps = conn.prepareStatement(qry);
	      // Fixed capitalization
	        ps.setString(1, d.getFullName());
	      
	        ps.setDate(2, d.getDob());// Added missing parentheses
	        ps.setString(3, d.getQualification());
	        ps.setString(4, d.getSpecialist());
	        ps.setString(5, d.getEmail());
	        ps.setString(6, d.getMobNo());
	        ps.setString(7, d.getPassword());
	        ps.setString(8, d.getId()); 
	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	    	 e.printStackTrace();
	    	   
	    }
	    return f;
	}
	public boolean deleteDoctor(String id)
	{
		boolean f = false;
		try {
	        String qry = "DELETE FROM doctor_details WHERE id=?";
	        
	        PreparedStatement ps = conn.prepareStatement(qry);
	       
	        ps.setString(1, id); 
	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	    	 e.printStackTrace();
	    	   
	    }
		 return f;
	}
	
	public Doctor login(String email,String pwd)
	{
		Doctor d=null;
		try {
			String qry="Select * from doctor_details Where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, email);
			ps.setString(2, pwd);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				d=new Doctor();
			 	d.setId(rs.getString("Id"));
	            d.setFullName(rs.getString("fullName"));
	            d.setDob(rs.getDate("dob")); // Correctly mapped
	            d.setQualification(rs.getString("qualification"));
	            d.setSpecialist(rs.getString("specialist"));
	            d.setEmail(rs.getString("email"));
	            d.setMobNo(rs.getString("contactNumber"));
	            d.setPassword(rs.getString("password"));
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return d;
	}
	public int countDoctor() {
		int i=0;
		try {
			String qry="select * from doctor_details";
			PreparedStatement ps=conn.prepareStatement(qry);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	public int countAppointment() {
		int i=0;
		try {
			String qry="select * from appointment";
			PreparedStatement ps=conn.prepareStatement(qry);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	public int countAppointmentbydoctorId(String doctorId) {
		int i=0;
		try {
			String qry="select * from appointment where doctorId=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, doctorId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	public int countUser() {
		int i=0;
		try {
			String qry="select * from user_details";
			PreparedStatement ps=conn.prepareStatement(qry);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	public int countSpecialist() {
		int i=0;
		try {
			String qry="select * from specialist";
			PreparedStatement ps=conn.prepareStatement(qry);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
}
