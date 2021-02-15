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
			modelAttribute="LeaveRequest">


			
				<table >
					<tr>
						<c:forEach items="${leaveTypes}" var="leaveType">
							<td style="padding-right: 20px;padding-left: 20px"><a href="apply-for-leave?
							leaveId=${leaveType.id}&leaveName=${leaveType.name}
							&leaveDays=${leaveType.days}"><form:radiobutton class="form-control"  path="leaveTypeId"
							name="leaveTypeId" value="${leaveType.id}" /></a>  ${leaveType.name} </td>

						</c:forEach>

					</tr>

				</table>

			


			<button type="submit" class="btn btn-primary">Register</button>
		</form:form>
	</div>


</body>
</html>