<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/script/script.js" defer></script>
<title>MVC</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
		<a class="navbar-brand" href="/dashboard">Lookify</a>
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item">
				<a class="nav-link" href="/songs/new">Add New</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/songs/top">See Top 10</a>
			</li>
		</ul>
		</div>
	</nav>
	<div class="container col-6 bg-light p-5 my-5 rounded">
		<h1 class="display-4">Add a New Song</h1>
		<form:form action="/songs/new" method="POST" modelAttribute="s">
			<div class="form-group">
				<form:label path="title">Title</form:label>
				<form:errors class="text-danger" path="title"/>
				<form:input type="text" class="form-control" path="title"/>
			</div>
			<div class="form-group">
				<form:label path="artist">Artist</form:label>
				<form:errors class="text-danger" path="artist"/>
				<form:input type="text" class="form-control" path="artist"/>
			</div>
			<div class="form-group">
				<form:label path="rating">Rating</form:label>
				<form:errors class="text-danger" path="rating"/>
				<form:input type="number" min="1" max="10" class="form-control" path="rating"/>
			</div>
			<button type="submit" class="btn btn-primary col-12 my-3">Submit</button>
		</form:form>
	</div>
</body>
</html>