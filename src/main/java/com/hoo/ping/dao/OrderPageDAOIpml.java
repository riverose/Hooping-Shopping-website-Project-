package com.hoo.ping.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.OrderPageVO;

@Repository("orderPageDAO")
public class OrderPageDAOIpml implements OrderPageDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public OrderPageVO getmember(OrderPageVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MPODDAO.getmember1", vo);
	}

	@Override
	public void insertPay(OrderPageVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("MPODDAO.insertPay", vo);
	}

	@Override
	public void insertDV(OrderPageVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("MPODDAO.insertDV", vo);
	}

//	@Override
//	public OrderPageVO getcoupon(OrderPageVO vo) {
//		// TODO Auto-generated method stub
//		return mybatis.selectOne("MPODDAO.getcoupon", vo);
//	}

	@Override
	public OrderPageVO getProduct(OrderPageVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MPODDAO.getProduct", vo);
	}

	@Override
	public List<OrderPageVO> getOrderList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MPODDAO.getOrderList");
	}

	@Override
	public void insertOption(OrderPageVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("MPODDAO.insertOption", vo);
	}

	@Override
	public List<OrderPageVO> getOptions() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MPODDAO.getOptions");
	}

	@Override
	public List<OrderPageVO> getOptions1() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MPODDAO.getOptions1");
	}

	@Override
	public int addCart(CartVO VO) {
		return mybatis.insert("MPODDAO.addCart", VO);
	}

	@Override
	public int deleteCart(int cartId) {
		return mybatis.delete("MPODDAO.deleteCart", cartId);
	}

	@Override
	public int modifyCount(CartVO VO) {
		return mybatis.update("MPODDAO.modifyCount", VO);
	}

	@Override
	public List<CartVO> getCart() {
		return mybatis.selectList("MPODDAO.getCart");
	}

	@Override
	public List<CartVO> checkCart() {
		return mybatis.selectList("MPODDAO.checkCart");
	}

	@Override
	public void insertCartPay(int cartId) {
		mybatis.insert("MPODDAO.insertCartPay", cartId);
	}

	@Override
	public void deleteAllCart(int memberId) {
		mybatis.delete("MPODDAO.deleteAllCart", memberId);
	}
}