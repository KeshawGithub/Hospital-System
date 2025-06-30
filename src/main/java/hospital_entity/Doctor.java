package hospital_entity;

import java.sql.Date;

public class Doctor {
	private String id;
	private String fullName;
	private Date dob;
	private String qualification;
	private String specialist;
	private String email;
	private String mobNo;
	private String password;
	
	
	public Doctor() {
		
	}


	public Doctor(String id, String fullName, Date dob, String qualification, String specialist, String email,
			String mobNo, String password) {
		this.id = id;
		this.fullName = fullName;
		this.dob = dob;
		this.qualification = qualification;
		this.specialist = specialist;
		this.email = email;
		this.mobNo = mobNo;
		this.password = password;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
	    if (id == null || id.isEmpty()) {
	        throw new IllegalArgumentException("ID cannot be null or empty");
	    }
	    this.id = id;
	}



	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public Date getDob() {
		return dob;
	}


	public void setDob(Date dob) {
		this.dob = dob;
	}


	public String getQualification() {
		return qualification;
	}


	public void setQualification(String qualification) {
		this.qualification = qualification;
	}


	public String getSpecialist() {
		return specialist;
	}


	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMobNo() {
		return mobNo;
	}


	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	

}
