package com.jkuates.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jkuates.models.Employee;
import com.jkuates.models.Leave;

/**
 * @author Ruth Mwangi
 *This interface holds the methods that will be used to access the database
 */

public interface EmployeeDao {
	
	//employee dao
	
	public boolean insertEmployee(Employee employee);
	
	public Employee getEmployeeById(String employeeId);
	
	
	
	

}
