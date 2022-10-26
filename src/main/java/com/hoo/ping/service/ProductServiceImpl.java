package com.hoo.ping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoo.ping.dao.ProductDAO;
import com.hoo.ping.domain.OptionsVO;
import com.hoo.ping.domain.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	private final ProductDAO productDAO;
	
	@Autowired
	ProductServiceImpl(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	@Override
	public List<ProductVO> getProductList(String gender, String type) {
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("gender",gender);
		map.put("type",type);
		return productDAO.productList(map);
	}
	@Override
	public ProductVO getProductDetail(int productId) {
		// TODO Auto-generated method stub
		return productDAO.productDetail(productId);
	}
	@Override
	public List<OptionsVO> getProductOptions(int productid) {
		// TODO Auto-generated method stub
		return productDAO.productOptions(productid);
	}
	@Override
	public List<OptionsVO> getProductSize(OptionsVO vo) {
		// TODO Auto-generated method stub
		return productDAO.productSize(vo);
	}
	@Override
	public void insertPay(ProductVO vo) {
		productDAO.insertPay(vo);
		
	}
	@Override
	public List<ProductVO> getBestProductList(String gender) {
		return productDAO.productBest(gender);
	}
	@Override
	public List<ProductVO> getNewProductList() {
		// TODO Auto-generated method stub
		System.out.println("2");

		return productDAO.productNew();
	}
	@Override
	public void upProductCnt(ProductVO vo) {
		// TODO Auto-generated method stub
		productDAO.upProductCnt(vo);
	}
	@Override
	public void downOptStock(HashMap<String, String> opmap) {
		// TODO Auto-generated method stub
		productDAO.downOptStock(opmap);
	}
//이미지-----------------1017
	@Override
	public ProductVO getProductReviewImg(int productId) {
		// TODO Auto-generated method stub
		return productDAO.getProductReviewImg(productId);
	}
	//--------------------------1017검색
	@Override
	public List<ProductVO> searchProduct(HashMap map) {
		// TODO Auto-generated method stub
		return productDAO.searchProduct(map);
	}
	@Override
	public List<ProductVO> getBrandList(String gender, String type) {
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("gender",gender);
		map.put("type",type);
		return productDAO.brandList(map);
	}
	@Override
	public List<ProductVO> getFilterProduct(Map<String, List<String>> map) {
		// TODO Auto-generated method stub
		return productDAO.filterProduct(map);
	}
	@Override
	public int getOptionsStock(OptionsVO vo) {
		return productDAO.getOptionsStock(vo);
	}

}