<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/styles.css">
<link href="/css/MainStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1><i>LIVE EAT LOVE</i></h1>
	<form action="/Search" method="post">
		<p><label for="categories">Choose a cuisine:</label>
		 <select id="categories" name="categories">
		    <option value=""></option>
			<option value="American">American</option>
			<option value="Asian Fusion">Asian Fusion</option>
			<option value="Barbeque">Barbeque</option>
			<option value="Canadian ">Canadian</option>
		</select> </p>
			<p>	<label for="location">Choose a City:</label> 
				<select id="location" name="location" required>
				 <option value=""></option>
			<option value="Detroit">Detroit</option>
			<option value="New York City">New York City</option>
			<option value="Chicago">Chicago</option>
			<option value="Seattle ">Seattle</option>
		</select> </p>
	<p>	<input type="submit" value="Search"> </p>
	</form>
</body>
</html>