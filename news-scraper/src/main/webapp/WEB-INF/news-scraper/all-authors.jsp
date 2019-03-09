<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Available Authors</title>
</head>
<body>
	<h2>Available Authors</h2>
	<table>
		<c:if test="empty allAuthorList">
			<tr>
				<td>Sorry, There no Authors.</td>
			</tr>
		</c:if>
		<c:forEach var="availableAuthor" items="${allAuthorList}">
			<tr>
				<td>${availableAuthor}</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<input type="button" value="Back" onclick="javascript:history.back()" />
</body>

<style>

body {
	background: lavender;
	position: relative;
}
</style>

</html>