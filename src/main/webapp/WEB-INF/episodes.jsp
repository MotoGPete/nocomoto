<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/static/css/episodesStyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="<c:url value="/resources/static/css/style.css" />"
	rel="stylesheet">
<meta charset="UTF-8">

</head>
<body>
	<div class="background">
		<div class="container p-5 text-center">
			<h5>${userName}</h5>
			<h5>Is Fighting the Dragon</h5>


			<h4>Episodes</h4>
		</div>
		<div class="text-center">
			<div class="table-wrapper-scroll-y my-custom-scrollbar">

				<table class="table table-bordered table-striped mb-0">
					<tbody>
						<c:forEach var="eachepisode" items="${episodes}">
							<tr>

								<td>Episode ${eachepisode.episode_number}:</td>
								<td><h4>
										<a href="/episodes/${eachepisode.id}">${eachepisode.title}</a>
									</h4></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>

	</div>


    <footer><h4>
                                    				<a class="btn btn-primary" href="/logout">Logout</a>
                                    			</h4>
                  <a href="https://www.etsy.com/shop/TempusDeficit?ref=simple-shop-header-name&listing_id=656222483" target="_blank" rel="noopener noreferrer">Art by TempusDeficit</a>
                </footer>
</body>
</html>

