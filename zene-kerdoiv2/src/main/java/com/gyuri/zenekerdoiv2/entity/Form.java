package com.gyuri.zenekerdoiv2.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Form {

	@Id
	private int id;
	
	private int age;
	
	private int year;
	
	private int studies;
	
	private long answer;
	
	private LocalDateTime time;
	
	public Form() {
	}
	

	public Form(int id, int age, int year, int studies, long answer, LocalDateTime time) {
		this.id = id;
		this.age = age;
		this.year = year;
		this.studies = studies;
		this.answer = answer;
		this.time = time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getStudies() {
		return studies;
	}

	public void setStudies(int studies) {
		this.studies = studies;
	}

	public long getAnswer() {
		return answer;
	}

	public void setAnswer(long answer) {
		this.answer = answer;
	}

	public LocalDateTime getTime() {
		return time;
	}

	public void setTime(LocalDateTime time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Form [id=" + id + ", age=" + age + ", year=" + year + ", studies=" + studies + ", q_answers="
				 + answer + ", startTime=" + time + "]";
	}

	
	
	
}
