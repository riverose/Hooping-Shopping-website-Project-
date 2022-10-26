package com.hoo.ping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hoo.ping.domain.OptionsVO;
import com.hoo.ping.domain.ProductVO;

public interface ProductService {
	
	List <ProductVO> getProductList(String gender, String type);
	ProductVO getProductDetail(int productId);
//----------------------1017이미지----------
	ProductVO getProductReviewImg(int productId);
//--------------------------------
	List <OptionsVO> getProductOptions(int productid);
	List <OptionsVO> getProductSize(OptionsVO vo);
	void insertPay(ProductVO vo);
	List <ProductVO> getBestProductList(String gender);
	List <ProductVO> getNewProductList();
	void upProductCnt(ProductVO vo);
	void downOptStock(HashMap<String, String> opmap);
//----------------------1017검색----------
	List<ProductVO> searchProduct(HashMap map);
	List <ProductVO> getBrandList(String gender, String type);
	List <ProductVO> getFilterProduct(Map<String, List<String>> map);
	int getOptionsStock(OptionsVO vo);
}