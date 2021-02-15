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
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item "><a class="nav-link" href="#">Home </a></li>
					<li class="nav-item"><a class="nav-link" href="popup.jsp">Apply
							for Leave</a></li>

					<li class="nav-item"><a class="nav-link" href="#">View
							Leaves</a></li>
					<li class="nav-item"><a class="nav-link" href="register">Register</a>
					</li>
				</ul>


				<button class="btn btn-success my-2 my-sm-0" type="submit"
					style="margin-left: 10px" data-toggle="modal"
					data-target="#loginModal">Log In</button>

			</div>
		</nav>
		<!-- Modal -->

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="login" method="POST">

					<div class="modal-body">
						<div class="form-group">
							<label for="username">User Name</label> <input
								type="text" class="form-control" id="username" placeholder="Enter username" name="username">
							
						</div>
						<c:if test="${loginSuccess=='False'}">
						<p>Login not successful</p>
						</c:if>
						
						<div class="form-group">
							<label for="pasword">Password</label> <input
								type="password" class="form-control" id="password" name="password"
								placeholder="Password">
						</div>
						
					</div>
					<div class="modal-footer">
						
						<button type="submit" class="btn btn-primary">Login</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
			</div>
			</div>

	
		
	</div>
	




</body>
</html>