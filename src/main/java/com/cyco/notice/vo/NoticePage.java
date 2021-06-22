package com.cyco.notice.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class NoticePage extends PageVO {
	private List<NoticeVo> list;
	
	public List<NoticeVo> getList() {
		return list;
	}

	public void setList(List<NoticeVo> list) {
		this.list = list;
	}
}
