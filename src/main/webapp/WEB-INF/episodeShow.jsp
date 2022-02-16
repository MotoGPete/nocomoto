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

<link rel="stylesheet" type="text/css"
	href="/resources/static/css/episodeShowStyle.css">

<script src="http://www.java.com/js/deployJava.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<meta charset="UTF-8">
<title>episode show</title>

</head>
<body class="container">
	<div class="background">
		<div class="container text-center mt-5 font">

			<h2 class="font">Episode ${episode.episode_number}
				${formattedEpisodeDate}</h2>
			<h3>${episode.title}</h3>
			<p>${episode.description}
		</div>
		<div class="container text-center mt-5" id='buzzsprout-large-player'>
			<script type='text/javascript' charset='utf-8'
				src='https://www.buzzsprout.com/147064.js?container_id=buzzsprout-large-player&player=large'></script>
		</div>
		<a class="btn" href="/episodes">back</a>
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="page-header">
						<h1>
							<small class="pull-right">${episode.comments.size()}
								Comments</small>
						</h1>
					</div>
					<div class="comments-list">
						<a class="btn" href="/comment/new/${episode.id}">Create a
							Comment</a>
						<c:forEach var="eachcomment" items="${episode.comments}">
							<div class="media">

								<%-- <c:set var="name" scope="application" value="Chaitanya Pratap Singh"/>
							<c:set var="daysAgo" scope="page" value="<fmt:parseNumber value='${(now.time - eachcomment.createdAt) / (1000*60*60*24*1000)}' integerOnly='true'"/>/>
							--%>


								<p class="pull-right">
									<small>Posted ? days ago</small>
								</p>
								<a class="media-left" href="#"> </a>
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
				</div>
			</div>
		</div>
	</div>
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



</body>
</html>

