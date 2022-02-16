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
	href="/resources/static/css/commentsEditStyle.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<title>comment edit</title>
</head>
<body>
	<div class="container">
		<form:form action="/comment/edit/${episode.id}" method="post"
			modelAttribute="newComment" class="form">
			<input type="hidden" name="_method" value="put" />
			<form:label path="content" class="form-label">comment here:</form:label>
			<form:input path="content" type="textarea" class="form-control" />
			<form:errors path="content" class="text-danger" />



			<form:input type="hidden" path="user" value="${user_id}" />
			<form:input type="hidden" path="episode" value="${episode.id}" />

			<button class="btn btn-primary">Create</button>
			<a class="btn" href="/episodes/${episode.id}">back</a>
		</form:form>
			
	</div>

</body>
</html>