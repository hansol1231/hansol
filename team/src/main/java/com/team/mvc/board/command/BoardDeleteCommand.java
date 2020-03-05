package com.team.mvc.board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {

		String currentPage = request.getParameter("currentPage");
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		int result = bDao.delete(bIdx);
		
		HttpSession session = request.getSession();
		session.setAttribute("currentPage", currentPage);
		
		if(result > 0) {
			Map<String, Object> map = model.asMap();
		    RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		    redirectAttributes.addFlashAttribute("deleteResult", result);
		    redirectAttributes.addFlashAttribute("isDelete", "yes");
		}
	}

}
