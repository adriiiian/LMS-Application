<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
	body {
		background-color: #ffffe6;
	}
	.clickable-container{
		cursor: pointer;
	}
	
	.clickable-container:hover{
		background-color:#f0f0f0;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Learning Management System</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	      <div class="navbar-nav">
	        <a class="nav-link active" aria-current="page" href="#">Home</a>
	        <a class="nav-link" href="student">Students</a>
	        <a class="nav-link" href="teacher">Teachers</a>
	        <a class="nav-link" href="course">Courses</a>
	      </div>
	    </div>
	  </div>
	</nav>
	
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4 clickable-container" onclick="location.href='student';">
				<div class="card text-center">
					<div class="card-body">
						<h5 class="card-title">Students</h5>
						<img src="/images/student-transparent.png" class="card-img-top" alt="Logo 1" width="200" height="300">
					</div>
				</div>
			</div>
			
			<div class="col-md-4 clickable-container" onclick="location.href='teacher';">
				<div class="card text-center">
					<div class="card-body">
						<h5 class="card-title">Teachers</h5>
						<img src="/images/teacher-transparent.png" class="card-img-top" alt="Logo 2" width="200" height="300">
					</div>
				</div>
			</div>
			
			<div class="col-md-4 clickable-container" onclick="location.href='course';">
				<div class="card text-center">
					<div class="card-body">
						<h5 class="card-title">Courses</h5>
						<img src="/images/course-transparent.png" class="card-img-top" alt="Logo 3" width="200" height="300">
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>