package com.hoo.ping.service;

import java.util.List;

import com.hoo.ping.domain.MemberVO;

public interface CouponService {
	void addCoupon(MemberVO vo);
	int countCoupon(int id);
	List<MemberVO> couponList(int id);
	MemberVO getCouponById(int id);
	void deleteCoupon(int id);
}
