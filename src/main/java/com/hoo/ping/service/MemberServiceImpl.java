package com.hoo.ping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoo.ping.dao.MemberDAOImpl;
import com.hoo.ping.domain.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	

	@Autowired
	private MemberDAOImpl memberDAO;
	
	@Override
	public void saveMember(MemberVO vo) {
		memberDAO.saveMember(vo);
	}

	public MemberVO memberCheck_Login(MemberVO vo) {
		return memberDAO.memberCheck(vo);
	}

	public void memberJoin(MemberVO vo) {
		memberDAO.memberJoin(vo);
	}

	public void memberUpdate(MemberVO vo) {
		memberDAO.memberUpdate(vo);
	}
	
	public List<MemberVO> getMemberList() {
		return memberDAO.getMemberList();
	}
	
	@Override
	public MemberVO getMember(MemberVO vo) {
		System.out.println("ServiceIn");
		return memberDAO.getMember(vo);
	}
	
	@Override
	public int memberUsing(String email) {
		int cnt = memberDAO.memberUsing(email);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	@Override
	public void updateRateInfo(MemberVO vo) {
		memberDAO.updateRateInfo(vo);
		
	}

	@Override
	public MemberVO getLastMember() {
		return memberDAO.getLastMember();
	}

	@Override
	public MemberVO getMemberById(int id) {
		return memberDAO.getMemberById(id);
	}

	@Override
	public MemberVO managerCheck_Login(MemberVO vo) {
		return memberDAO.managerCheck(vo);
	}
	

}
