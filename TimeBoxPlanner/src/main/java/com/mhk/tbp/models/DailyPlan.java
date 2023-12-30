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
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name="dailyplans")
public class DailyPlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Date is required!.")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

	// Timestamps
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	// relational
	// OneToMany relationship : DailyPlan should have many tasks
	@OneToMany(mappedBy="dailyPlan", cascade=CascadeType.ALL , fetch=FetchType.LAZY)
	private List<Task> tasks;

	
	
	// OneToOne relationship : DailyPlan should have unique schedule
//    @OneToOne(mappedBy="dailyPlan", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
//    private Schedule schedule;
    

	// zero-args constructor
	public DailyPlan() {
	}
	
	// Timestamps methods 
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	
	

}
