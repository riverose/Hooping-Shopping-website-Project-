package com.hoo.ping.dao;

import java.util.List;

import com.hoo.ping.domain.BCommentVO;
import com.hoo.ping.domain.BoardVO;
import com.hoo.ping.domain.Pagination;

public interface BoardDAO {
	
	List <BoardVO> getBoardList(Pagination pg); 
	
	BoardVO getBoard(BoardVO vo);
	
	BCommentVO getBComment(BoardVO vo);
	
	void insertBoard(BoardVO vo);
	
	void insertBComment(BCommentVO vo);
	
	void updateAnswerYN(BCommentVO vo);
	
	void deleteAnswerYN(BoardVO vo);
	
	int updateBoard(BoardVO vo);
	
	void updateBComment(BCommentVO vo);
	
	void deleteBoard(BoardVO vo);
	
	void deleteBComment(BoardVO vo);
	
	int cntBoardList(Pagination pg);
}
