<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>News Scraper</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	   <script src = "https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
      <link rel = "stylesheet"  href = "https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
      <link rel = "stylesheet"  href = "https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<div class="container">
		<h3 id="form-header" align="center">News Scraper</h3>
		<div></div>
		<c:url var="getAllAuthors" value="/getAllAuthors" />
		<form:form id="author-list-form" modelAttribute="allAuthors"
			method="GET" action="${getAllAuthors}">
			<table border='0' width='480px' cellpadding='0' cellspacing='0'
				align='center'>
				<tr>
					<td align='center'><a class="available-author-list-link"
						href="javascript:submit();">Click to view available authors</a></td>
				</tr>
			</table>
		</form:form>
		<c:url var="searchAuthorNames" value="/searchAuthorNames" />
		<form:form id="author-name-form" modelAttribute="searchAuthorName"
			method="POST" action="${searchAuthorNames}">
			<table border='0' width='480px' cellpadding='0' cellspacing='0'
				align='center'>
				<tr>
					<td><label class="search-label">Search by Author Name:
					</label></td>
					<td><form:input id="author-name-input"
							class="input-width-class" path="authorName" /></td>
					<td align='center'>
						<button id="searchAuthorButton" class="mdl-button mdl-js-button mdl-button--fab 
						mdl-button--mini-fab search-alignment mdl-button--colored" type="submit">
  							<i class="material-icons">search</i>
						</button>
					</td>
				</tr>
			</table>
		</form:form>
		<c:url var="searchArticleTitle" value="/searchArticleTitle" />
		<form:form id="article-title-form" modelAttribute="searchArticleTitle"
			method="POST" action="${searchArticleTitle}">
			<table border='0' width='480px' cellpadding='0' cellspacing='0'
				align='center'>
				<tr>
					<td><label class="search-label">Search by Article
							Title: </label></td>
					<td><form:input id="article-title-input"
							class="input-width-class" path="articleTitle" /></td>
					<td align='center'>
					<button id="searchTitleButton" class="mdl-button mdl-js-button mdl-button--fab 
						mdl-button--mini-fab search-alignment mdl-button--colored" type="submit">
  						<i class="material-icons">search</i>
					</button>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</body>

<style>
body {
	background-image: url(../img/news.jpg);
	background-position: left;
}

.container {
	position: absolute;
	border: 2px solid linen;
	top: 26%;
	left: 31%;
	background: lightyellow;
	height: 250px;
	width: 550px;
	border-radius: 20px;
}

#form-header {
	position: relative;
	color: olivedrab;
	font-size: 40px;
	top:-10px;
}

#author-list-form {
	position: relative;
    top: -10px;
}

#article-title-form {
	position: absolute;
	top: 165px;
/* 	left: 30px; */
}

#author-name-form {
	position: absolute;
	top: 110px;
}

.available-author-list-link {
	position: relative;
	font-size: 20px;
}

.input-width-class {
    position: absolute;
    width: 290px;
    left: 170px;
    top: 17px;
}

.search-label {
	position: absolute;
}

.search-alignment {
	position: relative;
    left: 250px;
    top: 8px;
}

</style>

<script type="text/javascript">
function submit() {
	document.forms["author-list-form"].submit();
}
</script>

</html>