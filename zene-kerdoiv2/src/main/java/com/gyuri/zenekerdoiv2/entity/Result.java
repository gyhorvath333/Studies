package com.gyuri.zenekerdoiv2.entity;

import java.util.ArrayList;

public class Result {
	
	Respondent resp = new Respondent();
	
	ArrayList<String> answers = new ArrayList<String>();
	

	
	Result() {
		
	}
	
	Result(Respondent resp, ArrayList<String> answers) {
		this.resp=resp;
		this.answers=answers;
	}
	
	
}
