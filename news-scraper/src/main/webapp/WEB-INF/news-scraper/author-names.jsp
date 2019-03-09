<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Article List</title>
</head>
<body>
	<h2>Article List</h2>
	<table>
		<c:if test="empty authorNameList">
			<tr>
				<td>Sorry, Author's data is not available.</td>
			</tr>
		</c:if>
	
		<c:forEach var="authorData" items="${authorNameList}">
			<tr>
				<td>----------------------------------------------</td>
			</tr>
			<tr>
				<td><h1>${authorData.articleTitle}</h1></td>
			</tr>
			<tr>
				<td><b>Author: </b><span>${authorData.authorName}</span></td>
			</tr>
			<tr>
				<td>${authorData.description}</td>
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

</style>
</html>