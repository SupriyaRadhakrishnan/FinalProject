<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- registration page, asks user for name, email and password -->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Meet Me There | Register</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.3/slate/bootstrap.min.css"
	integrity="sha512-Dfbzfu79H8lYHUElioPvezFPJI+wFlG4uP4tbHlRkrIhlyVzp/8sh2LQ7GmQz1+vIO9J6c/HUK5VfsMFM19piA=="
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="row" align="center">
		<div class="col-lg-12">
			<img src="/images/logo.png">
		</div>
	</div>
	<div class="col-lg-12" align="center">
		<h1>Register</h1>
	</div>
	<p>${message}</p>
	<div class="col-lg-12" align="center">
		<form method="post" action="/register">
			<div class="form-group w-25">
				<label for="username">Name</label> <input type="text"
					class="form-control" placeholder="Enter name" name="username"
					required> <label for="email">Email</label> <input
					type="email" class="form-control" placeholder="Enter email"
					name="email" required> <label for="password"
					class="mr-sm-2">Password</label> <input
					class="form-control mb-2 mr-sm-2" placeholder="Password"
					type="password" name="password" required> <input
					type="submit" class="btn btn-primary mb-2" value="Register">
				</div>
		</form>
		</div>
		<div class="col-lg-12" align="center">
			<a href="/"><button class="btn btn-primary mb-2">Back to
					Login</button></a>
		</div>
</body>
</html>