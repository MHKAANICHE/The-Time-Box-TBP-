package com.mhk.tbp.repositories;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mhk.tbp.models.DailyPlan;
@Repository
public interface DailyPlanRepository extends CrudRepository<DailyPlan, Long> {
	List<DailyPlan> findAll();
	List<DailyPlan> findAllByDate (Date date);
	Optional<DailyPlan> findByDate(Date date);
}
