<%@page import="com.codingdojo.nocomoto.services.CommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.Period"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/static/js/episodes.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/resources/static/css/episodesStyle.css">
<meta charset="UTF-8">
</head>

<body class=" container background">
	<!-- hamburger -->
	<button class="navbar-toggler " type="button"
		data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<i class="fas fa-bars"></i>
	</button>
	<!-- navbar content -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light rounded"	style="background-color: #C5DBDE">
		<a class="navbar-brand font" href="#"><c:out value="${userName} is Fighting The Dragon"></c:out></a>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse pagefont" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/episodes">Episodes <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
				<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
				<li class="nav-item"><a class="nav-link" target="_blank" href="https://www.etsy.com/shop/TempusDeficit?ref=simple-shop-header-name&listing_id=682919777">Buy The Artwork</a></li>


			</ul>
		</div>
	</nav>
				
		<!-- episodes container -->
		<div id="episodesscroll" class="text-center m-4">
		<h4>Episodes</h4>
			<div class="table-wrapper-scroll-y my-custom-scrollbar">
				<table class="table table-bordered table-striped mb-0">
					<tbody>
						<c:forEach var="eachepisode" items="${episodes}">
							<tr>
								<td>Episode ${eachepisode.episode_number}:</td>
								<td>
									<h4>
										<a href="/episodes/${eachepisode.id}">${eachepisode.title}</a>
									</h4>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	<!-- required scripts, DONT TOUCH! -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
	
	</script>
</body>
</html>

