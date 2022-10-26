package com.hoo.ping.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.domain.MyPageVO;

@Repository("myPageDAO")
public class MyPageDAOIpml implements MyPageDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public MyPageVO getmember(MyPageVO vo) {
		return mybatis.selectOne("MPODDAO.getmember", vo);
	}

	@Override
	public List<MyPageVO> payList(int memberId) {
		// TODO Auto-generated method stub
		return mybatis.selectList("MPODDAO.payList", memberId);
	}

	@Override
	public List<MyPageVO> reviewList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MPODDAO.reviewList");
	}

	@Override
	public MyPageVO getPay(MyPageVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MPODDAO.getPay", vo);
	}

	@Override
	public MyPageVO getprofile(MyPageVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MPODDAO.getprofile", vo);
	}

	@Override
	public List<MyPageVO> boardList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MPODDAO.boardList");
	}

	@Override
	public void insertRefund(MyPageVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("MPODDAO.insertRefund",vo);
		
	}

	@Override
	public MyPageVO getRefund(MyPageVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MPODDAO.getRefund",vo);
	}

	@Override
	public void updatePayRefund(MyPageVO vo) {
		// TODO Auto-generated method stub
		mybatis.update("MPODDAO.updatePayRefund",vo);
		
	}
}