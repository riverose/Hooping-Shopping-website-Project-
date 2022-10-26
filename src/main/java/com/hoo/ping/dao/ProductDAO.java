package com.hoo.ping.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hoo.ping.domain.FilterVO;
import com.hoo.ping.domain.OptionsVO;
import com.hoo.ping.domain.ProductVO;

public interface ProductDAO {
	// best에서 상품 출력하기, index 에서도 활용 가능
	List<ProductVO> productList(HashMap<String,String> map);
	/*
	 * {
	 * 		return mybatis.selectList("user.productListByGender",gender);
	 * 
	 * 		하고 sql문은
	 * 		
	 * 		select * from product 
	 * 		<if test="gender!=''">
	 * 			where productGender=#{gender}
	 * 		</if>
	 * 		order by productCnt desc
	 * }
	 */
	List<ProductVO> productListByGender(String gender);
	/*
	 * {
	 * 		return mybatis.selectList("user.productListByGender",gender);
	 * 
	 * 		하고 sql문은
	 * 		
	 * 		select * from product 
	 * 		<if test="gender!=''">
	 * 			where productGender=#{gender}
	 * 		</if>
	 * 		order by productCnt desc
	 * }
	 */
	
	// category에서 상품 출력하기
	List<ProductVO> productListByCategory(FilterVO filter);
	/*
	 * {
	 * 		return mybatis.selectList("user.productListByCategory",filter);
	 * 		
	 * 		하고 sql문은
	 * 		
	 * 		select * from product
	 * 		where productGender=#{gender} and productType=#{type} and
	 * 			productPrice between #{priceMin} and #{priceMax}
	 * 		<if test="brand!=''">
	 * 			and productCo=#{brand}
	 * 		</if>
	 * 		order by productCnt desc
	 * }
	 */
	
	// 상품 디테일
	ProductVO productDetail(int productId);
	/*
	 * {
	 * 		return mybatis.selectOne("user.productDetail", productId);
	 * 
	 * 		하고 sql문은
	 * 		
	 * 		select * from product
	 * 		where productId=#{productId}
	 * }
	 */
	
	// 장바구니에서 불러오기
	// 이건 cart 테이블과 join을 해서 불러와야할거같은데 cartVO가 없어서
	// 일단 주석으로 시나리오만 돌려봅니다
	/*
	 * 
	 */
	List<OptionsVO> productOptions(int productid);
	List<OptionsVO> productSize(OptionsVO vo);
	List<ProductVO> productBest(String gender);
	List<ProductVO> productNew();
	
	void insertPay(ProductVO vo);
	
	void upProductCnt(ProductVO vo);
	void downOptStock(HashMap<String, String> opmap);
	ProductVO getProductReviewImg(int productId);
	List<ProductVO> searchProduct(HashMap map);
	List<ProductVO> brandList(HashMap<String,String> map);
	List <ProductVO> filterProduct(Map<String, List<String>> map);
	
	int getOptionsStock(OptionsVO vo);
	
}