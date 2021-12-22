<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://www.java.com/js/deployJava.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>idea show</title>
</head>
<body>
	${episode.comments}
	
	
			<div class="has-bg-image container-sm w-35 text-center ">
			<img class="bg-img" src="/images/full throttle 1.jpg"/>
			<h2>Episode ${episode.episode_number}</h2>
				<h3>${episode.title}</h3>
				<p>${episode.description}
				<h5>Comments</h5>
				<c:forEach var="eachcomment" items="${episode.comments}">
			${eachcomment.content}
				</c:forEach>
				<a class="btn" href="/comment/new/${episode.id}">Create a Comment</a>
		   </div>
</body>
</html>

