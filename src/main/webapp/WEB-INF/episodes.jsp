<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="<c:url value="/resources/static/css/style.css" />"
	rel="stylesheet">
<meta charset="UTF-8">

</head>
<body>
	<div class="container w-25">
		<div class="container text-center">
		<h5>${userName} Is Fighting the Dragon</h5>
			<img src='images/IMG-0963.jpg' style="width:auto;height:410px;" />
			<h4>Episodes</h4>
		</div>
		<div class="container mt-3 text-center">
		<ul>
		<c:forEach var="eachepisode" items="${episodes}">
							<li>
								<a href="/episodes/${eachepisode.id}">${eachepisode.title}</a>
								
							
								
								 
						
							</li>
						</c:forEach>
		
		</ul>
			
			
		
		</div>
	</div>
</body>
</html>

