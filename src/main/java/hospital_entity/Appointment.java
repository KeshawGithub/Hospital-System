package hospital_entity;

import java.sql.Date;

public class Appointment {
		private String email;
		private String patientName;
		private String gender;
		private String age;
		private Date appointmentDate;
		private String contactNumber;
		private String diseases;
		private String DoctorId;
		private String status;
		private String fullAddress;
		
		public Appointment(String email, String patientName, String gender, String age, Date appointmentDate,
				String contactNumber, String diseases, String doctorId, String status,
				String fullAddress) {
			this.email = email;
			this.patientName = patientName;
			this.gender = gender;
			this.age = age;
			this.appointmentDate = appointmentDate;
			this.contactNumber = contactNumber;
			this.diseases = diseases;
			this.DoctorId = doctorId;
			this.status = status;
			this.fullAddress = fullAddress;
		}
		public Appointment() {
			super();
			// TODO Auto-generated constructor stub
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPatientName() {
			return patientName;
		}
		public void setPatientName(String patientName) {
			this.patientName = patientName;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getAge() {
			return age;
		}
		public void setAge(String age) {
			this.age = age;
		}
		public Date getAppointmentDate() {
			return appointmentDate;
		}
		public void setAppointmentDate(Date appointmentDate) {
			this.appointmentDate = appointmentDate;
		}
		public String getContactNumber() {
			return contactNumber;
		}
		public void setContactNumber(String contactNumber) {
			this.contactNumber = contactNumber;
		}
		public String getDiseases() {
			return diseases;
		}
		public void setDiseases(String diseases) {
			this.diseases = diseases;
		}
		public String getDoctorId() {
			return DoctorId;
		}
		public void setDoctorId(String doctorId) {
			DoctorId = doctorId;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getFullAddress() {
			return fullAddress;
		}
		public void setFullAddress(String fullAddress) {
			this.fullAddress = fullAddress;
		}
		
		
}
