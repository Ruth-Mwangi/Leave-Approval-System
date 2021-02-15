package com.jkuates.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jkuates.models.Leave;
import com.jkuates.utils.LeaveApprovalUtil;

/**
 * @author user
 *
 */
@Repository
public class LeaveTypeDaoImpl implements LeaveTypeDao {
	private SqlSession session;

	public List<Leave> getAllLeaveTypes() {
		// TODO Auto-generated method stub
		openSession();
		List<Leave> leave=new ArrayList<Leave>();

		try {

			leave=session.selectList("LeaveType.getLeaveTypes");
			commitSession();
			closeSession();
			System.out.println(leave.size());
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		return leave;
	}

	

	@Override
	public Leave getLeaveByName(String name) {
		openSession();
		Leave leave=null;

		try {

			leave=session.selectOne("LeaveType.getLeaveByName",name);
			commitSession();
			closeSession();
			
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}
		return leave;
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
