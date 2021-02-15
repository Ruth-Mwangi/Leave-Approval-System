package com.jkuates.dao;

import com.jkuates.models.LeaveRequest;

public interface LeaveRequestDao {
	
	public boolean saveLeaveRequest(LeaveRequest leaveRequest);
	
	public int getLeaveDaysTaken(String employeeId,int leaveId);

}
