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
				<a class="nav-link" href="/songs/top">See Top Songs</a>
			</li>
		</ul>
		<form action="/songs/search" class="d-flex" method="POST">
			<input class="form-control me-2" name="search" type="search" placeholder="Search"/>
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
		</div>
	</nav>
	<div class="container col-md-12 col-6">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Title</th>
					<th>Artist</th>
					<th>Rating</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${songs}">
					<tr>
						<td>${s.title}</td>
						<td>${s.artist}</td>
						<td>${s.rating}</td>
						<td>
							<div class="d-flex gap-3">
								<a href="/songs/edit/${s.id}">Edit</a>
								<form:form action="/songs/delete/${s.id}">
									<input type="hidden" name="_method" value="DELETE">
									<button type="submit" class="badge bg-danger">Delete</button>
								</form:form>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>