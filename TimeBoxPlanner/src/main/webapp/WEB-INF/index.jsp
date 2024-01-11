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
<!-- Responsive Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<title>Index</title>
<!-- YOUR own local CSS -->
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	height: 100vh;
	width: 100vw;
	background: #bc95d4;
	/*	#a36ec4; #bc95d4;*/
	z-index: 0;
}

header {
	display: flex;
	justify-content: space-between;
}

main {
	display: flex;
	justify-content: space-around;
}

footer {
	display: flex;
	justify-content: space-between;
}
/* Smartphones (portrait) ---------------- */
@media only screen and (min-width : 321px) and (max-width : 767px) and
	(orientation : portrait) {
}
/* Smartphones (landscape) ---------------- */
@media only screen and (min-width : 321px) and (max-width : 767px) and
	(orientation : landscape) {
}

/* Tablets (portrait) -------------------- ref */
@media only screen and (min-device-width : 768px) and (max-device-width
	: 1024px) and (orientation : portrait) {
}

/* Old Desktops and laptops ------------------ */
@media only screen and (min-width : 1025px) {
}

.mode-image {
	width: 20px; /* Adjust the width as needed */
	height: 20px; /* Adjust the height as needed */
}

/* Hide the second image initially */
#sunImage {
	display: none;
}

.moon-image {
	width: 100px; /* Adjust the width as needed */
	height: 100px; /* Adjust the height as needed */
}

/*Confeti*/
.confetti {
	left: 0;
	pointer-events: none;
	position: fixed;
	top: 0;
	transform: translate3d(0, 0, 0);
	will-change: transform;
	height: 100%;
	width: 100%;
}
/* -------------------------------------
/*   Scaffolding
/* -------------------------------------*/
.confetti-item {
	position: absolute;
	transform: translate3d(0, 0, 0);
	will-change: transform;
	 animation: 2s 1s confetti-fall ease-in both;
	
}
/* -------------------------------------
/*   Keyframe Animations
/* -------------------------------------

/* ----- Confetti Fall ----- */

@keyframes confetti-fall {
  0% {
    transform: translateY(-100%)
  }
  95%{
    animation-timing-function: ease-in-out;
    transform: translateY(calc(100vh - 55%))
  }
  100% {
    transform: translateY(calc(150vh - 65%))
  }}
  
</style>
</head>
<body>
	<!-- confetti -->
	<svg class="dn">
  <defs>
    <symbol id="svg-confetti">
      <path fill="currentColor"
			d="M-.017 6.91L4.035.012l2.587 1.52L2.57 8.43z"></path>
    </symbol>
  </defs>
