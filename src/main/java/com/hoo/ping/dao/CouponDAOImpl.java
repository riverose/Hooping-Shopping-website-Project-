package com.hoo.ping.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.domain.MemberVO;

@Repository("couponDAO")
public class CouponDAOImpl implements CouponDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void addCoupon(MemberVO vo) {
		mybatis.insert("couponDAO.addCoupon",vo);
		// TODO Auto-generated method stub
		
	}

	@Override
	public int countCoupon(int id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("couponDAO.countCoupon",id);
	}

	@Override
	public List<MemberVO> couponList(int id) {
		// TODO Auto-generated method stub
		return mybatis.selectList("couponDAO.couponList",id);
	}

	@Override
	public MemberVO getCouponById(int id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("couponDAO.getCouponById",id);
	}

	@Override
	public void deleteCoupon(int id) {
		// TODO Auto-generated method stub
		mybatis.delete("couponDAO.deleteCoupon",id);
		
	}
	
	

}
