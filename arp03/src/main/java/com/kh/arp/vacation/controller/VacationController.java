package com.kh.arp.vacation.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class VacationController {

	
	@RequestMapping("vList.me")
	public String vacationListForm() {
		
		return "vacation/vacationListForm";
	}
}