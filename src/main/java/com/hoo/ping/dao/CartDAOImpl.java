package com.hoo.ping.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.OptionsVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertCart(CartVO vo) {
		mybatis.insert("cartDAO.insertCart",vo);
	}

	@Override
	public CartVO getCart(CartVO vo) {
		return mybatis.selectOne("cartDAO.getCart",vo);
	}

	@Override
	public void deleteCart(String no) {
		mybatis.delete("cartDAO.deleteCart",no);
	}

	@Override
	public void orderCart(CartVO vo) {
		mybatis.selectOne("cartDAO.orderCart", vo);
	}

	@Override
    public List<CartVO> getCartList(int memberId) {
        return mybatis.selectList("cartDAO.getCartList", memberId);
    }

	
	@Override
	public void updateCart(CartVO vo) {
		mybatis.update("cartDAO.updateCart", vo);
	}
	
	@Override
    public int countCart(CartVO vo) {
        return mybatis.selectOne("cartDAO.countCart", vo);
    }
	

	public List<Object> getoptions(OptionsVO ovo) {
		return mybatis.selectList("cartDAO.getoptions", ovo);
	}

	@Override
	public int updateCartCnt(CartVO vo) {
		return mybatis.update("cartDAO.updateCartCnt", vo);
	}

	@Override
	public List<Integer> cartSum(int memberId) {
		return mybatis.selectList("cartDAO.cartSum", memberId);
	}

	@Override
	public List<Integer> getCartIdList(int memberId) {
		return mybatis.selectList("cartDAO.getCartIdList", memberId);
	}

}