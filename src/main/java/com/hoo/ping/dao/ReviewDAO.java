package com.hoo.ping.dao;

import java.util.List;

import com.hoo.ping.domain.LikesVO;
import com.hoo.ping.domain.Pagination;
import com.hoo.ping.domain.RCommentVO;
import com.hoo.ping.domain.ReviewVO;

public interface ReviewDAO {

	ReviewVO getReview(ReviewVO vo);

	List<ReviewVO> getReviewList(Pagination pg);
	
	List<ReviewVO> getMyReviewList(Pagination pg);
	
	//추가 
	List<ReviewVO> getReviewPageList();

	void insertReview(ReviewVO vo);

	List <RCommentVO> getRCommentList(ReviewVO vo);
	
	void insertRComment(RCommentVO vo);

	public ReviewVO getBestReview(int productId);

	public void updateBestYN(ReviewVO vo);

  // ------ 1018 진영 12:30 -----
	public List<ReviewVO> getReviewListWithBest(ReviewVO vo);
	
	int cntreviewList();

	int cntProductReviewList(int productId);

	int cntMyReviewList(int memberId);
	
	int thumbsYN(ReviewVO vo);
	
	public void deleteReview(String no);
	
	// 추가
	void updateRating(ReviewVO vo);
	
	void insertThumbsYN(LikesVO vo);
	
	void incThumbs(LikesVO vo);
	
	void deleteThumbsYN(LikesVO vo);
		
	void reduceThumbs(LikesVO vo);

	//------------------------1018---------------------------
	void updateReview(ReviewVO vo);
	
	ReviewVO getReviewId(ReviewVO vo);
	//--------------------------------------------------------

  //------------------------1018 진영 ---------------------
	void deleteRComment(String no);
	
	void deleteRCommentReivew(String no);
	
	int cntBestReview(int memberId);
}