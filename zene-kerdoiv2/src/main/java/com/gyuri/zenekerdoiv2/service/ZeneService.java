package com.gyuri.zenekerdoiv2.service;

import java.util.List;

import com.gyuri.zenekerdoiv2.entity.Answer;
import com.gyuri.zenekerdoiv2.entity.County;
import com.gyuri.zenekerdoiv2.entity.Form;
import com.gyuri.zenekerdoiv2.entity.Question;
import com.gyuri.zenekerdoiv2.entity.Respondent;
import com.gyuri.zenekerdoiv2.entity.Term;
import com.gyuri.zenekerdoiv2.entity.Type;

public interface ZeneService {

	public List<Answer> getAnswers();

	public void saveAnswer(Answer theAnswer);

	public Answer getAnswer(int theId);
	
	public void saveRespondent(Respondent theRespondent);
	
	public Respondent getRespondent(int theId);
	
	public List<Respondent> getRespondents(Term term);
	
	public void deleteRespondent(int theId);

	public List<Question> getQuestions();
	
	public Question getQuestion(int theId);
	
	public void saveQuestion(Question question);
	
	public void deleteQuestion(int theId);

	public List<Form> listOfAnswers();

	public List<County> getCounties();
	
	public List<Type> getTypes();

	public List<String> getRightAnswers();
	
}
