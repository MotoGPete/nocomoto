<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="/nocomoto/src/main/resources/static/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="<c:url value="/resources/static/css/style.css" />"
	rel="stylesheet">
<meta charset="UTF-8">

</head>
<body>
		<div class="container p-5 text-center mt-5">
		<h5>${userName} Is Fighting the Dragon</h5>
		<h4><a class="btn btn-primary" href="/logout">Logout</a></h4>
			<img class="mt-5"src='images/IMG-0963.jpg' style="width:auto;height:410px;" />
			<h4>Episodes</h4>
		</div>
		<div class="text-center">
		<ul style="list-style: none;">
		
			<c:forEach var="eachepisode" items="${episodes}">
			<li>
					<a href="/episodes/${eachepisode.id}">Episode ${eachepisode.episode_number}: ${eachepisode.title}</a>
				</li>
			</c:forEach>
			
		</ul>
		</div>
	
</body>
</html>

