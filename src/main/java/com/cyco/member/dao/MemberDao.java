package com.cyco.member.dao;

import java.util.List;

import com.cyco.member.vo.MemberVo;
import com.cyco.member.vo.PositionVo;

public interface MemberDao {
	//ȸ�����
	public List<MemberVo> getMemberList();
	
	//�����Ǹ��
	public List<PositionVo> getPositionList();
	
	//�����Ǳ�� ���͸�
	public List<MemberVo> getMemberPosition(String position);
	
	//�г��� �˻�
	public List<MemberVo> getMemberNickname(String nickname);
}
