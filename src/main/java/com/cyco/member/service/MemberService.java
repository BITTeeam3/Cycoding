package com.cyco.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyco.member.dao.MemberDao;
import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.PositionVo;

@Service
public class MemberService {
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//ȸ�����
	public List<MemberVo> memberList() {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		List<MemberVo> memberList = memberdao.getMemberList();
		System.out.println("ȸ����Ϻҷ�����");
		/*
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("memberList", memberList);
		mv.setViewName("Member/MemberList");
		*/
		return memberList;
	}
	
	//�����Ǹ�� �ҷ�����
	public List<PositionVo> positionList() {
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		List<PositionVo> positionList = memberdao.getPositionList();
		System.out.println("�����Ǹ�� �ҷ�����");
		
		return positionList;
	}
	
	//������select ������
	public List<MemberVo> memberPosition(String position) {
		System.out.println("(memberservice)���������͸�, position: " + position);
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		System.out.println("memberPosition ���ۿ���Ϸ�");
		
		List<MemberVo> memberPosition = memberdao.getMemberPosition(position);
		
		System.out.println("�����Ǻҷ�����: " + memberPosition);
		
		return memberPosition;
	}
	
	//�г���Search ������
	public List<MemberVo> memberNickname(String nickname) {
		System.out.println("(memberservice)�г��Ӱ˻�, nickname: " + nickname);
		
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		
		List<MemberVo> memberNickname = memberdao.getMemberNickname(nickname);
		
		return memberNickname;
	}
	
}
