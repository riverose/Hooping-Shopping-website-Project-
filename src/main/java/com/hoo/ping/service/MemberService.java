package com.hoo.ping.service;

import java.util.List;

import com.hoo.ping.domain.MemberVO;

public interface MemberService {
	
	void saveMember(MemberVO vo);
	
	public MemberVO memberCheck_Login( MemberVO vo);
	
	public void memberJoin(MemberVO vo );
	
	public List<MemberVO> getMemberList();

	public void memberUpdate(MemberVO vo);
	
	MemberVO getMember(MemberVO vo);
	
	public int memberUsing(String email);
	
	void updateRateInfo(MemberVO vo);
	
	MemberVO getLastMember();
	
	MemberVO getMemberById(int id);
	
	MemberVO managerCheck_Login(MemberVO vo);
}
