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
public class LeaveController {
	@Autowired
	private EmployeeDao employeeDao;

	@Autowired
	private LeaveTypeDao leaveTypeDao;

	private ModelAndView mv = new ModelAndView();

	@RequestMapping("/apply-for-leave")
	public ModelAndView applyForLeave(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result,HttpSession session) {
//		String employeeId = request.getParameter("employeeId").toUpperCase();
//		Employee employee = (Employee) session.getAttribute("employee");
		Employee employee =null;
		List<Leave> leaveType = leaveTypeDao.getAllLeaveTypes();

		mv.addObject("employee", employee);
		mv.addObject("leaveTypes", leaveType);
		mv.setViewName("leave.jsp");
		System.out.println(leaveType.size());
		System.out.println("employee name " + employee.getFname());

		return mv;

	}

}
