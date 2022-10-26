package com.hoo.ping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoo.ping.domain.MemberVO;
import com.hoo.ping.domain.MyPageVO;
import com.hoo.ping.domain.Pagination;
import com.hoo.ping.domain.RateVO;
import com.hoo.ping.domain.ReviewVO;
import com.hoo.ping.service.CouponService;
import com.hoo.ping.service.MemberService;
import com.hoo.ping.service.MyPageService;
import com.hoo.ping.service.ProductService;
import com.hoo.ping.service.ReviewService;

@Controller
@RequestMapping("/myPage/")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CouponService couponService;
	
	
	@RequestMapping("myPage.do")
	public String myPage(MyPageVO vo, Model model, HttpSession session, String productName,
						@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo,
						@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange) {
		System.out.println("-----------mypage 진입--------------");
		
		
//		model.addAttribute("getmember", myPageService.getmember(vo));
		vo.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		vo.setMemberName(String.valueOf(session.getAttribute("memberName")));
		vo.setMemberRating(String.valueOf(session.getAttribute("memberRating")));
		vo = myPageService.getmember(vo);
		System.out.println(vo.getMemberName());
		System.out.println(vo.getMemberRating());
		int rateNum=Integer.parseInt(vo.getMemberRating());
		String rateName="";
		
		System.out.println("현재 등급점수 :" + rateNum);
		
		int bestCnt = reviewService.cntBestReview(vo.getMemberId());
		System.out.println("베스트리뷰 선정횟수 : " +  bestCnt);
		RateVO Rvo = new RateVO();
		if(rateNum>=Rvo.memberUp && rateNum<Rvo.vipUp) {
			rateName="멤버";
			System.out.println("현재등급 : " + rateName);
		}
		else if(rateNum>=Rvo.vipUp) {
			System.out.println("현재등급 : " + rateName);
			if(bestCnt >Rvo.bestCnt) {
				
				rateName="인플루언서";
				System.out.println("현재등급 : " + rateName);
			}else {
				rateName="VIP";
				System.out.println("현재등급 : " + rateName);
			}
		}
		else {
			rateName="뉴비";
			System.out.println(rateName);
		}
		
		int couponCnt = couponService.countCoupon(vo.getMemberId());

		
		model.addAttribute("myPageVO", vo);
		model.addAttribute("paylist", myPageService.payList(vo.getMemberId()));
		model.addAttribute("productName", productName);
		model.addAttribute("rateName",rateName);
		model.addAttribute("couponCnt",couponCnt);
		System.out.println(productName);
		
		
		// 오류
		int currPageNo = 0;
		int range = 0;
		
		try {
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}
		
		Pagination pg = new Pagination();
		pg.setSizePerPage(2);
		
		System.out.println("totalCnt 이전" );
		int totalCnt = reviewService.cntreviewList();
		System.out.println("totalCnt 이후" );
		pg.pageInfo(currPageNo, range, totalCnt);
		pg.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		List<ReviewVO> test = reviewService.getMyReviewList(pg);
		
		System.out.println(pg.getMemberId());
		model.addAttribute("pagination", pg);
		model.addAttribute("reviewList", test);
		model.addAttribute("cnt", totalCnt);
		
		System.out.println(test.size());
		System.out.println(pg.getMemberId());
		
//		/* 
//		 * SELECT * FROM member
//		 */
//		model.addAttribute("reviewlist", myPageService.reviewList());
		
		
		return "/member/myPage";
	}
	
	
	
	@RequestMapping("writeReview.do")
	public String getpay(MyPageVO vo, Model model, HttpSession session) {
		
		MyPageVO VO = myPageService.getPay(vo);
		
		
		model.addAttribute("myPage", VO);
	
		
		return "/review/writeReview";

	}
	
	@RequestMapping("delete.do")
	public String deleteReviewList(HttpServletRequest request) {
		
		System.out.println("확인1");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			reviewService.deleteReview(ajaxMsg[i]);
		}
		System.out.println(size);
		
		return "redirect:/myPage/myPage.do";
	}
	
	@RequestMapping("refund.do")
	public String refundPage(MyPageVO vo,HttpServletRequest request) {
		return "/product/refund";
	}
	
	@RequestMapping("refundCheck.do")
	public String refundCheck(MyPageVO vo,String account, String bank, String payId) {
		System.out.println(account+bank+payId);
		vo.setPayId(payId);
		vo=myPageService.getPay(vo);
		vo.setRefundAccount(account);
		vo.setRefundBank(bank);
		
		myPageService.insertRefund(vo);
		vo=myPageService.getRefund(vo);
		myPageService.updatePayRefund(vo);
		System.out.println(vo);
		
		return  "redirect:/myPage/myPage.do";
	}
	
	@RequestMapping("coupon.do")
	public String coupon(HttpServletRequest request, Model model) {
		int memberId = Integer.parseInt(request.getParameter("num"));

		List<MemberVO> cList = couponService.couponList(memberId);
		model.addAttribute("cList", cList);
		return "/member/coupon";
	}
}