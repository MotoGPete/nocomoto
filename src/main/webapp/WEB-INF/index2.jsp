<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="/nocomoto/src/main/resources/static/css/style.css"> 
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>



<script src="/js/index.js"></script>

<meta charset="UTF-8">

</head>
<body>
	
		<div class="container text-center">
			<img class="img-fluid" src='images/nocomotologolg.jpg'
				style="width: 100%; height: auto;" />
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
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
									<form:form id="login-form" action="/login"
										method="post" role="form" style="display: block;" modelAttribute="newLogin">
										<div class="form-group">
											<input type="text" name="username" id="username" tabindex="1"
												class="form-control" placeholder="Username" value="">
										</div>
										<div class="form-group">
											<input type="password" name="password" id="password"
												tabindex="2" class="form-control" placeholder="Password">
										</div>
										<div class="form-group text-center">
											<input type="checkbox" tabindex="3" class="" name="remember"
												id="remember"> <label for="remember">
												Remember Me</label>
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
										<div class="form-group">
											<div class="row">
												<div class="col-lg-12">
													<div class="text-center">
														<a href="https://phpoll.com/recover" tabindex="5"
															class="forgot-password">Forgot Password?</a>
													</div>
												</div>
											</div>
										</div>
									</form:form>
									<form:form id="register-form"
										action="/register" method="post"
										role="form" style="display: none;" modelAttribute="newUser">
										<div class="form-group">
											<label>User Name:</label>
											<form:input path="userName" class="form-control" placeholder="Username"/>
											<form:errors path="userName" class="text-danger" />
											
										</div>
										<div class="form-group">
											<label>Email:</label>
											<form:input path="email" class="form-control" />
											<form:errors path="email" class="text-danger" />
										</div>
										<div class="form-group">
											<label>Password:</label>
											<form:password path="password" class="form-control" />
											<form:errors path="password" class="text-danger" />
										</div>
										<div class="form-group">
											<label>Confirm Password:</label>
											<form:password path="confirm" class="form-control" />
											<form:errors path="confirm" class="text-danger" />
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
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
		</div>
	
</html>

