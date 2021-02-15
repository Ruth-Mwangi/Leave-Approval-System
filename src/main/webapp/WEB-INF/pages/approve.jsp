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

</head>
<body>

	<div class="container-fluid">
		<jsp:include page="nav.jsp"></jsp:include>
		<div class="card-columns" style="margin-top: 15px">
			<c:forEach items="${requests}" var="request">
				<div class="card border-dark mb-3" >
					<div class="card-header"><h5 class="card-title">${request.employee.fname}
							${request.employee.lname}</h5></div>
					<div class="card-body">
						
						<p class="card-text">Employee Id : ${request.employeeId}</p>
						<p class="card-text">Leave Type : ${request.leaveName.name}</p>

						<p class="card-text">Start Date : ${request.startDate} &nbsp; &nbsp; End Date : ${request.endDate}</p>


						<p class="card-text">Number of requested days :
							${request.requestedDays}</p>
						<p class="card-text">
							<small class="text-muted">Requested on
								${request.dateCreated}</small>
						</p>

					</div>
					<div class="card-footer">
						<button class="btn btn-success">Approve</button>
						<button class="btn btn-danger">Reject</button>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>


</body>
</html>