</svg>


	<div class="header-blue">
		<nav
			class="navbar navbar-dark navbar-expand-md navigation-clean-search">
			<div class="container">
				<a class="navbar-brand" href="#">The Time Box</a>
				<button class="navbar-toggler" data-toggle="collapse"
					data-target="#navcol-1">
					<span class="sr-only">Toggle navigation</span><span
						class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navcol-1">
					<div class="form-check form-switch">
						<input class="form-check-input visually-hidden" type="checkbox"
							id="darkModeSwitch" onclick="toggleDarkMode()"> <label
							class="form-check-label" for="darkModeSwitch"> <img
							src="/images/moon.svg" alt="Moon Image" id="moonImage"
							class="mode-image"> <img src="/images/sun.svg"
							alt="Sun Image" id="sunImage" class="mode-image">
						</label>
					</div>
					<a href="#" class="login">Log In</a> <a
						class="btn btn-light action-button" role="button" href="#">Sign
						Up</a>
				</div>
			</div>
		</nav>
	</div>
	</div>

	<main style="background-color: green">
		<article id="tasksArticle">
			<!-- Top Priorities Section -->
			<div class="accordion" class="topPrioritiesSection">
				<!-- Content Toggle Button -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTopPriorities">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTopPriorities"
							aria-expanded="true" aria-controls="collapseTopPriorities">Top
							Priorities</button>
					</h2>
					<div id="collapseTopPriorities"
						class="accordion-collapse collapse show"
						aria-labelledby="headingTopPriorities"
						data-bs-parent="#accordionBasic">
						<div class="accordion-body">
							<p class="body-checkbox">
								<c:forEach var="priority" items="${priorities}">
									<div class="checkbox-container">
										<input type="checkbox" class="checkbox-icon"
											id="priorityItem${priority.keyWords}"
											onchange="handlePriorityCheckboxChange(this)"> <label
											for="priorityItem${priority.keyWords}" class="priority-label">${priority.keyWords}</label>
									</div>
								</c:forEach>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="accordion" class="TasksBubblesSection">
				<!-- Content Toggle Button -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTasksBubbles">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTasksBubbles"
							aria-expanded="false" aria-controls="collapseTasksBubbles">Tasks
							Bubbles</button>
					</h2>
					<div id="collapseTasksBubbles" class="accordion-collapse collapse "
						aria-labelledby="headingTasksBubbles"
						data-bs-parent="#accordionBasic">
						<div class="accordion-body">
							<p>
								<c:forEach var="task" items="${tasks}">
									<button class="btn btn-success" class="task-bubble"
										onClick="location.href='/task/<c:out value='${task.id}/show'/>'">
										<c:out value="${task.keyWords}" />
									</button>
								</c:forEach>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="accordion" class="BrainDumpSection">
				<!-- Content Toggle Button -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingBrainDump">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseBrainDump"
							aria-expanded="true" aria-controls="collapseBrainDump">Brain
							Dump</button>
					</h2>
					<div id="collapseBrainDump"
						class="accordion-collapse collapse show"
						aria-labelledby="headingBrainDump"
						data-bs-parent="#accordionBasic">
						<div class="accordion-body">
							<p>
								<!-- This section is shown for showTask -->
								<c:if test="${optionShow==true}">
									<form:form id="brainDumpFormShow"
										action="/task/${showTask.id}/edit" method="POST"
										modelAttribute="showTask">
										<div class="container mt-3">
											<div class="row">


												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="id"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="keyWords"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="description"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="priority"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="hour"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="minute"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="createdAt"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="updatedAt"></form:errors>
											</div>
											<div class="row">
												<div class="col-md-6 offset-md-3">
													<!-- Bootstrap form styling -->
													<div class="mb-3">
														<form:label path="priority" for="brainDumpRadioPriority"
															class="form-label"></form:label>
														<div class="form-check">
															<form:checkbox path="priority"
																id="brainDumpCheckboxNotPriority"
																class="form-check-input" />
															<form:label path="priority" class="form-check-label"
																for="brainDumpCheckboxNotPriority">Priority</form:label>
														</div>
													</div>

													<div class="mb-3">
														<form:label path="keyWords" for="brainDumpInputKeyWords"
															class="form-label">Keyword</form:label>
														<form:input path="keyWords" type="text"
															id="brainDumpInputKeyWords" name="keyWords"
															class="form-control" placeholder="Enter your keyword" />
													</div>

													<div class="mb-3">
														<form:label path="description"
															for="brainDumpTexteareaDescription" class="form-label">Description</form:label>
														<form:textarea path="description"
															id="brainDumpTexteareaDescription" name="description"
															class="form-control"></form:textarea>
													</div>

													<button id="brainDumpButtonEdit" type="submit"
														class="btn btn-primary">Edit Task</button>

												</div>
											</div>
										</div>
									</form:form>
									<td><button id="brainDumpButtonDelete"
											class="btn btn-danger"
											onClick="location.href='/task/${showTask.id}/delete'">Delete
											Task</button></td>
								</c:if>

								<!-- This section is shown for newTask -->
								<c:if test="${optionShow==false}">
									<form:form id="brainDumpFormNew" action="/saveNewTask"
										method="POST" modelAttribute="newTask">
										<div class="container mt-3">
											<div class="row">

												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="id"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="keyWords"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="description"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="priority"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="hour"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="minute"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="createdAt"></form:errors>
												<form:errors class="alert alert-danger" role="alert"
													id="brainDumpFormErrorMessage" path="updatedAt"></form:errors>

											</div>
											<div class="row">
												<div class="col-md-6 offset-md-3">

													<!-- Bootstrap form styling -->
													<div class="mb-3">
														<label path="priority" for="brainDumpRadioPriority"
															class="form-label">Priority</label>

														<div class="form-check">
															<form:checkbox path="priority"
																id="brainDumpCheckboxNotPriority"
																class="form-check-input" />
															<form:label path="priority" class="form-check-label"
																for="brainDumpCheckboxNotPriority">Priority</form:label>
														</div>
													</div>

													<div class="mb-3">
														<form:label path="keyWords" for="brainDumpInputKeyWords"
															class="form-label">Keyword</form:label>
														<form:input path="keyWords" type="text"
															id="brainDumpInputKeyWords" name="keyWords"
															class="form-control" placeholder="Enter your keyword" />
													</div>

													<div class="mb-3">
														<form:label path="description"
															for="brainDumpTexteareaDescription" class="form-label">Description</form:label>
														<form:textarea path="description"
															id="brainDumpTexteareaDescription" name="description"
															class="form-control"></form:textarea>
													</div>

													<button id="brainDumpButtonSaveNew" type="submit"
														class="btn btn-primary">Save new Task</button>

												</div>
											</div>
										</div>

									</form:form>
								</c:if>
							</p>
						</div>
					</div>
				</div>
			</div>

		</article>

		<article id="scheduleArticle">
			<!-- Select Date Section -->




			<div class="accordion" id="SelectDateSection">
				<!-- Content Toggle Button -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingSelectDate">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseSelectDate"
							aria-expanded="false" aria-controls="collapseSelectDate">Select
							Date</button>
					</h2>
					<div id="collapseSelectDate" class="accordion-collapse collapse"
						aria-labelledby="headingSelectDate"
						data-bs-parent="#SelectDateSection">
						<div class="accordion-body">
							<c:forEach var="error" items="${errors.allErrors}">
								<div class="error">${error.defaultMessage}</div>
							</c:forEach>
							<form:form id="scheduleDateForm" action="/DailyPlan/saveDate"
								method="POST" modelAttribute="scheduledDay" class="mt-3">
								<div class="mb-3">
									<label for="dateInput" class="form-label">Date:</label>
									<form:errors id="DateErrorMessage" path="date" cssClass="error"></form:errors>
									<form:input path="date" id="dateInput" type="date"
										class="form-control" onchange="submitDate()" />
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>




			<div class="accordion" id="MyplannedDaysSection">
				<!-- Content Toggle Button -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingMyplannedDays">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseMyplannedDays"
							aria-expanded="false" aria-controls="collapseMyplannedDays">My
							planned days</button>
					</h2>
					<div id="collapseMyplannedDays" class="accordion-collapse collapse"
						aria-labelledby="headingMyplannedDays"
						data-bs-parent="#MyplannedDaysSection">
						<div class="accordion-body">
							<p>
								<c:forEach var="selectDate" items="${ScheduledDates}">
									<button class="btn btn-primary me-2" id="selectDate"
										onClick="location.href='/scheduledDate/<c:out value="${selectDate.id}/show"/>'">
										<fmt:formatDate value="${selectDate.date}"
											pattern="yyyy-MM-dd" />
									</button>
									<button class="btn btn-danger" id="deleteSelectedDate"
										onClick="location.href='/scheduledDate/<c:out value="${selectDate.id}/delete"/>'">-</button>
								</c:forEach>
							</p>
						</div>
					</div>
				</div>
			</div>



			<!-- My ScheduleSection -->

			<div class="accordion" id="MyScheduleSection">
				<!-- Content Toggle Button -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingMySchedule">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseMySchedule"
							aria-expanded="true" aria-controls="collapseMySchedule">My
							Schedule</button>
					</h2>
					<div id="collapseMySchedule"
						class="accordion-collapse collapse show"
						aria-labelledby="headingMySchedule"
						data-bs-parent="#accordionBasic">
						<div class="accordion-body">
							<p>
							<div class="table-responsive">
								<table class="table table-bordered" id="ScheduleTable">
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
													<ul class="list-group" id="ScheduleTablePlannedTaskList">
														<!-- this section to show scheduled task -->
														<c:forEach var="task" items="${scheduledTaskMinute00}">
															<c:if test="${task.hour.getHour().equals(i)}">
																<li class="list-group-item"
																	id="ScheduleTablePlannedTaskItem" value="${task.id}"><span>${task.keyWords}
																</span>
																	<button class="btn btn-warning"
																		id="ScheduleTableTaskPlannedButtonCancel"
																		onClick="location.href='/cancelSchedule/${task.id}/task'">cancel</button>
																</li>
															</c:if>
														</c:forEach>
													</ul>
													<form class="mb-3" action="/schedule/${i}/minute00"
														method="POST" id="minute00_${i}">
														<select class="form-select"
															id="ScheduleTableSelectTaskList"
															name="selectedTask_id_Minute00"
															onchange="submitForm('minute00_${i}')">
															<!-- this section  to show Empty or delete scheduled task-->
															<option class="bg-secondary text-light"
																id="ScheduleTableSelectTaskItem" value="${task.id}">null</option>
															<!-- this section  to show options of tasks to schedule -->
															<c:forEach var="task" items="${notScheduledTask}">
																<option value="${task.id}">${task.keyWords}</option>
															</c:forEach>
														</select>
													</form>
												</td>

												<!-- :30 -->
												<td>
													<ul class="list-group" id="ScheduleTablePlannedTaskList">
														<!-- this section to show scheduled task -->
														<c:forEach var="task" items="${scheduledTaskMinute30}">
															<c:if test="${task.hour.getHour().equals(i)}">
																<li class="list-group-item"
																	id="ScheduleTablePlannedTaskItem" value="${task.id}"><span>${task.keyWords}
																</span>
																	<button class="btn btn-warning"
																		id="ScheduleTableTaskPlannedButtonCancel"
																		onClick="location.href='/cancelSchedule/${task.id}/task'">cancel</button>
																</li>
															</c:if>
														</c:forEach>
													</ul>
													<form class="mb-3" action="/schedule/${i}/minute30"
														method="POST" id="minute30_${i}">
														<select class="form-select"
															id="ScheduleTableSelectTaskList"
															name="selectedTask_id_Minute30"
															onchange="submitForm('minute30_${i}')">
															<!-- this section  to show Empty or delete scheduled task-->
															<option class="bg-secondary text-light"
																id="ScheduleTableSelectTaskItem" value="${task.id}">null</option>
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
								</p>
							</div>
						</div>
					</div>
				</div>
		</article>
	</main>
	<footer class="bg-warning">
		<section id="FooterSection" class="text-center py-3">
			<p class="m-0">
				Developed by <a href="https://www.linkedin.com/in/mhkaaniche/"
					class="text-dark">Mohamed KAANICHE</a> - December 2023.
			</p>
		</section>
	</footer>

	<script>
