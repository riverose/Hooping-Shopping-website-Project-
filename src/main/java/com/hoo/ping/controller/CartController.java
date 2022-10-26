package com.hoo.ping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoo.ping.domain.CartVO;
import com.hoo.ping.service.CartService;

@Controller
@RequestMapping("/cart/")
public class CartController {
	
	@Autowired
	private CartService cartService;

	// ----------- s ------------ // -- 장바구니 추가
	@RequestMapping("setCart.do")
	@ResponseBody
	public CartVO setCart(CartVO vo, HttpSession session, String color, String size) {
		
		vo.setCartColor(color);
		vo.setCartSize(size);
		System.out.println("=== setCart 시작===");
		vo.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		int count = cartService.countCart(vo);

		if (count == 0) {
			cartService.insertCart(vo);
		} else {
			// 있으면 update
			cartService.updateCart(vo);
		}
		System.out.println("===setCart===");
		return vo;
	}

	@RequestMapping("deleteCart.do")
	@ResponseBody
	public String deletCart(HttpServletRequest request) {

		System.out.println("확인1");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			cartService.deleteCart(ajaxMsg[i]);
		}
		System.out.println(size);

		return "redirect:/cart/getCartList.do";
	}

	// ----------- e ------------ //
	
	// ----------- s ------------ // -- 장바구니 리스트
	@RequestMapping("getCartList.do")
    public String getCartList(HttpSession session, Model model, CartVO vo){
		System.out.println("===getCartList.do===");
		
        int memberId = (Integer.parseInt(String.valueOf(session.getAttribute("memberId")))); // session에 저장된 userId
        
        List<CartVO> getCartList = cartService.getCartList(memberId); // 장바구니 정보 
        
        List<Integer> cartSumList = cartService.cartSum(memberId);
        
		model.addAttribute("getCartList",getCartList);
		model.addAttribute("cartSumList", cartSumList);
        
        return "/product/cart";
    }
		

	@RequestMapping("updateCartCnt.do")
	@ResponseBody
	public int updateCartCnt(CartVO vo) {
		System.out.println("===updateCartCnt===");
		
		int cnt = cartService.updateCartCnt(vo);
		
		return cnt;
	}
	


	
}