<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- user log in page. asks user for email and password -->

<html lang="en">
<head>
<meta charset="UTF-8">
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
<title>Meet Me There | Login</title>
</head>
<body>
<div class="container">
	<div class="row" align="center">
		<div class="col-lg-12 col-md-12">
			<img src="/images/logo.png">
		</div>
	</div>
	<div align="center">
		<p style="width: 400px">Meet Me There is for anyone that wants to
			go on a group vacation or a dinner with friends.</p>
		<p style="width: 400px">Create groups, add your friends and vote on your most favorite
			or least favorite place.</p>
		<p style="width: 400px">Make planning easier and make decisions faster and smarter. We
			hope you will meet us there!</p>
		<p>${message}</p>
	</div>


	<div class="col-lg-12" align="center">
		<form method="post" action="/login">
			<div class="form-group">
				<label for="email">Email address</label> <input style="width: 400px" type="email"
					class="form-control mb-2 mr-sm-2" placeholder="Enter email" name="email"
					required> <label for="password" class="mr-sm-2">Password</label>
				<input style="width: 400px" type="password" placeholder="Password"
					class="form-control mb-2 mr-sm-2" name="password" required>
				<input type="submit" class="btn btn-danger mb-2" value="Log In">
			</div>
		</form>
	</div>
	<div class="col-lg-12" align="center">
		<a href="/register"><button class="btn btn-danger mb-2">Register</button></a>
	</div>
	</div>
</body>
</html>