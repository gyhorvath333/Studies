package com.gyuri.zenekerdoiv2.entity;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="answer")
public class Answer {

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="id")
		private int id;
		
		@ManyToOne(fetch=FetchType.LAZY, cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
		@JoinColumn(name="resp_id")
		private Respondent respondent;
		
		@ManyToOne(fetch=FetchType.LAZY, cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
		@JoinColumn(name="question")
		private Question question;
		
		@Column(name="answer")
		private String answer;
		
		@Column(name="start_time")
		private LocalDateTime startTime;
		
		@Column(name="end_time")
		private LocalDateTime endTime;
		
		
		public Answer() {
			
		}
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public Respondent getRespondent() {
			return respondent;
		}

		public void setRespondent(Respondent respondent) {
			this.respondent = respondent;
		}

		public Question getQuestion() {
			return question;
		}

		public void setQuestion(Question question) {
			this.question = question;
		}

		public String getAnswer() {
			return answer;
		}

		public void setAnswer(String answer) {
			this.answer = answer;
		}

		public LocalDateTime getStartTime() {
			return startTime;
		}

		public void setStartTime(LocalDateTime startTime) {
			this.startTime = startTime;
		}

		public LocalDateTime getEndTime() {
			return endTime;
		}

		public void setEndTime(LocalDateTime endTime) {
			this.endTime = endTime;
		}

		@Override
		public String toString() {
			return "Answer [id=" + id + ", respondentId=" + respondent.getId() + ", question=" + question + ", answer="
					+ answer + ", startTime=" + startTime + ", endTime=" + endTime + "]";
		}

		
		
			
	}
