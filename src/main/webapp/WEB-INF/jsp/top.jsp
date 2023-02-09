<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lookify</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
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