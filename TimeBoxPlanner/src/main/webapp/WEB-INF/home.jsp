<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<style>
body {
	background-color: #ACA9CB;
}

.square-box {
	max-width: 600px;
	min-height: 600px;
	/* 	border: 1px solid #666; */
}

.square-min-box {
	max-width: 400px;
	min-height: 200px;
	/* 	border: 1px solid #666; */
}
</style>
</head>
<body>

	<div class="container d-flex justify-content-end align-items-center">
		<button>Login</button>
		<button>Register</button>
	</div>

	<div class="container">
		<div
			class="container d-flex justify-content-between align-items-center">
			<h1>The Time Box</h1>
			<div>
				<label>Date:</label> <input type="date" />
			</div>
		</div>
		<div class="row">
			<div class=" col md-6 ">
				<div class="container">
					<h3>Top Priorities:</h3>
					<ul>
						<c:forEach var="priority" items="${priorities}">
							<li>${priority.keyWords}</li>
						</c:forEach>
					</ul>
				</div>

				<div class="container">
					<h3>Brain Dump:</h3>
					<!-- This section is shown for showTask -->
					<c:if test="${optionShow==true}">
						<form:form action="/task/${showTask.id}/edit" method="POST"
							modelAttribute="showTask">
							<table>
								<tr>
									<form:errors path="id" class="error"></form:errors>
									<form:errors path="keyWords" class="error"></form:errors>
									<form:errors path="description" class="error"></form:errors>
									<form:errors path="priority" class="error"></form:errors>
									<form:errors path="hour" class="error"></form:errors>
									<form:errors path="minute" class="error"></form:errors>
									<form:errors path="createdAt" class="error"></form:errors>
									<form:errors path="updatedAt" class="error"></form:errors>
								</tr>
								<tr>
									<td></td>
									<td><form:radiobutton path="priority" label="Priority"
											value="true"></form:radiobutton></td>
									<td><form:radiobutton path="priority" label="Not Priority"
											value="false"></form:radiobutton></td>
								</tr>
								<tr>
									<td><form:label path="keyWords">Keyword</form:label></td>
									<td><form:input path="keyWords"
											placeholder="Enter your keyword"></form:input></td>
								</tr>
								<tr>
									<td><form:label path="description">Description</form:label></td>
									<td><form:textarea path="description" rows="25" cols="30"></form:textarea></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" value="Edit Task" /></td>

								</tr>


							</table>
						</form:form>
						<td><button
								onClick="location.href='/task/${showTask.id}/delete'">Delete
								Task</button></td>

					</c:if>

					<!-- This section is shown for newTask -->
					<c:if test="${optionShow==false}">
						<form:form action="/saveNewTask" method="POST"
							modelAttribute="newTask">
							<table>
								<tr>
									<form:errors path="id" class="error"></form:errors>
									<form:errors path="keyWords" class="error"></form:errors>
									<form:errors path="description" class="error"></form:errors>
									<form:errors path="priority" class="error"></form:errors>
									<form:errors path="hour" class="error"></form:errors>
									<form:errors path="minute" class="error"></form:errors>
									<form:errors path="createdAt" class="error"></form:errors>
									<form:errors path="updatedAt" class="error"></form:errors>
								</tr>
								<tr>
									<td></td>
									<td><form:radiobutton path="priority" label="Priority"
											value="true"></form:radiobutton></td>
									<td><form:radiobutton path="priority" label="Not Priority"
											value="false"></form:radiobutton></td>
								</tr>
								<tr>
									<td><form:label path="keyWords">Keyword</form:label></td>
									<td><form:input path="keyWords"
											placeholder="Enter your keyword"></form:input></td>
								</tr>
								<tr>
									<td><form:label path="description">Description</form:label></td>
									<td><form:textarea path="description" rows="25" cols="30"></form:textarea></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" value="Save new Task" /></td>
								</tr>
							</table>
						</form:form>
					</c:if>
				</div>

			</div>
			<div
				class=" col md-6 d-flex justify-content-center align-items-center">
				<div class="container">
					<h3>Schedule:</h3>
					<table class="table table-striped">
						<thead>
							<th></th>
							<th>:00</th>
							<th>:30</th>
						</thead>

						<tbody>
							<c:forEach var="i" begin="5" end="23">
								<tr>
									<td>${i}</td>
									
									<!-- :00 -->
									<td>
										<ul>
											<!-- this section to show scheduled task -->
											<c:forEach var="task" items="${scheduledTaskMinute00}">
												<c:if test="${task.hour.getHour().equals(i)}">
													<li value="${task.id}"><span>${task.keyWords} </span>
														<button
															onClick="location.href='/cancelSchedule/${task.id}/task'">cancel</button>
													</li>
												</c:if>
											</c:forEach>
										</ul>
										<form action="/schedule/${i}/minute00" method="POST" id="minute00_${i}">
										<select name="selectedTask_id_Minute00" onchange="submitForm('minute00_${i}')">
												<!-- this section  to show Empty or delete scheduled task-->
												<option value="${task.id}">null</option>
												<!-- this section  to show options of tasks to schedule -->
												<c:forEach var="task" items="${notScheduledTask}">
													<option value="${task.id}">${task.keyWords}</option>
												</c:forEach>
											</select>
										</form>
									</td>
									
									<!-- :30 -->
									<td>
										<ul>
											<!-- this section to show scheduled task -->
											<c:forEach var="task" items="${scheduledTaskMinute30}">
												<c:if test="${task.hour.getHour().equals(i)}">
													<li value="${task.id}"><span>${task.keyWords} </span>
														<button
															onClick="location.href='/cancelSchedule/${task.id}/task'">cancel</button>
													</li>
												</c:if>
											</c:forEach>
										</ul>
										<form action="/schedule/${i}/minute30" method="POST" id="minute30_${i}">
										<select name="selectedTask_id_Minute30" onchange="submitForm('minute30_${i}')">
												<!-- this section  to show Empty or delete scheduled task-->
												<option value="${task.id}">null</option>
												<!-- this section  to show options of tasks to schedule -->
												<c:forEach var="task" items="${notScheduledTask}">
													<option value="${task.id}">${task.keyWords}</option>
												</c:forEach>
											</select>
										</form>
									</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container d-flex justify-content-start align-items-center">
			<c:forEach var="task" items="${tasks}">
				<button class="btn btn-primary" style="margin: 5px;"
					onClick="location.href='/task/<c:out value="${task.id}/show"/>'">
					<c:out value="${task.keyWords}" />
				</button>
			</c:forEach>
		</div>
	</div>


	<!-- 	<div -->
	<!-- 		class="container square-box  -->
	<!-- 		d-flex justify-content-center align-items-center "> -->

	<!-- 		<div class="square-min-box d-flex align-items-center "> -->
	<!-- 			<div> -->
	<!-- 				<div class=" d-flex justify-content-center"> -->
	<!-- 					<h1>Welcome to Lookify!</h1> -->
	<!-- 				</div> -->
	<!-- 				<div class=" d-flex justify-content-center"> -->
	<!-- 					<a href="/dash">Start Looking</a> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<!-- For any Bootstrap that uses JS -->
	<!-- 	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> -->
	<script>
		function submitForm(hour) {
			document.getElementById(hour).submit();
		}
	</script>
</body>
</html>