package com.gyuri.zenekerdoiv2.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gyuri.zenekerdoiv2.entity.Form;
import com.gyuri.zenekerdoiv2.entity.Respondent;
import com.gyuri.zenekerdoiv2.entity.Term;
import com.gyuri.zenekerdoiv2.excelgenerator.ExcelReportView;
import com.gyuri.zenekerdoiv2.service.ZeneService;

@Controller
@RequestMapping("/admin")
public class ZeneAdminController {
	
	@Autowired
	private ZeneService zeneService;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("/answers")
	public String listOfAnswers(Model theModel) {
		
		List<Form>  listOfAnswers = zeneService.listOfAnswers();
		theModel.addAttribute("respondents", listOfAnswers);
		
		return "list-of-answers";
	}
	
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("respId") int theId) {
	
		zeneService.deleteRespondent(theId);
		
		return "redirect:/admin/answers";
	}
	
	@RequestMapping("/export")
	public String exportResults(Model theModel) {
		
		Term term = new Term(LocalDateTime.of(2019, 2, 15, 0, 0), LocalDateTime.now());
		
		theModel.addAttribute("term", term);
		
		return "term-of-results";
	}
	
	@RequestMapping("/generate")
	public ModelAndView getExcel(@ModelAttribute("term") Term term) {
		
		if(term.getStartTime()==null) term.setStartTime(LocalDateTime.of(2019, 2, 15, 0, 0));
		if(term.getEndTime()==null) term.setEndTime(LocalDateTime.now());
		
		List<Respondent> exportResults = zeneService.getRespondents(term);
		
		
		return new ModelAndView(new ExcelReportView(), "exportResults", exportResults);
	}
}
