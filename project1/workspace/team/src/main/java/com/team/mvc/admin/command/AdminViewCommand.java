package com.team.mvc.admin.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.common.Paging;
import com.team.mvc.dao.AdminDao;
import com.team.mvc.dao.ItemDao;
import com.team.mvc.dto.ItemDto;

public class AdminViewCommand implements AdminCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
      AdminDao aDao = sqlSession.getMapper(AdminDao.class);
      ItemDao iDao = sqlSession.getMapper(ItemDao.class);
      HttpSession session = request.getSession();
      int userIdx = Integer.parseInt( request.getParameter("userIdx") );
      model.addAttribute("mDto", aDao.adminView(userIdx));
      String userId = request.getParameter("userId");
      String currentPage = request.getParameter("currentPage");
      int nowPage = 1; // 기본 페이지 번호는 1로 정함
      if ( currentPage != null && !currentPage.isEmpty() ) {
         nowPage = Integer.parseInt(currentPage);
      }
      session.setAttribute("currentPage", nowPage);
      int recordPerPage = 10;
      int begin = (nowPage - 1) * recordPerPage + 1;
      int end = begin + recordPerPage - 1;
      session.removeAttribute("open");
      int totalRecord = iDao.select_total_record(userId);
      String pagingView = Paging.getPaging2("adminView", nowPage, recordPerPage, totalRecord, userIdx, userId);
      ArrayList<ItemDto> iList = iDao.view(userId, begin, end);
      session.setAttribute("pagingView", pagingView);
      model.addAttribute("iList", iList);
   }
}