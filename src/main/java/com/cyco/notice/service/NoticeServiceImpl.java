package com.cyco.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.notice.dao.NoticeDAO;
import com.cyco.notice.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public void notice_insert() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeVo> notice_list() {
		// TODO Auto-generated method stub
		return dao.notice_list();
	}

	@Override
	public NoticeVo notice_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void notice_update(NoticeVo vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void notice_delete(int id) {
		// TODO Auto-generated method stub
		
	}

}
