package com.hoo.ping.service;

import java.util.List;

import com.hoo.ping.domain.BCommentVO;
import com.hoo.ping.domain.BoardVO;
import com.hoo.ping.domain.Pagination;

public interface BoardService {
	
	List <BoardVO> getBoardList(Pagination pg); 
		
	BoardVO getBoard(BoardVO vo);
	
	BCommentVO getBComment(BoardVO vo);
	
	void insertBoard(BoardVO vo);
	
	void insertBComment(BCommentVO vo);
	
	int updateBoard(BoardVO vo);
	
	void updateBComment(BCommentVO vo);
	
	void deleteBoard(BoardVO vo);
	
	void deleteBComment(BoardVO vo);
	
	int cntBoardList(Pagination pg);
	
}
