package com.cyco.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cyco.notice.service.NoticeService;
import com.cyco.notice.vo.NoticeVo;

@Repository
public class NoticeDAO implements NoticeService {
	
	@Autowired private SqlSession sql;
	
	@Override
	public void notice_insert() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<NoticeVo> notice_list() {
		return sql.selectList("NoticeMapper.list");
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