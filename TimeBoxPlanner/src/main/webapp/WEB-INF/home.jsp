<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Your local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<style>
body, html {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-family: Arial, sans-serif;
	background-color: #FB938F; /* Light gray background color */
	color: #333; /* Default text color */
	transition: background-color 0.3s, color 0.3s; /* Smooth transition */
}

header, aside, main, footer {
	width: 80%;
	max-width: 1200px;
	margin: 0.1 auto;
	padding: 1em;
	box-sizing: border-box;
	background-color: #F2CAC8; /* Light blue background color */
	border-radius: 0.5em; /* Rounded corners */
	box-shadow: 0 0.5em 1em rgba(0, 0, 0, 0.1);
	/* Box shadow for a subtle lift */
}

nav, article {
	width: 100%;
	margin: 0.5em 0;
	box-sizing: border-box;
	background-color: #C36B85;
}

section {
	width: 100%;
	padding: 1em;
	margin-bottom: 1em;
	box-sizing: border-box;
	background-color: #FDBB75; /* White background for sections */
	border: 1px solid #DDDDDD; /* Light gray border */
	border-radius: 0.5em; /* Rounded corners */
	box-shadow: 0 0.2em 0.5em rgba(0, 0, 0, 0.1);
	/* Box shadow for a subtle lift */
}

ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

textarea, input, radio {
	width: 100%;
	padding: 0.5em;
	margin: 0.5em 0;
	box-sizing: border-box;
	border: 1px solid #DDDDDD;
	border-radius: 0.2em;
}

/* Media queries for responsive design */
@media only screen and (min-width: 600px) {
	header, aside, main, footer {
		width: 90%;
	}
}

@media only screen and (min-width: 768px) {
	header, aside, main, footer {
		width: 80%;
	}
}

@media only screen and (min-width: 992px) {
	header, aside, main, footer {
		width: 70%;
	}
	article {
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}
	section {
		width: 48%;
		margin-bottom: 1em;
	}
}

@media only screen and (min-width: 1200px) {
	header, aside, main, footer {
		width: 60%;
	}
}

/* Dark mode styles */
body.dark-mode, html.dark-mode {
	background-color: #1D3752; /* Dark gray background color */
	color: #e0e0e0; /* Light text color in dark mode */
}

header.dark-mode, aside.dark-mode, main.dark-mode, footer.dark-mode {
	background-color: #214D72; /* Dark gray background color in dark mode */
	border-color: #1a1a1a; /* Darker border color in dark mode */
	color: #e0e0e0; /* Light text color for elements in dark mode */
	box-shadow: 0 0.2em 0.5em rgba(0, 0, 0, 0.1);
	/* Box shadow for a subtle lift */
}

nav.dark-mode, article.dark-mode, section.dark-mode {
	background-color: #2C7695;
	/* Dark gray background color for footer in dark mode */
}

select.dark-mode, option.dark-mode, button.dark-mode, textarea.dark-mode,
	input.dark-mode, radio.dark-mode {
	background-color: #50BFC3; /* Dark gray background color in dark mode */
	border-color: #1a1a1a; /* Darker border color in dark mode */
	color: #e0e0e0; /* Light text color for elements in dark mode */
}

