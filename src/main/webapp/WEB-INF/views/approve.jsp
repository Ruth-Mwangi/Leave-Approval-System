<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<script src="<c:url value="/resources/js/main.js" />"></script>

</head>
<body>

	<div class="container-fluid">
		<div class="row navigation">
			<jsp:include page="nav.jsp"></jsp:include>

		</div>
		<div class="row approver ">

			<div class="col-md-2  approver-menu">
				<div class="row justify-content-start">
					<h5>Filter By</h5>
				</div>
				<hr>
				<div class="row justify-content-start">
					<button type="button" onclick="location.href='approver-requests'"
						class="btn btn-primary">All</button>
				</div>
				<div class="row justify-content-start">
					<button type="button"
						onclick="location.href='approver-requests?status=0'"
						class="btn btn-primary">Pending</button>
				</div>
				<div class="row justify-content-start">
					<button type="button"
						onclick="location.href='approver-requests?status=1'"
						class="btn btn-primary">Approved</button>
				</div>
				<div class="row justify-content-start">
					<button type="button"
						onclick="location.href='approver-requests?status=2'"
						class="btn btn-primary">Rejected</button>
				</div>


			</div>
			<div class="col-md-10 approver-content">
				<div class="row justify-content-end ">
					Sort By: &nbsp; &nbsp; <select class="form-select"
						aria-label="Default select example">
						<option selected>Open this select menu</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>

				</div>
				<div class="row approver-content-main">
					<div class="card-columns" style="margin-top: 15px">
						<c:forEach items="${requests}" var="request">
							<div class="card <c:if test='${request.status == 2 }'> border-danger</c:if><c:if test='${request.status == 1 }'> border-success</c:if> <c:if test='${request.status == 0 }'> border-dark</c:if>  ">
								<div class="card-header">
									<h5 class="card-title">${request.employee.fname}
										${request.employee.lname}</h5>
								</div>
								<div class="card-body">

									<p class="card-text">Employee Id : ${request.employeeId}</p>
									<p class="card-text">Leave Type : ${request.leaveType.name}</p>

									<p class="card-text">Start Date : ${request.startDate}
										&nbsp; &nbsp; End Date : ${request.endDate}</p>


									<p class="card-text">Number of requested days :
										${request.requestedDays}</p>
									<p class="card-text">
										<small class="text-muted">Requested on
											${request.dateCreated}</small>
									</p>

								</div>
								<c:if test="${request.status==0}">
									<div class="card-footer">

										<button class="btn btn-success"
											onclick="reviewLeave(${request.id},'approve')"
											data-toggle="modal" data-target="#approveModal">Approve</button>
										<button class="btn btn-danger"
											onclick="reviewLeave(${request.id},'reject')"
											data-toggle="modal" data-target="#rejectModal">Reject</button>

									</div>
								</c:if>

							</div>
						</c:forEach>

					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- Modal -->

	<div class="modal fade" id="approveModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Approve Request</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form action="approved" method="POST"
					modelAttribute="LeaveRequest">

					<div class="modal-body">
						<div class="form-group">
							<label for="remarks">Recommend Mr/Mrs/Miss/Ms</label> <input
								type="text" class="form-control" id="remarks"
								placeholder="Enter remarks" name="remarks" />

						</div>

						<div class="form-group">

							<input type="number" class="form-control" id="approveId"
								name="id" />
						</div>

					</div>
					<div class="modal-footer">

						<button type="submit" class="btn btn-primary">Approve</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- Modal -->

	<div class="modal fade" id="rejectModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Reject Request</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="rejected" method="POST">

					<div class="modal-body">
						<div class="form-group">
							<label for="remarks">Not recommended because</label> <input
								type="text" class="form-control" id="remarks"
								placeholder="Enter remarks" name="remarks" />

						</div>

						<div class="form-group">

							<input type="number" class="form-control" id="rejectId" name="id" />
						</div>

					</div>
					<div class="modal-footer">

						<button type="submit" class="btn btn-danger">Reject</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>