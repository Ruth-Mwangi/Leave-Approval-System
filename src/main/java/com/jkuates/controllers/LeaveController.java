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

import com.jkuates.dao.ApproverDao;
import com.jkuates.dao.EmployeeDao;
import com.jkuates.dao.LeaveRequestDao;
import com.jkuates.dao.LeaveTypeDao;
import com.jkuates.models.Approver;
import com.jkuates.models.Employee;
import com.jkuates.models.Leave;
import com.jkuates.models.LeaveRequest;

@RestController
public class LeaveController {
	@Autowired
	private EmployeeDao employeeDao;

	@Autowired
	private LeaveTypeDao leaveTypeDao;
	
	@Autowired
	private LeaveRequestDao leaveRequestDao;
	
	@Autowired
	private ApproverDao approverDao;

	private ModelAndView mv = new ModelAndView();
	
	

	@RequestMapping("/apply-for-leave")
	public ModelAndView applyForLeave(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result,HttpSession session) {
		
		int leaveId=Integer.parseInt(request.getParameter("leaveId"));
		int leaveDays=Integer.parseInt(request.getParameter("leaveDays"));
		String leaveName=request.getParameter("leaveName");
		int usedLeaveDays;
		List<Approver> approvers=approverDao.getApprovers();
		

		Employee employee = (Employee) session.getAttribute("employee");
		
		if(leaveName.equals("emergency")) {
			int id=leaveTypeDao.getLeaveByName("annual").getId();
			leaveDays=leaveTypeDao.getLeaveByName("annual").getDays();
			usedLeaveDays=leaveRequestDao.getLeaveDaysTaken(employee.getEmployeeId(),id);
		}
		else if(leaveName.equals("sick")) {
			usedLeaveDays=0;
		}
		else {
			usedLeaveDays=leaveRequestDao.getLeaveDaysTaken(employee.getEmployeeId(),leaveId);
		}
		
		int daysRemaining=leaveDays-usedLeaveDays;
		

		List<Leave> leaveType = leaveTypeDao.getAllLeaveTypes();

		mv.addObject("employee", employee);
		mv.addObject("leaveTypes", leaveType);
		mv.addObject("leaveDays", leaveDays);
		mv.addObject("usedLeaveDays", usedLeaveDays);
		mv.addObject("remainingLeaveDays", daysRemaining);
		mv.addObject("isLeaveSelected","True");
		mv.addObject("selectedLeave", leaveId);
		mv.addObject("approvers", approvers);
		mv.setViewName("leave.jsp");
//		System.out.println(leaveType.size());
//		System.out.println("here");
		System.out.println("my leave days are"+usedLeaveDays);
		System.out.println("employee name " + employee.getFname());
		System.out.println("approver name " +approvers.size());
		return mv;

	

	}
	@RequestMapping("/send-leave-request")
	public ModelAndView getEmployeeById(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("LeaveRequest")LeaveRequest leave, 
		      BindingResult result,HttpSession session) {
		boolean status=leaveRequestDao.saveLeaveRequest(leave);
		System.out.println(status);
		mv.setViewName("index.jsp");
		return mv;
		
	}

}
