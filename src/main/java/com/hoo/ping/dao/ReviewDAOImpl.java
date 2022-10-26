package com.hoo.ping.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.domain.LikesVO;
import com.hoo.ping.domain.Pagination;
import com.hoo.ping.domain.RCommentVO;
import com.hoo.ping.domain.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return mybatis.selectOne("reviewDAO.getReview", vo);
	}

	@Override
	public List<ReviewVO> getReviewList(Pagination pg) {
		return mybatis.selectList("reviewDAO.getReviewList",pg);
	}
	
	@Override
	public List<ReviewVO> getMyReviewList(Pagination pg) {
		return mybatis.selectList("reviewDAO.getMyReviewList",pg);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		mybatis.insert("reviewDAO.insertReview", vo);
	}

	@Override
	public List<RCommentVO> getRCommentList(ReviewVO vo) {
		return mybatis.selectList("reviewDAO.getRCommentList", vo);
	}
	
	@Override
	public void insertRComment(RCommentVO vo) {
		mybatis.insert("reviewDAO.insertRComment", vo);
	}

 // 1018 진영 //
	@Override
	public ReviewVO getBestReview(int productId) {
		return mybatis.selectOne("reviewDAO.getBestReview", productId);
	}

	@Override
	public void updateBestYN(ReviewVO vo) {
		mybatis.update("reviewDAO.updateBestYN", vo);
	}

// 1018 진영 //
	@Override
	public List<ReviewVO> getReviewListWithBest(ReviewVO vo) {
		return mybatis.selectList("reviewDAO.getReviewListWithBest", vo);
	}

	@Override
	public int cntreviewList() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("reviewDAO.cntreviewList");
	}

	@Override
	public int cntProductReviewList(int productId) {
		return mybatis.selectOne("reviewDAO.cntProductReviewList", productId);
	}

	@Override
	public int cntMyReviewList(int memberId) {
		return mybatis.selectOne("reviewDAO.cntMyReviewList", memberId);
	}

	@Override
	public int thumbsYN(ReviewVO vo) {
		return mybatis.selectOne("reviewDAO.thumbsYN",vo);
	}

	@Override
	public void deleteReview(String no) {
		mybatis.delete("reviewDAO.deleteReview", no);
		
	}

	@Override
	public List<ReviewVO> getReviewPageList() {
		return mybatis.selectList("reviewDAO.getReviewPageList");
	}

	@Override
	public void updateRating(ReviewVO vo) {
		mybatis.update("reviewDAO.updateRating", vo);
		
	}

	@Override
	public void insertThumbsYN(LikesVO vo) {
		mybatis.insert("reviewDAO.insertThumbsYN", vo);
		
	}

	@Override
	public void incThumbs(LikesVO vo) {
		mybatis.update("reviewDAO.incThumbs", vo);
		
	}

	@Override
	public void deleteThumbsYN(LikesVO vo) {
		mybatis.delete("reviewDAO.deleteThumbsYN", vo);
		
	}

	@Override
	public void reduceThumbs(LikesVO vo) {
		mybatis.update("reviewDAO.reduceThumbs", vo);
		
	}
	
	//------------------------1018---------------------------
	@Override
	public void updateReview(ReviewVO vo) {
		mybatis.update("reviewDAO.updateReview",vo);
		
	}

	@Override
	public ReviewVO getReviewId(ReviewVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("reviewDAO.getReviewId", vo);
	}
	//--------------------------------------------------------

	
	// 1018 진영
	@Override
	public void deleteRCommentReivew(String no) {
		mybatis.delete("reviewDAO.deleteRCommentReivew", no);
	}

	@Override
	public void deleteRComment(String no) {
		mybatis.delete("reviewDAO.deleteRComment", no);
	}
	
	@Override
	public int cntBestReview(int memberId) {
		return mybatis.selectOne("reviewDAO.cntBestReview", memberId);
	}


}