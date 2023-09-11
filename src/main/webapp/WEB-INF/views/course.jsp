<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Course Home</title>
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
	        <a class="nav-link" href="teacher">Teachers</a>
	        <a class="nav-link active" aria-current="page" href="course">Courses</a>
	      </div>
	    </div>
	    <button type="button" class="btn" style="background-color: #a9a9a9;" data-bs-toggle="modal" data-bs-target="#myModal">
			Add Course
		</button>
	  </div>
	</nav>
	
	<div class="modal fade" id="myModal" data-bs-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add Course</h4>
					<a href="course" class="btn-close"></a>
				</div>
	      
				<form:form modelAttribute="course" action="/addCourse" method="post">
				    	<!-- Modal body -->
						<div class="modal-body">
							<div class="form-group mb-3">
								<form:label path="code">Course code</form:label>
								<form:input type="text" class="form-control" id="code" path="code" placeholder="Enter course code"/>
								<p class="mb-3 text-danger">
									<form:errors path="code" cssClass="error"/>
								</p>
							</div>
							<div class="form-group mb-3">
								<form:label path="title">Course title</form:label>
								<form:input type="text" class="form-control" id="title" path="title" placeholder="Enter course title"/>
								<p class="mb-3 text-danger">
									<form:errors path="title" cssClass="error"/>
								</p>
							</div>
							<div class="form-group mb-3">
								<form:label path="description">Course description</form:label>
								<form:input type="text" class="form-control" id="description" path="description" placeholder="Enter course description"/>
								<p class="mb-3 text-danger">
									<form:errors path="description" cssClass="error"/>
								</p>
							</div>
							<form:label path="teacher_id">Assigned Teacher</form:label>
							<select name="teacher_id" id="teacher_id" class="form-select" aria-label="Default select example">
								<c:choose>
									<c:when test="${empty teachers}">
										<option selected>No teacher available</option>
									</c:when>
									<c:otherwise>
										<c:forEach var="trs" items="${teachers}">
											<option value="${trs.id}">${trs.id} : ${trs.firstname} ${trs.lastname}</option>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
				
						<!-- Modal footer -->
						<div class="modal-footer">
							<a href="course" class="btn btn-danger">Close</a>
							<c:choose>
								<c:when test="${empty teachers}">
									<button type="submit" class="btn btn-primary" disabled>Submit</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="btn btn-primary">Submit</button>
								</c:otherwise>
							</c:choose>
							
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
				<col span="1" style="width: 10%">
				<col span="1" style="width: 20%">
				<col span="1" style="width: 35%">
				<col span="1" style="width: 15%">
				<col span="1" style="width: 15%">
			</colgroup>
			<thead class="table-secondary">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Course code</th>
					<th scope="col">Course title</th>
					<th scope="col">Course description</th>
					<th scope="col">Assigned Teacher</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty courses}">
						<tr>
							<td colspan="6">No Courses found</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="course" items="${courses}">
							<tr>
								<th scope="row">${course.id}</th>
								<td class="fs-6">${course.code}</td>
								<td>${course.title}</td>
								<td>${course.description}</td>
								<c:forEach var="trs" items="${teachers}">
									<c:choose>
										<c:when test="${trs.id == course.teacher_id}">
											<td>${trs.firstname} ${trs.lastname}</td>
										</c:when>
									</c:choose>
								</c:forEach>
								
								<td>
									<button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#myModalEdit${course.id}">Edit</button>
									<button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#confirmModal${course.id}">Remove</button>
								</td>
							</tr>
							
							<div class="modal fade" id="myModalEdit${course.id}" data-bs-backdrop="static">
								<div class="modal-dialog">
									<div class="modal-content">
							
										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">Edit Course</h4>
											<a href="course" class="btn-close"></a>
										</div>
							      
										<form:form modelAttribute="course" action="/editCourse" method="post">
										    	<!-- Modal body -->
												<div class="modal-body">
													<form:input type="hidden" id="courseid" path="id" value="${course.id}"/>
													<div class="form-group mb-3">
														<form:label path="code">Course code</form:label>
														<form:input type="text" class="form-control" id="code_edit" path="code" placeholder="Enter course code" value="${course.code}"/>
														<p class="mb-3 text-danger">
															<form:errors path="code" cssClass="error"/>
														</p>
													</div>
													<div class="form-group mb-3">
														<form:label path="title">Course title</form:label>
														<form:input type="text" class="form-control" id="title_edit" path="title" placeholder="Enter course title" value="${course.title}"/>
														<p class="mb-3 text-danger">
															<form:errors path="title" cssClass="error"/>
														</p>
													</div>
													<div class="form-group mb-3">
														<form:label path="description">Course description</form:label>
														<form:input type="text" class="form-control" id="description_edit" path="description" placeholder="Enter course description" value="${course.description}"/>
														<p class="mb-3 text-danger">
															<form:errors path="description" cssClass="error"/>
														</p>
													</div>
													<form:label path="teacher_id">Assigned Teacher</form:label>
													<select name="teacher_id" id="teacher_id_edit" class="form-select" aria-label="Default select example">
														<c:choose>
															<c:when test="${empty teachers}">
																<option selected>No teacher available</option>
															</c:when>
															<c:otherwise>
																<c:forEach var="trs" items="${teachers}">
																	<c:choose>
																		<c:when test="${course.teacher_id == trs.id}">
																			<option value="${trs.id}" selected>${trs.id} : ${trs.firstname} ${trs.lastname}</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${trs.id}">${trs.id} : ${trs.firstname} ${trs.lastname}</option>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</select>
												</div>
										
												<!-- Modal footer -->
												<div class="modal-footer">
													<a href="course" class="btn btn-danger">Close</a>
													<button type="submit" class="btn btn-primary">Submit</button>
												</div>
										</form:form>
									</div>
								</div>
							</div>
							
							<c:choose>
								<c:when test="${courseId == course.id}">
									<script type="text/javascript">
										window.onload = () => {
										    $("#myModalEdit" + ${course.id}).modal('show');
										}
									</script>
								</c:when>
							</c:choose>
							
							<div class="modal fade" id="confirmModal${course.id}" data-bs-backdrop="static">
								<div class="modal-dialog">
									<div class="modal-content">
							
										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">Delete Course</h4>
											<a href="course" class="btn-close"></a>
										</div>
							      
										<form:form modelAttribute="course" action="/deleteCourse" method="post">
										    	<!-- Modal body -->
												<div class="modal-body">
													<form:input type="hidden" id="courseid_delete" path="id" value="${course.id}"/>
													<form:input type="hidden" id="code_delete" path="code" value="${course.code}"/>
													<form:input type="hidden" id="title_delete" path="title" value="${course.title}"/>
													<form:input type="hidden" id="description_delete" path="description" value="${course.description}"/>
													<form:input type="hidden" id="teacher_id_delete" path="teacher_id" value="${course.teacher_id}"/>
													<p>Delete Course with <b>ID: ${course.id}</b> and <b>Title: ${course.title}</b></p>
												</div>
										
												<!-- Modal footer -->
												<div class="modal-footer">
													<a href="course" class="btn btn-danger">Close</a>
													<button type="submit" class="btn btn-primary">Confirm</button>
												</div>
										</form:form>
									</div>
								</div>
							</div>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>