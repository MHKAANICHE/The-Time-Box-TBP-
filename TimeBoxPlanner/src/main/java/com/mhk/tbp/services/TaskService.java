package com.mhk.tbp.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mhk.tbp.config.AvailableMinute;
import com.mhk.tbp.models.DailyPlan;
import com.mhk.tbp.models.Task;
import com.mhk.tbp.repositories.TaskRepository;

@Service
public class TaskService {
	@Autowired
	private TaskRepository taskRepo;

	// CRUD
	// Create
	public Task create(Task task) {
		return taskRepo.save(task);
	}
	// Update
	public Task update(Task task) {
		return taskRepo.save(task);
	}
	// Delete
	public void deleteByIt(Long id) {
		Optional<Task> optionalTask = taskRepo.findById(id);
		if (optionalTask.isPresent()) {
			taskRepo.deleteById(id);
		}
	}
	// Find One
	public Task getById(Long id) {
		Optional<Task> optionalTask = taskRepo.findById(id);
		if (optionalTask.isPresent()) {
			return optionalTask.get();
		}
		return null;
	}
	// Find All
	public List<Task> getAll() {
		return taskRepo.findAll();
	}
	
	public List<Task> getAllbyDailyPlan(DailyPlan dailyPlan){
	return taskRepo.findAllByDailyPlan(dailyPlan);
	}
	
	// Extra Queries
	public List<Task> getAllPriorities(){
	return taskRepo.findAllByPriorityIsTrue();
	}
	
	public List<Task> getAllPrioritiesByDailyPlan(DailyPlan dailyPlan){
		return taskRepo.findAllByDailyPlanAndPriorityIsTrue(dailyPlan);
		}
	
	public List<Task> getAllNonScheduledTasks(){
	return taskRepo.findAllByMinuteIsNull();
	}
	
	public List<Task> getAllNonScheduledTasksByDailyPlan(DailyPlan dailyPlan){
		return taskRepo.findAllByDailyPlanAndMinuteIsNull(dailyPlan);
		}
	
	public List<Task> getAllByMinute(AvailableMinute minute){
	return taskRepo.findAllByMinute(minute);
	}
	
	public List<Task> getAllByMinuteByDailyPlan(DailyPlan dailyPlan, AvailableMinute minute){
	return taskRepo.findAllByDailyPlanAndMinute(dailyPlan,minute);
	}
}
