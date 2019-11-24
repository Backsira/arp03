package com.kh.arp.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.service.LectureService;
import com.kh.arp.manager.model.service.SurveyService;
import com.kh.arp.manager.model.vo.CompleteSurvey;
import com.kh.arp.manager.model.vo.ForSurvey;
import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.manager.model.vo.SurveyQuestion;
import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Member;

@Controller
public class SurveyController {

	@Autowired
	private LectureService ls;
	@Autowired
	private MemberService ms;
	@Autowired
	private SurveyService ss;
	
	@RequestMapping("selectsurvey.ma")
	public ModelAndView selectsurvey(ModelAndView mv) {
		List<InsertSurvey> s= ss.selectsurvey();
		mv.addObject("list", s).setViewName("manager/selectsurvey");
		return mv;
	}
	
	@RequestMapping("daysurvey.ma")
	public ModelAndView daysurvey(ModelAndView mv) {
		mv.setViewName("manager/insertFormSurvey");
		return mv;
	}
	
	@RequestMapping("insertsurvey.ma")
	public ModelAndView insertsurvey(ModelAndView mv, ForSurvey q, InsertSurvey is, HttpSession session) {
		Member m = new Member();
		m.setM_no(((Member)session.getAttribute("mem")).getM_no());
		is.setM_no(m.getM_no());
		System.out.println(is+"-------------");
		System.out.println(q+"model");
		int result=ss.insertsurvey(is);
		//---------------------------- insertSurvey 구문-----------------
		int ds =0;
		if(result>0) {
			List<SurveyQuestion> sq = ss.selectstudentmember();
			int j = 1;
			for( Object qq : q.getQuestion()) {
				System.out.println(qq+"========");
				SurveyQuestion fs= new SurveyQuestion();
				fs.setSq_no(j);
				fs.setQuestion((String)qq);
				for( Object osq:sq ) {
					fs.setM_no((int)osq);
					ds=ss.insertsurveyquestion(fs); 
						if(ds<=0) {
							break;
						}
					}
					if(ds<=0) {
						break;
					}
				j+=1;
			}
		}
//, @RequestParam("qlast") int qlast
		
		if(ds>0) {
			mv.setViewName("redirect:/selectsurvey.ma");
		}else {
			mv.setViewName("");
		}
		return mv;
	}
	
	@RequestMapping("detailsurvey.ma")
	public ModelAndView detailsurvey(ModelAndView mv, int su_no) {
		InsertSurvey s = ss.detailsurvey(su_no); 
		List<SurveyQuestion> sq = ss.detailsurveyquestion(su_no);
		mv.addObject("s", s).setViewName("manager/detailsurvey");
		return mv;
	}
	@RequestMapping("insertcompletesurvey.ma")
	public ModelAndView updatesurvey(ModelAndView mv, InsertSurvey is, CompleteSurvey cs, HttpSession session) {
		Member m = new Member();
		m.setM_no(((Member)session.getAttribute("mem")).getM_no());
		cs.setM_no(m.getM_no());
		
		int result = ss.insertcompletesurvey(cs);
		mv.setViewName("redirect:/selectsurvey.ma");
		return mv;
	}
}
