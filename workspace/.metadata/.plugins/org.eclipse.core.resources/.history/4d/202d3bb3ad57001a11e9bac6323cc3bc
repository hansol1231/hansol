package com.team.mvc.item.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.ItemDao;

public class ItemCancelCommand implements ItemCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
		
		Map<String, Object> map = model.asMap();
		int iMonth = Integer.parseInt( request.getParameter("iMonth") );
		int iDay = Integer.parseInt( request.getParameter("iDay") );
		int iTime = Integer.parseInt( request.getParameter("iTime") );
		String userId = "";
		String iReserve = "no";
		
		ItemDao iDao = sqlSession.getMapper(ItemDao.class);
		int cancelResult = iDao.cancel(iMonth, iDay, iTime, userId, iReserve);
		
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("cancelResult", cancelResult);
		redirectAttributes.addFlashAttribute("isCancel", "yes");
		
	}

}
