package com.hoo.ping.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoo.ping.domain.LikesVO;
import com.hoo.ping.domain.MemberVO;
import com.hoo.ping.domain.RCommentVO;
import com.hoo.ping.domain.RateVO;
import com.hoo.ping.domain.ReviewVO;
import com.hoo.ping.service.CouponService;
import com.hoo.ping.service.MemberService;
import com.hoo.ping.service.ReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CouponService couponService;
	
	@Autowired
	public ReviewController(ReviewService reviewService,
							MemberService memberService) {
		this.reviewService = reviewService;
		this.memberService = memberService;
	}
	
	
	@RequestMapping("getReviewPage.do")
	public String getReviewPage(Model model) {
		
		List<ReviewVO> test = reviewService.getReviewPageList();
		
		model.addAttribute("reviewList", test);
		
		return "/review/review";
	}
	
	// 리뷰를 DB에 저장
	@RequestMapping("saveReview.do")
	public String saveReview(ReviewVO vo, Model model, HttpSession session,
			String payIdStr, String productIdStr,
			String reviewHeightNull, String reviewWeightNull) { // 파라미터 ReviewVO vo, Model model
		
		System.out.println("퀄리티 : " + vo.getReviewQuality());
		System.out.println("리뷰아이디 : " + vo.getReviewText());
		/*
		 * 마이 페이지에서 productId, orderId를 리뷰 작성 페이지로 넘긴 후 파라미터를 넘길 때 hidden으로 함깨 넘긴다
		 */
		vo.setMemberId( Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		vo.setPayId(Integer.parseInt(payIdStr));
	    vo.setProductId(Integer.parseInt(productIdStr));
		// 리뷰 작성 메소드
		// 작성이 끝나면 reviewService안에서 vo.setRatingNum(1)을 이용해 등급 점수를 1점 올릴 세팅을 하고 
		// reviewDAO.updateRating(vo)를 실행하여 해당 리뷰를 작성한 유저의 점수를 1점 올린다
	      
	    System.out.println("reviewHeightNull 값은 :" + reviewHeightNull + "입니다");
	    System.out.println("reviewWeightNull 값은 :" + reviewWeightNull + "입니다");
	    
	    if( !(reviewHeightNull.equals("")) ){
	    	vo.setReviewHeight(Integer.parseInt(reviewHeightNull));
	    	System.out.println("입력된 키 인트형 " + Integer.parseInt(reviewHeightNull));
			
	    }
		    
	    if( !(reviewWeightNull.equals("")) ){
	    	vo.setReviewWeight(Integer.parseInt(reviewWeightNull));
	    	System.out.println("입력된 몸무게 인트형 " + Integer.parseInt(reviewWeightNull));
	    }
		    
		   reviewService.insertReview(vo);
		   ReviewVO test1 = reviewService.getReviewId(vo);
//	      System.out.println("리뷰아아디" + test1.getReviewId());
	      System.out.println("페이아이디" + test1.getPayId());
	      reviewService.updateReview(test1);
	      
	   // -------- 1020 희원
	      MemberVO memVo = new MemberVO();
	      memVo.setMemberId(vo.getMemberId());
	      memVo = memberService.getMember(memVo);
	      //1
	      System.out.println("memVO :"+memVo);
	     
	      int bestCnt = reviewService.cntBestReview(vo.getMemberId());
	      System.out.println("베스트리뷰 선정횟수 : " +  bestCnt);
	      int rateNum=memVo.getMemberRating();
	      //2
	      System.out.println("rateNum: "+rateNum);
	      String rateName="";
	      RateVO Rvo = new RateVO();
			if (rateNum >= Rvo.memberUp && rateNum < Rvo.vipUp) {
				rateName = "멤버";
				memVo.setCouponPrice("15%");
			} 
			else if (rateNum >= Rvo.vipUp) {

				if (bestCnt > Rvo.bestCnt) {

					rateName = "인플루언서";
					memVo.setCouponPrice("30%");

				} else {
					rateName = "VIP";
					memVo.setCouponPrice("25%");

				}
			} 
			else {
				rateName = "뉴비";
			}
			
			if(rateName.equals(memVo.getMemberRateName()) == false) {
				//3
				System.out.println("if 들어옴");
				memVo.setMemberRateName(rateName);
				memVo.setCouponName(rateName+"등급 축하 쿠폰");
				memberService.updateRateInfo(memVo);
				couponService.addCoupon(memVo);
			}
	      
	      // -------- 1020 희원

		return "redirect:/myPage/myPage.do";
	}
	
	// 리뷰 댓글을 저장
	@ResponseBody
	@RequestMapping("saveRComment.do")
	public HashMap <String, Object> saveRComment(RCommentVO vo, HttpSession session) {
		System.out.println("=== saveRComment.do ===");
		
		// 현재 로그인하고 있는 유저의 정보를 VO에 주입
		vo.setMemberId( Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		vo.setMemberName( String.valueOf(session.getAttribute("memberName")));
		
		// DB에 댓글 입력
		reviewService.insertRComment(vo);
		
		// ajax 리턴용 HashMap 생성
		HashMap <String, Object> map = new HashMap <String, Object>();
		
		// 댓글을 입력한 순간 갱신되기 위한 로직
		// 리뷰 VO 생성
		ReviewVO rvo = new ReviewVO();
		// 현재 보고 있는 reviewId를 주입
		rvo.setReviewId(vo.getReviewId());
		// 해당 리뷰 아이디를 가진 모든 댓글 리스트 획득
		List <RCommentVO> rCList = reviewService.getRCommentList(rvo);
		
		map.put("rCList", rCList);
		
		return map;
		
	}

	// 특정 리뷰를 선택했을 때
	@ResponseBody
	@RequestMapping("selectedReview.do")
	public HashMap <String, Object> selectedReview(ReviewVO vo, Model model, HttpSession session) {
		System.out.println("=== selectedReview.do ===");
		
		// 해당 리뷰 정보 가져오기
		vo = reviewService.getReview(vo);
		
		// 나중에 리뷰 작성자로 다시 초기화 하기 위한 변수
		int originId = vo.getMemberId();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 해당 리뷰에 담길 댓글 목록 가져오기
		List <RCommentVO> rCList = reviewService.getRCommentList(vo);
		
		// 리뷰 & 댓글 투입!
		map.put("review", vo);
		map.put("rCList", rCList);
		
		if(session.getAttribute("memberId") != null) {
			vo.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
			// 현재 이용자가 해당 리뷰에 좋아요를 누른 적이 있는지 확인하기
			
			// 좋아요 체크용 메소드 > 해당 리뷰에 현재 로그인 유저가 좋아요를 찍은 적이 있다면 1, 없다면 0을 리턴하는 구조
			int likeCheck = reviewService.thumbsYN(vo);
			
			// 좋아요 체크 투입!
			map.put("likeCheck", likeCheck);
		}else {
			// 로그인하지 않았을 경우 유효성 검사를 위한 숫자를 주입
			int likeCheck = 99;
			
			// 좋아요 체크 투입!
			map.put("likeCheck", likeCheck);
		}
		// 좋아요 체크를 위해 현재 로그인 유저로 덮어씌워진 상태
		// 그러므로 처음에 백업해뒀던 리뷰 아이디로 다시 초기화한다
		vo.setMemberId(originId);
		
		// 인플루언서 여부를 확인하기 위한 변수 생성
		int bestCnt = reviewService.cntBestReview(vo.getMemberId());
		System.out.println("베스트 리뷰 선정 횟수 : " + bestCnt);
		
		map.put("bestCnt", bestCnt);
		
		// 인플루언서 일 경우 인스타 아이디를 보여주기 위한 로직
		MemberVO mvo = new MemberVO();
		mvo.setMemberId(vo.getMemberId());
		mvo = memberService.getMember(mvo);
		
		map.put("mvo", mvo);
		// ajax로 리턴
		return map;
	}
	
	// 좋아요 버튼을 눌렀을 때
	@ResponseBody
	@RequestMapping("insertThumbsYN.do")
	public HashMap <String, Object> insertThumbsYN(LikesVO vo, HttpSession session) {
		System.out.println("=== insertThumbsYN ===");
		
		// LikesVO에는 ajax를 통해 reviewId가 이미 주입되어 있음
		
		// 좋아요 체크를 기록하기 위해 현재 로그인하고 있는 유저의 id값을 주입
		vo.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		
		// 해당 리뷰에 좋아요를 한 적이 있음을 기록
		// reviewService 내에서 reviewDAO.incThumbs(vo) 메소드를 추가로 실행
		// 해당 리뷰의 좋아요 개수를 1개 올린다
		reviewService.insertThumbsYN(vo);
		
		// 리턴용 rvo 작성 (reviewThumbs의 변동사항을 jsp에서 반영해야 되기 때문)
		ReviewVO rvo = new ReviewVO();
		
		// LikesVO에 주입되어 있는 reviewId를 ReviewVO에 주입한뒤
		// 해당 vo를 활용해 리뷰 정보를 다시 재주입
		rvo.setReviewId(vo.getReviewId());
		rvo = reviewService.getReview(rvo);
		
		HashMap <String, Object> map = new HashMap <String, Object> ();
		// 리뷰 투입!
		map.put("review", rvo);
		
		// ajax로 리턴
		return map;
	}
	
	// 이미 좋아요가 눌린 버튼을 다시 눌렀을 때
	@ResponseBody
	@RequestMapping("deleteThumbsYN.do")
	public HashMap <String, Object> deleteThumbsYN(LikesVO vo, HttpSession session){
		System.out.println("=== deleteThumbsYN ===");
		
		// LikesVO에는 ajax를 통해 reviewId가 이미 주입되어 있음
		
		// 좋아요 체크를 기록하기 위해 현재 로그인하고 있는 유저의 id값을 주입
		vo.setMemberId(Integer.parseInt(String.valueOf(session.getAttribute("memberId"))));
		
		// 해당 리뷰에 좋아요를 한 적이 없음을 기록
		// reviewService 내에서 reviewDAO.reduceThumbs(vo) 메소드를 추가로 실행
		// 해당 리뷰의 좋아요 개수를 1개 내린다
		reviewService.deleteThumbsYN(vo);
		
		// 리턴용 rvo 작성 (reviewThumbs의 변동사항을 jsp에서 반영해야 되기 때문)
		ReviewVO rvo = new ReviewVO();
		
		// LikesVO에 주입되어 있는 reviewId를 ReviewVO에 주입한뒤
		// 해당 vo를 활용해 리뷰 정보를 다시 재주입
		rvo.setReviewId(vo.getReviewId());
		rvo = reviewService.getReview(rvo);
		
		HashMap <String, Object> map = new HashMap <String, Object> ();
		// 리뷰 투입!
		map.put("review", rvo);
		
		// ajax로 리턴
		return map;
	}


	@ResponseBody
	@RequestMapping("deleteRComment.do")
	public HashMap <String, Object> deleteRComment(String rcommentId, ReviewVO vo){
		
		
		reviewService.deleteRComment(rcommentId);
		HashMap <String, Object> map = new HashMap <String, Object> ();
		
		List <RCommentVO> rCList = reviewService.getRCommentList(vo);
		
		map.put("rCList", rCList);
		
		return map;
		
	}
	
}