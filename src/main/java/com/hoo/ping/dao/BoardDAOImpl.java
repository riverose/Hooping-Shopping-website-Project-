package com.hoo.ping.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoo.ping.domain.BCommentVO;
import com.hoo.ping.domain.BoardVO;
import com.hoo.ping.domain.Pagination;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	private SqlSessionTemplate mybatis;
	
	@Autowired
	BoardDAOImpl(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	// 게시판 호출
	@Override
	public List<BoardVO> getBoardList(Pagination pg) {
		return mybatis.selectList("BoardDAO.getBoardList", pg);
	}

	// 게시글 호출
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}

	// 답글 호출
	@Override
	public BCommentVO getBComment(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getBComment", vo);
	}

	// 게시글 입력
	@Override
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard", vo);
	}

	// 답글 입력
	@Override
	public void insertBComment(BCommentVO vo) {
		mybatis.insert("BoardDAO.insertBComment", vo);
	}

	// 답글 여부 추가
	@Override
	public void updateAnswerYN(BCommentVO vo) {
		System.out.println("=== updateAnswerYN ===");
		mybatis.update("BoardDAO.updateAnswerYN", vo);
	}
	
	// 답글 여부 제거
	@Override
	public void deleteAnswerYN(BoardVO vo) {
		System.out.println("=== deleteAnswerYN ===");
		mybatis.delete("BoardDAO.deleteAnswerYN", vo);
	}
	
	// 게시글 수정
	@Override
	public int updateBoard(BoardVO vo) {
		return mybatis.update("BoardDAO.updateBoard", vo);
	}

	// 답글 수정
	@Override
	public void updateBComment(BCommentVO vo) {
		mybatis.update("BoardDAO.updateBComment", vo);
	}

	// 게시글 삭제
	@Override
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

	// 답글 삭제
	@Override
	public void deleteBComment(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBComment", vo);
	}

	@Override
	public int cntBoardList(Pagination pg) {
		return mybatis.selectOne("BoardDAO.cntBoardList", pg);
	}

	

	
}
