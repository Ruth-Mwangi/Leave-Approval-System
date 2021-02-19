package com.jkuates.dao;

import com.jkuates.models.Employee;
import com.jkuates.models.LeaveRequest;

public interface LeaveRequestDao {
	
	public boolean saveLeaveRequest(LeaveRequest leaveRequest);
	
	public int getLeaveDaysTaken(String employeeId,int leaveId);
	
	public void approveLeave(LeaveRequest leaveRequest);
	
	public void rejectLeave(LeaveRequest leaveRequest);
	
	public Employee getLeaveById(String employeeId,String leaveId);

}
