package com.hoo.ping.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoo.ping.domain.CartVO;
import com.hoo.ping.domain.MemberVO;
import com.hoo.ping.domain.OrderPageVO;
import com.hoo.ping.domain.ProductVO;
import com.hoo.ping.service.CartService;
import com.hoo.ping.service.CouponService;
import com.hoo.ping.service.OrderPageService;
import com.hoo.ping.service.ProductService;

@Controller
@RequestMapping("/order/")
public class OrderPageController {
	
	@Autowired
	private CartService cartServcice;
	
	@Autowired
	private OrderPageService orderPageService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CouponService couponService;

	@RequestMapping("orderProduct.do")
	public String get(HttpServletRequest request, OrderPageVO vo, Model model, HttpSession session, String color,
			String size, String cartCount) {
		vo.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		vo.setMemberName(String.valueOf(session.getAttribute("memberName")));
		vo.setMemberPhoneNum(String.valueOf(session.getAttribute("memberPhoneNum")));
		vo.setMemberBaseAddress(String.valueOf(session.getAttribute("memberBaseAddress")));
		orderPageService.getmember(vo);

		int productid = Integer.parseInt(request.getParameter("productid"));
		System.out.println(productid);

		ProductVO product = productService.getProductDetail(productid);

		product.setProductName(product.getProductName().replace('_', ' '));
		List<String> details = Arrays.asList(product.getProductInfo().split(","));
		
		List<MemberVO> couponList = couponService.couponList(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));

		int count = Integer.parseInt(cartCount);
		int sum = count * Integer.parseInt(vo.getProductPrice());
		
		model.addAttribute("couponList", couponList);
		System.out.println(product.getProductName());
		
		model.addAttribute("product", product);
		model.addAttribute("details", details);
		model.addAttribute("color", color);
		model.addAttribute("size", size);
		model.addAttribute("count", count);
		model.addAttribute("sum", sum);

