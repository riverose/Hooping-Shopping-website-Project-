package com.hoo.ping.dao;

import java.util.List;

import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.OptionsVO;

public interface CartDAO {
	
	void insertCart(CartVO vo);
	
	CartVO getCart(CartVO vo);
	
	void deleteCart(String no);
	
	void orderCart(CartVO vo);

	List<CartVO> getCartList(int memberId);

	void updateCart(CartVO vo);

	int countCart(CartVO vo);

	List<Object> getoptions(OptionsVO ovo);
	
	int updateCartCnt(CartVO vo);
	
	List<Integer> cartSum(int memberId);
	
	List<Integer> getCartIdList(int memberId);
	
	
}