package com.hoo.ping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoo.ping.dao.CouponDAO;
import com.hoo.ping.domain.MemberVO;

@Service("couponService")
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDAO couponDAO;
	
	@Override
	public void addCoupon(MemberVO vo) {
		couponDAO.addCoupon(vo);
		// TODO Auto-generated method stub
		
	}

	@Override
	public int countCoupon(int id) {
		// TODO Auto-generated method stub
		return couponDAO.countCoupon(id);
	}

	@Override
	public List<MemberVO> couponList(int id) {
		// TODO Auto-generated method stub
		return couponDAO.couponList(id);
	}

	@Override
	public MemberVO getCouponById(int id) {
		// TODO Auto-generated method stub
		return couponDAO.getCouponById(id);
	}

	@Override
	public void deleteCoupon(int id) {
		// TODO Auto-generated method stub
		couponDAO.deleteCoupon(id);
		
	}
	
	
	
}
