package com.jkuates.controllers;



import java.util.List;
import java.util.concurrent.TimeUnit;

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
		Employee employeeLeaveRequests;
		session.setAttribute("employee", employee);
		List<Leave> leaveType=leaveTypeDao.getAllLeaveTypes();
		session.removeAttribute("loginAttempt");
		if(employee==null) {
			mv.setViewName("home.jsp");
			
			request.getSession().setAttribute("employeeFound", "Fail");
	
			
			System.out.println("no employee");
		}
		else {
			employeeLeaveRequests=employeeDao.getEmployeeLeaveRequests(employeeId, null);
			request.getSession().setAttribute("employeeId", employeeId);
			request.getSession().setAttribute("employeeRequests", employeeLeaveRequests);
			mv.addObject("leaveTypes", leaveType);
			mv.setViewName("leave.jsp");
			request.getSession().setAttribute("employee", employee);
			session.removeAttribute("employeeFound");
			System.out.println("many employee");
			
		}
		
		return mv;
		
	}
	
	@RequestMapping("/save-employee")
	public ModelAndView insertEmployee(@ModelAttribute("Employee")Employee employee, 
		      BindingResult result,HttpSession session) {
//		String  employeeId=request.getParameter("employee_id");
		Employee newEmployee=employee;
		boolean status=false;
		if(newEmployee==null) {
			
			
			System.out.println("no employee");
		}
		else {
			status=employeeDao.insertEmployee(newEmployee);
			if(status==true) {
				session.removeAttribute("employeeFound");
				mv.setViewName("home.jsp");
				
			}
			else {
				System.out.println("was saving successful? nope");
				session.removeAttribute("employeeFound");
				mv.addObject("registrationStatus","Failed");
				mv.setViewName("register.jsp");
				
			}
			
			
			
		
			System.out.println("employee name "+ employee.getFname());
		}
		return mv;
		
	}
	@RequestMapping("/register")
	public ModelAndView register(@ModelAttribute("Employee")Employee employee) {
//		String  employeeId=request.getParameter("employee_id");
		mv.addObject("registrationStatus", "Starting");
		mv.setViewName("register.jsp");
	
		return mv;
		
	}
	@RequestMapping("/home")
	public ModelAndView goHome(HttpSession session) {
//		String  employeeId=request.getParameter("employee_id");
		
		session.removeAttribute("employeeFound");
		mv.setViewName("home.jsp");
		
		return mv;
		
	}
	@RequestMapping("/employee-requests")
	public ModelAndView getEmployeeRequests(HttpServletRequest request,HttpServletResponse response,HttpSession session,@ModelAttribute("LeaveRequest")LeaveRequest leave, 
		      BindingResult result) {
		Employee employeeLeaveRequests;
		String employeeId=request.getParameter("employeeId");
		String status= request.getParameter("status") ;
		employeeLeaveRequests=employeeDao.getEmployeeLeaveRequests(employeeId, status);
		request.getSession().setAttribute("employeeId", employeeId);
		request.getSession().setAttribute("employeeRequests", employeeLeaveRequests);
		
		mv.setViewName("leave.jsp");
		return mv;
		
	}
	
	
	

}
