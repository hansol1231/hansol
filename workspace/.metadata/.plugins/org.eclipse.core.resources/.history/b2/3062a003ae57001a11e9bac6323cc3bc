package com.team.mvc.member.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.dto.MemberDto;

public class MemberLogoutCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		MemberDto mDto = (MemberDto) session.getAttribute("loginDto");
		if ( mDto != null ) {
			session.invalidate();
			request.setAttribute("logoutResult", "success");
		} else {
			return;
		}
	}

}
