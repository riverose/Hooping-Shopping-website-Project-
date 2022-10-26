package com.hoo.ping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoo.ping.dao.ReviewDAO;
import com.hoo.ping.domain.LikesVO;
import com.hoo.ping.domain.Pagination;
import com.hoo.ping.domain.RCommentVO;
import com.hoo.ping.domain.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(Pagination pg) {
		return reviewDAO.getReviewList(pg);
	}

	@Override
	public List<ReviewVO> getMyReviewList(Pagination pg) {
		return reviewDAO.getMyReviewList(pg);
	}
	
// 1018 진영 추가
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
		vo.setMemberRating(1);
		reviewDAO.updateRating(vo);
	}
	
	@Override
	public List<RCommentVO> getRCommentList(ReviewVO vo) {
		return reviewDAO.getRCommentList(vo);
	}
	
	@Override
	public void insertRComment(RCommentVO vo) {
		reviewDAO.insertRComment(vo);
	}

  // 1018 진영 수정
	@Override
	public ReviewVO getBestReview(int productId) {
		 ReviewVO vo = reviewDAO.getBestReview(productId);
		 
		 if(vo != null && vo.getReviewBestYN() != '1') {
			 System.out.println("==updateBestYN===");
			 System.out.println(vo.getReviewId());
			 reviewDAO.updateBestYN(vo);
			 vo.setMemberRating(10);
			 System.out.println("==updateRating===");
			 reviewDAO.updateRating(vo);
		 }
		 return vo;
	}

	@Override
	public void updateBestYN(ReviewVO vo) {
		reviewDAO.updateBestYN(vo);
	}
	// 1018 진영 삭제
	@Override
	public List<ReviewVO> getReviewListWithBest(ReviewVO vo) {
		return reviewDAO.getReviewListWithBest(vo);
	}


// 1018 진영 수정
	@Override
	public int cntMyReviewList(int memberId) {
		return reviewDAO.cntMyReviewList(memberId);
	}

	@Override
	public int cntProductReviewList(int productId) {
		return reviewDAO.cntProductReviewList(productId);
	}

	@Override
	public int cntreviewList() {
		return reviewDAO.cntreviewList();
	}

	@Override
	public int thumbsYN(ReviewVO vo) {
		return reviewDAO.thumbsYN(vo);
	}

// 1018 진영 수정
	@Override
	public void deleteReview(String no) {
		reviewDAO.deleteReview(no);
		
//		reviewDAO.deleteRCommentReivew(no);
	}
	

	@Override
	public List<ReviewVO> getReviewPageList() {
		return reviewDAO.getReviewPageList();
	}

	@Override
	public void insertThumbsYN(LikesVO vo) {
		reviewDAO.insertThumbsYN(vo);
		reviewDAO.incThumbs(vo);
		
	}

	@Override
	public void deleteThumbsYN(LikesVO vo) {
		reviewDAO.deleteThumbsYN(vo);
		reviewDAO.reduceThumbs(vo);
	}

	//------------------------1018---------------------------
	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
		
	}

	@Override
	public ReviewVO getReviewId(ReviewVO vo) {
		// TODO Auto-generated method stub
		return reviewDAO.getReviewId(vo);
	}
	//--------------------------------------------------------
	
// 1018 진영 추가

@Override
	public void deleteRComment(String no) {
		reviewDAO.deleteRComment(no);
		
	}

@Override
public void deleteRCommentReivew(String no) {
	// TODO Auto-generated method stub
	reviewDAO.deleteRCommentReivew(no);
}

@Override
public int cntBestReview(int memberId) {
	return reviewDAO.cntBestReview(memberId);
}

	

	
}