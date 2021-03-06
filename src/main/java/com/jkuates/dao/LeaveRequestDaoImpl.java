package com.jkuates.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jkuates.models.Employee;
import com.jkuates.models.GetLeaveDaysParameters;
import com.jkuates.models.LeaveRequest;
import com.jkuates.utils.LeaveApprovalUtil;

public class LeaveRequestDaoImpl implements LeaveRequestDao {
	
	private SqlSession session;

	@Override
	public boolean saveLeaveRequest(LeaveRequest leaveRequest) {
		// TODO Auto-generated method stub
		boolean status = false;
		openSession();
		
		
		try {
			
			session.insert("LeaveRequest.insertLeavRequest",leaveRequest);
			commitSession();
			closeSession();
			status=true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		return status;
	}

	@Override
	public int getLeaveDaysTaken(String employeeId,int leaveId) {
		// TODO Auto-generated method stub
		int daysTaken = 0;
		GetLeaveDaysParameters params=new GetLeaveDaysParameters(employeeId, leaveId);
		
		Map<String, String> map = new HashMap<String, String>();
        map.put("leaveId", employeeId);
        map.put("leaveId", String.valueOf(leaveId));
		openSession();
		
		
		try {
			if(session.selectOne("LeaveRequest.getDaysTaken",params)==null) {
				daysTaken=0;
			}
			else {
			daysTaken=session.selectOne("LeaveRequest.getDaysTaken",params);
			}
			commitSession();
			closeSession();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}

		return daysTaken;
	}
	
	
	private void openSession() {
		session = LeaveApprovalUtil.getSqlSessionFactory().openSession();

	}

	private void commitSession() {
		session.commit();

	}

	private void closeSession() {
		session.close();
	}

	@Override
	public void approveLeave(LeaveRequest leaveRequest) {
		boolean status = false;
		openSession();
		
		
		try {
			
			session.update("LeaveRequest.approveLeave",leaveRequest);
			System.out.println("Approved Successfully");
			commitSession();
			closeSession();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		
		
	}

	@Override
	public void rejectLeave(LeaveRequest leaveRequest) {
		boolean status = false;
		openSession();
		
		
		try {
			
			session.update("LeaveRequest.rejectLeave",leaveRequest);
			System.out.println("Rejected Successfully");
			commitSession();
			closeSession();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		
		
	}

	@Override
	public Employee getLeaveById(String employeeId, String leaveId) {
		// TODO Auto-generated method stub
		Employee employeeRequest=null;
		Map<String, String> map=new HashMap<String, String>();
		map.put("employeeId", employeeId);
		map.put("leaveId", leaveId);
		openSession();
		
		
		try {
			
			employeeRequest=session.selectOne("LeaveRequest.getLeaveById",map);
			commitSession();
			closeSession();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		return employeeRequest;
	}

}
