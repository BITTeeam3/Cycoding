package com.cyco.notice.vo;

import java.util.Date;
import lombok.Data;

@Data
public class NoticeVo {
//	게시글번호
	private int id;
//	조회수
	private int views;
//	글제목
	private String title;
//	글내용
	private String content;
//	글쓴이
	private String MEMBER_ID;
//	파일이름
	private String filename;
//	파일경로
	private String filepath;
//	작성일
	private Date writedate;

}
