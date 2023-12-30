package com.mhk.tbp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mhk.tbp.models.DailyPlan;
@Repository
public interface DailyPlanRepository extends CrudRepository<DailyPlan, Long> {
	List<DailyPlan> findAll();
}
