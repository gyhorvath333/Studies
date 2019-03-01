package com.gyuri.zenekerdoiv2.jdbc;


import com.gyuri.zenekerdoiv2.entity.Respondent;
import com.gyuri.zenekerdoiv2.service.ZeneService;
import com.gyuri.zenekerdoiv2.service.ZeneServiceImpl;

public class HibernateTest {

	public static void main(String[] args) {
		
		
		ZeneService zeneService = new ZeneServiceImpl();
		
		Respondent tempResp=zeneService.getRespondent(20);
		
		tempResp.toString();

	}

}
