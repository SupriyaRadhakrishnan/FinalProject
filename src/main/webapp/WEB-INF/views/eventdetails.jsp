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
<title>Meet Me There | Group Home</title>
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
	<h1>Welcome ${username}</h1>
	<h2>${fn:toUpperCase(event.getEventname())}</h2>
	<h3>${message}</h3>
	
	
	<input type="text" name="groupid" hidden=true value="${groupid}"/>
		<input type="number" name="eventid" value="${event.getEventid()}"
			hidden=true />
			<form method="post" action="/selectedactivity">
		<label for="activity">Activity</label> <select id="activity" name="activity" required>
		<c:forEach var="activity" items="${event.getActivity()}">
			<option value="${activity.activityid}">${fn:toUpperCase(fn:substring(activity.activityname, 0, 1))}${fn:toLowerCase(fn:substring(activity.activityname, 1, -1))}</option>
			</c:forEach>
			</select>
		<input type="text" name="groupid" hidden=true value="${groupid}"/>	
		<input type="number" name="eventid" value="${event.getEventid()}"
			hidden=true />
			<input type="submit" value="List choice"> 
			</form>
			<form method="post" action="/savevotes">
			<input type="text" name="groupid" hidden=true value="${groupid}"/>
		    <input type="number" name="eventid" value="${event.getEventid()}" hidden=true />
		     <input type="number" name="activityid" value="${selectedactivity.getActivityid()}" hidden=true />
			<c:if test="${not empty businesses}">
			<div class ="businesslist">
			<table id="businesslist">
				<thead>
					<tr>
					    <th></th>
						<th><c:out value="${fn:toUpperCase(selectedactivity.activityname)}"></c:out></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="business" items="${businesses}">
						<tr>
						<td></td>
							<td><label for="${selectedactivity.activityname}_favorite">Most Favorite </label>
								 <c:if test = "${empty message}"><input type="radio" name="${selectedactivity.activityname}_favorite"
								value="${business.name}"></c:if><br />Votes
								:${business.favourite}</td>
							<td><img src="${business.image_url}" /><br /> <a
								href="${business.url}"> ${business.name} </a></td>
							<td><label for="${selectedactivity.activityname}_notfavorite">Least
									Favorite </label> <c:if test = "${empty message}"><input type="radio" name="${selectedactivity.activityname}_notfavorite"
								value="${business.name}"></c:if> <br /> Votes
								:${business.notfavourite}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		<c:if test = "${empty message}">
		<input type="submit" value="Save votes" />
		</c:if>
		</c:if>
	</form>
</body>
</html>

