package com.jkuates.controllers;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jkuates.dao.EmployeeDao;
import com.jkuates.dao.LeaveTypeDao;
import com.jkuates.models.Employee;
import com.jkuates.models.Leave;
import com.jkuates.models.LeaveRequest;

@RestController
public class EmployeeController {
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private LeaveTypeDao leaveTypeDao;
	
	private ModelAndView mv=new ModelAndView();
	
	@RequestMapping("/get-employee")
	public ModelAndView getEmployeeById(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("LeaveRequest")LeaveRequest leave, 
		      BindingResult result,HttpSession session) {
		String  employeeId=request.getParameter("employee_id");
		
		Employee employee=employeeDao.getEmployeeById(employeeId);
		session.setAttribute("employee", employee);
		List<Leave> leaveType=leaveTypeDao.getAllLeaveTypes();
		if(employee==null) {
			mv.setViewName("popup.jsp");
			mv.addObject("employeeFound", "Fail");
	
			
			System.out.println("no employee");
		}
		else {
			mv.addObject("employeeId", employeeId);
			mv.addObject("leaveTypes", leaveType);
			mv.setViewName("leave.jsp");
			request.getSession().setAttribute("employee", employee);
			System.out.println("many employee");
			
		}
		return mv;
		
	}
	
	@RequestMapping("/save-employee")
	public ModelAndView insertEmployee(@ModelAttribute("Employee")Employee employee, 
		      BindingResult result) {
//		String  employeeId=request.getParameter("employee_id");
		Employee newEmployee=employee;
		boolean status=false;
		if(newEmployee==null) {
			
			
			System.out.println("no employee");
		}
		else {
			status=employeeDao.insertEmployee(newEmployee);
			if(status==true) {
				mv.setViewName("index.jsp");
			}
			else {
				mv.setViewName("register.jsp");
				
			}
			
			
			
		
			System.out.println("employee name "+ employee.getFname());
		}
		return mv;
		
	}
	@RequestMapping("/register")
	public ModelAndView register(@ModelAttribute("Employee")Employee employee) {
//		String  employeeId=request.getParameter("employee_id");
		mv.setViewName("register.jsp");
		return mv;
		
	}
	

}