		return "/product/order";
	}

	@RequestMapping("cartOrderProduct.do")
	   public String cartOrderProduct(HttpSession session, Model model) {
	      
	      System.out.println("=== cartOrderProduct ===");
	      
	      List <CartVO> cList = cartServcice.getCartList(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
	      
	      model.addAttribute("cartList", cList);
	      
	      List<Integer> cartSumList = cartServcice.cartSum(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
	      
	      model.addAttribute("cartSumList", cartSumList);
	      
	      int totalSum = 0;
	      
	      for (Integer sum : cartSumList) {
	         
	         totalSum += sum;
	      }
	      
	      model.addAttribute("totalSum", totalSum);
	      List<MemberVO> couponList = couponService.couponList(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
	      System.out.println(couponList);
	      model.addAttribute("couponList", couponList);
	      
	      return "/product/order";
	   }

	@RequestMapping("saveOrderPay.do")
	public String insertPay(  HttpSession session,OrderPageVO ovo,Model model, HttpServletRequest request, 
								ProductVO vo, String color, String size, String productId, String productName,String couponId) {
		int couponIdInt = Integer.parseInt(couponId);
		if(couponIdInt != 0) {
			System.out.println("결제 저장으로 넘어온 couponId"+couponId);
			couponService.deleteCoupon(Integer.parseInt(couponId));
		}
		
		/*
		 * ProductVO product = productService.getProductDetail(productid);
		 * model.addAttribute("memberId", orderPageService.getmember(ovo));
		 * model.addAttribute("product", product);
		 * int productid = Integer.parseInt(request.getParameter("productid"));
		 * System.out.println(productid);
		 */
		ovo.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		model.addAttribute("color", color);
		model.addAttribute("size", size);
		model.addAttribute("productId", productId);
		model.addAttribute("productName", productName);
		System.out.println("color : "+color);
		System.out.println("productName: "+ productName);
		System.out.println(vo);
		productService.insertPay(vo);
		productService.upProductCnt(vo);
		HashMap<String, String> opmap=new HashMap<String, String>();
		opmap.put("productId", productId);
		opmap.put("size",vo.getOptionsSize());
		opmap.put("color",vo.getOptionsColor());
		System.out.println(opmap);
		productService.downOptStock(opmap);
		System.out.println("구매해주셔서 감사합니다");
		/*
		 * INSERT INTO PAY ( ORDERSID, PRODUCTID, PAYCOLOR, PAYSIZE, PAYCOUNT, PAYDATE,
		 * PAYCOST, MEMBERID) VALUES (PAY_SEQ.nextval, #{orderId, }, #{prodectId},
		 * #{payColor}, #{paySize}, #{payCount}, SYSDATE, #{payCost}, #{memberId})
		 */
		return "redirect:/myPage/myPage.do";
	}

	@RequestMapping("saveCartPay.do")
	public String saveCartPay(HttpSession session,String couponId) {
		if(couponId!="**") {
			System.out.println("결제 저장으로 넘어온 couponId"+couponId);
			couponService.deleteCoupon(Integer.parseInt(couponId));
		}
		System.out.println("=== saveCartPay ===");
		
		int memberId = Integer.parseInt(String.valueOf(session.getAttribute("memberId")));
		List <Integer> cartIdList = cartServcice.getCartIdList(memberId);
		
		for (Integer cartId : cartIdList) {
			
			System.out.println(" 카트아이디 : " + cartId + " 입력중");
			orderPageService.insertCartPay(cartId);
			System.out.println(" 카트아이디 : " + cartId + " 입력완료");
		}
		
		System.out.println(" === cart 삭제 시작 === ");
		orderPageService.deleteAllCart(memberId);
		System.out.println(" === cart 삭제 완료 === ");
		
		return "redirect:/myPage/myPage.do";
	}


//
	@RequestMapping("saveOrderDV.do")
	public String insertDV(OrderPageVO vo,String couponId) {
		orderPageService.insertDV(vo);
		/*
		 * INSERT INTO DELIVERY ( DELIVERYID, DELIVERYADD, DELIVERYTELL, DELIVERYPOST,
		 * DELIVERYDATE, REFUNDYN, MEMBERID) VALUES (DELIVERY_SEQ.nextval,
		 * #{deliveryAdd, }, #{deliveryTell}, #{deliveryPost}, SYSDATE, #{refundYN},
		 * memberId,)
		 */
		return "redirect:/index.jsp";
	}

	// kakaoapi
		@RequestMapping("kakaoPay.do")
		@ResponseBody
		public String kakaoPay(Long amount, HttpSession session,OrderPageVO ovo,Model model, HttpServletRequest request, 
				ProductVO vo, String color, String size, String productId, String productName) {
			System.out.println(amount);
			System.out.println("왔음 여기까지");
			
			ovo.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
			
			model.addAttribute("color", color);
			model.addAttribute("size", size);
			model.addAttribute("productId", productId);
			model.addAttribute("productName", productName);
			System.out.println("color : "+color);
			System.out.println("productName: "+ productName);
			System.out.println(vo);
			productService.insertPay(vo);
			productService.upProductCnt(vo);
			HashMap<String, String> opmap=new HashMap<String, String>();
			opmap.put("productId", productId);
			opmap.put("size",vo.getOptionsSize());
			opmap.put("color",vo.getOptionsColor());
			System.out.println(opmap);
			productService.downOptStock(opmap);
			System.out.println("구매해주셔서 감사합니다");
			
			
		
			return "data";
		}
		
		@RequestMapping(value="couponCheck.do", produces = "application/text; charset=utf8")
		@ResponseBody// 화면이 전환되지 않고 비동기통신이 가능하도록 하는 어노테이션
		public String couponCheck(String couponId, String totalPrice) {
			System.out.println(couponId);
			int totalPriceInt = Integer.parseInt(totalPrice);
			MemberVO cVo = couponService.getCouponById(Integer.parseInt(couponId));
			if(cVo.getCouponPrice().contains("%")) {
				totalPriceInt=totalPriceInt*(100-Integer.parseInt(cVo.getCouponPrice().split("%")[0]))/100;
			}
			else {
				totalPriceInt=totalPriceInt-Integer.parseInt(cVo.getCouponPrice());
			}
			return totalPriceInt+"";
		}
	
	

}