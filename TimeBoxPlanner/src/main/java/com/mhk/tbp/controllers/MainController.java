package com.mhk.tbp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mhk.tbp.config.AvailableHour;
import com.mhk.tbp.config.AvailableMinute;
import com.mhk.tbp.models.Task;
import com.mhk.tbp.services.DailyPlanService;
import com.mhk.tbp.services.TaskService;

import jakarta.validation.Valid;

@Controller
public class MainController {

	@Autowired
	private DailyPlanService dailyPlanServ;

	@Autowired
	private TaskService taskServ;

	@GetMapping("/home")
	public String home(@ModelAttribute("newTask") Task newTask,@ModelAttribute("scheduleTask")Task scheduleTask, Model model) {
			// option to switch jstl section
			// initialise to false, to switch for newTask
			boolean optionShow = false;
						
			// Model buckets for accessibility
			model.addAttribute("optionShow", optionShow);
			model.addAttribute("priorities", taskServ.getAllPriorities());
			model.addAttribute("notScheduledTask", taskServ.getAllNonScheduledTasks());
			model.addAttribute("scheduledTaskMinute00", taskServ.getAllByMinute(AvailableMinute.MINUTE_00));
			model.addAttribute("scheduledTaskMinute30", taskServ.getAllByMinute(AvailableMinute.MINUTE_30));				
			model.addAttribute("tasks", taskServ.getAll());
			//model.addAttribute("selectedDate", dailyPlanServ.getById(null).getDate());
			
			// debug : 
			//System.out.println("scheduledTask : " +  taskServ.getAllByMinute(AvailableMinute.MINUTE_00));
			
			return "home.jsp";
	}

	@PostMapping("/saveNewTask")
	public String saveTask(@Valid @ModelAttribute("newTask") Task newTask, BindingResult result, Model model) {
		if (result.hasErrors()) {
			// initialise to false, to switch for newTask
			boolean optionShow = false;
						
			// Model buckets for accessibility
			model.addAttribute("optionShow", optionShow);
			model.addAttribute("priorities", taskServ.getAllPriorities());
			model.addAttribute("notScheduledTask", taskServ.getAllNonScheduledTasks());
			model.addAttribute("scheduledTaskMinute00", taskServ.getAllByMinute(AvailableMinute.MINUTE_00));
			model.addAttribute("scheduledTaskMinute30", taskServ.getAllByMinute(AvailableMinute.MINUTE_30));				
			model.addAttribute("tasks", taskServ.getAll());
			return "home.jsp";
		}
		taskServ.create(newTask);
		return "redirect:/home";
	}

	@GetMapping("/task/{id}/show")
	public String showTask(@PathVariable("id") Long id,@ModelAttribute("scheduleTask")Task scheduleTask, Model model) {
			// option to switch jstl section
			boolean optionShow = true;
			model.addAttribute("showTask", taskServ.getById(id));
			
			// Model buckets for accessibility
			model.addAttribute("optionShow", optionShow);
			model.addAttribute("priorities", taskServ.getAllPriorities());
			model.addAttribute("notScheduledTask", taskServ.getAllNonScheduledTasks());
			model.addAttribute("scheduledTaskMinute00", taskServ.getAllByMinute(AvailableMinute.MINUTE_00));
			model.addAttribute("scheduledTaskMinute30", taskServ.getAllByMinute(AvailableMinute.MINUTE_30));				
			model.addAttribute("tasks", taskServ.getAll());
			
			return "home.jsp";
	}

	@PostMapping("/task/{id}/edit")
	public String editTask(@PathVariable("id") Long id, @ModelAttribute("showTask") Task editTask, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			// option to switch jstl section
			boolean optionShow = true;
			model.addAttribute("showTask", taskServ.getById(id));
			
			// Model buckets for accessibility
			model.addAttribute("optionShow", optionShow);
			model.addAttribute("priorities", taskServ.getAllPriorities());
			model.addAttribute("notScheduledTask", taskServ.getAllNonScheduledTasks());
			model.addAttribute("scheduledTaskMinute00", taskServ.getAllByMinute(AvailableMinute.MINUTE_00));
			model.addAttribute("scheduledTaskMinute30", taskServ.getAllByMinute(AvailableMinute.MINUTE_30));				
			model.addAttribute("tasks", taskServ.getAll());
			return "home.jsp";
		}
		taskServ.update(editTask);
		return "redirect:/home";
	}

	@GetMapping("/task/{id}/delete")
	public String deleteTask(@PathVariable("id") Long id, Model model) {
		if (taskServ.getById(id).equals(null)) {
			// option to switch jstl section
			boolean optionShow = true;
			model.addAttribute("optionShow", optionShow);
			
			// Model buckets for accessibility
			model.addAttribute("optionShow", optionShow);
			model.addAttribute("priorities", taskServ.getAllPriorities());
			model.addAttribute("notScheduledTask", taskServ.getAllNonScheduledTasks());
			model.addAttribute("scheduledTaskMinute00", taskServ.getAllByMinute(AvailableMinute.MINUTE_00));
			model.addAttribute("scheduledTaskMinute30", taskServ.getAllByMinute(AvailableMinute.MINUTE_30));				
			model.addAttribute("tasks", taskServ.getAll());
			
			
			return "home.jsp";
		}
		taskServ.deleteByIt(id);
		return "redirect:/home";
	}
	
	@PostMapping("/schedule/{hour_id}/minute00")
	public String scheduleTaskMinute00(
	    @ModelAttribute("scheduleTask") Task scheduleTask,
	    @PathVariable("hour_id") int hourId, // Use int instead of Long
	    @RequestParam("selectedTask_id_Minute00") Long selectedTask_id
	) {
	
		Task scheduledTask = taskServ.getById(selectedTask_id);
		// debug : 
		//System.out.println("selectedTask_id" + selectedTask_id);
	    //System.out.println("selectedTask_keyWords" + scheduledTask.getKeyWords());
	    
	    // Use the getByHour method to find the corresponding enum constant
	    AvailableHour selectedHour = AvailableHour.getByHour(hourId);
	    scheduledTask.setMinute(AvailableMinute.MINUTE_00);
	    scheduledTask.setHour(selectedHour);
	    
	    taskServ.update(scheduledTask);
	    
	    return "redirect:/home";
	}
	
	@PostMapping("/schedule/{hour_id}/minute30")
	public String scheduleTaskMinute30(
	    @ModelAttribute("scheduleTask") Task scheduleTask,
	    @PathVariable("hour_id") int hourId, // Use int instead of Long
	    @RequestParam("selectedTask_id_Minute30") Long selectedTask_id
	) {
	
		Task scheduledTask = taskServ.getById(selectedTask_id);
		// debug : 
		//System.out.println("selectedTask_id" + selectedTask_id);
	    //System.out.println("selectedTask_keyWords" + scheduledTask.getKeyWords());
	    
	    // Use the getByHour method to find the corresponding enum constant
	    AvailableHour selectedHour = AvailableHour.getByHour(hourId);
	    scheduledTask.setMinute(AvailableMinute.MINUTE_30);
	    scheduledTask.setHour(selectedHour);
	    
	    taskServ.update(scheduledTask);
	    
	    return "redirect:/home";
	}
	
	@GetMapping("/cancelSchedule/{id}/task")
	public String cancelScheduleTask(@PathVariable("id") Long id) {
	Task task = taskServ.getById(id);
	task.setHour(null);
	task.setMinute(null);
	taskServ.update(task);
	return "redirect:/home";
	}
	
	

}
