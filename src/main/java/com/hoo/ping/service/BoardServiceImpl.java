package com.hoo.ping.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoo.ping.dao.BoardDAO;
import com.hoo.ping.domain.BCommentVO;
import com.hoo.ping.domain.BoardVO;
import com.hoo.ping.domain.Pagination;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	private final BoardDAO boardDAO;
	
	@Autowired
	BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	
	@Override
	public List<BoardVO> getBoardList(Pagination pg) {
		return boardDAO.getBoardList(pg);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public BCommentVO getBComment(BoardVO vo) {
		return boardDAO.getBComment(vo);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void insertBComment(BCommentVO vo) {
		boardDAO.insertBComment(vo);
		boardDAO.updateAnswerYN(vo);
		
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return boardDAO.updateBoard(vo);
	}

	@Override
	public void updateBComment(BCommentVO vo) {
		boardDAO.updateBComment(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
		boardDAO.deleteBComment(vo);
	}

	@Override
	public void deleteBComment(BoardVO vo) {
		boardDAO.deleteBComment(vo);
		boardDAO.deleteAnswerYN(vo);
	}

	@Override
	public int cntBoardList(Pagination pg) {
		return boardDAO.cntBoardList(pg);
	}

	
}
