package com.team.mvc.member.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.dao.MemberDao;
import com.team.mvc.dto.MemberDto;

public class MemberPwChangePage implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
	    String userId = request.getParameter("userId");
	    MemberDao mDao = sqlSession.getMapper(MemberDao.class);
	    MemberDto loginSubDto = (MemberDto)session.getAttribute("loginSubDto");
    	loginSubDto = mDao.login2(userId);
    	session.setAttribute("loginSubDto", loginSubDto);
	}
}
