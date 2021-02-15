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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<script>
	
	function checkValue(remainingDays){
		
		var requestedDays=document.getElementById("requestedDays").value;
		if(requestedDays>remainingDays){
			alert("Requested days must be less than "+remainingDays+" !")
			document.getElementById("requestedDays").value=''
			
		}
		
	}
	
</script>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="nav.jsp"></jsp:include>

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



	</div>



</body>
</html>