package com.hoo.ping.service;

import java.util.List;

import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.OrderPageVO;

public interface OrderPageService {

	OrderPageVO getmember(OrderPageVO vo);

	void insertPay(OrderPageVO vo);

	void insertDV(OrderPageVO vo);

//	OrderPageVO getcoupon(OrderPageVO vo);

	OrderPageVO getProduct(OrderPageVO vo);

	List<OrderPageVO> getOrderList();

	void insertOption(OrderPageVO vo);

	List<OrderPageVO> getOptions();

	List<OrderPageVO> getOptions1();
	
/* 카트 추가 */
	int addCart(CartVO VO);
	
	/* 카트 삭제 */
	int deleteCart(int cartId);
	
	/* 카트 수량 수정 */
	int modifyCount(CartVO VO);
	
	/* 카트 목록 */
	List<CartVO> getCart();	
	
	/* 카트 확인 */
	List<CartVO> checkCart();
	
	void insertCartPay(int cartId);
	
	void deleteAllCart(int memberId);
}