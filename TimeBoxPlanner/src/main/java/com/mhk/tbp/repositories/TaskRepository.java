package com.mhk.tbp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mhk.tbp.models.Task;
@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
	List<Task> findAll();
	// Retreive all Tasks that are not affected to schedule
	//List<Task> findAllByMinuteContainNot(AvailableMinute);
	// Retreive all Tasks that are selected as Priority
	List<Task> findAllByPriorityIsNotNull();
}
