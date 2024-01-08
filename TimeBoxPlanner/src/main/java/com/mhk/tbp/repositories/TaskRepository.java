package com.mhk.tbp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mhk.tbp.config.AvailableMinute;
import com.mhk.tbp.models.DailyPlan;
import com.mhk.tbp.models.Task;
@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
	List<Task> findAll();
	// Retreive all Tasks that are not affected to schedule
	//List<Task> findAllByMinuteContainNot(AvailableMinute);
	// Retreive all Tasks that are selected as Priority
	List<Task> findAllByPriorityIsTrue();
	// Retrieve all Tasks that are not affected to schedule
	List<Task> findAllByMinuteIsNull();
	// Retrieve all Tasks that are affected to MINUTE_00
	List<Task> findAllByMinute(AvailableMinute minute);
	// Retrieve All Task by DailyPlan
	List<Task> findAllByDailyPlan(DailyPlan dailyPlan);
    List<Task> findAllByDailyPlanAndPriorityIsTrue(DailyPlan dailyPlan);
    List<Task> findAllByDailyPlanAndMinuteIsNull(DailyPlan dailyPlan);
    List<Task> findAllByDailyPlanAndMinute(DailyPlan dailyPlan,AvailableMinute minute );
}
