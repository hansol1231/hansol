package com.team.mvc.admin.command;

import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.AdminDao;

public class AdminRemoveCalendarCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		int iMonth = cal.get(Calendar.MONTH) + 1;
		int iDay = cal.get(Calendar.DATE);
		
		int delResult;
		
		AdminDao aDao = sqlSession.getMapper(AdminDao.class);
		if( iMonth == 1 && iDay == 1 ) {
			delResult = aDao.adminRemoveCalendar(13, 32);
		} else {
			delResult = aDao.adminRemoveCalendar(iMonth, iDay);
		}
		
		Map<String, Object> map = model.asMap();
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("delResult", delResult);
		redirectAttributes.addFlashAttribute("isCalendarRemove", "yes");
		
	}

}
