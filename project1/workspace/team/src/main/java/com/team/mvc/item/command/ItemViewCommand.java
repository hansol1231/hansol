package com.team.mvc.item.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.team.mvc.common.Paging;
import com.team.mvc.dao.ItemDao;
import com.team.mvc.dto.ItemDto;
import com.team.mvc.dto.MemberDto;

public class ItemViewCommand implements ItemCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
      
       HttpSession session = request.getSession();
  
       MemberDto loginDto = (MemberDto)session.getAttribute("loginDto");
      String userId = loginDto.getUserId();
        
      ItemDao iDao = sqlSession.getMapper(ItemDao.class);
        
      String currentPage = request.getParameter("currentPage");
      int nowPage = 1; // 기본 페이지 번호는 1로 정함
      if ( currentPage != null && !currentPage.isEmpty() ) {
         nowPage = Integer.parseInt(currentPage);
      }
      
      // 현재 페이지 번호를 request 에 저장
      session.setAttribute("currentPage", nowPage);
      
      // 현재 페이지 번호를 알면
      // 현재 페이지에 표시되는 게시글을 시작 번호와 끝 번호를 알 수 있다.
      // 추가로 페이지 당 게시글 수(recordPerPage)를 알아야 한다.
      int recordPerPage = 15;
      int begin = (nowPage - 1) * recordPerPage + 1;
      int end = begin + recordPerPage - 1;
      
      // 게시물이 열리면 session 에 open 속성이 저장된다.
      // 목록으로 이동하는 경우에 그 값을 삭제한다.
      session.removeAttribute("open");
      
      // 전체 게시글 개수 구하기
      int totalRecord = iDao.select_total_record(userId);
      
      // ◀ 1 2 3 ▶ 생성 (pagingView)
      String pagingView = Paging.getPaging("goCancelPage", nowPage, recordPerPage, totalRecord, 0, "0", "");
      
      ArrayList<ItemDto> iList = iDao.view(userId, begin, end);
      // request 에 pagingView 저장
      session.setAttribute("pagingView", pagingView);
      
      model.addAttribute("iList", iList);
      
   }

}