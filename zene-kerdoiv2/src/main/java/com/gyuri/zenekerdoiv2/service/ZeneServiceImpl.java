package com.gyuri.zenekerdoiv2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gyuri.zenekerdoiv2.dao.ZeneDAO;
import com.gyuri.zenekerdoiv2.entity.Answer;
import com.gyuri.zenekerdoiv2.entity.County;
import com.gyuri.zenekerdoiv2.entity.Form;
import com.gyuri.zenekerdoiv2.entity.Question;
import com.gyuri.zenekerdoiv2.entity.Respondent;
import com.gyuri.zenekerdoiv2.entity.Term;
import com.gyuri.zenekerdoiv2.entity.Type;

@Service
public class ZeneServiceImpl implements ZeneService {

	@Autowired
	private ZeneDAO zeneDAO;
	
	@Override
	@Transactional
	public List<Answer> getAnswers() {
		
		return zeneDAO.getAnswers();
	}

	@Override
	@Transactional
	public void saveAnswer(Answer theAnswer) {
		
		zeneDAO.saveAnswer(theAnswer);
	}

	@Override
	@Transactional
	public Answer getAnswer(int theId) {
		
		return zeneDAO.getAnswer(theId);
	}

	@Override
	@Transactional
	public void saveRespondent(Respondent theRespondent) {
		
		zeneDAO.saveRespondent(theRespondent);
	}

	@Override
	@Transactional
	public Respondent getRespondent(int theId) {
		
		return zeneDAO.getRespondent(theId);
	}
	
	@Override
	@Transactional
	public void deleteRespondent(int theId) {
		
		zeneDAO.deleteRespondent(theId);
	}

	@Override
	@Transactional
	public List<Question> getQuestions() {
		
		return zeneDAO.getQuestions();
	}

	@Override
	@Transactional
	public Question getQuestion(int theId) {
		
		return zeneDAO.getQuestion(theId);
	}

	@Override
	@Transactional
	public void saveQuestion(Question question) {
		
		zeneDAO.saveQuestion(question);
	}

	@Override
	@Transactional
	public void deleteQuestion(int theId) {
		
		zeneDAO.deleteQuestion(theId);
	}

	@Override
	@Transactional
	public List<Form> listOfAnswers() {
		
		return zeneDAO.listOfAnswers();	
	}

	@Override
	@Transactional
	public List<County> getCounties() {
		
		return zeneDAO.getCounties();
	}

	@Override
	@Transactional
	public List<Type> getTypes() {

		return zeneDAO.getTypes();
	}
	
	@Transactional
	public List<Respondent> getRespondents(Term term) {
		
		return zeneDAO.getRespondents();
	}

	@Override
	public List<String> getRightAnswers() {
		
		return zeneDAO.getRightAnswers();
	}
	
}
