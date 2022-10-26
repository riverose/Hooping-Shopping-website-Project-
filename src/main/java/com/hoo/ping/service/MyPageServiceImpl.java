package com.hoo.ping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoo.ping.dao.MyPageDAO;
import com.hoo.ping.domain.MyPageVO;


@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO myPageDAO;

	@Override
	public MyPageVO getmember(MyPageVO vo) {
		return myPageDAO.getmember(vo);
		
	}
	@Override
	public List<MyPageVO> payList(int memberId) {
		return myPageDAO.payList(memberId);
	}
	@Override
	public List<MyPageVO> reviewList() {
		return myPageDAO.reviewList();
	}
	@Override
	public MyPageVO getPay(MyPageVO vo) {
		return myPageDAO.getPay(vo);
	}
	@Override
	public MyPageVO getprofile(MyPageVO vo) {
		return myPageDAO.getprofile(vo);
	}
	@Override
	public List<MyPageVO> boardList() {
		return myPageDAO.boardList();
	}

	@Override
	public void insertRefund(MyPageVO vo) {
		myPageDAO.insertRefund(vo);
	}
	@Override
	public MyPageVO getRefund(MyPageVO vo) {
		return myPageDAO.getRefund(vo);
	}
	@Override
	public void updatePayRefund(MyPageVO vo) {
		myPageDAO.updatePayRefund(vo);
		
	}
	
}