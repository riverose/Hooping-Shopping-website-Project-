package com.hoo.ping.service;

import java.util.List;

import com.hoo.ping.domain.LikesVO;
import com.hoo.ping.domain.Pagination;
import com.hoo.ping.domain.RCommentVO;
import com.hoo.ping.domain.ReviewVO;

public interface ReviewService {
	
	ReviewVO getReview(ReviewVO vo);
	
	List <ReviewVO> getReviewList(Pagination pg);
	
	List <ReviewVO> getMyReviewList(Pagination pg);
	
	//추가
	List <ReviewVO> getReviewPageList(); 
	
	void insertReview(ReviewVO vo);
	
	List <RCommentVO> getRCommentList(ReviewVO vo);
	
	void insertRComment(RCommentVO vo);
	// 1018 진영 추가
	ReviewVO getBestReview(int productId);
	
	void updateBestYN(ReviewVO vo);
	
	List <ReviewVO> getReviewListWithBest(ReviewVO vo);
	// 1018 진영 추가 & 수정
	
	public int cntreviewList();

	int cntProductReviewList(int productId);

	int cntMyReviewList(int memberId);
	
	// 추가
	int thumbsYN(ReviewVO vo);
	
	void insertThumbsYN(LikesVO vo);
		
	void deleteThumbsYN(LikesVO vo);
	
	public void deleteReview(String no);

	//------------------------1018---------------------------
	void updateReview(ReviewVO vo);
	
	ReviewVO getReviewId(ReviewVO vo);
	//--------------------------------------------------------
	
	void deleteRComment(String no);
	void deleteRCommentReivew(String no);
	
	int cntBestReview(int memberId);
	
	
}