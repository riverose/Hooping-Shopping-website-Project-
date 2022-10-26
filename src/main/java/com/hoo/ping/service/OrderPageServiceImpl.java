package com.hoo.ping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.dao.OrderPageDAO;
import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.OrderPageVO;

@Repository("orderPageService")


public class OrderPageServiceImpl implements OrderPageService{

	@Autowired
	OrderPageDAO orderPageDAO;



	@Override
	public OrderPageVO getmember(OrderPageVO vo) {
		// TODO Auto-generated method stub
		return orderPageDAO.getmember(vo);
	}


	@Override
	public void insertPay(OrderPageVO vo) {
		// TODO Auto-generated method stub
		orderPageDAO.insertPay(vo);
	}


	@Override
	public void insertDV(OrderPageVO vo) {
		// TODO Auto-generated method stub
		orderPageDAO.insertDV(vo);
	}


	@Override
	public OrderPageVO getProduct(OrderPageVO vo) {
		// TODO Auto-generated method stub
		return orderPageDAO.getProduct(vo);
	}


	@Override
	public List<OrderPageVO> getOrderList() {
		// TODO Auto-generated method stub
		return orderPageDAO.getOrderList();
	}


	@Override
	public void insertOption(OrderPageVO vo) {
		orderPageDAO.insertOption(vo);
		
	}


	@Override
	public List<OrderPageVO> getOptions() {
		// TODO Auto-generated method stub
		return orderPageDAO.getOptions();
	}


	@Override
	public List<OrderPageVO> getOptions1() {
		// TODO Auto-generated method stub
		return orderPageDAO.getOptions1();
	}

@Override
	public int addCart(CartVO VO) {
		return orderPageDAO.addCart(VO);
	}


	@Override
	public int deleteCart(int cartId) {
		return orderPageDAO.deleteCart(cartId);
	}


	@Override
	public int modifyCount(CartVO VO) {
		return orderPageDAO.modifyCount(VO);
	}


	@Override
	public List<CartVO> getCart() {
		return orderPageDAO.getCart();
	}


	@Override
	public List<CartVO> checkCart() {
		return orderPageDAO.checkCart();
	}


	@Override
	public void insertCartPay(int cartId) {
		orderPageDAO.insertCartPay(cartId);
	}


	@Override
	public void deleteAllCart(int memberId) {
		orderPageDAO.deleteAllCart(memberId);
	}
	
}