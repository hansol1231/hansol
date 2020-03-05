package com.team.mvc.admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.AdminDao;

public class AdminAckCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) throws Exception {
		
		Map<String, Object> map = model.asMap();
		
		int iMonth = Integer.parseInt( request.getParameter("iMonth") );
		int iDay = Integer.parseInt( request.getParameter("iDay") );
		int iTime = Integer.parseInt( request.getParameter("iTime") );
		
		AdminDao aDao = sqlSession.getMapper(AdminDao.class);
		int ackResult = aDao.ackReserve(iMonth, iDay, iTime, "yes");
		
		if( ackResult > 0 ) {
			RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
			redirectAttributes.addFlashAttribute("ackResult", ackResult);
			redirectAttributes.addFlashAttribute("isAck", "yes");
		} else {
			return;
		}
		
	}

}
