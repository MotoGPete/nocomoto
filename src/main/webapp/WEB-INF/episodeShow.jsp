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

<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/static/js/episodeShow.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/resources/static/css/episodeShowStyle.css">
<!-- async for on page comment form -->
<%--<script type="text/javascript">
	$(document).ready(function() {
		$('#submitForm').submit(function(e) {

			var form = this;

			e.preventDefault();

			var formData = {}

			$.each(this, function(i, v) {
				var input = $(v);

				formData[input.attr("name")] = input.val();
			});
			$.ajax({
				type : 'post',
				url : '/saveComment',
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(formData),
			});
		});
	});
</script>--%>


<title>Episode ${episode.episode_number}</title>
</head>

<meta charset="UTF-8">

<body class="container background">
	<!-- Toggle button -->
	<button class="navbar-toggler " type="button"
		data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<i class="fas fa-bars"></i>
	</button>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="background-color: #C5DBDE">
		<a class="navbar-brand font" href="#">Episode
			${episode.episode_number}</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse pagefont" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/episodes">Episodes <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/profile">Profile</a>
                				</li>
				<li class="nav-item"><a class="nav-link" href="/logout">Logout</a>
				</li>
				<li class="nav-item"><a class="nav-link" target="_blank"
					href="https://www.etsy.com/shop/TempusDeficit?ref=simple-shop-header-name&listing_id=682919777">Buy
						the Artwork</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Play Episode</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="${episode.audio_url}"
							target="_blank">Play This episode in another window
							*recommended </a>
						<button id="playerOn" class="dropdown-item"
							onclick="togglePlayer()">Load/Hide all episodes player</button>

					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Comments</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item"  onclick="toggleCommentBox()">View/Hide
							Comments </a> <a class="dropdown-item"
							href="/comment/new/${episode.id}">Create Comment</a>

					</div></li>
			</ul>
		</div>
	</nav>

	<div>
		<!-- episode info -->
		<div class="container text-center mt-5 font">
			${formattedEpisodeDate}
			<h2>${episode.title}</h2>

			<div class="epdescription d-flex justify-content-center pagefont">
				<p>${episode.description}</p>
			</div>
		</div>

		<!-- all episodes player -->
		
		<div id='buzzsprout-large-player'></div>
		<script type='text/javascript' charset='utf-8'
			src='https://www.buzzsprout.com/147064.js?container_id=buzzsprout-large-player&player=large'></script>
	</div>

	<div id="commentBox">
		<div class="text-center">
			<div class="table-wrapper-scroll-y my-custom-scrollbar pagefont">

				<table class="table table-striped mb-0">
				
					<thead>
						<tr>
							<th scope="col">${episode.comments.size()} Comments</th>
							<th scope="col">Comments</th>
							<th scope="col">links</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="eachcomment" items="${episode.comments}">
							<tr>

								<td>User: ${eachcomment.user.userName}</td>
								<td><p>${eachcomment.content}</p></td>
								<td><a href="${eachcomment.href}"
										target="_blank"> ${eachcomment.label}</a></td>
								<td><c:if test="${user_id == eachcomment.user.id}">
											<div class="col">
												<form action="/comment/edit/${eachcomment.id}" method="get">
													<input type="hidden"> <input type="submit"
														value="edit">
												</form>

											</div>
											<div class="col">
												<form
													action="/comment/delete/${eachcomment.id}/${episode.id}"
													method="post">
													<input type="hidden" name="_method" value="delete">
													<input class="none" type="submit" value="Delete">
												</form>
											</div>
										</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>
	</div>

	<!-- old on page comment form -->
	<%-- <form id="submitForm" action="/saveComment" method="post">
		&nbsp; <input type="hidden" name="user_id" value="${user_id}" /> <input
			type="hidden" name="episode_id" value="${episode.id}" /> <label>Comment</label>
		<input name="content" type="text"> <label>link</label> <input
			name="href" type="text"> <label>link name</label> <input
			name="label" type="text"> <input value="Submit Form"
			type="submit">
	</form>--%>
	

	<!-- old comments box(not good) -->
	<%-- <div id=commentdiv>
					<div class="comments-list">
						<c:forEach var="eachcomment" items="${episode.comments}">
							<div class="media">
								<!-- code for episode dates -->
								<%-- <c:set var="name" scope="application" value="Chaitanya Pratap Singh"/>
							<c:set var="daysAgo" scope="page" value="<fmt:parseNumber value='${(now.time - eachcomment.createdAt) / (1000*60*60*24*1000)}' integerOnly='true'"/>/>
									

								
								<p class="pull-right">
									<small>Posted ? days ago</small>
								</p>
								
								<div class="media-body">

									<h4 class="media-heading user_name">${eachcomment.user.userName}</h4>
									${eachcomment.content}<a href="${eachcomment.href}"
										target="_blank"> ${eachcomment.label}</a>

									<div class="row">
										<c:if test="${user_id == eachcomment.user.id}">
											<div class="col">
												<form action="/comment/edit/${eachcomment.id}" method="get">
													<input type="hidden"> <input type="submit"
														value="edit">
												</form>

											</div>
											<div class="col">
												<form
													action="/comment/delete/${eachcomment.id}/${episode.id}"
													method="post">
													<input type="hidden" name="_method" value="delete">
													<input class="none" type="submit" value="Delete">
												</form>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>--%>



	<%--<div class="container text-left border border-dark rounded">
		<h5>Episode Forum</h5>

		<ul>
			<c:forEach var="eachcomment" items="${episode.comments}">
				<c:if test="${user_id == eachcomment.user.id}">
					<div class="container">
						<a class="btn btn-secondary"
							href="/comment/edit/${eachcomment.id}">Edit </a>
						<form action="/comment/delete/${eachcomment.id}/${episode.id}"
							method="post">
							<input type="hidden" name="_method" value="delete"> <input
								 type="submit" value="Delete">
						</form>
					</div>
				</c:if>
				<li>${eachcomment.user.userName}Commented:
					${eachcomment.content}<a href="${eachcomment.href}" target="_blank">
						${eachcomment.label}</a>
				</li>
			</c:forEach>
		</ul>
		<a class="btn" href="/comment/new/${episode.id}">Create a Comment</a>
	</div>--%>
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

