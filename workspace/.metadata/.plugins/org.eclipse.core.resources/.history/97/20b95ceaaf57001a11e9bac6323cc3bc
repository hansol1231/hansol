package com.team.mvc.member.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.MemberDao;

public class MemberLeaveCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		int result = mDao.leave(userIdx);
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		if(result > 0) {
			redirectAttributes.addFlashAttribute("isLeave", "yes");
			redirectAttributes.addFlashAttribute("leaveResult", result);
			HttpSession session = request.getSession();
			session.invalidate();
		} else {
			return;
		}
	}

}
