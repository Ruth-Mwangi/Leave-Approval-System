<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
											
												<input type="radio" value="${leaveType.id}" onclick="location.href='apply-for-leave?leaveId=${leaveType.id}&leaveName=${leaveType.name}&leaveDays=${leaveType.days}'" name="leave"
												checked="checked"> <label for="leave">${leaveType.name}</label>
											
										</div>

									</c:when>
									<c:otherwise>
										<div class="form-group col-md-2">
											
												<input type="radio" value="${leaveType.id}" onclick="location.href='apply-for-leave?leaveId=${leaveType.id}&leaveName=${leaveType.name}&leaveDays=${leaveType.days}'" name="leave">
												<label for="leave">${leaveType.name}</label>
											
										</div>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</c:when>
						<c:otherwise>

							<c:forEach items="${leaveTypes}" var="leaveType">
								<div class="form-group col-md-2">
									
										<input type="radio" value="${leaveType.id}" onclick="location.href='apply-for-leave?leaveId=${leaveType.id}&leaveName=${leaveType.name}&leaveDays=${leaveType.days}'" name="leave">
										<label for="leave">${leaveType.name}</label>
									

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
							value='${employee.fname} ${employee.lname}' readonly="readonly" />
					</div>
					<div class="form-group col-md-6">
						<form:label path="employeeId">Employee Id</form:label>
						<form:input type="text" class="form-control" path="employeeId"
							name="employeeId" placeholder="" value='${employee.employeeId}'
							readonly="true" />
					</div>

				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="address">Address</label> <input type="text"
							class="form-control" id="address" name="address" placeholder=""
							value='${employee.address}' readonly="readonly" />
					</div>
					<div class="form-group col-md-6">
						<label for="telephone">Telephone</label> <input type="text"
							class="form-control" id="telephone" name="telephone"
							placeholder="" value='${employee.telephone}' readonly="readonly" />
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
							name="startDate" placeholder="" />
					</div>
					<div class="form-group col-md-6">
						<form:label path="endDate">End Date</form:label>
						<form:input type="date" class="form-control" path="endDate"
							name="endDate" placeholder="" />
					</div>

				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<form:label path="requestedDays">Days requesting</form:label>
						<form:input type="number" class="form-control" path="requestedDays"
							name="requestedDays" id="requestedDays" placeholder="" onkeyup="checkValue(${remainingLeaveDays})" />
					</div>
					<div class="form-group col-md-6">
						<form:label path="approverId">Days requesting</form:label>
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

</body>
</html>