package com.team.mvc.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.dao.BoardDao;
import com.team.mvc.dto.BoardDto;

public class BoardViewCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		BoardDto bDto = new BoardDto();
		String bIdx = request.getParameter("bIdx");
		HttpSession session = request.getSession();
		String open = (String)session.getAttribute("open");
		if( open == null ) {
			bDao.updateHit( Integer.parseInt(bIdx) );
			session.setAttribute("open", "YES");
		}
		bDto.setbIdx(Integer.parseInt(bIdx));
		model.addAttribute("bDto", bDao.view(bDto));
	}

}
