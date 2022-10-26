package com.hoo.ping.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoo.ping.domain.BCommentVO;
import com.hoo.ping.domain.BoardVO;
import com.hoo.ping.domain.Pagination;
import com.hoo.ping.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	private BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService){
		this.boardService = boardService;
	}
	
	// 게시판 호출
	@RequestMapping("getBoardList.do")
	public String getBoardList (@RequestParam(defaultValue = "boardTitle") String searchCondition,    
		    					@RequestParam(defaultValue = "") String searchKeyword 
		    					,Model model,
		    					@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo, 
		    		   	 		@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange) {
		
		System.out.println("=== getBoardList ===");
		
		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		HashMap <String, String> map = new HashMap <String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		
		Pagination pg = new Pagination();
		pg.setSearchCondition(searchCondition);
		pg.setSearchKeyword(searchKeyword);
		
		int totalCnt = boardService.cntBoardList(pg);
		pg.pageInfo(currPageNo, range, totalCnt);
		
		List <BoardVO> bList = boardService.getBoardList(pg);
		
		if(!"".equals(searchCondition) && !"".equals(searchKeyword)) {
	        model.addAttribute("map", map);
	    }
		
		model.addAttribute("pagination", pg);
		model.addAttribute("bList", bList);
		model.addAttribute("cnt", totalCnt);
		
		return "/board/boardList";
	}
	
	// 특정 문의글을 클릭했을 때
	@RequestMapping("getBoard.do")
	public String getBoard (BoardVO vo, Model model) {
		
		System.out.println("=== getBoard ====");
		// 해당 게시글의 아이디와 일치하는 게시글 대입
		vo = boardService.getBoard(vo);
		
		
		// 모델에 게시글 저장
		model.addAttribute("board", vo);
		
		// 해당 게시글이 답글을 받은 상태라면
		if(vo.getAnswerYN() == '1') {
			
			// 해당 게시글의 답글을 호출
			BCommentVO bcvo = boardService.getBComment(vo);
			
			System.out.println(bcvo.getBcommentUser());
			System.out.println(bcvo.getBcommentDate());
			System.out.println(bcvo.getBcommentContents());
			
			// 모델에 답글 저장
			model.addAttribute("bComment", bcvo);
		}
		
		return "/board/board";
	}
	
	// 게시글 수정
	@RequestMapping("modifyBoard.do")
	public String writeBoard(BoardVO vo, Model model) {
		
		System.out.println("=== modifyBoard ===");
		
		if(vo != null) {
			vo = boardService.getBoard(vo);
			
			model.addAttribute("updateBoard", vo);
			System.out.println("writeBoard boardid : " + vo.getBoardId());
		}
		
		return "/board/boardWrite";
	}
	
	// 게시글 작성
	@RequestMapping("writeBoard.do")
	public String writeBoard() {
		
		System.out.println("=== writeBoard ===");
	
		return "/board/boardWrite";
	}
	
	// 문의글 저장
	@RequestMapping("saveBoard.do")
	public String saveBoard (BoardVO vo) {
		
		System.out.println("=== saveBoard ===");
		
		boardService.insertBoard(vo);
		
		return "redirect:/board/getBoardList.do";
	}
	
	// 댓글 저장
	@RequestMapping("saveBComment.do")
	public String saveBComment (BCommentVO vo) {
		
		System.out.println("=== saveBComment ===");
		System.out.println("=== boardId : " + vo.getBoardId());
//		String manager = "manager";
//		vo.setBcommentUser(manager);
		
		boardService.insertBComment(vo);
		
		/*
		 * boardService.insertBComment(vo)에서
		 * boardDAO.updateAnswerYN(vo)를 진행
		 */ 
		
		return "redirect:/board/getBoardList.do";
	}
	
	// 게시글 수정
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardVO vo, String boardIdstr) {
		
		vo.setBoardId(Integer.parseInt(boardIdstr));
		System.out.println("=== updateBoard ===");
		System.out.println("보드아이디 : " + vo.getBoardId());
		boardService.updateBoard(vo);
		
		return "redirect:/board/getBoardList.do";
	}
	
	// 답글 수정
	@RequestMapping("updateBComment.do")
	public String updateBComment(BCommentVO vo, String bcommentIdStr) {
		
		vo.setBcommentId(Integer.parseInt(bcommentIdStr));
		System.out.println("=== updateBComment ===");
		boardService.updateBComment(vo);
		
		
		return "redirect:/board/getBoardList.do";
	}
	
	// 게시글 삭제
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		
		System.out.println("=== deleteBoard ===");
		boardService.deleteBoard(vo);
		
		return "redirect:/board/getBoardList.do";
	}
	
	// 댓글 삭제
	@RequestMapping("deleteBComment.do")
	public String deleteBComment(BoardVO vo) {
		
		System.out.println("=== deleteBComment ===");
		boardService.deleteBComment(vo);
		
		return "redirect:/board/getBoardList.do";
	}
	
	@RequestMapping("getGradeList.do")
	public String getGradeList() {
		System.out.println("=== grade ===");
		return "board/grade";
	}
	
}
