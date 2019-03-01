package com.gyuri.zenekerdoiv2.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gyuri.zenekerdoiv2.entity.Answer;
import com.gyuri.zenekerdoiv2.entity.County;
import com.gyuri.zenekerdoiv2.entity.Question;
import com.gyuri.zenekerdoiv2.entity.Respondent;
import com.gyuri.zenekerdoiv2.entity.Type;
import com.gyuri.zenekerdoiv2.entity.Form;

@Repository
public class ZeneDAOImpl implements ZeneDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Answer> getAnswers() {
		
		Session currentSession =sessionFactory.getCurrentSession();
		Query<Answer> theQuery = currentSession.createQuery("from Answer", Answer.class);
		List<Answer> answers = theQuery.getResultList();
		
		return answers;
	}

	@Override
	public void saveAnswer(Answer theAnswer) {

		Session currentSession =sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theAnswer);	
	}

	@Override
	public Answer getAnswer(int theId) {
		Session currentSession =sessionFactory.getCurrentSession();
		Answer currentAnswer = currentSession.get(Answer.class, theId); 
		
		return currentAnswer;	
	}

	@Override
	public void saveRespondent(Respondent theRespondent) {
		Session currentSession =sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theRespondent);	
	}

	@Override
	public Respondent getRespondent(int theId) {
		Session currentSession =sessionFactory.getCurrentSession();
		Respondent currentRespondent = currentSession.get(Respondent.class, theId);
		
		return currentRespondent;
	}
	
	@Override
	public void deleteRespondent(int theId) {
		Session currentSession =sessionFactory.getCurrentSession();
		Respondent tempResp = currentSession.get(Respondent.class, theId);
		currentSession.delete(tempResp);
		
	}

	@Override
	public List<Question> getQuestions() {
		Session currentSession =sessionFactory.getCurrentSession();
		Query<Question> theQuery = currentSession.createQuery("from Question where enabled=1", Question.class);
		List<Question> questions = theQuery.getResultList();
		
		return questions;
	}

	@Override
	public Question getQuestion(int theId) {
		Session currentSession =sessionFactory.getCurrentSession();
		Query<Question> theQuery = currentSession.createQuery("from Question where nr=:qId", Question.class);
		theQuery.setParameter("qId", theId);
		Question currentQuestion = theQuery.getSingleResult();
		return currentQuestion;
	}

	@Override
	public void saveQuestion(Question theQuestion) {
		Session currentSession =sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theQuestion);
	}

	@Override
	public void deleteQuestion(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Question> theQuery = currentSession.createQuery("update Question set enabled=0 where id=:theId", Question.class);
		theQuery.setParameter("theId", theId);
		theQuery.executeUpdate();
	}

	@Override
	public List<Form> listOfAnswers() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		TypedQuery<Form> query=currentSession.createQuery("SELECT NEW Form(r.id as id, r.age as age, r.year as year, r.studies as studies, count(a.answer) as answers, max(a.startTime) as time)" + 
				" FROM Respondent r LEFT JOIN Answer a" + 
				" ON r.id=a.respondent" +
				" GROUP BY r.id" +
				" ORDER BY r.id asc", Form.class);
		List<Form> resps = (List<Form>)query.getResultList();
				
		return resps;		
	}
	
	@Override
	public List<County> getCounties() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<County> theQuery = currentSession.createQuery("from County", County.class);
		List<County> counties = theQuery.getResultList();
		
		return counties;		
	}

	@Override
	public List<Type> getTypes() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Type> theQuery = currentSession.createQuery("from Type", Type.class);
		List<Type> types = theQuery.getResultList();
		
		return types;
	}
	
	@Override
	public List<Respondent> getRespondents() {
		Session currentSession =sessionFactory.getCurrentSession();
		Query<Respondent> theQuery = currentSession.createQuery("from Respondent", Respondent.class);
		List<Respondent> respondents = theQuery.getResultList();
		
		return respondents;
	}

	@Override
	public List<String> getRightAnswers() {
		Session currentSession =sessionFactory.getCurrentSession();
		Query<String> theQuery = currentSession.createQuery("from Question right where enabled=1");
		List<String> questions = theQuery.getResultList();
		
		return questions;
	}

}
