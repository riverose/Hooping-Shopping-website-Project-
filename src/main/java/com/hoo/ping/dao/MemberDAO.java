package com.hoo.ping.dao;

import java.util.List;

import com.hoo.ping.domain.MemberVO;

public interface MemberDAO {
	
	void saveMember(MemberVO vo);
	
	MemberVO memberCheck( MemberVO vo );
	
	int memberJoin(MemberVO vo);
	
	int memberUpdate(MemberVO vo);
	
	MemberVO memberLogin(MemberVO vo);
	
	List<MemberVO> getMemberList();
	
	MemberVO getMember(MemberVO vo);
	
	int memberUsing(String email);
	
	void updateRateInfo(MemberVO vo);
	
	MemberVO getLastMember();
	
	MemberVO getMemberById(int id);
	
	MemberVO managerCheck(MemberVO vo);
	
}
