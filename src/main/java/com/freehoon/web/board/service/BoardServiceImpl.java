package com.freehoon.web.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.freehoon.web.board.dao.BoardDAO;
import com.freehoon.web.board.model.BoardVO;
import com.freehoon.web.error.controller.NotFoundException;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getBoardList() throws Exception {
		return boardDAO.getBoardList();
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}

	@Override
	public BoardVO getBoardContent(int bid) throws Exception {
		BoardVO boardVO = new BoardVO();
		boardDAO.updateViewCnt(bid);
		boardVO = boardDAO.getBoardContent(bid);
		
		// Cate_cd에 컬럼에서 저장할 수 있는 크기보다 큰 문자열을 저장하도록 셋팅 // 수정 SQL문 처리 시 에러 발생
		/*
		 * try { boardVO.setBid(bid);
		 * boardVO.setCate_cd("1111111111111111111111111111111111111111");
		 * boardDAO.updateBoard(boardVO); } catch (RuntimeException e) { throw new
		 * NotFoundException(); }
		 */
		
		boardDAO.updateBoard(boardVO);
		return boardVO;
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
	}

	@Override
	public void deleteBoard(int bid) throws Exception {
		boardDAO.deleteBoard(bid);
	}

}
