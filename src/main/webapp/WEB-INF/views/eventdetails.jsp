<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<!-- voting home, allows users to vote for places they want to do and don't want to go -->
<html>
<head>
<meta charset="UTF-8">
<title>Events | Group Home</title>
<link rel="stylesheet" href="/css/MainStyles.css">
</head>
<body>
	<img src="/images/logo.png" style="vertical-align:middle; margin:0px 50px;">
	<br /><br /><br />
	<br /><br /><br />	
	<br /><br /><br />
	<a href="/index">
		<button type="submit">Go Home</button>
	</a>
	<a href="/groupdetails/${groupid}">
		<button type="submit">Go to group</button>
	</a>
	<a href="/logout"><button type="submit">Logout</button></a>
	<h2>${fn:toUpperCase(event.getEventname())}</h2>
	<form method="post" action="/savevotes">
	<input type="text" name="groupid" hidden=true value="${groupid}"/>
		<input type="number" name="eventid" value="${event.getEventid()}"
			hidden=true />
		<c:forEach var="activity" items="${event.getActivity()}">
			<c:set var="activityname" value="${activity.activityname}" />
			<table id="businesslist">
				<thead>
					<tr>
					    <th></th>
						<th><c:out value="${fn:toUpperCase(activity.activityname)}"></c:out></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="business" items="${activity.getBusiness()}">
						<tr>
						<td></td>
							<td><label for="${activityname}_favorite">Favorite </label>
								<input type="radio" name="${activityname}_favorite"
								value="${business.name}"><br />Votes
								:${business.favourite}</td>
							<td><img src="${business.image_url}" /><br /> <a
								href="${business.url}"> ${business.name} </a></td>
							<td><label for="${activityname}_notfavorite">Not
									Favorite </label><input type="radio" name="${activityname}_notfavorite"
								value="${business.name}"> <br /> Votes
								:${business.notfavourite}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:forEach> <br />
		<input type="submit" value="Save votes" />
	</form>
</body>
</html>

