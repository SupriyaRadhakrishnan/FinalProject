<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<!-- group information, including members and group events -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/MainStyles.css">
</head>
<body>
	<img src="http://j.b5z.net/i/u/2017580/i/Events1.png"
		style="width: 200px; height: 75px;">
	<a href="/index">
		<button type="submit">Go Home</button>
	</a>
    <a href="/logout"><button type="submit">Logout</button></a>
	<h2>${groupinfo.getGroupname()}</h2>
	<h3>Group Members</h3>
	<ul>
	<c:forEach var="member" items="${groupinfo.getUser()}"> 
	  <li> ${member.getUsername()}</li>
	</c:forEach>
	</ul>
	<h3>Add Members</h3>
	<form method="post" action="/addmembers">
		<label for="email">Members(Enter group members email)</label>
		<textarea name="email" rows="4" cols="50" required></textarea>
		<input type="text" name="groupid" hidden=true value="${groupinfo.getGroupid()}"/>
		<br /> <input type="submit" value="Add to Group">
	</form>
	<h3>Events</h3>

	<table>
		<thead>
			<tr>
				<th>Event</th>
				<th>Date</th>
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
							href="/delete?eventdetails=${e.getEventid()}&group=${groupinfo.getGroupid()}"><button
									type="submit">Remove</button></a></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form method="post" action="/createevent">
		<input hidden=true name="groupid" value="${groupinfo.getGroupid()}">
		<h2>Create a Event</h2>
		<label for="eventname">Event Name</label> <input type="text"
			name="eventname" required><br /> <label
			for="eventdescription">Event Description</label>
		<textarea name="eventdescription" rows="4" cols="50"></textarea>
		<br /> <label for="eventdate">Event Date</label> <input type="date"
			placeholder="yyyy-mm-dd" name="eventdate" required><br /> <label
			for="pricerange">Price</label> <select id="pricerange"
			name="pricerange" value="1" required>
			<option value="1">$</option>
			<option value="2">$$</option>
			<option value="3">$$$</option>
			<option value="4">$$$$</option>
		</select> <label for="eventcity">Choose a City:</label> <select id="eventcity"
			name="eventcity">
			<option value="Detroit">Detroit</option>
			<option value="Chicago">Chicago</option>
			<option value="New York City">New York City</option>
		</select> <label for="category">Event Category</label>
		<div>
			<input type="checkbox" id="restaurants" value="restaurants"
				name="category"> <label for="restaurants">Restaurants</label>
			<input type="checkbox" id="parks" value="parks" name="category">
			<label for="parks">Parks</label>
		</div>
		<input type="submit" value="Create Event">
	</form>


</body>
</html>
