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
		<c:if test="empty articleTitleList">
			<tr>
				<td>Sorry, Title is not available.</td>
			</tr>
		</c:if>
		<tr>
			<td><h1>${articleTitleList.articleTitle}</h1></td>
		</tr>
		<tr>
			<td><b>Author : </b><span>${articleTitleList.authorName}</span></td>
		</tr>
		<tr>
			<td>${articleTitleList.description}</td>
		</tr>
	</table>
	<br />
	<button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab" value="Back" onclick="javascript:history.back()" >
  		<i class="material-icons">arrow_left</i>
	</button>
<!-- 	<input type="button" value="Back" onclick="javascript:history.back()" /> -->
</body>

<style>
body {
	background: lavender;
	position: relative;
}
</style>

</html>