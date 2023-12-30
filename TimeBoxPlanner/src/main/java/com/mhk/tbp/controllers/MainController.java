package com.mhk.tbp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String home(@ModelAttribute("newTask") Task newTask, Model model) {
		// option to switch jstl section 
		boolean optionShow = false;
		model.addAttribute("optionShow", optionShow);
		
		model.addAttribute("priorities", taskServ.getAllPriorities());
		model.addAttribute("tasks", taskServ.getAll());
		return "home.jsp";
	}

	@PostMapping("/saveNewTask")
	public String saveTask(@Valid @ModelAttribute("newTask") Task newTask, 
	BindingResult result) {
		if (result.hasErrors()) {
			return "home.jsp";
		}
		taskServ.create(newTask);
		return "redirect:/home";
	}
	
	@GetMapping("/task/{id}/show")
	public String showTask(@PathVariable("id") Long id, 
	Model model) {
		// option to switch jstl section 
		boolean optionShow = true;
		model.addAttribute("optionShow", optionShow);
		model.addAttribute("showTask",taskServ.getById(id));
		model.addAttribute("priorities", taskServ.getAllPriorities());
		model.addAttribute("tasks", taskServ.getAll());
		

		
	return "home.jsp";
	}
	
	@PostMapping("/task/{id}/edit")
	public String editTask(@PathVariable("id") Long id,
	@ModelAttribute("showTask")Task editTask,
	BindingResult result,  Model model) {
	if(result.hasErrors()) {
		// option to switch jstl section 
				boolean optionShow = true;
				model.addAttribute("optionShow", optionShow);
				model.addAttribute("showTask",taskServ.getById(id));
				model.addAttribute("tasks", taskServ.getAll());
				return "home.jsp";
	}
		taskServ.update(editTask);
		return "redirect:/home";
	}
	
	@GetMapping("/task/{id}/delete")
	public String deleteTask(@PathVariable("id") Long id, Model model) {
	if(taskServ.getById(id).equals(null)) {
		// option to switch jstl section 
		boolean optionShow = true;
		model.addAttribute("optionShow", optionShow);
		model.addAttribute("showTask",taskServ.getById(id));
		model.addAttribute("priorities", taskServ.getAllPriorities());
		model.addAttribute("tasks", taskServ.getAll());
		return "home.jsp";
	}
		taskServ.deleteByIt(id);
		return "redirect:/home";
	}
	

}
