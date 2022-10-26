package com.hoo.ping.dao;

import java.util.List;

import com.hoo.ping.domain.MemberVO;

public interface CouponDAO {
	void addCoupon(MemberVO vo);
	int countCoupon(int id);
	List<MemberVO> couponList(int id);
	MemberVO getCouponById(int id);
	void deleteCoupon(int id);
}
