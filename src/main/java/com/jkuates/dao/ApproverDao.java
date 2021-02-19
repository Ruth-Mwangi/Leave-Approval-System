package com.jkuates.dao;

import java.util.List;

import com.jkuates.models.Approver;
import com.jkuates.models.LeaveRequest;

public interface ApproverDao {
	
	public List<Approver> getApprovers();
	
	public int getApproverByName(String name);
	
	public List<LeaveRequest> getApproversRequests(int id,Integer status);

}
