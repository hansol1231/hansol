package com.team.mvc.board.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.dao.BoardDao;
import com.team.mvc.dto.BoardDto;

public class BoardSearchTypeCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request2 = (HttpServletRequest)map.get("request");
		
		int bType = Integer.parseInt( request2.getParameter("bType") );
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		ArrayList<BoardDto> list = bDao.searchBybType(bType);
		
		model.addAttribute("list", list);
		
	}

}
