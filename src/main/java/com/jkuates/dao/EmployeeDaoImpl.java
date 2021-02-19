package com.jkuates.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jkuates.mappers.LeaveApprovalMapper;
import com.jkuates.models.Employee;
import com.jkuates.utils.LeaveApprovalUtil;

/**
 * @author Ruth Mwangi This an implementation of the LeaveApprovalDao
 */

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	private SqlSession session;
	
	

	public boolean insertEmployee(Employee employee) {
		// TODO Auto-generated method stub
		boolean status = false;
		openSession();
		
		
		try {
			
			session.insert("Employee.insertEmployee",employee);
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

	public Employee getEmployeeById(String employeeId) {
		// TODO Auto-generated method stub
		Employee employee=null;
		openSession();
		
		
		try {
			employee=session.selectOne("Employee.getEmployeeById", employeeId);
			commitSession();
			closeSession();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}

		return employee;
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
	public Employee getEmployeeLeaveRequests(String employeeId, String status) {
		Employee employee=null;
		Map<String, String> map=new HashMap<String, String>();
		map.put("employeeId", employeeId);
		map.put("status", status);
		openSession();
		
		
		try {
			employee=session.selectOne("LeaveRequest.getLeaveRequestsForEmployee", map);
			commitSession();
			closeSession();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			closeSession();
		}

		return employee;
	}

}
