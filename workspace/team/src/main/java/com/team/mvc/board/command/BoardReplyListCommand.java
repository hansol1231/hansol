package com.team.mvc.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.dao.BoardDao;
import com.team.mvc.dto.BoardDto;

public class BoardReplyListCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {

		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		List<BoardDto> replylist = bDao.replylist();
		model.addAttribute("replylist", replylist);
		model.addAttribute("listCount", bDao.replylist().size());
	}

}
