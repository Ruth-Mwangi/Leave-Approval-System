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
	private Integer status;
	private Integer requestedDays;
	private String remarks;
	private Employee employee;
	private Leave leaveName;
	
	
	
	
	public LeaveRequest(String employeeId, String dateCreated, String startDate, String endDate,
			Integer requestedDays) {
		this.employeeId = employeeId;
		this.dateCreated = dateCreated;
		this.startDate = startDate;
		this.endDate = endDate;
		this.requestedDays = requestedDays;
	}

	public LeaveRequest(String employeeId, Integer approverId, Integer leaveTypeId, String startDate, String endDate,
			Integer requestedDays) {
		this.employeeId = employeeId;
		this.approverId = approverId;
		this.leaveTypeId = leaveTypeId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.requestedDays = requestedDays;
	}
	
	public LeaveRequest() {
		
	}

	public LeaveRequest(Integer id, String employeeId, Integer approverId, Integer leaveTypeId, String dateCreated,
			String dateApproved, String startDate, String endDate, Integer status, Integer requestedDays,
			String remarks) {
		
		this.id = id;
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

	public LeaveRequest(String employeeId, Integer approverId, Integer leaveTypeId, String dateCreated,
			String dateApproved, String startDate, String endDate, Integer status, Integer requestedDays,
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
	
	
	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Leave getLeaveName() {
		return leaveName;
	}

	public void setLeaveName(Leave leaveName) {
		this.leaveName = leaveName;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
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