#brainDumpFormErrorMessage {
	color: red;
}
</style>
</head>
<body>
	<header>
		<section id="logoSection">
			<h1>The Time Box</h1>
		</section>
		<section id="navSection">
		<nav id="ToggleDarkMode">
			<button onclick="toggleDarkMode()">Toggle Dark Mode</button>
		</nav>
		<nav id="loginRegistrationSection">
			<button id="loginButton">Login</button>
			<button id="registerButton">Register</button>
		</nav>
	</section>
	</header>
	<main>
		<article id="tasksArticle">
			<section id="topPrioritiesSection">
				<h3>Top Priorities:</h3>
				<ul id="prioritiesList">
					<c:forEach var="priority" items="${priorities}">
						<li id="priorityItem">${priority.keyWords}</li>
					</c:forEach>
				</ul>
			</section>
			<section id="tasksBublesSection">
				<c:forEach var="task" items="${tasks}">
					<button id="taskItemBuble"
						onClick="location.href='/task/<c:out value="${task.id}/show"/>'">
						<c:out value="${task.keyWords}" />
					</button>
				</c:forEach>
			</section>
			<section id="brainDumpSection">
				<h3>Brain Dump:</h3>
				<!-- This section is shown for showTask -->
				<c:if test="${optionShow==true}">
					<form:form id="brainDumpFormShow"
						action="/task/${showTask.id}/edit" method="POST"
						modelAttribute="showTask">
						<table>
							<tr>
								<form:errors id="brainDumpFormErrorMessage" path="id"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="keyWords"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="description"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="priority"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="hour"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="minute"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="createdAt"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="updatedAt"></form:errors>
							</tr>
							<tr>
								<td></td>
								<td><form:radiobutton id="brainDumpRadioPriority"
										path="priority" label="Priority" value="true"></form:radiobutton></td>
								<td><form:radiobutton id="brainDumpRadioNotPriority"
										path="priority" label="Not Priority" value="false"></form:radiobutton></td>
							</tr>
							<tr>
								<td><form:label id="brainDumpLabelKeyWords" path="keyWords">Keyword</form:label></td>
								<td><form:input id="brainDumpInputKeyWords" path="keyWords"
										placeholder="Enter your keyword"></form:input></td>
							</tr>
							<tr>
								<td><form:label id="brainDumpLabelDescription"
										path="description">Description</form:label></td>
								<td><form:textarea id="brainDumpTexteareaDescription"
										path="description" rows="25" cols="30"></form:textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><input id="brainDumpButtonEdit" type="submit"
									value="Edit Task" /></td>
							</tr>
						</table>
					</form:form>
					<td><button id="brainDumpButtonDelete"
							onClick="location.href='/task/${showTask.id}/delete'">Delete
							Task</button></td>
				</c:if>

				<!-- This section is shown for newTask -->
				<c:if test="${optionShow==false}">
					<form:form id="brainDumpFormNew" action="/saveNewTask"
						method="POST" modelAttribute="newTask">
						<table>
							<tr>
								<form:errors id="brainDumpFormErrorMessage" path="id"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="keyWords"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="description"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="priority"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="hour"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="minute"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="createdAt"></form:errors>
								<form:errors id="brainDumpFormErrorMessage" path="updatedAt"></form:errors>
							</tr>
							<tr>
								<td></td>
								<td><form:radiobutton id="brainDumpRadioPriority"
										path="priority" label="Priority" value="true"></form:radiobutton></td>
								<td><form:radiobutton id="brainDumpRadioNotPriority"
										path="priority" label="Not Priority" value="false"></form:radiobutton></td>
							</tr>
							<tr>
								<td><form:label id="brainDumpLabelKeyWords" path="keyWords">Keyword</form:label></td>
								<td><form:input id="brainDumpInputKeyWords" path="keyWords"
										placeholder="Enter your keyword"></form:input></td>
							</tr>
							<tr>
								<td><form:label id="brainDumpLabelDescription"
										path="description">Description</form:label></td>
								<td><form:textarea id="brainDumpTexteareaDescription"
										path="description" rows="25" cols="30"></form:textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><input id="brainDumpButtonSaveNew" type="submit"
									value="Save new Task" /></td>
							</tr>
						</table>
					</form:form>
				</c:if>
			</section>
		</article>

		<article id="scheduleArticle">
			<section id="selectDateSection">
				<c:forEach var="error" items="${errors.allErrors}">
					<div class="error">${error.defaultMessage}</div>
				</c:forEach>
				<form:form id="scheduleDateForm" action="/DailyPlan/saveDate"
					method="POST" modelAttribute="scheduledDay">
					<!-- Show errors -->
					<%-- 				<c:forEach var="error" items="${errors.allErrors}"> --%>
					<%-- 					<div class="error">${error.defaultMessage}</div> --%>
					<%-- 				</c:forEach> --%>

					<form:label path="date" id="dateLabel">Date:</form:label>
					<form:errors id="DateErrorMessage" path="date"></form:errors>
					<form:input path="date" id="dateInput" type="date"
						onchange="submitDate()" />
				</form:form>
			</section>
			<section id="listscheduledDates">
				<c:forEach var="selectDate" items="${ScheduledDates}">
					<button id="selectDate"
						onClick="location.href='/scheduledDate/<c:out value="${selectDate.id}/show"/>'">
						<fmt:formatDate value="${selectDate.date}" pattern="yyyy-MM-dd" />
					</button>
					<button id="deleteSelectedDate"
						onClick="location.href='/scheduledDate/<c:out value="${selectDate.id}/delete"/>'">
						-</button>
				</c:forEach>
			</section>
			<section id="ScheduleSection">
				<h3 id="ScheduleTitle">Schedule:</h3>
				<table id="ScheduleTable">
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
									<ul id="ScheduleTablePlannedTaskList">
										<!-- this section to show scheduled task -->
										<c:forEach var="task" items="${scheduledTaskMinute00}">
											<c:if test="${task.hour.getHour().equals(i)}">
												<li id="ScheduleTablePlannedTaskItem" value="${task.id}"><span>${task.keyWords}
												</span>
													<button id="ScheduleTableTaskPlannedButtonCancel"
														onClick="location.href='/cancelSchedule/${task.id}/task'">cancel</button>
												</li>
											</c:if>
										</c:forEach>
									</ul>
									<form action="/schedule/${i}/minute00" method="POST"
										id="minute00_${i}">
										<select id="ScheduleTableSelectTaskList"
											name="selectedTask_id_Minute00"
											onchange="submitForm('minute00_${i}')">
											<!-- this section  to show Empty or delete scheduled task-->
											<option id="ScheduleTableSelectTaskItem" value="${task.id}">null</option>
											<!-- this section  to show options of tasks to schedule -->
											<c:forEach var="task" items="${notScheduledTask}">
												<option value="${task.id}">${task.keyWords}</option>
											</c:forEach>
										</select>
									</form>
								</td>

								<!-- :30 -->
								<td>
									<ul id="ScheduleTablePlannedTaskList">
										<!-- this section to show scheduled task -->
										<c:forEach var="task" items="${scheduledTaskMinute30}">
											<c:if test="${task.hour.getHour().equals(i)}">
												<li id="ScheduleTablePlannedTaskItem" value="${task.id}"><span>${task.keyWords}
												</span>
													<button id="ScheduleTableTaskPlannedButtonCancel"
														onClick="location.href='/cancelSchedule/${task.id}/task'">cancel</button>
												</li>
											</c:if>
										</c:forEach>
									</ul>

									<form action="/schedule/${i}/minute30" method="POST"
										id="minute30_${i}">
										<select id="ScheduleTableSelectTaskList"
											name="selectedTask_id_Minute30"
											onchange="submitForm('minute30_${i}')">
											<!-- this section  to show Empty or delete scheduled task-->
											<option id="ScheduleTableSelectTaskItem" value="${task.id}">null</option>
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
			</section>
		</article>
	</main>
	<footer>
		<section id="FooterSection">
			<nav></nav>
			<nav></nav>
			<nav>
				Developed by <a href="https://www.linkedin.com/in/mhkaaniche/">Mohamed 	KAANICHE</a> - December 2023.
			</nav>
				
		</section>
	</footer>
	<script>
		// Submit date script
		function submitDate() {
			document.getElementById('scheduleDateForm').submit();
		}
	
		// Submit scheduleTask script
		function submitForm(hour) {
			document.getElementById(hour).submit();
		}
		// JavaScript to toggle dark mode
        function toggleDarkMode() {
            

            // Toggle dark mode styles for specific elements without adding classes
            document.querySelectorAll('section, nav, article,header, aside, main, footer,body, html').forEach(element => {
                element.classList.toggle("dark-mode");
            });
            document.querySelectorAll('textarea, input, radio,ul,select,option,button').forEach(element => {
                element.classList.toggle("dark-mode");
            });
        }
	</script>
	<!-- Bootstrap JS and Popper.js (if needed) -->
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
</body>

</html>
