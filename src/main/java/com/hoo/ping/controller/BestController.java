package com.hoo.ping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoo.ping.domain.ProductVO;
import com.hoo.ping.service.ProductService;

@Controller
@RequestMapping("/best/")
public class BestController {
	
	private ProductService productService;
	
	@Autowired
	public BestController(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping("getBestProductList.do")
	public String getBestProductList(HttpServletRequest request,Model model) {
		System.out.println("=== getBestProductList.do ===");
		String gender = request.getParameter("gender");
		System.out.println(gender);
		List<ProductVO> blist=productService.getBestProductList(gender);
		for(ProductVO item : blist) {
			item.setProductName(item.getProductName().replace('_', ' '));
		}
		List<ProductVO> toplist=blist.subList(0, 3);
		blist=blist.subList(3,9);

		model.addAttribute("blist",blist);
		model.addAttribute("toplist",toplist);
//		productService.getBestProductList();
		
		return "/product/best";
	}
}
