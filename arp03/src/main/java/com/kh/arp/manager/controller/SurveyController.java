package com.kh.arp.manager.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.service.LectureService;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.manager.model.service.SurveyService;
import com.kh.arp.manager.model.vo.ForSurvey;
import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.manager.model.vo.SelectSurveyStudent;
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
	
	/**
	 * @param mv 
	 * @param lec_no 수업 넘버
	 * @return s객체는 lec_no번호에 있는 모든 설문조사양식(InsertSurvey) 정보, 강의메인페이지에서-> 설문조사 리스트를 보여준다.
	 */
	@RequestMapping("selectsurvey.ma")
	public ModelAndView selectsurvey(ModelAndView mv, int lec_no) {
		List<InsertSurvey> s= ss.selectsurvey(lec_no);
		mv.addObject("list", s).setViewName("manager/selectsurvey");
		return mv;
	}
	
	/**
	 * @param sss(SelectSurveyStudent) 학생과 강의번호를 담을수있는 객체
	 * @param mv
	 * @param session
	 * @param lec_no
	 * @param sq (SurveyQuestion) 질문양식이 아닌 답과 질문에대한 정보 객체
	 * @return
	 */
	@RequestMapping("selectsurveystudent.ma")
	public ModelAndView selectsurveystudent(SelectSurveyStudent sss, ModelAndView mv, HttpSession session, int lec_no, SurveyQuestion sq) {
		sss.setM_no(((Member)session.getAttribute("mem")).getM_no());
		List<SurveyQuestion> s= ss.selectsurveystudent(sss);
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
		/*
		 * Member m = new Member();
		 * m.setM_no(((Member)session.getAttribute("mem")).getM_no());
		 * is.setM_no(m.getM_no());
		 */
		/*
		 *  System.out.println(q+"model");
		 */
		int result=ss.insertsurvey(is);	// 설문조사 양식을 insert하는 메소드
		int lec_no=((Lecture)session.getAttribute("lec")).getLec_no();
		//---------------------------- insertSurvey 구문-----------------
		int ds =0;			// 질문이 제대로 꽂혔는지 판단하는 변수
		int dd =0;			// 제대로 트랜잭션 리턴값이 올때 판단하는 번수
		if(result>0) {
			List<SurveyQuestion> sq = ss.selectstudentmember(lec_no);	// 특정 수업의 학생들의 번호를 가져오는 메소드
			int j = 1;		// 질문의 순서를 아는 변수
		
			for( Object qq : q.getQuestion()) {
				SurveyQuestion fs= new SurveyQuestion();
				fs.setSq_no(j);
				fs.setQuestion((String)qq);
				for( SurveyQuestion osq:sq ) {
					fs.setM_no(osq.getM_no());
					ds=ss.insertsurveyquestion(fs); 					// 특정설문조사에 질문을 insert하는 메소드
						if(ds<=0) {
							dd+=1;
							break;
						}
					}
					if(ds<=0) {
						dd+=1;
						break;
					}
				j+=1;
			}
		}
//, @RequestParam("qlast") int qlast
		
		if(dd==0) {
			mv.setViewName("redirect:/selectsurvey.ma?lec_no="+lec_no);
		}else {
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("detailsurvey.ma")
	public ModelAndView detailsurvey(ModelAndView mv, int su_no, HttpSession session, SurveyQuestion sq) {
		int m_no=((Member)session.getAttribute("mem")).getM_no();
		sq.setM_no(m_no);
		sq.setSu_no(su_no);
		List<SurveyQuestion> s = ss.detailsurvey(sq);
		String ssq = s.get(0).getEnrolldate();
		int ssu = s.get(0).getSu_no();
		String title = s.get(0).getTitle();
		mv.addObject("s", s).addObject("ssq", ssq).addObject("ssu", ssu).addObject("title", title).setViewName("manager/detailsurvey");
			
			return mv;
		}
	@RequestMapping("detailsurveystudent")
	public ModelAndView detailsurveystudent(ModelAndView mv, int su_no, SurveyQuestion sq) {
		List<SurveyQuestion> ysq = ss.detailsurveyYstudent(su_no);
		List<SurveyQuestion> nsq = ss.detailsurveyNstudent(su_no);
		for(int i= 0; i<ysq.size(); i++) {
			for(int j=i; j<ysq.size();j++) {
				boolean k=ysq.get(i).getName()==ysq.get(j).getName();
				int n=0;
				if(k==true){
					List l=new ArrayList();
					l.add(ysq.get(i).getName());
					n+=1;
					k=false;
				}
			}
		}
		mv.addObject("Ysq", ysq).addObject("Nsq",nsq).addObject("su_no", su_no).setViewName("manager/detailsurveystudent");
		return mv;
	}
	@RequestMapping("insertcompletesurvey.ma")
	public ModelAndView updatesurvey(ModelAndView mv, int lec_no, int su_no, ForSurvey q, String[] answer, HttpSession session) {
		//---------------------------- insertSurvey 구문-----------------
		int ds =0;			// 질문이 제대로 꽂혔는지 판단하는 변수
		int dd =0;			// 제대로 트랜잭션 리턴값이 올때 판단하는 번수
	
		
			int j = 1;		// 질문의 순서를 아는 변수
			SurveyQuestion fs= new SurveyQuestion();
			fs.setM_no(((Member)session.getAttribute("mem")).getM_no());
			fs.setSu_no(su_no);
			
			for( Object qq : q.getAnswer()) {
				System.out.println(qq+"========");
				fs.setAnswer((String)qq);
				fs.setSq_no(j);
				ds=ss.updatesurveyquestion(fs); 					// 특정설문조사에 답을 update하는 메소드
				if(ds<=0) {
							dd+=1;
							break;
						}
						j+=1;
					}
					
				
			
//, @RequestParam("qlast") int qlast
		
		if(dd==0) {
			mv.setViewName("redirect:/selectsurveystudent.ma?lec_no="+lec_no);
		}else {
			mv.setViewName("common/error");
		}
		return mv;
	}

	/*
	 * int lam_no=lsq.get(lsq.size()).getM_no(); sq.setM_no(lam_no); m_no가 필요할때 코드
	 */
	@RequestMapping("resultsurvey.ma")
	public ModelAndView resultsurvey(ModelAndView mv, int su_no,  HttpSession session) {
	
		SurveyQuestion sq = new SurveyQuestion();
	
	sq.setSu_no(su_no);
	//그 수업과 설문에 들어가있는 m_no 리스트
	List<SurveyQuestion> list = ss.selectstudent(sq);
	
	System.out.println(list);
	//그수업과 설문에 들어가있는 m_no의 번호
	int lsm=list.get(0).getM_no();
	sq.setM_no(lsm);
	//sq, 질문, 답 값을 불러오는 메소드
	List<SurveyQuestion> lsq= ss.sq_nosurvey(sq);
	// 최종 질문 순서번호를 알기위한 메소드
	int lastsq_no=lsq.size();
	
	sq.setSq_no(lastsq_no);
	// 질문과 답과 m_no이 담겨있는 List변수
	List<SurveyQuestion> sm= ss.resultsurvey(sq);
	float su_total_m_no=sm.size();
	ArrayList a=new ArrayList();
	// 수업의 만족도의 평균 메소드==============
	for(SurveyQuestion msq: lsq) {
		float m = ss.sumsurvey(msq);// 질문에 대답한 학생들의 답들을 더한값
		float b=m/su_total_m_no;  // 더한값/질문에 대답한 총 학생수
		String c=String.format("%.1f",b);
		a.add(c);					
	}
	// =============================
	mv.addObject("rsq", lsq).addObject("a", a).setViewName("manager/resultsurvey");
		return mv;
	}
}


