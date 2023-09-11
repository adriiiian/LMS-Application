<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
	body {
		background-color: #ffffe6;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- import jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
	        <a class="nav-link" href="index">Home</a>
	        <a class="nav-link" href="student">Students</a>
	        <a class="nav-link active" aria-current="page" href="teacher">Teachers</a>
	        <a class="nav-link" href="course">Courses</a>
	      </div>
	    </div>
	    <button type="button" class="btn" style="background-color: #a9a9a9;" data-bs-toggle="modal" data-bs-target="#myModal">
			Add Teacher
		</button>
	  </div>
	</nav>
	<div class="modal fade" id="myModal" data-bs-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add Teacher</h4>
					<a href="teacher" class="btn-close"></a>
				</div>
	      
				<form:form modelAttribute="teacher" action="/addTeacher" method="post">
				    	<!-- Modal body -->
						<div class="modal-body">
							<div class="form-group mb-3">
								<form:label path="firstname">First Name</form:label>
								<form:input type="text" class="form-control" id="firstname" path="firstname" placeholder="Enter first name" autocomplete="off"/>
								<p class="mb-3 text-danger">
									<form:errors path="firstname" cssClass="error"/>
								</p>
							</div>
							<div class="form-group mb-3">
								<form:label path="lastname">Last Name</form:label>
								<form:input type="text" class="form-control" id="lastname" path="lastname" placeholder="Enter last name" autocomplete="off"/>
								<p class="mb-3 text-danger">
									<form:errors path="lastname" cssClass="error"/>
								</p>
							</div>
							<div class="form-group mb-3">
								<form:label path="email">Email</form:label>
								<form:input type="text" class="form-control" id="email" path="email" placeholder="Enter email" autocomplete="off"/>
								<p class="mb-3 text-danger">
									<form:errors path="email" cssClass="error"/>
								</p>
							</div>
						</div>
				
						<!-- Modal footer -->
						<div class="modal-footer">
							<a href="teacher" class="btn btn-danger">Close</a>
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
				</form:form>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${showModal == true }">
			<script type="text/javascript">
				window.onload = () => {
				    $('#myModal').modal('show');
				}
			</script>
		</c:when>
	</c:choose>
	
	<div class="container-fluid">
		<table class="table table-hover table-bordered" style="width: 100%">
			<colgroup>
				<col span="1" style="width: 5%">
				<col span="1" style="width: 25%">
				<col span="1" style="width: 25%">
				<col span="1" style="width: 25%">
				<col span="1" style="width: 20%">
			</colgroup>
			<thead class="table-secondary">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">First name</th>
					<th scope="col">Last name</th>
					<th scope="col">Email</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty teachers}">
						<tr>
							<td colspan="5">No Teachers found</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="trs" items="${teachers}">
							<tr>
								<th scope="row">${trs.id}</th>
								<td>${trs.firstname}</td>
								<td>${trs.lastname}</td>
								<td>${trs.email}</td>
								<td>
									<button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#myModalEdit${trs.id}">Edit Details</button>
								</td>
							</tr>
							
							<div class="modal fade" id="myModalEdit${trs.id}" data-bs-backdrop="static">
								<div class="modal-dialog">
									<div class="modal-content">
							
										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">Edit Teacher</h4>
											<a href="teacher" class="btn-close"></a>
										</div>
							      
										<form:form modelAttribute="teacher" action="/editTeacher" method="post" autocomplete="off">
										    	<!-- Modal body -->
												<div class="modal-body">
													<form:input type="hidden" id="teacherid" path="id" value="${trs.id}"/>
													<div class="form-group mb-3">
														<form:label path="firstname">First Name</form:label>
														<form:input type="text" class="form-control" id="firstname" path="firstname" autocomplete="off" placeholder="Enter first name" value="${trs.firstname}"/>
														<p class="mb-3 text-danger">
															<form:errors path="firstname" cssClass="error"/>
														</p>
													</div>
													<div class="form-group mb-3">
														<form:label path="lastname">Last Name</form:label>
														<form:input type="text" class="form-control" id="lastname" path="lastname" placeholder="Enter last name" value="${trs.lastname}"/>
														<p class="mb-3 text-danger">
															<form:errors path="lastname" cssClass="error"/>
														</p>
													</div>
													<div class="form-group mb-3">
														<form:label path="email">Email</form:label>
														<form:input type="text" class="form-control" id="email" path="email" placeholder="Enter email" value="${trs.email}"/>
														<p class="mb-3 text-danger">
															<form:errors path="email" cssClass="error"/>
														</p>
													</div>
												</div>
										
												<!-- Modal footer -->
												<div class="modal-footer">
													<a href="teacher" class="btn btn-danger">Close</a>
													<button type="submit" class="btn btn-primary">Submit</button>
												</div>
										</form:form>
									</div>
								</div>
							</div>
							
							<c:choose>
								<c:when test="${modalId == trs.id }">
									<script type="text/javascript">
										window.onload = () => {
										    $("#myModalEdit" + ${trs.id}).modal('show');
										}
									</script>
								</c:when>
							</c:choose>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
</body>
</html>