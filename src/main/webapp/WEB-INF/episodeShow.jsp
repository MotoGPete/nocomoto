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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
$('#submitForm').submit(function(e) {
	   
	var form = this;
	   
	    e.preventDefault();
	    
	    var formData = {}
	
	    $.each(this, function(i, v){
	    var input = $(v);
	  
	    formData[input.attr("name")] = input.val();
	    });
	    $.ajax({
	        type: 'post', 
	        url: '/saveComment', 
	        dataType : 'json',
	        contentType:"application/json; charset=utf-8",

	    // convert form data to json format
	        data : JSON.stringify(formData),
	    });
	});
});
 </script>
<script>

</script>
<link rel="stylesheet" type="text/css"
	href="/resources/static/css/episodeShowStyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>episode show</title>
</head>
<body class="container">
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<div class="background">
	<a class="btn" href="/episodes">back</a>
		<div class="container text-center mt-5 font">

			<h2 class="font">Episode ${episode.episode_number}${episode.id}
				${formattedEpisodeDate}</h2>
			<h3>${episode.title}</h3>
			<p>${episode.description}
		</div>
		<div class="container text-center mt-5" id='buzzsprout-large-player'>
			<script type='text/javascript' charset='utf-8'
				src='https://www.buzzsprout.com/147064.js?container_id=buzzsprout-large-player&player=large'></script>
		</div>

		<div class="container">
			<div class="col-md-8">
				<div class="page-header">
					<form id="submitForm" action="/saveComment" method="post">
						&nbsp; 
						<input type="hidden" name="user_id" value="${user_id}" /> 
						<input type="hidden" name="episode_id" value="${episode.id}" /> 
						<label>Comment</label>
						<input name="content" type="text"> 
						<label>link</label> 
						<input name="href" type="text"> 
						<label>link name</label> 
						<input name="label" type="text">
						<input value="Submit Form" type="submit">
					</form>
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

