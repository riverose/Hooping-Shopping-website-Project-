package com.hoo.ping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoo.ping.dao.CartDAO;
import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.OptionsVO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDAO cartDAO;

	@Override
	public void insertCart(CartVO vo) {
		cartDAO.insertCart(vo);
	}
	
	@Override
	public CartVO getCart(CartVO vo) {
		return cartDAO.getCart(vo);
	}

	@Override
	public void deleteCart(String no) {
		cartDAO.deleteCart(no);
	}

	@Override
	public void orderCart(CartVO vo) {
		cartDAO.orderCart(vo);
	}
	
	@Override
    public List<CartVO> getCartList(int memberId) {
        return cartDAO.getCartList(memberId);
    }
	
	@Override
	public void updateCart(CartVO vo) {
		cartDAO.updateCart(vo);
	}
	
	// 6. 장바구니 상품 확인
    @Override
    public int countCart(CartVO vo) {
        return cartDAO.countCart(vo);
    }
    

	@Override
	public List<Object> getoptions(OptionsVO ovo) {
		return cartDAO.getoptions(ovo);
		
	}

	@Override
	public int updateCartCnt(CartVO vo) {
		return cartDAO.updateCartCnt(vo);
	}

	@Override
	public List<Integer> cartSum(int memberId) {
		return cartDAO.cartSum(memberId);
	}

	@Override
	public List<Integer> getCartIdList(int memberId) {
		return cartDAO.getCartIdList(memberId);
	}

    
}