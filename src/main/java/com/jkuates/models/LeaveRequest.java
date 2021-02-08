package com.jkuates.models;

public class LeaveRequest {
	private Integer id;
	private String employeeId;
	private Integer approverId;
	private Integer leaveTypeId;
	private String dateCreated;
	private String dateApproved;
	private String startDate;
	private String endDate;
	private String status;
	private Integer requestedDays;
	private String remarks;
	
	
	public LeaveRequest(String employeeId, Integer approverId, Integer leaveTypeId, String dateCreated,
			String dateApproved, String startDate, String endDate, String status, Integer requestedDays,
			String remarks) {
		
		
		this.employeeId = employeeId;
		this.approverId = approverId;
		this.leaveTypeId = leaveTypeId;
		this.dateCreated = dateCreated;
		this.dateApproved = dateApproved;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.requestedDays = requestedDays;
		this.remarks = remarks;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public Integer getApproverId() {
		return approverId;
	}
	public void setApproverId(Integer approverId) {
		this.approverId = approverId;
	}
	public Integer getLeaveTypeId() {
		return leaveTypeId;
	}
	public void setLeaveTypeId(Integer leaveTypeId) {
		this.leaveTypeId = leaveTypeId;
	}
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	public String getDateApproved() {
		return dateApproved;
	}
	public void setDateApproved(String dateApproved) {
		this.dateApproved = dateApproved;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getRequestedDays() {
		return requestedDays;
	}
	public void setRequestedDays(Integer requestedDays) {
		this.requestedDays = requestedDays;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	

}
