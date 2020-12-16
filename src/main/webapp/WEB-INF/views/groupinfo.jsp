<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<!-- group information, including members and group events -->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Meet Me There | Group Details</title>
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
<script>
	function validate() {
		let boxes = document
				.querySelectorAll("#category_checkbox input[type=checkbox]");
		for (let i = 0; i < boxes.length; i++) {
			console.log(boxes[i].checked);
			if (boxes[i].checked) {
				return true;
			}
		}
		alert("You didn't check a category");
		return false;

	}
</script>
</head>
<body>
	<div class="container">
		<div class="row" align="center">
			<div class="col-lg-12">
				<img alt="logo" src="/images/logo.png">
			</div>
		</div>
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link" href="/index"><button
						class="btn btn-danger mb-2" type="submit">Go Home</button></a></li>
			<li class="nav-item"><a class="nav-link" href="/logout"><button
						class="btn btn-danger mb-2" type="submit">Logout</button></a></li>
		</ul>

		<h1 align="center">Welcome ${username}</h1>
		<div class="row">
			<div class="col-lg-4 col-md-4">
				<h2>Group: ${groupinfo.getGroupname()}</h2>
				<h4>Group Members</h4>
				<ul>
					<c:forEach var="member" items="${groupinfo.getUser()}">
						<li>${member.getUsername()}</li>
					</c:forEach>
				</ul>
				<h4>Add Members</h4>
				<form method="post" action="/addmembers">
					<div class="form-group">
						<label for="email">Group Members</label>
						<textarea class="form-control mb-2 mr-sm-2" placeholder="someone@example.com;something@example.com" name="email" rows="2"
							cols="40" required></textarea>
						<input type="text" name="groupid" hidden=true 
							value="${groupinfo.getGroupid()}" /> <input
							class="btn btn-danger mb-2" type="submit" value="Add to Group">
					</div>
				</form>
			</div>
			<div class="col-lg-4 col-md-4">
				<h2>Your Events</h2>
				<c:choose>
<c:when test="${fn:length(event) gt 0}">
				<table>
					<thead>
						<tr>
							<th>Event</th>
							<th>Date</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="e" items="${event}">
							<tr>
								<td><a
									href="/eventdetails?event=${e.getEventid()}&group=${groupinfo.getGroupid()}">${e.getEventname()}</a></td>
								<td>${e.getEventdate()}</td>
								<c:if test="${e.getEventadmin() eq  userid}">
									<td><a
										href="/delete?eventdetails=${e.getEventid()}&group=${groupinfo.getGroupid()}"
										onclick="if (!confirm('Are you sure you want to remove the event?')) return false;"><button
												class="btn btn-danger mb-2" type="submit">Remove</button></a></td>
									<td><a
										href="/editevent?eventdetails=${e.getEventid()}&group=${groupinfo.getGroupid()}"><button
												class="btn btn-danger mb-2" type="submit">Edit</button></a></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:when>
				<c:otherwise>
				<p>No Events</p>
				</c:otherwise>
				</c:choose>
			</div>

			<div class="col-lg-4 col-md-4">
				<h2>Create an Event</h2>
				<form method="post" action="/createevent"
					onsubmit="return validate()">
					<input hidden=true name="groupid" value="${groupinfo.getGroupid()}">

					<div class="form-group">

						<label for="eventname">Event Name</label> <input
							class="form-control mb-2 mr-sm-2" type="text" name="eventname"
							maxlength="100" required> <label for="eventdescription">Event
							Description</label>
						<textarea class="form-control mb-2 mr-sm-2"
							name="eventdescription" maxlength="100" rows="2" cols="40"></textarea>
						<label for="eventdate">Event Date</label> <input
							class="form-control mb-2 mr-sm-2" type="date"
							placeholder="yyyy-mm-dd" min="${todayString}" name="eventdate"
							required> <label for="pricerange">Price</label> <select
							class="form-control mb-2 mr-sm-2" id="pricerange"
							name="pricerange" value="1" required>
							<option value="1">$ - Inexpensive</option>
							<option value="2">$$ - Moderate</option>
							<option value="3">$$$ - Pricey</option>
							<option value="4">$$$$ - Ultra High End</option>
						</select> <label for="eventcity">Choose a City:</label> <select
							class="form-control mb-2 mr-sm-2" id="eventcity" name="eventcity">
							<option value="Chicago">Chicago</option>
							<option value="Detroit">Detroit</option>
							<option value="Los Angeles">Los Angeles</option>
							<option value="Miami">Miami</option>
							<option value="New York City">New York City</option>
							<option value="Seattle">Seattle</option>
							<option value="Toronto">Toronto</option>
							<option value="Washington DC">Washington DC</option>
						</select>
						<div id="category_checkbox">
							<p>Event Category</p>
							<label for="restaurants">Restaurants</label> <input
								type="checkbox" id="restaurants" value="restaurants"
								name="category"> <label for="parks">Parks</label> <input
								type="checkbox" id="parks" value="parks" name="category">

							<label for="tours">Tours</label> <input type="checkbox"
								id="tours" value="tours" name="category"> <label
								for="hotels">Hotels</label> <input type="checkbox" id="hotels"
								value="hotels" name="category">

						</div>
						<input type="submit" class="btn btn-danger mb-2"
							value="Create Event">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