// take the user at the same scroll position
    document.addEventListener('DOMContentLoaded', function () {
        var scrollPosition = localStorage.getItem('scrollPosition');
        if (scrollPosition !== null) {
            window.scrollTo(0, scrollPosition);
            localStorage.removeItem('scrollPosition'); // Clear the remembered position
        }
    });
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<script>
  function handlePriorityCheckboxChange(checkbox) {
    // Check if the checkbox is checked
    if (checkbox.checked) {
      // Trigger confetti
      confetti();
    }
  }
</script>

<script>
  function randomize(collection) {
    var randomNumber = Math.floor(Math.random() * collection.length);
    return collection[randomNumber];
  }

  function confetti() {
    $(".confetti").remove();
    var $confettiItems = $('<div class="confetti"></div>'),
        colors = ["#3b5692", "#f9c70b", "#00abed", "#ea6747"],
        height = 6.6,
        width = 6.6;

    var scale, $confettiItem;

    for (var i = 0; i < 100; i++) {
      scale = Math.random() * 1.75 + 1;
      $confettiItem = $(
        "<svg class='confetti-item' width='" +
        width * scale +
        "' height='" +
        height * scale +
        "' viewbox='0 0 " +
        width +
        " " +
        height +
        "'>\n  <use transform='rotate(" +
        Math.random() * 360 +
        ", " +
        width / 2 +
        ", " +
        height / 2 +
        ")' xlink:href='#svg-confetti' />\n</svg>"
      );
      $confettiItem.css({
        animation:
            Math.random() +
            2 +
            "s " +
            Math.random() * 2 +
            "s confetti-fall ease-in both",
        color: randomize(colors),
        left: Math.random() * 100 + "vw"
      });
      $confettiItems.append($confettiItem);
    }
    $("body").append($confettiItems);
  }
