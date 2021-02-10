package com.jkuates.mappers;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.jkuates.models.Employee;

public interface LeaveApprovalMapper {

	final String getEmployeeById = "SELECT * FROM employee WHERE employee_id=#{employee_id}";
	final String insertEmployee = "INSERT INTO employee (employee_id,deparmrnt,fname,lname,title,address,gender,station,telephone)  VALUES "
			+ "(#{employee_id},#{department},#{fname},#{lname},#{title},#{address},#{gender},#{station},#{telephone})";

	@Results(id = "employeeMap", value = {
			@Result(column = "employeeId",property = "employeeId"),
			@Result(column = "depatment",property = "department"),
			@Result(column = "fname",property = "fname"),
			@Result(column = "lname",property = "lname"),
			@Result(column = "title",property = "title"),
			@Result(column = "address",property = "address"),
			@Result(column = "gender",property = "gender"),
			@Result(column = "station",property = "station"),
			@Result(column = "telephone",property = "telephone")
			
	})
	
	@Insert(insertEmployee)
	void insertEmployee(Employee employee);
	
	@ResultMap("employeeMap")
	@Select(getEmployeeById)
	Employee getEmployeeById(String employee_id);

}
