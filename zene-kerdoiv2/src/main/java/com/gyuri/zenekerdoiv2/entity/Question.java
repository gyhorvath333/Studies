package com.gyuri.zenekerdoiv2.entity;

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

@Entity
@Table(name="question")
public class Question {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="sub_id")
	private String subId;
	
	@Column(name="q_answers")
	private int quantityOfAnswers;
	
	@Column(name="answer1")
	private String answer1;
	
	@Column(name="answer2")
	private String answer2;
	
	@Column(name="answer3")
	private String answer3;
	
	@Column(name="q_files")
	private int quantityOfFiles;
	
	@Column(name="file_path1")
	private String filePath1;
	
	@Column(name="file_path2")
	private String filePath2;
	
	@Column(name="nr")
	private int nr;
	
	@Column(name="right")
	private String right;
	
	@Column(name="enabled")
	private int enabled;
		
	@OneToMany(fetch=FetchType.LAZY, mappedBy="question",
			cascade={CascadeType.REFRESH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH})
	public List<Answer> answers;

	public Question() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubId() {
		return subId;
	}

	public void setSubId(String subId) {
		this.subId = subId;
	}

	public int getQuantityOfAnswers() {
		return quantityOfAnswers;
	}

	public void setQuantityOfAnswers(int quantityOfAnswers) {
		this.quantityOfAnswers = quantityOfAnswers;
	}

	public String getAnswer1() {
		return answer1;
	}

	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}

	public String getAnswer2() {
		return answer2;
	}

	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}

	public String getAnswer3() {
		return answer3;
	}

	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}

	public int getQuantityOfFiles() {
		return quantityOfFiles;
	}

	public void setQuantityOfFiles(int quantityOfFiles) {
		this.quantityOfFiles = quantityOfFiles;
	}

	public String getFilePath1() {
		return filePath1;
	}

	public void setFilePath1(String filePath1) {
		this.filePath1 = filePath1;
	}

	public String getFilePath2() {
		return filePath2;
	}

	public void setFilePath2(String filePath2) {
		this.filePath2 = filePath2;
	}

	public int getNr() {
		return nr;
	}

	public void setNr(int nr) {
		this.nr = nr;
	}

	public String getRight() {
		return right;
	}

	public void setRight(String right) {
		this.right = right;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", quantityOfAnswers=" + quantityOfAnswers + ", answer1="
				+ answer1 + ", answer2=" + answer2 + ", answer3=" + answer3 + ", quantityOfFiles=" + quantityOfFiles
				+ ", filePath1=" + filePath1 + ", filePath2=" + filePath2 + ", enabled="
				+ enabled + "]";
	}

	
	
}
