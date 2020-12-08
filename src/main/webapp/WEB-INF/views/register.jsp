<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- registration page, asks user for name, email and password -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Events | Register</title>
</head>
<body>
	<img src="http://j.b5z.net/i/u/2017580/i/Events1.png"
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