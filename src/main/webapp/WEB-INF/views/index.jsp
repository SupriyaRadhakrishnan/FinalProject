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
<h1>Welcome ${username}</h1>
<br />
<div class="row">
<c:forEach var="business" items="${businesses}">
  <div class="column">
<img src="${business.image_url}"><br />
<a href="${business.url}">${business.name}</a>
  </div>
  </c:forEach>
</div>

</body>
</html>