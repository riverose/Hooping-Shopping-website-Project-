package com.hoo.ping.dao;

import java.util.List;

import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.OrderPageVO;

public interface OrderPageDAO {

	OrderPageVO getmember(OrderPageVO vo);

	void insertPay(OrderPageVO vo);

	void insertDV(OrderPageVO vo);

	OrderPageVO getProduct(OrderPageVO vo);

	List<OrderPageVO> getOrderList();

	void insertOption(OrderPageVO vo);

	List<OrderPageVO> getOptions();

	List<OrderPageVO> getOptions1();

	int addCart(CartVO vO);

	int deleteCart(int cartId);

	int modifyCount(CartVO vO);

	List<CartVO> getCart();

	List<CartVO> checkCart();
	
	void insertCartPay(int cartId);

	void deleteAllCart(int memberId);


}