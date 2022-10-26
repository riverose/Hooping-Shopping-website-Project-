package com.hoo.ping.service;

import java.util.List;

import com.hoo.ping.domain.MyPageVO;


public interface MyPageService {

	MyPageVO getmember(MyPageVO vo);

	List<MyPageVO> payList(int memberId);

	List<MyPageVO> reviewList();
	
	List<MyPageVO> boardList();

	MyPageVO getPay(MyPageVO vo);

	MyPageVO getprofile(MyPageVO vo);
	
	void insertRefund(MyPageVO vo);
	
	MyPageVO getRefund(MyPageVO vo);
	
	void updatePayRefund(MyPageVO vo);

	
}