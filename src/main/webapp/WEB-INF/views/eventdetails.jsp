<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<!-- voting home, allows users to vote for places they want to do and don't want to go -->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Meet Me There | Group Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.3/slate/bootstrap.min.css"
	integrity="sha512-Dfbzfu79H8lYHUElioPvezFPJI+wFlG4uP4tbHlRkrIhlyVzp/8sh2LQ7GmQz1+vIO9J6c/HUK5VfsMFM19piA=="
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="row" align="center">
		<div class="col-lg-12">
			<img src="/images/logo.png">
		</div>
	</div>
<ul class="nav justify-content-center">  
  <li class="nav-item">
    <a class="nav-link" href="/index"><button class="btn btn-primary mb-2" type="submit">Go Home</button></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/groupdetails/${groupid}"><button class="btn btn-primary mb-2" type="submit">Go to group</button></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/logout"><button class="btn btn-primary mb-2" type="submit">Logout</button></a>
  </li>   
</ul>



	
	
	
	<h1 align="center">Welcome ${username}</h1>
	<h2 align="center">Event: ${fn:toUpperCase(event.getEventname())}</h2>
	<h3 align="center">${message}</h3>
	<input type="text" name="groupid" hidden=true value="${groupid}" />
	<input type="number" name="eventid" value="${event.getEventid()}"
		hidden=true />
		<div class="col-lg-12 col-md-12" align="center">
	<form method="post" action="/selectedactivity">
		<label for="activity">Category Selection</label> <select id="activity"
			name="activity" required>
			<c:forEach var="activity" items="${event.getActivity()}">
				<option value="${activity.activityid}">${fn:toUpperCase(fn:substring(activity.activityname, 0, 1))}${fn:toLowerCase(fn:substring(activity.activityname, 1, -1))}</option>
			</c:forEach>
		</select> <input type="text" name="groupid" hidden=true value="${groupid}" />
		<input type="number" name="eventid" value="${event.getEventid()}"
			hidden=true /> <input type="submit" class="btn btn-primary mb-2" value="List choice">
	</form>
	</div>
	<form method="post" action="/savevotes">
		<input type="text" name="groupid" hidden=true value="${groupid}" /> <input
			type="number" name="eventid" value="${event.getEventid()}"
			hidden=true /> <input type="number" name="activityid"
			value="${selectedactivity.getActivityid()}" hidden=true />
		<c:if test="${not empty businesses}">
			<div class="businesslist">
				<table id="businesslist">
					<thead>
						<tr>
							<th></th>
							<th><c:out
									value="${fn:toUpperCase(selectedactivity.activityname)}"></c:out></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="business" items="${businesses}">
							<tr>
								<td></td>
								<td><label for="${selectedactivity.activityname}_favorite">Most
										Favorite </label> <c:if test="${empty message}">
										<input type="radio"
											name="${selectedactivity.activityname}_favorite"
											value="${business.name}">
									</c:if><br />Votes :${business.favourite}</td>
								<td><img src="${business.image_url}" alt="Business Picture"
									width="200" height="200" /><br /><a href="${business.url}">${business.name}</a></td>
								<td><label
									for="${selectedactivity.activityname}_notfavorite">Least
										Favorite </label> <c:if test="${empty message}">
										<input type="radio"
											name="${selectedactivity.activityname}_notfavorite"
											value="${business.name}">
									</c:if> <br /> Votes :${business.notfavourite}</td>									
							</tr>							
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:if test="${empty message}">
				<input class="btn btn-primary mb-2" type="submit" value="Save votes" />
			</c:if>
		</c:if>
	</form>
</body>
</html>