</script>

	<script>
    function toggleDarkMode() {
    	 localStorage.setItem('scrollPosition', window.scrollY);
        var darkModeSwitch = document.getElementById("darkModeSwitch");
        var moonImage = document.getElementById("moonImage");
        var sunImage = document.getElementById("sunImage");

        if (darkModeSwitch.checked) {
            moonImage.style.display = "inline";
            sunImage.style.display = "none";
        } else {
            moonImage.style.display = "none";
            sunImage.style.display = "inline";
        }
    }

//Submit date script
function submitDate() {
	 localStorage.setItem('scrollPosition', window.scrollY);
	document.getElementById('scheduleDateForm').submit();
}

//Submit scheduleTask script
function submitForm(hour) {
	 localStorage.setItem('scrollPosition', window.scrollY);
	document.getElementById(hour).submit();
}



//accordion javascript
document.addEventListener('DOMContentLoaded', function() {
	 localStorage.setItem('scrollPosition', window.scrollY);
	const accordions = document.querySelectorAll('.accordion');

	accordions.forEach((accordion) => {
		const button = accordion.querySelector('.accordion-button');
		const content = accordion.querySelector('.accordion-content');
		const icon = button.querySelector('.rotate-icon');

		button.addEventListener('click', function() {
			const showContent = content.classList.toggle('show');

			if (showContent) {
				content.style.height = content.scrollHeight + 'px';
			} else {
				content.style.height = '0';
			}

			icon.style.transform = `rotate(${showContent ? '45deg' : '0'})`;

			// Close other sections
			const otherContents = document.querySelectorAll('.accordion-content');
			const otherIcons = document.querySelectorAll('.rotate-icon');

			otherContents.forEach((otherContent) => {
				if (otherContent !== content) {
					otherContent.style.height = '0';
					otherContent.classList.remove('show');
				}
			});

			otherIcons.forEach((otherIcon) => {
				if (otherIcon !== icon) {
					otherIcon.style.transform = 'rotate(0)';
				}
			});
		});
	});
});


	// script for automatic page scroll (up and down)
// document.addEventListener("DOMContentLoaded", function () {
//   const tasksArticle = document.getElementById("tasksArticle");
//   const scheduleArticle = document.getElementById("scheduleArticle");
//   let timer;
//   let lastScrollPosition = 0;

//   window.addEventListener("scroll", function () {
//   	  clearTimeout(timer);
//         const currentScrollPosition = window.scrollY;
//         if (currentScrollPosition > lastScrollPosition   ) {
//           timer = setTimeout(function () {
//           	window.scrollTo(0, document.body.scrollHeight);
//           }, 20);
//         }

//         if (currentScrollPosition < lastScrollPosition ) {
//           timer = setTimeout(function () {
//           	window.scrollTo(0, 0);
//           }, 20);
//         }

//     lastScrollPosition = currentScrollPosition;
//   });
// });
 </script>
</body>
</html>