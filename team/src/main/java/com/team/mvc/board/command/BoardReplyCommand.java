package com.team.mvc.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.dao.BoardDao;
import com.team.mvc.dto.BoardDto;

public class BoardReplyCommand implements BoardCommand {

	@Override
   	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
		
		String currentPage = request.getParameter("currentPage");
		
		String bIdx = request.getParameter("bIdx");
		String bTitle = request.getParameter("bTitle");
		String bWriter = request.getParameter("bWriter");
		String bContent = request.getParameter("bContent");
		String userIdx = request.getParameter("userIdx");
		
		BoardDto subDto = new BoardDto();
		subDto.setbTitle(bTitle);
		subDto.setbWriter(bWriter);
		subDto.setbContent(bContent);
		subDto.setUserIdx(Integer.parseInt(userIdx));
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		// 댓글이 달리는 원글 가져오기
		BoardDto bDto = bDao.listOne(Integer.parseInt(bIdx));
		
		// 원글의 정보를 이용해서 댓글의 정보 작성
		subDto.setbRef( bDto.getbRef() );
		subDto.setbStep( bDto.getbStep() + 1 );
		subDto.setbDepth( bDto.getbDepth() + 1 );
		
		// 기존 댓글들의 bStep 증가
		bDao.update_bStep(bDto);
		
		bDao.reply(subDto);
		
		HttpSession session = request.getSession();
		session.setAttribute("currentPage", currentPage);
		
   	}	      
}