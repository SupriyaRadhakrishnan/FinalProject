<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Events | Home</title>
<link rel="stylesheet" href="/css/styles.css">
<link href="/css/MainStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<img src="http://j.b5z.net/i/u/2017580/i/Events1.png"
		style="width: 200px; height: 75px;">
	<a href="/logout"><button type="submit">Logout</button></a>

	<h1>Welcome ${username}</h1>
	<br />
	<h2>Your Groups</h2>
	<c:forEach var="group" items="${groups}">
		<a href="/groupdetails/${group.getGroupid()}">${group.getGroupname()}</a>
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