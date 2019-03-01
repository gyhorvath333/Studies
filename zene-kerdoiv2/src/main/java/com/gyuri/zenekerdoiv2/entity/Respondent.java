package com.gyuri.zenekerdoiv2.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
//import javax.validation.constraints.Pattern;


@Entity
@Table(name="respondent")
public class Respondent {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="created_on")
	private LocalDateTime createdOn;
	
	@Column(name="gender")
	@NotNull(message="Kötelezõ kitölteni!")
	private int gender;
	
	@Column(name="age")
	@NotNull(message="Kötelezõ kitölteni!")
	@Min(value=6, message="Ilyen fiatalok nem tölthetik ki!")
	@Max(value=20, message="Csak gyerkeknek!")
	private int age;
	
	@Column(name="year")
	@NotNull(message="Kötelezõ kitölteni!")
	@Min(value=1, message="Minimum 1!")
	//@Pattern(regexp="[0-9]", message="Kérlek számot adj meg!")
	private int year;
	
	@Column(name="studies")
	@NotNull(message="Kötelezõ kitölteni!")
	//@Pattern(regexp="[0-9]", message="Kérlek számot adj meg!")
	private int studies;
	
	@Column(name="note")
	@NotNull(message="Kötelezõ kitölteni!")
	@Min(value=1, message="1-tõl 5-ig kérek egy számot!")
	@Max(value=5, message="1-tõl 5-ig kérek egy számot!")
	private int note;
	
	@OneToMany(fetch=FetchType.EAGER,
			mappedBy="respondent",
			cascade= CascadeType.ALL)
	private List<Answer> answers;
	
	@Column(name="county")
	private int county;
	
	@Column(name="type")
	private int type;
	
	public Respondent() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(LocalDateTime createdOn) {
		this.createdOn = createdOn;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
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
	
	public int getNote() {
		return note;
	}

	public void setNote(int note) {
		this.note = note;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public int getCounty() {
		return county;
	}

	public void setCounty(int county) {
		this.county = county;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Respondent [id=" + id + ", gender=" + gender + ", age=" + age + ", year=" + year + ", studies="
				+ studies + ", note=" + note + "]";
	}
	
}
