package com.team.mvc.member.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.MemberDao;
import com.team.mvc.dto.MemberDto;

public class MemberLoginCommand implements MemberCommand {
   @Override
   public void execute(SqlSession sqlSession, Model model) {
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map.get("request");
      RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
      String userId = request.getParameter("userId");
      String userPw = request.getParameter("userPw");
      MemberDao mDao = sqlSession.getMapper(MemberDao.class);
      MemberDto loginDto = mDao.login(userId, userPw);
      if(loginDto != null) {
         HttpSession session = request.getSession();
         session.setAttribute("loginDto", loginDto);
         redirectAttributes.addFlashAttribute("isLogin", "yes");
         redirectAttributes.addFlashAttribute("loginResult", 1);
      } else {
         redirectAttributes.addFlashAttribute("isLogin", "yes");
         redirectAttributes.addFlashAttribute("loginResult", 0);
         return;
      }
   }
}