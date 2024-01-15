package com.mhk.tbp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mhk.tbp.config.AvailableHour;
import com.mhk.tbp.config.AvailableMinute;
import com.mhk.tbp.models.DailyPlan;
import com.mhk.tbp.models.Task;
import com.mhk.tbp.services.DailyPlanService;
import com.mhk.tbp.services.TaskService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {

	@Autowired
	private DailyPlanService dailyPlanServ;

	@Autowired
	private TaskService taskServ;

	@GetMapping("/landingPage")
	public String landingPage () {
	return "landingPage.jsp";
	}
	

	@GetMapping("/tab")
	public String tab () {
	return "tab.jsp";
	}
	
	@GetMapping("/login")
	public String login () {
	return "login.jsp";
	}

	@GetMapping("/home")
	public String gome(@ModelAttribute("newTask") Task newTask, @ModelAttribute("scheduleTask") Task scheduleTask,
			Model model, HttpSession session) {
		// option to switch jstl section
		// initialise to false, to switch for newTask
		boolean optionShow = false;
		loadModelAttributesRoutine(model, session, optionShow);
		return "home.jsp";
	}

	@GetMapping("/index")
	public String index(@ModelAttribute("newTask") Task newTask, @ModelAttribute("scheduleTask") Task scheduleTask,
			Model model, HttpSession session) {
		// option to switch jstl section
		// initialise to false, to switch for newTask
		boolean optionShow = false;
		loadModelAttributesRoutine(model, session, optionShow);
		return "index.jsp";
	}

	@PostMapping("/saveNewTask")
	public String saveTask(@Valid @ModelAttribute("newTask") Task newTask, BindingResult result, Model model,
			HttpSession session) {
		if (result.hasErrors()) {
			// initialise to false, to switch for newTask
			boolean optionShow = false;
			loadModelAttributesRoutine(model, session, optionShow);
			return "index.jsp";
		}
		if (session.getAttribute("scheduledDay") != null) {
			newTask.setDailyPlan((DailyPlan) session.getAttribute("scheduledDay"));
		}
		taskServ.create(newTask);
		return "redirect:/index";
	}

	@GetMapping("/task/{id}/show")
	public String showTask(@PathVariable("id") Long id, @ModelAttribute("scheduleTask") Task scheduleTask, Model model,
			HttpSession session) {
		// option to switch jstl section
		boolean optionShow = true;
		model.addAttribute("showTask", taskServ.getById(id));
		loadModelAttributesRoutine(model, session, optionShow);
		return "index.jsp";
	}

	@PostMapping("/task/{id}/edit")
	public String editTask(@PathVariable("id") Long id, @Valid @ModelAttribute("showTask") Task editTask, BindingResult result,
			Model model, HttpSession session) {
		if (result.hasErrors()) {
			// option to switch jstl section
			boolean optionShow = true;
			model.addAttribute("showTask", editTask);
			loadModelAttributesRoutine(model, session, optionShow);
			return "index.jsp";
		}
		if (session.getAttribute("scheduledDay") != null) {
			editTask.setDailyPlan((DailyPlan) session.getAttribute("scheduledDay"));
		}
		taskServ.update(editTask);
		return "redirect:/index";
	}

	@GetMapping("/task/{id}/delete")
	public String deleteTask(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (taskServ.getById(id).equals(null)) {
			// option to switch jstl section
			boolean optionShow = true;
			loadModelAttributesRoutine(model, session, optionShow);
			return "index.jsp";
		}
		taskServ.deleteByIt(id);
		return "redirect:/index";
	}

	@PostMapping("/schedule/{hour_id}/minute00")
	public String scheduleTaskMinute00(
			@PathVariable("hour_id") int hourId, // Use int instead of Long
			@RequestParam("selectedTask_id_Minute00") Long selectedTask_id, HttpSession session) {

		Task scheduledTask = taskServ.getById(selectedTask_id);
		// Use the getByHour method to find the corresponding enum constant
		AvailableHour selectedHour = AvailableHour.getByHour(hourId);
		scheduledTask.setMinute(AvailableMinute.MINUTE_00);
		scheduledTask.setHour(selectedHour);

		if (session.getAttribute("scheduledDay") != null) {
			scheduledTask.setDailyPlan((DailyPlan) session.getAttribute("scheduledDay"));
		}
		taskServ.update(scheduledTask);

		return "redirect:/index";
	}

	@PostMapping("/schedule/{hour_id}/minute30")
	public String scheduleTaskMinute30(
			@PathVariable("hour_id") int hourId, // Use int instead of Long
			@RequestParam("selectedTask_id_Minute30") Long selectedTask_id, HttpSession session) {

		Task scheduledTask = taskServ.getById(selectedTask_id);

		// Use the getByHour method to find the corresponding enum constant
		AvailableHour selectedHour = AvailableHour.getByHour(hourId);
		scheduledTask.setMinute(AvailableMinute.MINUTE_30);
		scheduledTask.setHour(selectedHour);

		if (session.getAttribute("scheduledDay") != null) {
			scheduledTask.setDailyPlan((DailyPlan) session.getAttribute("scheduledDay"));
		}
		taskServ.update(scheduledTask);

		return "redirect:/index";
	}

	@GetMapping("/cancelSchedule/{id}/task")
	public String cancelScheduleTask(@PathVariable("id") Long id, HttpSession session) {
		Task task = taskServ.getById(id);
		task.setHour(null);
		task.setMinute(null);

		if (session.getAttribute("scheduledDay") != null) {
			task.setDailyPlan((DailyPlan) session.getAttribute("scheduledDay"));
		}
		taskServ.update(task);
		return "redirect:/index";
	}

	@PostMapping("/DailyPlan/saveDate")
	public String saveDate(@Valid @ModelAttribute("scheduledDay") DailyPlan scheduleDay, BindingResult result,
			Model model, HttpSession session) {
		if (result.hasErrors()) {
			// initialise to false, to switch for newTask
			boolean optionShow = false;
			model.addAttribute("newTask", new Task());
			loadModelAttributesRoutine(model, session, optionShow);
			return "index.jsp";
		}
		
		// if the selectedDate is allready used
		if (dailyPlanServ.getByDate(scheduleDay.getDate()) != null) {
			// Model buckets for accessibility
			// initialise to false, to switch for newTask
			boolean optionShow = false;
			model.addAttribute("newTask", new Task());
			loadModelAttributesRoutine(model, session, optionShow);
			
			result.rejectValue("date", "error.date", "This date exists in your schedule, please select another date");
			 if (result.hasErrors()) {
			        // Handle other errors or processing if needed
			        model.addAttribute("errors", result);
			 }
			//Debug
//			System.out.println("Debug: Error Message - " + result.getFieldError("date").getDefaultMessage());
//			System.out.println("Debug: scheduledDay Attributes - " + model.getAttribute("scheduledDay"));
//			if (result.hasErrors()) {
//		        for (ObjectError error : result.getAllErrors()) {
//		            System.out.println("Error: " + error.getDefaultMessage());
//		        }
//		    }

			return "index.jsp";
		}
		
		// save all task for the selected Date
		scheduleDay.setTasks(taskServ.getAll());
		DailyPlan newscheduleDay = dailyPlanServ.create(scheduleDay);
		for (Task item : scheduleDay.getTasks()) {
			item.setDailyPlan(newscheduleDay);
			taskServ.update(item);
		}
		
		// save the scheduledDate in session
		session.setAttribute("scheduledDay", newscheduleDay);
			
		return "redirect:/index";
	}

	@GetMapping("/scheduledDate/{selectedDate_id}/show")
	public String showScheduledDailyPlan(@PathVariable("selectedDate_id") Long id, HttpSession session) {
		session.setAttribute("scheduledDay", dailyPlanServ.getById(id));
		return "redirect:/index";
	}
	
	@GetMapping("/scheduledDate/{selectedDate_id}/delete")
	public String deleteScheduledDailyPlan(@PathVariable("selectedDate_id") Long id, HttpSession session) {
		dailyPlanServ.deleteById(id);
		return "redirect:/index";
	}

	private void loadModelAttributesRoutine(Model model, HttpSession session, boolean optionShow) {
		model.addAttribute("optionShow", optionShow);
		model.addAttribute("ScheduledDates", dailyPlanServ.getAllScheduledDates());
		// Check if scheduledDay exists in the session
		if (session.getAttribute("scheduledDay") != null) {
			DailyPlan selectedDate = (DailyPlan) session.getAttribute("scheduledDay");
			model.addAttribute("scheduledDay", selectedDate);
			model.addAttribute("priorities", taskServ.getAllPrioritiesByDailyPlan(selectedDate));
			model.addAttribute("notScheduledTask", taskServ.getAllNonScheduledTasksByDailyPlan(selectedDate));
			model.addAttribute("scheduledTaskMinute00",	taskServ.getAllByMinuteByDailyPlan(selectedDate, AvailableMinute.MINUTE_00));
			model.addAttribute("scheduledTaskMinute30",	taskServ.getAllByMinuteByDailyPlan(selectedDate, AvailableMinute.MINUTE_30));
			model.addAttribute("tasks", taskServ.getAllbyDailyPlan(selectedDate));
		} else {
			// If it doesn't exist, create a new DailyPlan object
			model.addAttribute("scheduledDay", new DailyPlan());
			model.addAttribute("priorities", taskServ.getAllPriorities());
			model.addAttribute("notScheduledTask", taskServ.getAllNonScheduledTasks());
			model.addAttribute("scheduledTaskMinute00", taskServ.getAllByMinute(AvailableMinute.MINUTE_00));
			model.addAttribute("scheduledTaskMinute30", taskServ.getAllByMinute(AvailableMinute.MINUTE_30));
			model.addAttribute("tasks", taskServ.getAll());
		}
	}

}
