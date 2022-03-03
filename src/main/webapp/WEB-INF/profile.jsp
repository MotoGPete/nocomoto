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
<div><p>Welcome Back ${userName}</p></div>

<div>
    <ul>
    <li><a href = "/episodes">Episodes</a></li>
    <li><a href = href="https://www.etsy.com/shop/TempusDeficit?ref=simple-shop-header-name&listing_id=682919777">Buy
                  						the Artwork</a></li>
    <li><a href="/logout">Logout</a></li>

    </ul>
</div>
</div>

<div class="body-text">
<div class = "list">
<table class="table table-secondary table-striped">
<tr>
<th>The dumb shit you post: <th></tr>
<tr><td>Omg Pete is so cool, I wish I was a pokemon master too!</td></tr>
<tr><td>Some other content</td></tr>
<tr><td>Three wheeled bikes are tricycles and I will fight anyone on this subject</td></tr>

</table>

</div>
<br>
<div class = "list">
<table class="table table-secondary table-striped">
<tr><th>I should make these accordion menus with episode descriptions</th></tr>

<tr><td>Bikes!</td></tr>
<tr><td>More bikes!</td></tr>
<tr><td>Scooters:  Smaller bikes? </td></tr>




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