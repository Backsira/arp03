package com.kh.arp.message.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arp.member.model.vo.Member;
import com.kh.arp.message.model.dao.messageDao;
import com.kh.arp.message.model.vo.Dto;
import com.kh.arp.message.model.vo.Message;

@Service
public class messageServiceImpl implements messageService {
	
	@Autowired
	private messageDao mDao;

	@Override
	public int insertMsg(Message m) {
		return mDao.insertMsg(m);
	}

	@Override
	public ArrayList<Message> selectList(int m_no) {
		return mDao.selectList(m_no);
	}

	@Override
	public Message detailMsg(int ms_no) {

		return mDao.detailMsg(ms_no);
	}

	@Override
	public ArrayList<Message> listSendMsg(int m_no) {
		return mDao.listSendMsg(m_no);
	}

	@Override
	public int updateDate(int m_no) {
		return mDao.updateDate(m_no);
	}

	@Override
	public List<Dto> searchList(Dto dto) {
		return mDao.searchList(dto);
	}


	@Override
	public int selectMcount(int m_no) {
		return mDao.selectMcount(m_no);
	}

	@Override
	public ArrayList<Message> selectNList(int m_no) {
		return mDao.selectNList(m_no);
	}

	@Override
	public int updateAlram(int m_no) {

		return mDao.updateAlram(m_no);
	}

	@Override
	public int getListCount(int m_no) {
		
		return mDao.getListCount(m_no);
	}

	@Override
	public Message reSendMsgForm(int ms_no) {
	    return mDao.reSendMsgForm(ms_no);
	}

	@Override
	public ArrayList<Member> selectMember() {
		return mDao.selectMember();
	}
	
	



}
