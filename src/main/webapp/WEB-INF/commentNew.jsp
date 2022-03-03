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
	href="/resources/static/css/commentNewStyle.css">

<meta charset="ISO-8859-1">
<title>comment new</title>
</head>
<body>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<div class="background">
	    <img src = "/resources/static/img/angryLady.jpg" style="width:300px;">
		<div class="form">
			<form:form action="/comment/new/${episode.id}" method="post"
				modelAttribute="newComment" class="form">
				<form:label path="content" class="form-label">Post:</form:label>
				<form:textarea path = "content" class="form-control"  rows="6" cols="50"/>
				<form:errors path="content" class="text-danger" />
				<form:label path = "href">Any links?</form:label>
				<form:input path="href" type="text" class="form-control" />
				<form:label path = "href">Describe the link</form:label>
				<form:input path="label" type="text" class="form-control" />
				<form:input type="hidden" path="user" value="${user_id}" />
				<form:input type="hidden" path="episode" value="${episode.id}" />
				<button class="btn btn-primary">Create</button>
				<a class="btn" href="/episodes/${episode.id}">back</a>
			</form:form>
		</div>
	</div>

<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>