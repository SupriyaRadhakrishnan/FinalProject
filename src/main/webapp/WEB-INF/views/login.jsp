<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- user log in page. asks user for email and password -->

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/MainStyles.css">
<title>Events | Login</title>
</head>
<body>
	<img src="/images/logo.png" style="vertical-align:middle; margin:0px 50px;">
	<br /><br /><br />
	<br /><br /><br />	
	<br /><br /><br />
	<p>${message}</p>
	<form method="post" action="/login">
		<label for="email">Email</label> <input type="email" name="email" required><br />
		<label for="password">Password</label> <input type="password" 
			name="password" required><br /> <input type="submit" value="Log In"><br />
	</form>
	<a href="/register"><button>Register</button></a>
</body>
</html>