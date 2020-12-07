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
<link rel="stylesheet" href="/css/MainStyles.css">
</head>
<body>
<img src="http://j.b5z.net/i/u/2017580/i/Events1.png" style="width:200px;height:75px;">
<a href="/index"> <button type="submit">Go Home</button> </a> 
<h2>${fn:toUpperCase(event.getEventname())}</h2>
	<form method ="post" action ="/savevotes">
	<input type="number" name ="eventid" value="${event.getEventid()}" hidden=true/>
	<c:forEach var="activity" items="${event.getActivity()}">
		<c:out value="${fn:toUpperCase(activity.activityname)}"></c:out>
		<c:set var="activityname" value="${activity.activityname}"/>
<table>
<thead>
<tr>
<th></th>
<th></th>
<th></th>
</tr>
</thead>
<tbody>
<c:forEach var="business" items="${activity.getBusiness()}">
<tr>
<td><label for="${activityname}_favorite">Favorite </label>	<input type="radio" name="${activityname}_favorite" value="${business.name}"><br />Votes :${business.favourite} </td>
<td><img src="${business.image_url}"/><br />
<a href="${business.url}"> ${business.name} </a></td>
<td><label for="${activityname}_notfavorite">Not Favorite </label><input type="radio" name="${activityname}_notfavorite" value="${business.name}"> <br /> Votes :${business.notfavourite} </td>
</tr>
</c:forEach>
</tbody>
</table>
	</c:forEach>
	<input type="submit" value="Save votes"/>
	</form>	
</body>
</html>

