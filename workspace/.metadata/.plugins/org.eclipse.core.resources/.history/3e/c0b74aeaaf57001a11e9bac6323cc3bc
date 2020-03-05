package com.team.mvc.admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.AdminDao;

public class AdminModifyCommand implements AdminCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {

      AdminDao aDao = sqlSession.getMapper(AdminDao.class);
      Map<String, Object> map = model.asMap();
      
      String userId = request.getParameter("userId");
      String userPw = request.getParameter("userPw");
      String userName = request.getParameter("userName");
      String userSN = request.getParameter("userSN");
      String userAddr = request.getParameter("userAddr");
      String userEmail = request.getParameter("userEmail");
      String userTel = request.getParameter("userTel");
      int userIdx = Integer.parseInt(request.getParameter("userIdx"));
      
      int result = aDao.adminModify(userId, userPw, userName, userSN, userAddr, userEmail, userTel, userIdx);
      
      if ( result > 0 ) {
         RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
         redirectAttributes.addFlashAttribute("alertResult", "회원수정 성공");
      } else {
         return;
      }
      
   }
}