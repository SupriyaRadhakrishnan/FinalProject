<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Register</h1>
<form method="post" action="/register">
<label for="username">Name</label>
<input type="text" name="username" required> <br />
<label for="email">Email</label>
<input type="text" name="email" required><br />
<label for="password">Password</label>
<input type="password" name="password" required><br />
<input type="submit" value="Register">
</form> 
</body>
</html>