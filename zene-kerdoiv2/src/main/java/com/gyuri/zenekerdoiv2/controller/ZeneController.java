package com.gyuri.zenekerdoiv2.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gyuri.zenekerdoiv2.entity.Answer;
import com.gyuri.zenekerdoiv2.entity.County;
import com.gyuri.zenekerdoiv2.entity.Question;
import com.gyuri.zenekerdoiv2.entity.Respondent;
import com.gyuri.zenekerdoiv2.entity.Type;
import com.gyuri.zenekerdoiv2.service.ZeneService;

@Controller
@RequestMapping("/zene")
public class ZeneController {
	
	
	@Autowired
	private ZeneService zeneService;
	

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	
	@GetMapping("/szia")
	public String szia(Model theModel, HttpServletRequest req, HttpServletResponse res) {
		
		List<County> counties=zeneService.getCounties();
		List<Type> types=zeneService.getTypes();
		HttpSession httpSession = req.getSession();
		Respondent resp = new Respondent();
		resp.setAge(10);
		
		
		theModel.addAttribute("respondent", resp);
		httpSession.setAttribute("counties", counties);
		httpSession.setAttribute("types", types);
		
		return "welcome-details";
	}
	
	@PostMapping("/szia2")
	public String szia2(@ModelAttribute("respondent")
			@Valid Respondent theRespondent, BindingResult theBindingResult, 
			HttpServletRequest req, HttpServletResponse res, Model theModel) {
		
		if(theBindingResult.hasErrors()) {
			
			return "welcome-details";
		}
		else {
			theRespondent.setCreatedOn(LocalDateTime.now());
			zeneService.saveRespondent(theRespondent);
		
			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("resp", theRespondent);
			httpSession.setAttribute("age", theRespondent.getAge());
			httpSession.removeAttribute("counties");
			httpSession.removeAttribute("types");
			return "test-question";
		}
	}
	
	@RequestMapping("/pelda")
	public String example() {
		
		return "example";
	}
	
	@RequestMapping("/jokivansag")
	public String greeting() {
		
		return "greeting";
	}
	
	@RequestMapping(value = {"/next-{answer}"})
	public String nextQuestion(Model theModel,
			HttpServletRequest req, HttpServletResponse res, @PathVariable String answer) {
		
		int theId;
		int maxId=86;
		
		HttpSession httpSession = req.getSession();
		if(httpSession.getAttribute("qId")==null) {
			theId=2;
		}  else {
			theId=(int)httpSession.getAttribute("qId")+1;
		}
		if (answer!=null) {
			Answer answerFin = (Answer)httpSession.getAttribute("answer");
			
			answerFin.setAnswer(answer);
			answerFin.setEndTime(LocalDateTime.now());
			zeneService.saveAnswer(answerFin);
		}
		if (theId<=maxId) {
			Respondent resp = (Respondent)httpSession.getAttribute("resp");
			Question currentQuestion = zeneService.getQuestion(theId);
			Answer currentAnswer = new Answer();
			currentAnswer.setStartTime(LocalDateTime.now());
			currentAnswer.setQuestion(currentQuestion);
			currentAnswer.setRespondent(resp);
			httpSession.setAttribute("answer", currentAnswer);
		
			theModel.addAttribute("question", currentQuestion);
			theModel.addAttribute("qa", currentQuestion.getQuantityOfAnswers());
			theModel.addAttribute("qf", currentQuestion.getQuantityOfFiles());
			theModel.addAttribute("qt", currentQuestion.getTitle());

		
			httpSession.setAttribute("qId", theId);
		
			return "question";
		} else return "the-end";
	}
}
