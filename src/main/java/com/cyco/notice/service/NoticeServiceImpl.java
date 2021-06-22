package com.cyco.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.notice.dao.NoticeDAO;
import com.cyco.notice.vo.NoticePage;
import com.cyco.notice.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public void notice_insert(NoticeVo vo) {
		dao.notice_insert(vo);
	}
	@Override
	public List<NoticeVo> notice_list() {
		return dao.notice_list();
	}
	@Override
	public NoticeVo notice_detail(int id) {
		return dao.notice_detail(id);
	}
	@Override
	public void notice_update(NoticeVo vo) {
		dao.notice_update(vo);
	}
	@Override
	public void notice_delete(int id) {
		dao.notice_delete(id);
	}
	@Override
	public void notice_read(int id) {
		dao.notice_read(id);
	}
	@Override
	public NoticePage notice_list(NoticePage page) {
		return dao.notice_list(page);
	}
	@Override
	public void notice_reply_insert(NoticeVo vo) {
		dao.notice_reply_insert(vo);
		
	}

}
