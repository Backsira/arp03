package com.kh.arp.FAQ.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.FAQ.model.service.FAQService;
import com.kh.arp.FAQ.model.vo.FAQ;

@Controller
public class FAQContoller {
	@Autowired
	private FAQService fService;
	

@RequestMapping("flist.ad")
public ModelAndView faqListForm(ModelAndView mv) {
	
	ArrayList<FAQ> list = fService.selectList();
	
	mv.addObject("list" , list).setViewName("FAQ/FAQListForm");
	
	return mv;
}
@RequestMapping("finsertForm.ad")
public String faqInsertForm() {
	return "FAQ/insertFAQForm";
}

	
@RequestMapping("finsert.ad")
public String faqInsert(FAQ f) {
	
	int result = fService.insertFAQ(f);
	
	if(result>0) {
		return "redirect:flist.ad";
	}else {
		return null;
	}
}

@RequestMapping("fdelete.ad")
public String deleteFAQ(int faq_no) {
	
	int result = fService.deleteFAQ(faq_no);
	
	
	if(result>0) {
		return "redirect:flist.ad";
	}else {
		return null;
	}
	
}


@RequestMapping("fcategory.ad")
public ModelAndView selectCatgory(String category , ModelAndView mv) {
	
	ArrayList<FAQ> list = fService.selectCategory(category);
	
	mv.addObject("list" , list).setViewName("FAQ/FAQListForm");
	
	return mv;
}




}
