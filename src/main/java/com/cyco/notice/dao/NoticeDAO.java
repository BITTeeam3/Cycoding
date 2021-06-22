package com.cyco.notice.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cyco.notice.service.NoticeService;
import com.cyco.notice.vo.NoticePage;
import com.cyco.notice.vo.NoticeVo;

@Repository
public class NoticeDAO implements NoticeService {
	
	@Autowired 
	private SqlSession sql;
	
	@Override
	public void notice_insert(NoticeVo vo) {
		sql.insert("NoticeMapper.insert", vo);
	}

	@Override
	public List<NoticeVo> notice_list() {
		return sql.selectList("NoticeMapper.list");
	}

	@Override
	public NoticeVo notice_detail(int id) {
		return sql.selectOne("NoticeMapper.detail", id);
	}

	@Override
	public void notice_update(NoticeVo vo) {
		sql.update("NoticeMapper.update", vo);
	}

	@Override
	public void notice_delete(int id) {
		sql.delete("NoticeMapper.delete", id);
	}
	
	@Override
	public void notice_read(int id) {
		sql.update("NoticeMapper.read", id);
	}
	@Override
	public NoticePage notice_list(NoticePage page) {
		page.setTotalList((Integer) sql.selectOne("NoticeMapper.totalList"));
		page.setList(sql.selectList("NoticeMapper.list", page));
		
		return page;
	}

	@Override
	public void notice_reply_insert(NoticeVo vo) {
		sql.insert("NoticeMapper.reply_insert", vo);
		
	}
}