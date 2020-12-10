<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- registration page, asks user for name, email and password -->
<html>
<head>
<meta charset="UTF-8">
<title>Meet Me There | Register</title>
<link rel="stylesheet" href="/css/MainStyles.css">
</head>
<body>
	<img src="/images/logo.png" style="vertical-align:middle; margin:0px 50px;">
	<br /><br /><br />
	<br /><br /><br />	
	<br /><br /><br />
	<h1>Register</h1>
	<p>${message}</p>
	<form method="post" action="/register">
		<label for="username">Name</label> <input type="text" name="username"
			required> <br /> <label for="email">Email</label> <input
			type="email" name="email" required><br /> <label
			for="password">Password</label> <input type="password"
			name="password" required><br /> <input type="submit"
			value="Register">
	</form>
</body>
</html>