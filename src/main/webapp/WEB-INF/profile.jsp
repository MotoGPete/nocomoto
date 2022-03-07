<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/resources/static/css/profile.css">
<meta charset="UTF-8">
<!DOCTYPE html>
<html>


</head>
<body>

<div class="sidebar">
<div><p class = "pagefont">Welcome Back ${userName}</p></div>

<div class="pagefont">
    <ul>
    <li class = "pagefont"><a href = "/episodes">Episodes</a></li>
    <li class = "pagefont"><a href = href="https://www.etsy.com/shop/TempusDeficit?ref=simple-shop-header-name&listing_id=682919777">Buy
                  						the Artwork</a></li>
    <li class = "pagefont"><a href="/logout">Logout</a></li>

    </ul>
</div>
</div>

<div class="body-text">
<br>
<div id="favorites" class="text-center m-4">
                       		<h4 class = "font">Saved Episodes</h4>
                       			<div class="table-wrapper-scroll-y my-custom-scrollbar">
                       				<table class="table table-info table-striped mb-0">
                       					<tbody>
                       					<tr>
                       					<th class = "font">Episode</th>
                       					<th class = "font">Description</th>
                       					</tr>
                       						<c:forEach var="favorites" items="${favorites}">
                       							<tr>
                                                    <td class = "pagefont">
                       										<a href="/episodes/${favorites.id}">${favorites.title}</a>
                       								</td>
                       										<td>${favorites.description}</td>
                       							</tr>
                       						</c:forEach>
                       					</tbody>
                       				</table>
                       			</div>
<br>

<div id="comments" class="text-center m-4">
		<h4 class = "pagefont">Comments</h4>
			<div class="table-wrapper-scroll-y my-custom-scrollbar">
				<table class="table table-info table-striped mb-0">
					<tbody>
					<tr>
					<th class = "pagefont">What you said</th>
					<th class = "pagefont">Where you said it</th>
					</tr>
						<c:forEach var="comments" items="${comments}">
							<tr>
								<td>${comments.content}:</td>

								<td class = "pagefont">

										<a href="/episodes/${comments.episode.id}">${comments.episode.title}</a>

								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


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
</body>
</html>