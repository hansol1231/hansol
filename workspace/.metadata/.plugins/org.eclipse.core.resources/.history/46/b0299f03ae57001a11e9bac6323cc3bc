package com.team.mvc.member.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.MemberDao;
import com.team.mvc.dto.MemberDto;

public class MemberInfoModifyCommand implements MemberCommand {
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String userName = request.getParameter("userName");
		String userAddr = request.getParameter("userAddr");
		String userEmail = request.getParameter("userEmail");
		String userTel = request.getParameter("userTel");
		String userIdx = request.getParameter("userIdx");
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		MemberDto mDto = new MemberDto();
		mDto.setUserName(userName);
		mDto.setUserAddr(userAddr);
		mDto.setUserEmail(userEmail);
		mDto.setUserTel(userTel);
		mDto.setUserIdx(Integer.parseInt(userIdx));
		int modifyResult = mDao.changeInfo(mDto);
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
		redirectAttributes.addFlashAttribute("isModify", "yes");
		HttpSession session = request.getSession();
		session.invalidate();
	}
}
