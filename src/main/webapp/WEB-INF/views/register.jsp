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
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="nav.jsp"></jsp:include>

		<form:form action="save-employee" method="POST"
			modelAttribute="Employee">
			<div class="form-row" style="margin-top: 10px">

				<c:if test="${registrationStatus == 'Failed' }">
					<div class="form-group col-md-6">
						<div class="alert alert-danger" role="alert">Registration
							failed employee with that id exists!</div>
					</div>

				</c:if>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<form:label path="fname">First Name</form:label>
					<form:input type="text" class="form-control" path="fname"
						name="fname" placeholder="" />
				</div>
				<div class="form-group col-md-6">
					<form:label path="lname">Last Name</form:label>
					<form:input type="text" class="form-control" path="lname"
						name="lname" placeholder="" />
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<form:label path="employeeId">Employee Id</form:label>
					<form:input type="text" class="form-control" path="employeeId"
						name="employeeId" style="text-transform: uppercase" placeholder="" />
				</div>
				<div class="form-group col-md-6">
					<form:label path="station">Station</form:label>
					<form:input type="text" class="form-control" path="station"
						name="station" placeholder="" />
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<form:label path="title">Title</form:label>
					<form:input type="text" class="form-control" path="title"
						name="title" />
				</div>
				<div class="form-group col-md-6">
					<form:label path="department">Department</form:label>
					<form:input type="text" class="form-control" path="department"
						name="department" placeholder="" />
				</div>


			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<form:label path="gender">Gender</form:label>
					<form:select path="gender" name="gender" class="form-control">
						<form:option value="Female">Female</form:option>
						<form:option value="Male">Male</form:option>

					</form:select>
				</div>
				<div class="form-group col-md-4">
					<form:label path="telephone">Telephone</form:label>
					<form:input type="text" class="form-control" path="telephone"
						name="telephone" placeholder="" />
				</div>
				<div class="form-group col-md-4">
					<form:label path="address">Address</form:label>
					<form:input type="text" class="form-control" path="address"
						name="address" placeholder="" />
				</div>


			</div>


			<button type="submit" class="btn btn-primary">Register</button>
		</form:form>
	</div>


</body>
</html>