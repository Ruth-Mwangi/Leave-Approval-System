package com.jkuates.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jkuates.models.Approver;
import com.jkuates.models.Leave;
import com.jkuates.models.LeaveRequest;
import com.jkuates.utils.LeaveApprovalUtil;

public class ApproverDaoImpl implements ApproverDao {
	
	private SqlSession session;

	


	@Override
	public List<Approver> getApprovers() {
		openSession();
		List<Approver> approvers=new ArrayList<Approver>();

		try {

			approvers=session.selectList("Approver.getApprovers");
			commitSession();
			closeSession();
	
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		return approvers;
	}
	

	

	@Override
	public int getApproverByName(String name) {
		// TODO Auto-generated method stub
		openSession();
		int approverId=0;

		try {

			approverId=session.selectOne("Approver.getApproverId",name);
			commitSession();
			closeSession();
	
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		return approverId;
	}
	@Override
	public List<LeaveRequest> getApproversRequests(int id,Integer status) {
		openSession();
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("approverId", id);
		map.put("status", status);
		
		List<LeaveRequest> requests=new ArrayList<LeaveRequest>();

		try {

			requests=session.selectList("LeaveRequest.getLeaveRequestsForApprover",map);
			System.out.println(requests.size());
			commitSession();
			closeSession();
	
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		return requests;
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



	
}
