package com.cyco.notice.vo;

import java.util.Date;

import com.cyco.utils.utiletc;

import lombok.Data;

@Data
public class NoticeVo {

//	게시글번호
	private int id;
//	조회수
	private int views;
//	rownum?
	private int no;
//	글제목
	private String title;
//	글내용
	private String content;
//	글쓴이
	private String MEMBER_ID;
//	파일이름
	private String filename;
//	파일 경로
	private String filepath;
	
	private String MEMBER_NICKNAME;
	private String name;
//	작성일
	private Date writedate;
//	공지 여부
	private String notice_YN;
//	깊이
	private int dept;
//	순서
	private int step;
//	참조글
	private int root;

//	게시글 긴 제목 짜르기
	public String getShortTitle(Integer len){
        return utiletc.getShortString(title, len);
    }



}
