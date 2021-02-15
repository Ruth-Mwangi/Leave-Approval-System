package com.jkuates.controllers;

import java.util.ArrayList;
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
import com.jkuates.models.LeaveRequest;

@RestController
public class ApproverController {
	
	private String userName="Patrick";
	private String password="Patrick@123";
	@Autowired
	private ApproverDao approverDao;

	private ModelAndView mv = new ModelAndView();
	
	@RequestMapping("/login")
	public ModelAndView getEmployeeById(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		
		boolean status=false;
		
		String user=request.getParameter("username");
		String pass=request.getParameter("password");
		List<LeaveRequest> requests=new ArrayList<LeaveRequest>();
		if(session.getAttribute("loginId")!=null) {
			int loginId=Integer.parseInt(session.getAttribute("loginId").toString());
			requests=approverDao.getApproversRequests(loginId);
			request.getSession().setAttribute("requests", requests);
			mv.setViewName("approve.jsp");
			System.out.println("session here controller");
		}
		else {
			if(user.equals(userName) && pass.equals(password)) {
				int id=approverDao.getApproverByName(user);
				System.out.println("success here controller");
				request.getSession().setAttribute("loginId", id);
				requests=approverDao.getApproversRequests(id);
				request.getSession().setAttribute("requests", requests);
				status=true;
				mv.setViewName("approve.jsp");
				
			}
			else {
				status=false;
				
				mv.setViewName("index.jsp");
			}
			
		
		}
		
		
		return mv;
		
	}

}
