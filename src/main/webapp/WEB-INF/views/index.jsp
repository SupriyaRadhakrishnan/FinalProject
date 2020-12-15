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
	<div class="row" align="center">
		<div class="col-lg-12 col-md-12">
			<img src="/images/logo.png">
		</div>
	</div>

	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link" href="/logout"><button
					class="btn btn-danger mb-2" type="submit">Logout</button></a></li>
	</ul>


	<h1 align="center">Welcome ${username}</h1>
	<br />
	<div class="row">
		<div class="col-lg-6 col-md-6">
			<h2 align="center">Your Groups</h2>
			<c:forEach var="group" items="${groups}">
				<div align="center">
					<a href="/groupdetails/${group.getGroupid()}">${group.getGroupname()}</a>
					<a href="/leavegroup/${group.getGroupid()}"
						onclick="if (!confirm('Are you sure you want to leave the group?')) return false;"><button
							class="btn btn-danger mb-2" type="submit">Leave Group</button></a>
				</div>
				<br />
			</c:forEach>
		</div>
		<div class="col-lg-6 col-md-6">
			<h2>Create a Group</h2>
			<form method="post" action="/creategroup">
				<div class="form-group">
					<label for="groupname">Group Name</label> <input
						class="form-control mb-2 mr-sm-2" style="width: 50%" type="text"
						name="groupname" maxlength="100" required> <label
						for="email">Members(Enter group members email)</label>
					<textarea style="width: 50%" class="form-control mb-2 mr-sm-2"
						name="email" rows="2" cols="40" required></textarea>
					<input class="btn btn-danger mb-2" type="submit"
						value="Create group">
				</div>
			</form>
		</div>
	</div>
</body>
</html>