package com.jkuates.models;


public class Employee extends User {
	private String employeeId;
	private String department;
	private String telephone;
	private String station;
	private String address;
	private String gender;
	
	
	public Employee(String fname, String lname, String title, String employeeId, String department, String telephone,
			String station, String address,String gender) {
		super(fname, lname, title);
		this.employeeId = employeeId;
		this.department = department;
		this.telephone = telephone;
		this.station = station;
		this.address = address;
		this.gender=gender;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getStation() {
		return station;
	}
	public void setStation(String station) {
		this.station = station;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

}
