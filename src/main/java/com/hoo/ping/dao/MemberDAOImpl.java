package com.hoo.ping.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.domain.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void saveMember(MemberVO vo) {
		mybatis.insert("memberDAO.insertMember", vo);
	}
	
	@Override
	public MemberVO memberCheck(MemberVO vo) {
		System.out.println("===> MemberMapper memberCheck ����");
		return mybatis.selectOne("memberDAO.memberCheck", vo);
	}

	@Override
	public int memberJoin(MemberVO vo) {
		
		return mybatis.insert("memberDAO.memberJoin", vo);
	}
	
	@Override
	public int memberUpdate(MemberVO vo) {
		
		return mybatis.update("memberDAO.memberUpdate", vo);
	}
	

	@Override
	public MemberVO memberLogin(MemberVO vo) {
		System.out.println("===> MemberMapper memberCheck ����");
		return mybatis.selectOne("memberDAO.memberCheck", vo);
	}
	
	
	@Override
	public List<MemberVO> getMemberList() {
		return mybatis.selectList("memberDAO.getMemberList");
	}
	
	@Override
	public MemberVO getMember(MemberVO vo) {
		System.out.println("Dao in");
		return mybatis.selectOne("memberDAO.getMember",vo);
	}

	public int memberUsing(String email) {
		return mybatis.selectOne("memberDAO.memberUsing", email);
	}
	
	@Override
	public void updateRateInfo(MemberVO vo) {
		mybatis.update("memberDAO.updateRateInfo",vo);
		
	}

	@Override
	public MemberVO getLastMember() {
		return mybatis.selectOne("memberDAO.getLastMember");
	}

	@Override
	public MemberVO getMemberById(int id) {
		return mybatis.selectOne("memberDAO.getMemberById",id);
	}

	@Override
	public MemberVO managerCheck(MemberVO vo) {
		return mybatis.selectOne("memberDAO.managerCheck", vo);
	}
	
	
}
