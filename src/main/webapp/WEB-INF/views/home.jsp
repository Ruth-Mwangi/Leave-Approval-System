<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<html>
<head>
<title>Leave Approval</title>
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
	<div class="loading justify-content-center" style="display: none;">
		<div
			style="margin: auto; text-align: center; display: flex; height: 100%; align-items: center; justify-content: center; width: 50%;">
			<img alt="bzzzzzzzzz"
				src='<c:url value="/resources/images/loading.gif" />'
				style="width: 100px">
		</div>


	</div>

	<c:if test="${loginAttempt == 'Failed'}">
		<script type="text/javascript">
			$(function() {

				document.getElementById('btnLogin').click();

			});
		</script>
	</c:if>
	<c:choose>
		<c:when test="${loggedIn!=null}">

			<div onload="location.href='approve'"></div>
			<c:redirect url="approve"></c:redirect>
		</c:when>
		<c:otherwise>
			<div class="container-fluid">
				<div class="row navigation">
					<jsp:include page="nav.jsp"></jsp:include>

				</div>

				<div class="row introduction justify-content-center">

					<div class="employeeform justify-content-center" onload="">
						<jsp:include page="popup.jsp"></jsp:include>

					</div>

				</div>

			</div>
		</c:otherwise>
	</c:choose>




</body>
</html>
