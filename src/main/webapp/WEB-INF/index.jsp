<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="/resources/static/css/indexStyle.css">
<meta charset="UTF-8">

</head>
<body class="container">
<div class="padding"></div>
 <div class="logo">
 <img src="static/img/noco mot logo lg.jpg" alt="Logo" class="logo">
 </div>
 <hr>
 <div class="logincontainer">
    	<div class="loginrow">

				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form:form id="login-form" action="/login" method="post"
							role="form" style="display: block;" modelAttribute="newLogin">
							<div class="form-group">
								<h1><label>Email:</label></h1>
								<form:input path="email" class="form-control" />
								<form:errors path="email" class="text-danger" />
							</div>
							<div class="form-group">
								<h1><label>Password:</label></h1>
								<form:password path="password" class="form-control" />
								<form:errors path="password" class="text-danger" />
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3">
										<input type="submit" name="login-submit" id="login-submit"
											tabindex="4" class="form-control btn btn-login"
											value="Log In">
									</div>
								</div>
							</div>

						</form:form>
								<form:form id="register-form" action="/register" method="post"
							role="form" style="display: none;" modelAttribute="newUser">
							<div class="form-group">
								<h1><label>User Name:</label></h1>
								<form:input path="userName" class="form-control"
									placeholder="Username" />
								<form:errors path="userName" class="text-danger" />

							</div>
							<div class="form-group">
								<h1><label>Email:</label></h1>
								<form:input path="email" class="form-control" />
								<form:errors path="email" class="text-danger" />
							</div>
							<div class="form-group">
								<h1><label>Password:</label></h1>
								<form:password path="password" class="form-control" />
								<form:errors path="password" class="text-danger" />
							</div>
							<div class="form-group">
								<h1><label>Confirm Password:</label></h1>
								<form:password path="confirm" class="form-control" />
								<form:errors path="confirm" class="text-danger" />
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 col-sm-offset-3 d-flex justify-content-center">
										<input type="submit" name="register-submit"
											id="register-submit" tabindex="4"
											class="form-control btn btn-register" value="Register Now">
									</div>
								</div>
							</div>
						</form:form>
							</div>
						</div>
					</div>
				</div>

		</div>
	</div>


	



    <script type="text/javascript" src="/resources/static/js/index.js"></script>


	</body>

</html>
