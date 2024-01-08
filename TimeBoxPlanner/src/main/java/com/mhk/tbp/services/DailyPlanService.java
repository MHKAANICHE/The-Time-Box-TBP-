package com.mhk.tbp.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mhk.tbp.models.DailyPlan;
import com.mhk.tbp.repositories.DailyPlanRepository;

@Service
public class DailyPlanService {

	@Autowired
	private DailyPlanRepository dailyPlanRepo;

// CRUD
	// Create
	public DailyPlan create(DailyPlan dailyPlan) {
		return dailyPlanRepo.save(dailyPlan);
	}

	// Update
	public DailyPlan update(DailyPlan dailyPlan) {
		return dailyPlanRepo.save(dailyPlan);
	}

	// Delete
	public void deleteById(Long id) {
		Optional<DailyPlan> optionalDailyPlan = dailyPlanRepo.findById(id);
		if (optionalDailyPlan.isPresent()) {
			dailyPlanRepo.deleteById(id);
		}
	}

	// Find One
	public DailyPlan getById(Long id) {
		Optional<DailyPlan> optionalDailyPlan = dailyPlanRepo.findById(id);
		if (optionalDailyPlan.isPresent()) {
			return optionalDailyPlan.get();
		}
		return null;
	}

	// Find ALL
	public List<DailyPlan> getAllScheduledDates() {
		return dailyPlanRepo.findAll();
	}

	// Extra Query
	public DailyPlan getByDate(Date date) {
		Optional<DailyPlan> optionalDailyPlan = dailyPlanRepo.findByDate(date);
		if (optionalDailyPlan.isEmpty()) {
			return null;
		} else {
			return optionalDailyPlan.get();
		}
	}

}
