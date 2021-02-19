package com.jkuates.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
import com.jkuates.utils.LeaveApprovalUtil;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

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
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result, HttpSession session) {

		int leaveId = Integer.parseInt(request.getParameter("leaveId"));
		int leaveDays = Integer.parseInt(request.getParameter("leaveDays"));
		String leaveName = request.getParameter("leaveName");
		int usedLeaveDays;
		List<Approver> approvers = approverDao.getApprovers();

		Employee employee = (Employee) session.getAttribute("employee");

		if (leaveName.equals("emergency")) {
			int id = leaveTypeDao.getLeaveByName("annual").getId();
			leaveDays = leaveTypeDao.getLeaveByName("annual").getDays();
			usedLeaveDays = leaveRequestDao.getLeaveDaysTaken(employee.getEmployeeId(), id);
		} else if (leaveName.equals("sick")) {
			usedLeaveDays = 0;
		} else {
			usedLeaveDays = leaveRequestDao.getLeaveDaysTaken(employee.getEmployeeId(), leaveId);
		}

		int daysRemaining = leaveDays - usedLeaveDays;

		List<Leave> leaveType = leaveTypeDao.getAllLeaveTypes();

		mv.addObject("employee", employee);
		mv.addObject("leaveTypes", leaveType);
		mv.addObject("leaveDays", leaveDays);
		mv.addObject("usedLeaveDays", usedLeaveDays);
		mv.addObject("remainingLeaveDays", daysRemaining);
		mv.addObject("isLeaveSelected", "True");
		mv.addObject("selectedLeave", leaveId);
		mv.addObject("approvers", approvers);
		mv.addObject("applicationProcess","True");
		mv.setViewName("leave.jsp");
//		System.out.println(leaveType.size());
//		System.out.println("here");
		System.out.println("my leave days are" + usedLeaveDays);
		System.out.println("employee name " + employee.getFname());
		System.out.println("approver name " + approvers.size());
		return mv;

	}

	@RequestMapping("/send-leave-request")
	public ModelAndView getEmployeeById(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result, HttpSession session) {
		boolean status = leaveRequestDao.saveLeaveRequest(leave);
		System.out.println(status);
		mv.addObject("applicationProcess","False");
		mv.addObject("isLeaveSelected", "False");
		mv.setViewName("leave.jsp");
		return mv;

	}

	@RequestMapping("/review-leave")
	public void reviewLeave(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result, HttpSession session) {
		int id = Integer.parseInt(request.getParameter("leaveId"));
		request.getSession().setAttribute("leaveRequestId", id);

	}

	@RequestMapping("/approved")
	public ModelAndView approveLeave(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result, HttpSession session) {
		String remarks = request.getParameter("remarks");
		int id = Integer.parseInt(request.getParameter("id"));
		LeaveRequest updateLeave = new LeaveRequest(id, remarks);
		leaveRequestDao.approveLeave(updateLeave);

		return new ModelAndView("redirect:/approve");

	}

	@RequestMapping("/rejected")
	public ModelAndView rejectLeave(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result, HttpSession session) {
		String remarks = request.getParameter("remarks");
		int id = Integer.parseInt(request.getParameter("id"));
		LeaveRequest updateLeave = new LeaveRequest(id, remarks);
		leaveRequestDao.rejectLeave(updateLeave);
		

		return new ModelAndView("redirect:/approve");

	}

	@RequestMapping("/approve")
	public ModelAndView goToApprove(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result, HttpSession session) {
//		String  employeeId=request.getParameter("employee_id");
		List<LeaveRequest> requests = new ArrayList<LeaveRequest>();
		int loginId = Integer.parseInt(session.getAttribute("approverId").toString());
		requests = approverDao.getApproversRequests(loginId,null);
		request.getSession().setAttribute("requests", requests);
		mv.setViewName("approve.jsp");
		return mv;

	}
	@RequestMapping("/approver-requests")
	public ModelAndView sortByStatusApproverRequest(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result, HttpSession session) {
//		String  employeeId=request.getParameter("employee_id");
		List<LeaveRequest> requests = new ArrayList<LeaveRequest>();
		int loginId = Integer.parseInt(session.getAttribute("approverId").toString());
		Integer status=null;
		if(request.getParameter("status")!=null) {
			status= Integer.parseInt(request.getParameter("status"));
		}
		 
		requests = approverDao.getApproversRequests(loginId,status);
		request.getSession().setAttribute("requests", requests);
		mv.setViewName("approve.jsp");
		return mv;

	}

	@RequestMapping("/download-leave")
	public void downloadLeave(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("LeaveRequest") LeaveRequest leave, BindingResult result, HttpSession session)
			throws IOException {
		String employeeId = request.getParameter("employeeId");
		String leaveId = request.getParameter("leaveId");
//		Employee employeeRequests = leaveRequestDao.getLeaveById(employeeId, leaveId);
//		
//		List<Employee> employeeRequestsList = new ArrayList<Employee>();
//		employeeRequestsList.add(employeeRequests);
		try {
			
			System.out.println("here");

			final InputStream stream = this.getClass().getResourceAsStream("/leave_form.jrxml");

			// Compile the Jasper report from .jrxml to .japser
			final JasperReport report = JasperCompileManager.compileReport(stream);

			// Fetching the employees from the data source.
//			final JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(employeeRequestsList);
			

			// Adding the additional parameters to the pdf.
			final Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("employeeId", employeeId);
			parameters.put("id", Integer.parseInt(leaveId));
			
			SqlSession sqlSession=LeaveApprovalUtil.getSqlSessionFactory().openSession();
			Connection conn = sqlSession.getConnection();
			

			// Filling the report with the employee data and additional parameters
			// information.
			final JasperPrint print = JasperFillManager.fillReport(report, parameters,conn);

			response.setContentType("application/x-download");
			response.addHeader("Content-disposition", "attachment; filename=" + "leave_report.pdf");
			OutputStream out = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(print, out);
			out.flush();
			out.close();
			
			sqlSession.commit();
			sqlSession.close();
			conn.close();

			mv.setViewName("leave,jsp");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			mv.setViewName("leave,jsp");
		}

	}

}
