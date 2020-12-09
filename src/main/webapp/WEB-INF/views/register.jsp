<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- registration page, asks user for name, email and password -->
<html>
<head>
<meta charset="UTF-8">
<title>Events | Register</title>
</head>
<body>
	<img src="/images/events.png"
		style="width: 200px; height: 75px;">
	<h1>Register</h1>
	<p>${message}</p>
	<form method="post" action="/register">
		<label for="username">Name</label> <input type="text" name="username"
			required> <br /> <label for="email">Email</label> <input
			type="text" name="email" required><br /> <label
			for="password">Password</label> <input type="password"
			name="password" required><br /> <input type="submit"
			value="Register">
	</form>
</body>
</html>