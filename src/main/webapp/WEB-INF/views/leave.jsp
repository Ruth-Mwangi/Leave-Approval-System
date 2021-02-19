<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<script src="<c:url value="/resources/js/main.js" />"></script>



</head>
<body>
	<div class="container-fluid">

		<c:if test="${applicationProcess == 'True' }">
			<script>
			$(function () {

				document.getElementById('formDiv').style.display='block';
				document.getElementById('requestDiv').style.display='none'; 
			   });
			</script>
		</c:if>
		<div class="row navigation">
			<jsp:include page="nav.jsp"></jsp:include>

		</div>
		<div class="row approver ">
			<div class="col-md-2  approver-menu">

				<div class="row justify-content-start">
					<button type="button" onclick="displayApplyForLeave()"
						class="btn btn-success">Apply for leave</button>
				</div>
				<hr>
				<div class="row justify-content-start">
					<h5>View Your Requests</h5>
				</div>
				<hr>
				<div class="row justify-content-start">
					<h5>Filter By</h5>
				</div>
				<div class="row justify-content-start">
					<button type="button" class="btn btn-primary"
						onclick="displayRequests();location.href='employee-requests?employeeId=${employeeId}'">All</button>
				</div>
				<div class="row justify-content-start">
					<button type="button" class="btn btn-primary"
						onclick="displayRequests();location.href='employee-requests?status=0&employeeId=${employeeId}'">Pending</button>
				</div>
				<div class="row justify-content-start">
					<button type="button" class="btn btn-primary"
						onclick="displayRequests();location.href='employee-requests?status=1&employeeId=${employeeId}'">Approved</button>
				</div>
				<div class="row justify-content-start">
					<button type="button" class="btn btn-primary"
						onclick="displayRequests();location.href='employee-requests?status=2&employeeId=${employeeId}'">
						Rejected</button>
				</div>



			</div>
			<div class="col-md-10 approver-content">


				<div class="row approver-content-main" id="requestDiv">

					<div class="card-columns" style="margin-top: 15px">
						<c:forEach items="${employeeRequests.requests}" var="request">
							<div class="card <c:if test='${request.status == 2 }'> border-danger</c:if><c:if test='${request.status == 1 }'> border-success</c:if> <c:if test='${request.status == 0 }'> border-dark</c:if> ">
								<div class="card-header">
									<h5 class="card-title">${employeeRequests.employeeName}</h5>
								</div>
								<div class="card-body">

									<p class="card-text">Employee Id :
										${employeeRequests.employeeId}</p>
									<p class="card-text">Leave Type : ${request.leaveName}</p>

									<p class="card-text">Start Date : ${request.startDate}
										&nbsp; &nbsp; End Date : ${request.endDate}</p>


									<p class="card-text">Number of requested days :
										${request.requestedDays}</p>
									<p class="card-text">Approver Name :
										${request.approverName}</p>


								</div>
								<c:if test="${request.status==1}">
									<div class="card-footer">

										<button class="btn btn-success"
											onclick="location.href='download-leave?employeeId=${employeeRequests.employeeId}&leaveId=${request.id}'"
											data-toggle="modal" data-target="#approveModal">Download</button>

									</div>
								</c:if>
							</div>
						</c:forEach>

					</div>

				</div>
				<div class="row approver-content-main" id="formDiv"
					style="display: none">
					<div class="leave-form"
						style="width: 70%; margin: auto; justify-content: center">
						

						<form:form action="send-leave-request" method="POST"
							modelAttribute="LeaveRequest">

							<div class="form-row">
								<h4>Select Leave Type</h4>
							</div>
							<hr>
							<div class="form-row">
								<c:choose>
									<c:when test="${isLeaveSelected=='True'}">

										<c:forEach items="${leaveTypes}" var="leaveType">
											<c:choose>
												<c:when test="${leaveType.id==selectedLeave}">
													<div class="form-group col-md-2">

														<input type="radio" value="${leaveType.id}"
															onclick="location.href='apply-for-leave?leaveId=${leaveType.id}&leaveName=${leaveType.name}&leaveDays=${leaveType.days}'"
															name="leave" checked="checked" data-toggle="tooltip"
															data-placement="bottom"
															title="${leaveType.leaveDescription}"> <label
															for="leave">${leaveType.name}</label>

													</div>

												</c:when>
												<c:otherwise>
													<div class="form-group col-md-2">

														<input type="radio" value="${leaveType.id}"
															onclick="location.href='apply-for-leave?leaveId=${leaveType.id}&leaveName=${leaveType.name}&leaveDays=${leaveType.days}'"
															name="leave" data-toggle="tooltip"
															data-placement="bottom"
															title="${leaveType.leaveDescription}"> <label
															for="leave">${leaveType.name}</label>

													</div>
												</c:otherwise>
											</c:choose>

										</c:forEach>
									</c:when>
									<c:otherwise>

										<c:forEach items="${leaveTypes}" var="leaveType">
											<div class="form-group col-md-2">

												<input type="radio" value="${leaveType.id}"
													onclick="location.href='apply-for-leave?leaveId=${leaveType.id}&leaveName=${leaveType.name}&leaveDays=${leaveType.days}'"
													name="leave" data-toggle="tooltip" data-placement="bottom"
													title="${leaveType.leaveDescription}"> <label
													for="leave">${leaveType.name}</label>


											</div>

										</c:forEach>
									</c:otherwise>

								</c:choose>

							</div>
							<hr>
							<div class="form-row">
								<h4>Leave Details</h4>
							</div>
							<hr>
							<div class="form-row">

								<table class="table table-borderless">
									<tr>
										<th>Days earned in current leave year:</th>
										<td>${leaveDays}</td>
										<td></td>
										<th>Leave days carried from last year:</th>
										<td></td>
									</tr>
									<tr>
										<th>Leave days taken so far:</th>
										<td>${usedLeaveDays}</td>
										<td></td>
										<th>Leave days remaining:</th>
										<td>${remainingLeaveDays}</td>
									</tr>
								</table>
							</div>
							<hr>
							<div class="form-row">
								<h4>Employee Details</h4>
							</div>
							<div style="display: none">
								<form:input type="number" path="leaveTypeId"
									value='${selectedLeave}' />
							</div>
							<hr>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="name">First Name</label> <input type="text"
										class="form-control" id="name" name="name" placeholder=""
										value='${employee.fname} ${employee.lname}'
										readonly="readonly" />
								</div>
								<div class="form-group col-md-6">
									<form:label path="employeeId">Employee Id</form:label>
									<form:input type="text" class="form-control" path="employeeId"
										name="employeeId" placeholder=""
										value='${employee.employeeId}' readonly="true" />
								</div>

							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" name="address"
										placeholder="" value='${employee.address}' readonly="readonly" />
								</div>
								<div class="form-group col-md-6">
									<label for="telephone">Telephone</label> <input type="text"
										class="form-control" id="telephone" name="telephone"
										placeholder="" value='${employee.telephone}'
										readonly="readonly" />
								</div>

							</div>
							<hr>
							<div class="form-row">
								<h4>Leave Request Details</h4>
							</div>
							<hr>
							<div class="form-row">
								<div class="form-group col-md-6">
									<form:label path="startDate">Start Date</form:label>
									<form:input type="date" class="form-control" path="startDate"
										name="startDate" placeholder="" onfocusout="DateCheck2()" />
								</div>
								<div class="form-group col-md-6">
									<form:label path="endDate">End Date</form:label>
									<form:input type="date" class="form-control" path="endDate"
										name="endDate" placeholder="" onfocusout="DateCheck()" />
								</div>

							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<form:label path="requestedDays">Days requesting</form:label>
									<form:input type="number" class="form-control"
										path="requestedDays" name="requestedDays" id="requestedDays"
										placeholder="" onkeyup="checkValue(${remainingLeaveDays})" />
								</div>
								<div class="form-group col-md-6">
									<form:label path="approverId">Approver Name</form:label>
									<form:select path="approverId" class="form-control">
										<c:forEach items="${approvers}" var="approver">
											<form:option value="${approver.id}">${approver.fname} ${approver.lname}</form:option>
										</c:forEach>

									</form:select>
								</div>


							</div>





							<button type="submit" class="btn btn-primary">Register</button>
						</form:form>
					</div>


				</div>
			</div>
		</div>


	</div>



</body>
</html>