package hospital_CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hospital_entity.Appointment;
import hospital_entity.Doctor;

public class AppointmentCurd {
	private Connection conn;

	public AppointmentCurd(Connection conn) {
		super();
		this.conn = conn;
	}

	public AppointmentCurd() {
		super();
		// TODO Auto-generated constructor stub
	}
	/*
	 * CREATE TABLE appointment ( email VARCHAR2(50), patientName VARCHAR2(50),
	 * gender VARCHAR2(10) NOT NULL, age VARCHAR2(2) not null, appointmentDate DATE
	 * NOT NULL, contactNumber VARCHAR2(10) NOT NULL, diseases VARCHAR2(40) NOT
	 * NULL, fullAddress VARCHAR2(100) NOT NULL, doctorId VARCHAR2(10), status
	 * VARCHAR2(20) NOT NULL, PRIMARY KEY (email, patientName), FOREIGN KEY
	 * (doctorId) REFERENCES doctor_details(Id), FOREIGN KEY (email) REFERENCES
	 * user_details(email) ON DELETE CASCADE );
	 */

	public boolean addAppointment(Appointment ab) {
		boolean f=false;
		
		try {
			String qry="INSERT INTO appointment(email,patientName,gender,age,appointmentDate,contactNumber,diseases,fullAddress,doctorId,status) VALUES (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, ab.getEmail());
			ps.setString(2, ab.getPatientName());
			ps.setString(3, ab.getGender());
			ps.setString(4, ab.getAge());
			ps.setDate(5, ab.getAppointmentDate());
			ps.setString(6, ab.getContactNumber());
			ps.setString(7, ab.getDiseases());
			ps.setString(8, ab.getFullAddress());
			ps.setString(9, ab.getDoctorId());
			ps.setString(10, ab.getStatus());
			
			int row=ps.executeUpdate();
			if(row==1) {
				f=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}
	public List<Appointment> getAllAppointment()
	{	
			List<Appointment> list = new ArrayList<Appointment>();
			Appointment a = null;
			try {
				String qry = "select * from appointment ";
				PreparedStatement ps=conn.prepareStatement(qry);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					a=new Appointment();
						a.setEmail(rs.getString("email"));
					 	a.setPatientName(rs.getString("patientName"));
			            a.setGender(rs.getString("gender"));
			            a.setAge(rs.getString("age"));
			            a.setAppointmentDate(rs.getDate("appointmentDate")); // Correctly mapped
			            a.setContactNumber(rs.getString("contactNumber"));
			            a.setDiseases(rs.getString("Diseases"));
			            a.setDoctorId(rs.getString("doctorId"));
			            a.setStatus(rs.getString("status"));
			            a.setFullAddress(rs.getString("fullAddress"));
					list.add(a);
				}
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		
			
		return list;
		
	}
	
	public List<Appointment> getAllAppointmentUserLogin(String email){
		
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment a = null;
		try {
			String qry = "select * from appointment where email=? ";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				a=new Appointment();
					
				 	a.setPatientName(rs.getString("patientName"));
		            a.setGender(rs.getString("gender"));
		            a.setAge(rs.getString("age"));
		            a.setAppointmentDate(rs.getDate("appointmentDate")); // Correctly mapped
		            a.setContactNumber(rs.getString("contactNumber"));
		            a.setDiseases(rs.getString("diseases"));
		            a.setDoctorId(rs.getString("doctorId"));
		            a.setStatus(rs.getString("status"));
		            a.setFullAddress(rs.getString("fullAddress"));
				list.add(a);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
public List<Appointment> getAllAppointmentDoctorLogin(String doctorId){
		
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment a = null;
		try {
			String qry = "select * from appointment where doctorId=? ";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, doctorId);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				a=new Appointment();
					a.setEmail(rs.getString("email"));
				 	a.setPatientName(rs.getString("patientName"));
		            a.setGender(rs.getString("gender"));
		            a.setAge(rs.getString("age"));
		            a.setAppointmentDate(rs.getDate("appointmentDate")); // Correctly mapped
		            a.setContactNumber(rs.getString("contactNumber"));
		            a.setDiseases(rs.getString("diseases"));
		            a.setDoctorId(rs.getString("doctorId"));
		            a.setStatus(rs.getString("status"));
		            a.setFullAddress(rs.getString("fullAddress"));
				list.add(a);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

public Appointment getAppointmentByEmailPatient(String email,String patientName){
	
	Appointment a = null;
	try {
		String qry = "select * from appointment where email=? and patientName=? ";
		PreparedStatement ps=conn.prepareStatement(qry);
		ps.setString(1, email);
		ps.setString(2, patientName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			a=new Appointment();
				a.setEmail(rs.getString("email"));
			 	a.setPatientName(rs.getString("patientName"));
	            a.setGender(rs.getString("gender"));
	            a.setAge(rs.getString("age"));
	            a.setAppointmentDate(rs.getDate("appointmentDate")); // Correctly mapped
	            a.setContactNumber(rs.getString("contactNumber"));
	            a.setDiseases(rs.getString("diseases"));
	            a.setDoctorId(rs.getString("doctorId"));
	            a.setStatus(rs.getString("status"));
	            a.setFullAddress(rs.getString("fullAddress"));
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return a;
}
public boolean UpdateComment(String patientName,String email,String doctorId,String status) {
	boolean f=false;
	
	try {
		String qry="UPDATE appointment SET status=? WHERE email=? AND patientName=? AND doctorId=?";
		PreparedStatement ps=conn.prepareStatement(qry);
		ps.setString(1, status);
		ps.setString(2, email);
		ps.setString(3, patientName);
		ps.setString(4, doctorId);
		
		int row=ps.executeUpdate();
		if(row==1) {
			f=true;
		}
	}catch(Exception e) {
		e.printStackTrace();
	}

	return f;
}
	
}
