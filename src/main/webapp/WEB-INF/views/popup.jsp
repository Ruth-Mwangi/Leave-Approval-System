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
	
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<script src="<c:url value="/resources/js/main.js" />"></script>
</head>
<body>
<div class="loading justify-content-center" style="display: none;">
		<div
			style="margin: auto; text-align: center; display: flex; height: 100%; align-items: center; justify-content: center; width: 50%;">
			<img alt="bzzzzzzzzz"
				src='<c:url value="/resources/images/loading.gif" />'
				style="width: 100px">
		</div>


	</div>

	<div style="width: 50vw;" >
		<form class="text-center" action="get-employee" style="width: 100%" onsubmit="startLoading()">
			<div class="form-group ">
				 <input type="text"
					class="form-control form-rounded" id="employee_id" aria-describedby="empIdHelp"
					name="employee_id" placeholder="Input Employee Id"
					style="text-transform: uppercase;border-radius: 1rem;">
				<c:set var="message" value="${employeeFound}" />
				<c:if test="${message=='Fail'}">
					<small id="empIdHelp" class="form-text" style="color: red">Employee
						not found! Please ensure you are registered. </small>
				</c:if>


			</div>

			<button type="submit"  class="btn btn-primary mb-2">Go</button>
		</form>
	</div>









</body>
</html>