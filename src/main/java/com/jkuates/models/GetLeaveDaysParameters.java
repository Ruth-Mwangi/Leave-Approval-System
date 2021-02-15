package com.jkuates.models;

public class GetLeaveDaysParameters {
	private String employeeId;
	private int leaveId;
	
	
	
	
	
	public GetLeaveDaysParameters(String employeeId, int leaveId) {
		this.employeeId = employeeId;
		this.leaveId = leaveId;
	}
	
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public int getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(int leaveId) {
		this.leaveId = leaveId;
	}
	
	

}
