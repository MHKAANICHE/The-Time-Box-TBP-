package com.mhk.tbp.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name="schedules")
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

	// TimeStamp
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	// relational 
	
//	// OneToOne : Schedule is associated to unique DailyPlan 
//	@OneToOne(fetch= FetchType.LAZY)
//	@JoinColumn(name="dailyPlan_id")
//	private DailyPlan dailyPlan;
	
//	// OneToMany : Schedule is associated to Many Tasks 
//	@OneToMany(mappedBy = "schedule", cascade = CascadeType.ALL ,fetch=FetchType.LAZY)
//	private List<Task> tasks;
	
	// Enum relationship 
	// Plages horaires disponibles
    //@ElementCollection
    //@CollectionTable(name = "schedule_available_hours", joinColumns = @JoinColumn(name = "schedule_id"))
    //@Enumerated(EnumType.STRING)
    //@Column(name = "hour")
    //private List<AvailableHour> availableHours;

	// Enum relationship 
    // Minutes disponibles
    //@ElementCollection
    //@CollectionTable(name = "schedule_available_minutes", joinColumns = @JoinColumn(name = "schedule_id"))
    //@Enumerated(EnumType.STRING)
    //@Column(name = "minute")
    //private List<AvailableMinute> availableMinutes;

	// zero-args constructor
	public Schedule() {
	}
	
	// TimeStamp methods
	@PrePersist
	private void onCreate() {
	this.createdAt = new Date();
	}
	@PreUpdate
	private void onUpdate() {
	this.updatedAt = new Date();
	}
	// Getters and Setters

}
