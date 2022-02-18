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
<link rel="stylesheet" type="text/css"
	href="/resources/static/css/indexStyle.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>



<script src="/js/index.js"></script>

<meta charset="UTF-8">

</head>
<body>


	<div class="container" style="height: 20px; width: auto"></div>
	<div class="container text-center" style="width:auto">
		<img class="img-fluid" src='/resources/static/img/noco mot logo lg.jpg'
			style="width: 50%; height: auto; border-radius: 10%" />
	</div>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6 text-right">
								<button class="btn-lg">
									<a href="#" class="active" id="login-form-link">Login Form</a>
								</button>
							</div>
							<div class="col-xs-6 text-left">
								<button class="btn-lg mr-1150">
									<a href="#" id="register-form-link">Register Form</a>
								</button>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body" style="width:=75%">
						<div class="row">
							<div class="col-lg-12">
								<form:form id="login-form" action="/login" method="post"
									role="form" style="display: block;" modelAttribute="newLogin">
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
										<label>User Name:</label>
										<form:input path="userName" class="form-control"
											placeholder="Username" />
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
<footer>
      <a href="https://www.etsy.com/shop/TempusDeficit?ref=simple-shop-header-name&listing_id=656222483" target="_blank" rel="noopener noreferrer">Support the Artist</a></p>
    </footer>
	</body>
</html>

