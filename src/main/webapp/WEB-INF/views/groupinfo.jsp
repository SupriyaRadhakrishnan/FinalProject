<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/MainStyles.css">
</head>
<body>
<h2>${groupinfo.getGroupname()}</h2>
<h3>Events</h3>
<c:forEach var="e" items="${event}">
<a href="/eventdetails?event=${e.getEventid()}">${e.getEventname()}</a>
</c:forEach>
<form method="post" action="/createevent">
<input type="number" hidden=true name ="groupid" value="${groupinfo.getGroupid()}">
<h2>Create a Event</h2>
<label for="eventname">Event Name</label> <input type="text" name ="eventname" required><br />
<label for="eventdescription">Event Description</label><textarea name ="eventdescription" rows="4" cols="50"></textarea><br />
<label for="eventdate">Event Date</label> <input type="date" name ="eventdate" required><br />
  <label for="eventcity">Choose a City:</label>
  <select id="eventcity" name="eventcity">
    <option value="Detroit">Detroit</option>
    <option value="Chicago">Chicago</option>
    <option value="New York City">New York City</option>
  </select>
<label for="category">Event Category</label> 
<div>
  <input type="checkbox" id="restaurants" value ="restaurants" name="category">
  <label for="restaurants">Restaurants</label>
    <input type="checkbox" id="parks" value ="parks" name="category">
  <label for="parks">Parks</label>
</div>
<input type="submit" value="Create Event">
</form>
</body>
</html>
