package com.team.mvc.board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.BoardDao;

public class BoardModifyCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {

		//HttpSession session = request.getSession();
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bIsOpen = request.getParameter("bIsOpen");
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		int modifyResult = bDao.modify(bTitle, bContent, bIsOpen, bIdx);
		Map<String, Object> map = model.asMap();
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
		redirectAttributes.addFlashAttribute("isModify", "yes");
		
	}
}
