package com.mhk.tbp.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.mhk.tbp.config.AvailableHour;
import com.mhk.tbp.config.AvailableMinute;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name="tasks")
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message="Keywords are required!.")
    private String keyWords;
    @NotEmpty(message="Description is required!.")
    private String description;
    private Boolean priority;
    
    // Enum collection
    @Enumerated(EnumType.ORDINAL)
    private AvailableHour hour;
    @Enumerated(EnumType.STRING)
    private AvailableMinute minute;
    
    // Timestamp
    @Column(updatable = false)
    @DateTimeFormat(pattern="yyyy-MM-dd") 
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    // relational 
    
    // ManyToOne : ManyTasks are associated to unique DailyPlan
    @ManyToOne (fetch= FetchType.LAZY)
    @JoinColumn(name="dailyPlan_id")
    private DailyPlan dailyPlan;
    
    // ManyToOne : Many tasks are associated to unique schedule
//    @ManyToOne(fetch=FetchType.LAZY)
//    @JoinColumn(name = "schedule_id")
//    private Schedule schedule;

	// enum relationship 
    //@Column(name = "task_hour")
    //private AvailableHour taskHour; // Heure associée à la tâche
 	// enum relationship
    //@Column(name = "task_minute")
    //private AvailableMinute taskMinute; // Minute associée à la tâche


    // zero-args constructor 
    public Task() {
    }
    // TimeStamp methods
    @PrePersist
    public void onCreate() {
    this.createdAt = new Date();
    }
    @PreUpdate
    public void onUpdate() {
    this.updatedAt = new Date();
    }
	// Getters and Setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Boolean getPriority() {
		return priority;
	}
	public void setPriority(Boolean priority) {
		this.priority = priority;
	}
	public AvailableHour getHour() {
		return hour;
	}
	public void setHour(AvailableHour hour) {
		this.hour = hour;
	}
	public AvailableMinute getMinute() {
		return minute;
	}
	public void setMinute(AvailableMinute minute) {
		this.minute = minute;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public DailyPlan getDailyPlan() {
		return dailyPlan;
	}
	public void setDailyPlan(DailyPlan dailyPlan) {
		this.dailyPlan = dailyPlan;
	}
	
}
