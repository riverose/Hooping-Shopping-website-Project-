package com.hoo.ping.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.domain.FilterVO;
import com.hoo.ping.domain.OptionsVO;
import com.hoo.ping.domain.ProductVO;

@Repository("ProductDAO")
public class ProductDAOImpl implements ProductDAO {
	private SqlSessionTemplate mybatis;

	@Autowired
	ProductDAOImpl(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public List<ProductVO> productList(HashMap<String,String> map) {
		return mybatis.selectList("product.productList", map);
	}

	@Override
	public List<ProductVO> productListByGender(String gender) {
		return null;
	}

	@Override
	public List<ProductVO> productListByCategory(FilterVO filter) {
		return null;
	}

	@Override
	public ProductVO productDetail(int productid) {
		return mybatis.selectOne("product.productDetail",productid);
	}

	@Override
	public List<OptionsVO> productOptions(int productid) {
		return mybatis.selectList("product.productOptions",productid);
	}

	@Override
	public List<OptionsVO> productSize(OptionsVO vo) {
		return mybatis.selectList("product.productOptionsSize",vo);
	}

	@Override
	public void insertPay(ProductVO vo) {
		mybatis.insert("MPODDAO.insertPay",vo);
		
	}
	
	@Override
	public List<ProductVO> productBest(String gender) {
		if(gender.contains("A")) {
			return mybatis.selectList("product.productBestAll");
		}
		else {
			return mybatis.selectList("product.productBestGender",gender);

		}
	}

	@Override
	public List<ProductVO> productNew() {
		System.out.println("3");

		return mybatis.selectList("product.productNew");
	}

	@Override
	public void upProductCnt(ProductVO vo) {
		mybatis.update("product.upProductCnt", vo);
		
	}

	@Override
	public void downOptStock(HashMap<String, String> opmap) {
		mybatis.update("product.downOptStock",opmap);
	}
// --------------------1017이미지
@Override
	public ProductVO getProductReviewImg(int productid) {
		return mybatis.selectOne("product.productReviewImg", productid);
	}
//---------------------1017검색
	@Override
	public List<ProductVO> searchProduct(HashMap map) {
		return  mybatis.selectList("product.searchProduct", map);
	}
	@Override
	public List<ProductVO> brandList(HashMap<String, String> map) {
		return mybatis.selectList("product.brandList", map);
	}

	@Override
	public List<ProductVO> filterProduct(Map<String, List<String>> map) {
		return mybatis.selectList("product.filterList",map);
	}

	@Override
	public int getOptionsStock(OptionsVO vo) {
		return mybatis.selectOne("product.getOptionsStock", vo);
	}

}