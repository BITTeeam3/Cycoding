package com.cyco.notice.service;

import java.util.List;
import com.cyco.notice.vo.NoticeVo;

public interface NoticeService {
	//공지글 저장
	void notice_insert();
	//공지글 목록 조회
	List<NoticeVo> notice_list();
	//공지글 상세 조회
	NoticeVo notice_detail(int id);
	//공지글 변경 저장
	void notice_update(NoticeVo vo);
	//공지글 삭제
	void notice_delete(int id); 
}
