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
<title>episode show</title>
</head>
<body>
	<div
		class="has-bg-image container  text-center  ">

		<h2>Episode ${episode.episode_number}</h2>
		<h3>${episode.title}</h3>
		<p>${episode.description}
	</div>
	<div class="container text-left border border-dark rounded">
		<h5>Episode Forum</h5>

		<ul>
			<c:forEach var="eachcomment" items="${episode.comments}">
				<li><c:if test="${user_id == eachcomment.user.id}"><a href="/comment/edit/${episode.id}">Edit </a></c:if>${eachcomment.user.userName}  Commented:
					${eachcomment.content}</li>
			</c:forEach>
		</ul>
		<a class="btn" href="/comment/new/${episode.id}">Create a Comment</a>
	</div>
	<div class="container text-center mt-5" id='buzzsprout-large-player'>
		<script type='text/javascript' charset='utf-8' src='https://www.buzzsprout.com/147064.js?container_id=buzzsprout-large-player&player=large'></script>
	</div>
	

</body>
</html>

