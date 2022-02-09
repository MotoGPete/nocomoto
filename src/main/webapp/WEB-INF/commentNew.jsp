<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>comment new</title>
</head>
<body>
	<div class="container width-auto">
		<form:form action="/comment/new/${episode.id}" method="post"
			modelAttribute="newComment" class="form">
			
			<form:label path="content" class="form-label">comment here:</form:label>
			<form:input path="content" type="textarea" class="form-control" />
			<form:errors path="content" class="text-danger" />
			<form:input path="href" type="text" class="form-control"/>
			<form:input path="label" type="text" class="form-control"/>

			<form:input type="hidden" path="user" value="${user_id}" />
			<form:input type="hidden" path="episode" value="${episode.id}"/>

			<button class="btn btn-primary">Create</button>
		</form:form>

	</div>

</body>
</html>