<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!-- user home page, includes ability to create a group and and allows users to view groups -->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Meet Me There | Home</title>
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
	<img src="/images/logo.png">
	
	<a href="/logout"><button type="submit">Logout</button></a>

	<h1>Welcome ${username}</h1>
	<br />
	<h2>Your Groups</h2>
	<c:forEach var="group" items="${groups}">
	<div>
		<a href="/groupdetails/${group.getGroupid()}">${group.getGroupname()}</a>
		<a href="/leavegroup/${group.getGroupid()}" onclick="if (!confirm('Are you sure you want to leave the group?')) return false;"><button type="submit">Leave Group</button></a> 
		</div>
		<br />
	</c:forEach>
	<form method="post" action="/creategroup">
		<h2>Create a Group</h2>
		<label for="groupname">Group Name</label> <input type="text"
			name="groupname" required><br /> <label for="email">Members(Enter
			group members email)</label>
		<textarea name="email" rows="4" cols="50" required></textarea>
		<br /> <input type="submit" value="Create group">
	</form>
</body>
</html>