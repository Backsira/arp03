package com.kh.arp.calendar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.arp.calendar.model.service.CalendarService;
import com.kh.arp.calendar.model.vo.Calendar;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	
	@RequestMapping("calmain.ca")
	public String calendarMain() {
		return "calendar/calendar";
	}
	
	@ResponseBody
	@RequestMapping("insert.ca")
	public String insertCalendar(Calendar c) {
		//System.out.println(c);
		int rst = cService.insertCalendar(c);
		if(rst > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="calList.ca", produces="application/json; charset=UTF-8")
	public String selectList(int m_no) {
		ArrayList<Calendar> list = cService.selectCalList(m_no);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("updatedate.ca")
	public String updateCalendar(Calendar c) {
		//System.out.println(c);
		int rst = cService.updateCalendar(c);
		if(rst > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updatetitle.ca")
	public String updateTitle(Calendar c) {
		//System.out.println(c);
		int rst = cService.updateTitle(c);
		if(rst > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteCal.ca")
	public String deleteCalendar(Calendar c) {
		//System.out.println(c);
		int rst = cService.deleteCalendar(c);
		if(rst > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("movedate.ca")
	public String moveCalendar(Calendar c) {
		//System.out.println(c);
		int rst = cService.moveCalendar(c);
		if(rst > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
}
