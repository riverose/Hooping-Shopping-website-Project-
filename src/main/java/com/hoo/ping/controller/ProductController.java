package com.hoo.ping.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoo.ping.domain.MemberVO;
import com.hoo.ping.domain.OptionsVO;
import com.hoo.ping.domain.Pagination;
import com.hoo.ping.domain.ProductVO;
import com.hoo.ping.domain.RateVO;
import com.hoo.ping.domain.ReviewVO;
import com.hoo.ping.service.CouponService;
import com.hoo.ping.service.MemberService;
import com.hoo.ping.service.ProductService;
import com.hoo.ping.service.ReviewService;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	private ProductService productService;
	private ReviewService reviewService;
	private MemberService memberService;
	private CouponService couponService;
	 
	@Autowired
	public ProductController(ProductService productService,
							 ReviewService reviewService,
							 MemberService memberService,
							 CouponService couponService){
		this.productService = productService;
		this.reviewService = reviewService;
		this.memberService=memberService;
		this.couponService=couponService;
	}
	
	@RequestMapping("getProduct.do")
	public String getProduct(HttpServletRequest request
							, Model model,
							@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo, 
	    		   	 		@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange) {
		
		System.out.println("=== getProduct.do ===");
		
		int productid=Integer.parseInt(request.getParameter("productid"));
		
		ProductVO product = productService.getProductDetail(productid);
		product.setProductName(product.getProductName().replace('_', ' '));
		List<String> details=Arrays.asList(product.getProductInfo().split(","));
		List<OptionsVO> options=productService.getProductOptions(productid);
		
				
		model.addAttribute("product",product);
		model.addAttribute("details",details);
		model.addAttribute("options",options);

		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		Pagination pg = new Pagination();
		// 1018 ?????? ??????
		pg.setSizePerPage(6);
		
		int totalCnt = reviewService.cntProductReviewList(productid);
		pg.pageInfo(currPageNo, range, totalCnt);
		
		ReviewVO bvo = reviewService.getBestReview(productid);
		if (bvo != null) {
			System.out.println(bvo);
			// -------- 1020 ??????
			MemberVO memVo = memberService.getMemberById(bvo.getMemberId());
			System.out.println(memVo);
			memVo = memberService.getMember(memVo);
			// 1
			System.out.println("memVO :" + memVo);

			int bestCnt = reviewService.cntBestReview(bvo.getMemberId());
			System.out.println("??????????????? ???????????? : " + bestCnt);
			int rateNum = memVo.getMemberRating();
			// 2
			System.out.println("rateNum: " + rateNum);
			String rateName = "";
			RateVO Rvo = new RateVO();
			if (rateNum >= Rvo.memberUp && rateNum < Rvo.vipUp) {
				rateName = "??????";
				memVo.setCouponPrice("15%");
			} 
			else if (rateNum >= Rvo.vipUp) {

				if (bestCnt > Rvo.bestCnt) {

					rateName = "???????????????";
					memVo.setCouponPrice("30%");

				} else {
					rateName = "VIP";
					memVo.setCouponPrice("25%");

				}
			} 
			else {
				rateName = "??????";
			}
			
			if(rateName.equals(memVo.getMemberRateName()) == false) {
				//3
				System.out.println("if ?????????");
				memVo.setMemberRateName(rateName);
				memVo.setCouponName(rateName+"?????? ?????? ??????");
				memberService.updateRateInfo(memVo);
				couponService.addCoupon(memVo);
			}
		}
		// -------- 1020 ??????
		pg.setProductId(productid);
		
		if(bvo != null) {
			pg.setReviewId(bvo.getReviewId());
			pg.pageInfo(currPageNo, range, totalCnt-1);
		}

		List<ReviewVO> test = reviewService.getReviewList(pg);
		
		model.addAttribute("best", bvo);
		model.addAttribute("pagination", pg);
		model.addAttribute("reviewList", test);
		model.addAttribute("cnt", totalCnt);
		// 1018 ?????? ???
		System.out.println(product);
		System.out.println(details);
		System.out.println(options);
		// System.out.println(productid);
		
		return "/product/product";
	}
//	----------------------------1017-??????----------------------------------------
	@RequestMapping("searchProduct.do")
	public String searchProduct(HttpServletRequest request, Model model , String searchKeyword) {
		System.out.println("????????? : " + searchKeyword);
		HashMap map = new HashMap();
		map.put("searchKeyword", searchKeyword);
		List<ProductVO> sp=productService.searchProduct(map);
	
		model.addAttribute("plist",sp);
		System.out.println(sp);
		return "/product/category";
	}
	
//	---------------------------------------------------------------------
	
	@RequestMapping("getProductList.do")
	public String getProductList(HttpServletRequest request, Model model) {
		System.out.println("=== getProductList.do ===");
		String gender = request.getParameter("gender");
		String type = request.getParameter("type");
		List<ProductVO> plist=productService.getProductList(gender,type);
		List<ProductVO> bList=productService.getBrandList(gender,type);
		for(ProductVO item : plist) {
			item.setProductName(item.getProductName().replace('_', ' '));
		}
		System.out.println(gender+type);
		System.out.println(plist);
		model.addAttribute("plist",plist);
		model.addAttribute("bList",bList);
		return "/product/category";
	}
	
	@RequestMapping(value="colorCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String colorCheck(OptionsVO vo){		
		List<OptionsVO> options=productService.getProductSize(vo);
		String optionArray="";
		for(OptionsVO item : options) {
			optionArray+=item.getOptionsSize()+",";
		}
		optionArray=optionArray.substring(0,optionArray.length()-1);
		return optionArray;
	}
	@RequestMapping(value="filterCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String filterCheck(String brand_select, String color_select, String gender, String type, String min, String max) {
		System.out.println(brand_select+color_select);
		String[] brand_arr = brand_select.split(",");
		String[] color_arr = color_select.split(",");
		String[] category = new String[2];
		category[0]=gender; category[1]=type;
		String[] price = new String[2];
		price[0]=min; price[1]=max;

		List<String> brand_list = Arrays.asList(brand_arr);
		List<String> color_list = Arrays.asList(color_arr);
		List<String> category_list = Arrays.asList(category);
		List<String> price_list = Arrays.asList(price);

		
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("brands", brand_list);
		map.put("colors", color_list);
		map.put("category", category_list);
		map.put("price",price_list);
		List<ProductVO> selected=productService.getFilterProduct(map);
		String listStr="";
		for(ProductVO item : selected) {
			listStr=listStr+"~????????????~"+item.getProductId()+","+item.getPimageAddr1()+","+item.getProductName()+","+item.getProductPrice();
		}
		System.out.println(listStr);
		return listStr;
	}
	
	@RequestMapping("getOptionsStock.do")
	@ResponseBody
	public int getOptionsStock(OptionsVO vo, String size, String color) {
			
		System.out.println("===getOptionStock.do===");
		
		vo.setOptionsSize(size);
		vo.setOptionsColor(color);
		
		System.out.println("?????? ????????? ????????????" + vo.getProductId());
		System.out.println("?????? ????????? ?????????" + vo.getOptionsSize());
		System.out.println("?????? ????????? ??????" + vo.getOptionsColor());
		int options = productService.getOptionsStock(vo);
		System.out.println("?????? ?????? :" + options);
		return options;
	}
	
}