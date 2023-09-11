<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home</title>
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
	        <a class="nav-link active" aria-current="page" href="student">Students</a>
	        <a class="nav-link" href="teacher">Teachers</a>
	        <a class="nav-link" href="course">Courses</a>
	      </div>
	    </div>
	    <button type="button" class="btn" style="background-color: #a9a9a9;" data-bs-toggle="modal" data-bs-target="#myModal">
			Add Student
		</button>
	  </div>
	</nav>
	
	<div class="modal fade" id="myModal" data-bs-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Enroll</h4>
					<a href="student" class="btn-close"></a>
				</div>
	      
				<form:form modelAttribute="student" action="/enrollStudent" method="post">
				    	<!-- Modal body -->
						<div class="modal-body">
							<div class="form-group mb-3">
								<form:label path="firstname">First Name</form:label>
								<form:input type="text" class="form-control" id="firstname" path="firstname" placeholder="Enter first name"/>
								<p class="mb-3 text-danger">
									<form:errors path="firstname" cssClass="error"/>
								</p>
							</div>
							<div class="form-group mb-3">
								<form:label path="lastname">Last Name</form:label>
								<form:input type="text" class="form-control" id="lastname" path="lastname" placeholder="Enter last name"/>
								<p class="mb-3 text-danger">
									<form:errors path="lastname" cssClass="error"/>
								</p>
							</div>
							<div class="form-group mb-3">
								<form:label path="email">Email</form:label>
								<form:input type="text" class="form-control" id="email" path="email" placeholder="Enter email"/>
								<p class="mb-3 text-danger">
									<form:errors path="email" cssClass="error"/>
								</p>
							</div>
						</div>
				
						<!-- Modal footer -->
						<div class="modal-footer">
							<a href="student" class="btn btn-danger">Close</a>
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
					<c:when test="${empty students}">
						<tr>
							<td colspan="5">No Students found</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="stud" items="${students}">
							<tr>
								<th scope="row">${stud.id}</th>
								<td>${stud.firstname}</td>
								<td>${stud.lastname}</td>
								<td>${stud.email}</td>
								<td>
									<button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#myModalEdit${stud.id}">Edit Details</button>
									<button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#myModalEnrollCourses${stud.id}">Enroll Courses</button>
								</td>
							</tr>
							
							<div class="modal fade" id="myModalEdit${stud.id}" data-bs-backdrop="static">
								<div class="modal-dialog">
									<div class="modal-content">
							
										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">Edit Student</h4>
											<a href="student" class="btn-close"></a>
										</div>
							      
										<form:form modelAttribute="student" action="/editStudent" method="post">
										    	<!-- Modal body -->
												<div class="modal-body">
													<form:input type="hidden" id="id${stud.id}" path="id" value="${stud.id}"/>
													<div class="form-group mb-3">
														<form:label path="firstname">First Name</form:label>
														<form:input type="text" class="form-control" id="firstname${stud.id}" path="firstname" placeholder="Enter first name" value="${stud.firstname}"/>
														<p class="mb-3 text-danger">
															<form:errors path="firstname" cssClass="error"/>
														</p>
													</div>
													<div class="form-group mb-3">
														<form:label path="lastname">Last Name</form:label>
														<form:input type="text" class="form-control" id="lastname${stud.id}" path="lastname" placeholder="Enter last name" value="${stud.lastname}"/>
														<p class="mb-3 text-danger">
															<form:errors path="lastname" cssClass="error"/>
														</p>
													</div>
													<div class="form-group mb-3">
														<form:label path="email">Email</form:label>
														<form:input type="text" class="form-control" id="email${stud.id}" path="email" placeholder="Enter email" value="${stud.email}"/>
														<p class="mb-3 text-danger">
															<form:errors path="email" cssClass="error"/>
														</p>
													</div>
												</div>
										
												<!-- Modal footer -->
												<div class="modal-footer">
													<a href="student" class="btn btn-danger">Close</a>
													<button type="submit" class="btn btn-primary">Submit</button>
												</div>
										</form:form>
									</div>
								</div>
							</div>
							
							<c:choose>
								<c:when test="${modalId == stud.id }">
									<script type="text/javascript">
										window.onload = () => {
										    $("#myModalEdit" + ${stud.id}).modal('show');
										}
									</script>
								</c:when>
							</c:choose>
							
							<div class="modal fade" id="myModalEnrollCourses${stud.id}" data-bs-backdrop="static">
								<div class="modal-dialog">
									<div class="modal-content">
							
										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">Enroll Courses for Student: ${stud.id} - ${stud.firstname}</h4>
											<a href="student" class="btn-close"></a>
										</div>
							      
										<form:form modelAttribute="studentcourse" action="/enrollCourse" method="post">
										    	<!-- Modal body -->
												<div class="modal-body">
													<p>Currently Enrolled Courses</p>
													<c:forEach var="enrolledCourse" items="${enrolledcourses}">
														<c:choose>
															<c:when test="${stud.id == enrolledCourse.student_id}">
																<c:forEach var="course" items="${courses}">
																	<c:choose>
																		<c:when test="${course.id == enrolledCourse.course_id}">
																			<div style="height: 50px;">
																				<div class="h-75 d-flex flex-row justify-content-between align-items-center border border-dark">
																					<span>${course.id} - ${course.code} - ${course.title}</span>
																				</div>
																			</div>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</c:when>
														</c:choose>
													</c:forEach>
													<form:input type="hidden" id="student_id" path="student_id" value="${stud.id}"/>
													<form:label path="course_id">Enroll to a course</form:label>
													<c:set var="totalcourses" value="${fn:length(courses)}"/>
													<select name="course_id" id="course_id" class="form-select" aria-label="Default select example">
														<c:choose>
															<c:when test="${empty courses}">
																<option selected>No courses available</option>
															</c:when>
															<c:otherwise>
																<c:set var="allcoursestaken" value="false"/>
																<c:forEach var="course" items="${courses}">
																	<c:set var="contains" value="false"/>
																	<c:set var="coursecount" value="0"/>
																	<c:forEach var="enrolledCourse" items="${enrolledcourses}">
																		<c:choose>
																			<c:when test="${stud.id == enrolledCourse.student_id }">
																				<c:set var="coursecount" value="${coursecount + 1}"/>
																				<c:choose>
																					<c:when test="${course.id == enrolledCourse.course_id}">
																						<c:set var="contains" value="true"/>
																					</c:when>
																				</c:choose>
																			</c:when>
																		</c:choose>
																	</c:forEach>
																	<c:choose>
																		<c:when test="${allcoursestaken == false}">
																			<c:choose>
																				<c:when test="${totalcourses ==  coursecount}">
																					<c:set var="allcoursestaken" value="true"/>
																					<option selected>No courses available</option>
																				</c:when>
																			</c:choose>
																		</c:when>
																		
																	</c:choose>
																	<c:choose>
																		<c:when test="${contains != true}">
																			<option value="${course.id}">${course.id} : ${course.code}</option>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</select>
												</div>
										
												<!-- Modal footer -->
												<div class="modal-footer">
													<a href="student" class="btn btn-danger">Close</a>
													<c:choose>
														<c:when test="${allcoursestaken == true}">
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
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
</body>

</html>