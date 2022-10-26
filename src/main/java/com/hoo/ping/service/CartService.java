package com.hoo.ping.service;

import java.util.List;

import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.OptionsVO;

public interface CartService {
	
	void insertCart(CartVO vo);
	
	CartVO getCart(CartVO vo);
	
	void deleteCart(String no);
	
	void orderCart(CartVO vo);

	List<CartVO> getCartList(int memberId);

	void updateCart(CartVO vo);
	
	int updateCartCnt(CartVO vo);

	int countCart(CartVO vo);

	List<Object> getoptions(OptionsVO ovo);
	
	List<Integer> cartSum(int memberId);
	
	List<Integer> getCartIdList(int memberId);

}